#! /bin/bash -x
headCount=0
tailCount=0

while [[ $headCount -lt 21 && $tailCount -lt 21 ]]
do
        toss=$(( $RANDOM%2 ))
        if [ $toss -eq 1 ]
        then
                let headCount++
        else
                let tailCount++
        fi
done
if [ $headCount -eq 20 ]
then
        result1=`expr $headCount - $tailCount`
        echo "head win" $result1 "times more than tail"
else [ $tailCount -eq 21 ]
        result2=`expr $tailCount - $headCount`
        echo "tail win" $result2 "times more than head"
fi
#elif [[ $headcount -eq 21 && $tailcount -eq 21 ]]
#then
#echo "tie"




echo "head occured : " $headCount
echo "tails occured : " $tailCount

