# 변수 2개를 선언한다. 
mystring1="hello"
mystring2="bash"

# if 문장을 이용하여 변수 2개를 비교한다. 
if [ ${mystring1} == ${mystring2} ]; then
    # 실행 문장이 없으면 오류 발생함
    # 아래 echo 문장을 주석 처리하면 확인 가능함
    echo "hello bash"
elif [ ${mystring1} == ${mystring3} ]; then
    echo "hello bash same"
else
    echo "hello bash different"
fi

# AND 연산자를 이용하여 2개의 변수 조건을 비교한다. 
if [ ${mystring1} == ${mystring2} ] && [ ${mystring3} == ${mystring4} ]
# . . . 아래 생략 . . . 
echo “compare 2 variables with AND.”
fi

# OR 연산자를 이용하여 2개의 변수 조건을 비교한다. 
if [ ${mystring1} == ${mystring2} ] || [ ${mystring3} == ${mystring4} ]
# . . . 아래 생략 . . . 
echo “compare 2 variables with OR.”

fi

# 2개 이상의 변수 조건을 비교하려고 할 때는 [[ ]] 명령을 사용하도록 한다. 
if [[ ${mystring1} == ${mystring2} || ${mystring3} == ${mystring4} ]] && [ ${mystring5} == ${mystring6} ]
# . . . 아래 생략 . . . 
echo “compare 2 variables with additional conditions.”

fi
