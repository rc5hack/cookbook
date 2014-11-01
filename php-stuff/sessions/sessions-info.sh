#!/bin/sh

echo 'Sessions count:'
find . ! -name ".*" -type f | wc -l

echo 'Sessions size:'
du -hs .
