# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## WIP
### Add
  - `blib info` -- show infomation(version, etc) for library
  - `blib man` -- show detailed description for library
  - `blib help`/`blib -h` -- help message
  - `blib update [<lib>]` -- update given library(or all libraries)
  - bundle default libraries
  - with above one, provide customized oo-bootstrap.sh so that we can use `import blib:<library>`
  - bpkg support
  - version management
  - config file for each library


## [v0.2.3] - 2018/11/09
### Fixed
  - Don't leave broken symlink of `blib` bin(`/usr/local/bin/blib)` in `make install`
  - `make install` works fine


## [v0.2.2] - 2018/11/09
### Changed
  - Add 'FORCE_INSTALL' option to force install. You can force to install again
### Fixed
  - Homebrew installation works fine(I hope)


## [v0.2.1] - 2018/11/09
### Added
  - system test for `blib.oo.sh`

### Changed
  - Use `blib --prefix` in libblib test

### Fixed
  - `make test` works fine
  - Left any exception after script excecution
  - Treat exceptions well
  - Fix some test cases


## [v0.2.0] - 2018/11/07
### Added
  - Makefile
  - `make install`/`make test`/`make uninstall`
### Changed
  - Default value for `BLIB_ROOT` is now `/usr/local/etc/blib`.
    All libraries will be installed under there by default
  -  Update README and JA_README
### Fixed
  - some typo


## [v0.1.3] - 2018/11/06 [YANKED]
### Added
  - Japanese README
  - Japanese coding guide
### Changed
  - Coding guide using blib libraries
### Fixed
  - some typo
  - Typo of DEFAULT OF BLIB_ROOT


## [v0.1.2] - 2018/11/05 [YANKED]
### Added
  - variable `BLIB_ROOT`: set root directory for blib. default: $HOME/.blib
### Changed
  - Prefix has been decided as `$HOME/.blib`
### Fixed
  - Remove fork bomb :(
      the code called `blib` itself at the bigining of customized oo-bootstrap.sh.
      I remove that.

## [v0.1.1] - 2018/11/05
### Fixed
  - don't echo stdout of 'type' command

## [v0.1.0] - 2018/11/05
### Added
  - `blib --prefix` -- return blib prefix(all libraries are installed under there)
  - `blib list` -- list installed libraries
  - `blib install <user>/<repo>` -- install given library
  - `blib uninstall <libary_name>` -- uninstall library
  - Makefile: `test` target is available
  - Homebrew support -- I hope this works
