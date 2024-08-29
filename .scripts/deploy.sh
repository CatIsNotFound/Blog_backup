#!/bin/bash
echo "* Clearing..."
npx hexo clean
echo "* Generating..."
npx hexo g -d
