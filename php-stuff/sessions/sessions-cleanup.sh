#!/bin/sh

# NOTE: if PHP unexpectedly get cookie with the SID pointing to
# non-existent session file, it will successfully create it.

echo 'Delete small sessions:'
find . -type f -size -64c -delete -print | wc -l
# if you don't want to see errors such as permissions mismatch, use this:
#find . -type f -size -64c -delete -print 2>/dev/null | wc -l

echo 'Delete old sessions:'
find . -type f -mtime +120 -delete -print | wc -l
# if you don't want to see errors such as permissions mismatch, use this:
#find . -type f -mtime +120 -delete -print 2>/dev/null | wc -l
