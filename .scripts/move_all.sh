#!/bin/bash
# Move all my post
# 移动所有文章至 _posts 目录下，但不删除日期目录


cd source/_posts
for POST in `find . | grep .md$`
do
    echo "Moved: $POST"
    mv $POST .
done
cd -
echo "Done!"