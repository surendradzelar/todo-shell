a=100
echo A =$a

DATE=$(date +%F)
echo -e "\e[32mtoday date is \e[0m $DATE "


EXPR= $((2+3/4*5+7-8*9))
echo -e "\e[33m $EXPR \e[0m"