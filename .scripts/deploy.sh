#!/bin/bash
echo "* Clearing..."
npx hexo clean
echo "* Deploying..."
npx hexo g -d
