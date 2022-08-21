[![status-badge](https://ci.kokolor.es/api/badges/imo/lua-dockerfiles/status.svg)](https://ci.kokolor.es/imo/lua-dockerfiles)

# Docker Library

This repository is a fork from [akornatskyy/docker-library](https://github.com/akornatskyy/docker-library) with some changes to fit my setup:

* Removed luajit and nginx, cause I don't need it
* Lua is build with plattform **linux**, instead of **posix**, so I don't get the error `dynamic libraries not enabled; check your Lua installation` when loading libraries like `luafilesystem` ([Issue](https://github.com/akornatskyy/docker-library/issues/1))
* Install build environment and keep it in luarocks images, so I don't have to install it every time when I want to test something which involves libraries written in C
   * Disadvantage: The images are around 180MB instead of the sexy 12MB without the build environment

# Docker Hub

You can find the images on Docker Hub:
* [Lua](https://hub.docker.com/r/imolein/lua)
* [LuaRocks](https://hub.docker.com/r/imolein/luarocks)