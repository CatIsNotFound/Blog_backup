#!/bin/bash
# Show all my post
# 显示所有的 post 文章

cd source/_posts
i=0
for POST in `find . | grep .md$`
do
    i=$[i+1]
    echo $POST
done
cd - > /dev/null
echo -e "SUM: \033[1m$i\033[0m"