#!/bin/bash

# file
FILE=".conkyrc"

# question
echo "Color:"
echo "1) White"
echo "2) Black"
echo "3) gruvboxie-white"

# read
read -p "number (1 or 2, 3): " choice

# main 
case $choice in
    1)
        OLD_STRING1="#ebdbb2"
        OLD_STRING2="#282828"
        NEW_STRING="#ffffff"
        ;;
    2)
 
        OLD_STRING1="#ebdbb2"
        OLD_STRING2="#ffffff"
        NEW_STRING="#282828"
        ;;
   3)     
        
        OLD_STRING1="#ffffff"
        OLD_STRING2="#282828"
        NEW_STRING="#ebdbb2"
        ;;
    *)
        echo "FALSE ANSWER!"
        exit 1
        ;;
esac

# sed...
sed -i "s/$OLD_STRING1/$NEW_STRING/g" "$FILE"
sed -i "s/$OLD_STRING2/$NEW_STRING/g" "$FILE"

echo "Its all! Best wishes to use our DOTS!"

# # * Credits: 
# * Name, Description, github
# - Sophron Ragozin, idea (https://github.com/sophragoz/)
# - Vovan Vladimir, script (idea also) (https://github.com/Vovanvladimir)
