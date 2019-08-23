#!/user/bin/env bash
echo “Hello bash world.”
printf “Hello bash world.”
printf “%s %s %s” Hello bash world.
# 전역변수를 선언한다.
mystring=”hello bash”
echo $mystring
echo ${mystring}

# 지역 변수를 선언한다.
my_test() {
   # 만약 local을 뺀다면 전역변수가 된다. 
    local local_string=”local”
    echo $local_string
}
# 지역변수를 테스트하는 함수를 실행한다. 
my_test
# 환경변수를 선언한다.
export hello_world=”my bash script”

# 자식 스크립트 파일을 호출하여 실행하고 싶다면 아래와 같이 스크립트 파일 경로를 쓴다.
./export-mytest.sh
