#!/bin/bash

export DOCKERGROUP=`getent group docker | awk -F: '{printf "%d", $3}'`
