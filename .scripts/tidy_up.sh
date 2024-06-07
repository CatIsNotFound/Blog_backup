# Tidy up my posts
# 整理我的文章
# 执行后将会按照日期进行存放。比如：2024/03/你的文章.md

cd source/_posts
for POST in `ls .`
do
    YEAR=`cat $POST | grep ^date: | cut -d ' ' -f2 | cut -d '-' -f1`
    if [ ! -d $YEAR ];then
        echo "Create dir: $YEAR"
        mkdir $YEAR
    fi
    MOUTH=`cat $POST | grep ^date: | cut -d ' ' -f2 | cut -d '-' -f2`
    if [ ! -d $YEAR/$MOUTH ];then
        echo "Create dir: $YEAR/$MOUTH"
        mkdir $YEAR/$MOUTH
    fi
    echo "Moved: $POST --> $YEAR/$MOUTH."
    mv $POST $YEAR/$MOUTH
    if [ $? -ne 0 ];then
        echo "Move failed!"
        exit 1
    fi
done
cd -
echo "Done!"