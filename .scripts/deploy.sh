#!/bin/bash
echo "* Clearing..."
npx hexo clean
echo "* Generating..."
npx hexo g 
echo "* Deploying..."
npx hexo d 
