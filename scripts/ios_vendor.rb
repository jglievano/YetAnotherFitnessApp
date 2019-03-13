#!/usr/bin/env ruby

require 'fileutils'
require 'pathname'
require 'yaml'

def print_usage()
  puts
  puts "\e[1mNAME\e[0m"
  puts "    \e[1mios_vendor.rb\e[0m -- Parses though vendor dependency files"
  puts
  puts "\e[1mSYNOPSIS\e[0m"
  puts "    \e[1mios_vendor.rb\e[0m \e[4mdep_name\e[0m"
  puts
  puts "\e[1mDESCRIPTION\e[0m"
  puts "    This utility parses through each Objective-C source file (h, m, mm extensions)"
  puts "    and perform operations that may help for improving compatibility with other"
  puts "    build tools."
  puts
  puts "\e[1mEXIT STATUS\e[0m"
  puts "    0 on success, and >0 if an error occurs."
  puts
  puts "\e[1mCOMPATIBILITY\e[0m"
  puts "    Built and tested with \e[4mRuby v2.5\e[0m."
  puts
end

if ARGV.length != 1
  puts "\e[31mOne (1) argument required.\e[0m"
  print_usage
  exit
end

$dep_name = ARGV[0]
$dep_path = "/tmp/#{$dep_name}"

vendors = YAML.load(File.read("#{File.dirname(__FILE__)}/vendors.yml"))
vendor = vendors.detect { |v| v["url"].end_with? $dep_name }
exit if vendor.nil?
ok = system("git clone #{vendor["url"]} #{$dep_path}")
exit if !ok
ok = system("cd #{$dep_path}; git checkout #{vendor["tag"]}")
exit if !ok
$dst_path = vendor["location"]

depmap = {}

def break_file(file)
  filename = File.basename(file)
  path = File.dirname(file).delete_prefix("#{$dep_path}/")
  path = "." if path.empty? || path == $dep_path
  return filename, path
end

def relative_path_from(filename, src, dst)
  return filename if src == dst
  src_pathname = Pathname.new(src)
  dst_pathname = Pathname.new(dst)
  rel_pathname = dst_pathname.relative_path_from(src_pathname)
  return "#{rel_pathname.to_s}/#{filename}"
end

Dir.glob("#{$dep_path}/**/*.{h,m,mm}") { |file|
  filename, path = break_file(file)
  depmap[filename] = path
}

Dir.glob("#{$dep_path}/**/*.{h,m,mm}") { |file|
  filename, path = break_file(file)
  puts "\e[1mProcessing\e[0m #{filename} \e[32mfound in\e[0m #{path}"

  FileUtils.mkdir_p "#{$dst_path}/#{path}"

  contents = File.read(file)
  new_contents = contents.gsub(/#import <IGListKit\/([a-zA-Z0-9\-_\.\+]+)>/, '#import "\1"')
  depmap.each { |k, v|
    new_contents.gsub!("\"#{k}\"",
                       "\"#{relative_path_from(k, path, v)}\"")
  }
  File.open("#{$dst_path}/#{path}/#{filename}", "w") { |file|
    file.write(new_contents)
  }
}

Dir.glob("#{$dep_path}/**/*.swift") { |file|
  filename, path = break_file(file)
  puts "\e[1mCopying\e[0m #{filename} \e[32mfound in\e[0m #{path}"

  FileUtils.mkdir_p "#{$dst_path}/#{path}"

  contents = File.read(file)
  File.open("#{$dst_path}/#{path}/#{filename}", "w") { |file|
    file.write(contents)
  }
}

ok = system("rm -rf #{$dep_path}")
if !ok
  puts "Error deleting #{$dep_path}. Do it yourself."
end
