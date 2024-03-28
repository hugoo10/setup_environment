#!/bin/bash

function addKeepassRepositoryToSourceList() {
  sudo apt-add-repository ppa:ubuntuhandbook1/keepass2 -y
}

function installKeepass() {
  sudo apt-get update
  sudo apt-get install keepass2 mono-complete xdotool -y
}

addKeepassRepositoryToSourceList && installKeepass
