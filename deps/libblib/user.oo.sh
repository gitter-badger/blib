#!/usr/bin/env bash
#
# Copyright 2018 (c) Cj-bc
# This software is released under MIT License
#

class:user() {

  # check if user is exist on github
  # @param <string name>
  # @stdout <string User-found>
  # @exception "User not found"
  user::is_exist() {
    [string] name
    local status
    status="$(curl "https://github.com/${name}" -o /dev/null -w '%{http_code}' -s)"
    if [[ "$?" -ne 0 || "$status" = "404" ]]; then
      e="User not found" throw
    fi
    @return
  }

  # check if user has given repo
  # @param <string name> <string repo>
  user::has_repo() {
    [string] name
    [string] repo

    user::is_exist "$name" >/dev/null

    local status
    status="$(curl "https://github.com/${name}/${repo}" -o /dev/null -w '%{http_code}' -s)"
    if [[ "$?" -ne 0 || "$status" = "404" ]]; then
      e="repo not found" throw
    fi
    @return
  }
}

Type::InitializeStatic user
