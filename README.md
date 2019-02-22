# Docker Library

This repository is a fork from [akornatskyy/docker-library](https://github.com/akornatskyy/docker-library) with some changes to fit my setup:

* Removed luajit and nginx, cause I don't need it
* Lua is build with plattform **linux**, instead of **posix**, so I don't get the error `dynamic libraries not enabled; check your Lua installation` when loading libraries like luafilesystem ([Issue](https://github.com/akornatskyy/docker-library/issues/1))
* Install build environment and keep it in luarocks images, so I don't have to install it every time when I want to test something which involves libraries written in C
   * Disadvantage: The images are around 180MB instead of the sexy 12MB without the build environment

I don't have a Docker Hub account, so you have to clone the repository and build the Docker images on your own (manually or using the update.sh scripts). Maybe I'll create one in the future.