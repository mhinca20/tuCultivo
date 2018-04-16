# for f in *.jpg
# do
#   if [ ${#f} -gt 6 ]
#   then
#     cp $f ${f:0:3}.png
#   fi
#   if [ ${#f} -gt 5 ]
#   then
#     cp $f ${f:0:2}.png
#   fi
#   if [ ${#f} -gt 4 ]
#   then
#     cp $f ${f:0:1}.png
#   fi
# done

# for f in 201.png 202.png 203.png 204.png 205.png 206.png 207.png
# do
#   rm $f
# done

for f in *.png
do
  if [ ${#f} -gt 6 ]
  then
    convert $f ${f:0:3}.jpg
  fi
  if [ ${#f} -gt 5 ]
  then
    convert $f ${f:0:2}.jpg
  fi
  if [ ${#f} -gt 4 ]
  then
    convert $f ${f:0:1}.jpg
  fi
done
