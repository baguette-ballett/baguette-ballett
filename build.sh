#!/usr/bin/env bash

set -e

rm -rf dist/
mkdir -p dist

echo 'Building for web ...'
godot --headless --no-window --export-release "Web" dist/index.html
echo 'done.'

echo 'Building for linux ...'
godot --headless --no-window --export-release 'Linux' dist/baguette-ballett.x86_64
chmod a+x dist/baguette-ballett.x86_64
echo 'done.'

echo 'Building for Windows ...'
godot --headless --no-window --export-release 'Windows Desktop' dist/baguette-ballett.exe
echo 'done.'
