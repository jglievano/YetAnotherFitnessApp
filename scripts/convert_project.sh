#!/usr/bin/env bash

function usage() {
  printf "\n"
  printf "\e[1mNAME\e[0m\n"
  printf "    \e[1mconvert_project.sh\e[0m -- Converts project name everywhere necessary.\n"
  printf "\n"
  printf "\e[1mSYNOPSIS\e[0m\n"
  printf "    \e[1mconvert_project.sh\e[0m \e[4mname\e[0m \e[4murl\e[0m\n"
  printf "\n"
  printf "\e[1mDESCRIPTION\e[0m\n"
  printf "    This utility goes through files in this template project and makes\n"
  printf "    substitutions where necessary\n"
  printf "\n"
  printf "\e[1mEXIT STATUS\e[0m\n"
  printf "    0 on success, and >0 if an error occurs.\n"
  printf "\n"
  printf "\e[1mCOMPATIBILITY\e[0m\n"
  printf "    Built and tested with \e[4mGNU Bash 4.4.23(1)-release\e[0m.\n"
  printf "\n"
}

if [[ $# -ne 2 ]]; then
  usage
  exit 1
fi

PROJECT_NAME=$1
PROJECT_URL=$2
