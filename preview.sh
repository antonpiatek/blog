#!/bin/bash

docker run --rm   --volume="$PWD:/srv/jekyll" -P  -it jekyll/jekyll:3.8   jekyll serve
