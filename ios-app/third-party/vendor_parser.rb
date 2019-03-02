require 'fileutils'
require 'pathname'

if ARGV.length != 2
  puts "Two (2) arguments required."
  puts "Usage: ruby vendor_parser.rb DepPath CopyPath"
  exit
end

$dep_path = ARGV[0]
$dst_path = ARGV[1]

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
  puts "Processing #{filename} found in #{path}"

  FileUtils.mkdir_p "#{$dst_path}/#{path}"

  contents = File.read(file)
  new_contents = contents.gsub(/#import <IGListKit\/([a-zA-Z0-9\-_\.\+]+)>/, '#import "\1"')
  depmap.each { |k, v| new_contents.gsub!(k, relative_path_from(k, path, v)) }
  File.open("#{$dst_path}/#{path}/#{filename}", "w") { |file|
    file.write(new_contents)
  }
}
