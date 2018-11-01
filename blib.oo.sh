#!/usr/bin/env bash
#
# Copyright 2018 (c) Cj-bc
# This software is released under MIT License
#
# @(#) version -

source "$( cd "${BASH_SOURCE[0]%/*}" && pwd )/deps/bash-oo-framework/lib/oo-bootstrap.sh"
import util/class util/log util/trycatch util/exception UI/Console
import ../../libblib/user.oo.sh


class:blib() {

  # treat options.
  # @param <string option>
  blib::options() {
    [string] option

    case $option in
      "--prefix" ) echo "$()";;
    esac
  }

  # install given library.
  # @param <string libname>
  blib::install() {
    [string] libname

    # throw exception if the libname is wrong.
    [[ ! "$libname" =~ .*/.* ]] && e="libname should form <user>/<repo>" throw && return
    try {
      echo -n "Checking the user [${libname%/*}]..."
      user::is_exist "${libname%/*}"
      echo -n "Checking the repo [${libname}]..."
      user::has_repo "${libname%/*}" "${libname#*/}"
    } catch {
      Console::WriteStdErr "\n${__EXCEPTION__[1]}"
      return -1
    }

    echo "Installing [${libname}]..."
    git clone --depth 1 -- "https://github.com/${libname}.git" "$(blib::options --prefix)/${libname#*/}" > /dev/null 2>&1
    if [ "$?" -ne 0 ]; then
      Console::WriteStdErr "Fail to clone."
      return
    fi
    echo "Done."

    return 0
  }

  # uninstall given library.
  # @param <string libname>
  blib::uninstall() {
    [string] libname

    [[ ! "$(realpath $(blib::options --prefix)/${libname})" =~ $(blib::options --prefix)/* ]] && e="invalid library name." throw && return
    [[ "$libname" =~ .*/.* ]] && libname=${libname#*/} # remove username if it's appended
    [[ ! -d "$(blib::options --prefix)/${libname}" ]] && e="library ${libname} is not installed." throw && return
    echo "Removing [${libname}]..."
    rm -r "$(blib::options --prefix)/${libname}"
    if [ "$?" -ne 0 ]; then
      Console::WriteStdErr "Fail to uninstall."
    fi
    echo "Done."

    return 0
  }

  # list all installed libraries.
  blib::list() {
    local prefix="$(blib::options --prefix)"
    if [[ "$(ls ${prefix})" = "" ]]; then
      echo "No library is installed."
    else
      command ls "$prefix"
    fi

    return 0
  }

  # output infomation about given library.
  # @param <string libname>
  blib::info() {
    :
  }

  # execute man for given library.
  # @param <string libname>
  blib::man() {
    :
  }
}

Type::InitializeStatic blib

function main() {
  local cmd="$1"
  shift
  case "$cmd" in
    list|install|uninstall|info|man|help ) eval 'blib::$cmd' $@;;
    -* ) blib::options $cmd;;
    * ) blib::options --help;;
  esac
}

main $@
