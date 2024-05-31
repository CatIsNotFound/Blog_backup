#!/bin/bash
echo "* Clearing..."
hexo clear
echo "* Generating..."
hexo g
echo "* Deploying..."
hexo d
