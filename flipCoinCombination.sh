#!/bin/bash -x

arr[1]="H"
arr[2]="T"
while [[ $count -lt 10 ]];
do
        toss=$((RANDOM%2))
        toss=$(( $RANDOM%2 ))
        if [ $toss -eq 1 ]
        then
                let H++
        else
                let T++
        fi
        let count++

done


arr[3]="HH"
arr[4]="HT"
arr[5]="TH"
arr[6]="TT"

for i in {0..19}
do
        coinA=$((RANDOM%2))
        coinB=$((RANDOM%2))
        if [ $coinA -eq '1' -a $coinB -eq '1' ]
        then
                let HH++

        elif [ $coinA -eq '1' -a $coinB -eq '0' ]
        then
                let HT++

        elif [ $coinA -eq '0' -a $coinB -eq '1' ]
        then
                let TH++
        else
                let TT++
        fi
done




arr[7]="HHH"
arr[8]="HHT"
arr[9]="HTH"
arr[10]="HTT"
arr[11]="THH"
arr[12]="THT"
arr[13]="TTH"
arr[14]="TTT"
for((i=0;i<40;i++)){

        coinA=$((RANDOM%2))
        coinB=$((RANDOM%2))
        coinC=$((RANDOM%2))
        if [ $coinA -eq '1' -a $coinB -eq '1' -a $coinC -eq '1' ]
        then
                let HHH++
        elif [ $coinA -eq '1' -a $coinB -eq '1' -a $coinC -eq '0' ]
        then
                let HHT++

        elif [ $coinA -eq '1' -a $coinB -eq '0' -a $coinC -eq '1' ]
        then
                let HTH++

        elif [ $coinA -eq '1' -a $coinB -eq '0' -a $coinC -eq '0' ]
        then
                let HTT++

        elif [ $coinA -eq '0' -a $coinB -eq '1' -a $coinC -eq '1' ]
        then
                let THH++

        elif [ $coinA -eq '0' -a $coinB -eq '1' -a $coinC -eq '0' ]
        then
                let THT++

        elif [ $coinA -eq '0' -a $coinB -eq '0' -a $coinC -eq '1' ]
        then
                let TTH++

        elif [ $coinA -eq '0' -a $coinB -eq '0' -a $coinC -eq '0' ]
        then
                let TTT++

        fi
}


for i in {1..14}
do
        echo "  $i   ${arr[$i]} : $((${arr[$i]}))"
done

echo
echo
for ((i = 1; i<=14; i++))
do
    for ((j = 1; j<=14-i; j++))
    do
        if [[ ${arr[$j]} -lt ${arr[$(($j+1))]} ]]
        then
            # swap
            temp=${arr[$j]}
            arr[$j]=${arr[$(($j+1))]}
            arr[$(($j+1))]=$temp
        fi
    done
done
echo "After sorting"

for key in ${!arr[@]}
do
        echo " $key      ${arr[$key]}   $((${arr[$key]}))  "
done


for i in ${!arr[@]}
do
        echo  "Winning combination is : " ${arr[$i]}
        exit
done
