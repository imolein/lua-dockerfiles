[![status-badge](https://ci.kokolor.es/api/badges/imo/lua-dockerfiles/status.svg)](https://ci.kokolor.es/imo/lua-dockerfiles)

# Lua Dockerfiles

This repository is a fork from [akornatskyy/docker-library](https://github.com/akornatskyy/docker-library). I forked it because of this [issue](https://github.com/akornatskyy/docker-library/issues/1), which was fixed some time ago. In the meantime I made a lot of changes to fit my needs:

* Removed luajit and nginx, because I don't need them
* Lua is build with plattform **linux**, instead of **posix** (that's the fix for the mentioned issue above)
* Install build environment and keep it in luarocks images, so I don't have to install it every time when I want to test something which involves libraries written in C
   * Disadvantage: The images are around 180MB instead of the sexy 12MB without the build environment
* Added verify stage to Luarocks Dockerfiles, which verify the downloaded luarocks archive
* Added Dockerfiles for Lua Ubuntu images
* Added Dockerfiles for [Fennel](https://fennel-lang.org)

## Image overview

### imolein/lua tags

* 5.4, 5.4-alpine, 5.4-ubuntu
* 5.3, 5.3-alpine, 5.3-ubuntu
* 5.2, 5.2-alpine, 5.2-ubuntu
* 5.1, 5.1-alpine, 5.1-ubuntu

### imolein/fennel tags

* 1.4.0-5.4, 1.4.0-5.4-alpine
* 1.4.0-5.3, 1.4.0-5.3-alpine
* 1.4.0-5.2, 1.4.0-5.2-alpine
* 1.4.0-5.1, 1.4.0-5.1-alpine

### imolein/luarocks tags

* 5.4, 5.4-alpine, 5.4-fat
* 5.4-slim, 5.4-alpine-slim
* 5.3, 5.3-alpine, 5.3-fat
* 5.3-slim, 5.3-alpine-slim
* 5.2, 5.2-alpine, 5.2-fat
* 5.2-slim, 5.2-alpine-slim
* 5.1, 5.1-alpine, 5.1-fat
* 5.1-slim, 5.1-alpine-slim

*-fat*: image with installed C build environment, which I use in Ci/CD systems to speed up module installations  
*-slim*: plain lua und luarocks

## Docker Hub

You can find the images on Docker Hub:
* [Lua](https://hub.docker.com/r/imolein/lua)
* [Fennel](https://hub.docker.com/r/imolein/fennel)
* [LuaRocks](https://hub.docker.com/r/imolein/luarocks)

