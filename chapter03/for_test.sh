
# 반복 문 for 문장을 이용하여 3개의 문자열을 출력하는 예제이다. 
for string in "hello" "bash" "world"; do;
    echo ${string};
done

# $count1 값이 3보다 작으면 반복문의 실행을 계속 수행한다. 
count1=0
while [ ${count1} -le 3 ]; do
    echo ${count1}
    count=$(( ${count1}+1 ))
done

# $count2 변수의 값이 3보다 같거나 작을 때까지 계속 반복 수행한다. 
count2=10
until [ ${count2} -le 3 ]; do
    echo ${count2}
    count2=$(( ${count2}-1 ))
done
