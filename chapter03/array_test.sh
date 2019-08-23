
# 쉘 스크립트는 배열을 정의할 때 “declear -a” 옵션을 추가하면 된다. 
declare -a array

# 아래는 4개의 배열 값을 지정하는 예제이다. 
array=("my" "test" "array" "world")

# 기존 배열의 4번째 위치에 1개의 배열 값을 추가하는 예이다. 
# 배열 값을 입력할 때 순차적으로 값을 입력할 필요는 없다. 
array[4]="append"

# 기존 배열 전체에 1개의 배열 값을 추가하여 배열 저장한다. 
# 이 방법은 배열 복사 시에 주로 사용하는 경우이다. 
array=(${array[@]} "mydata")

# 이제 위에서 지정한 배열을 다양한 방법으로 아래와 같이 출력하여 보도록 하자. 
echo "hello world 출력: ${array[0]} ${array[2]}"
echo "배열 전체 출력: ${array[@]}"
echo "배열 전체 개수 출력: ${#array[@]}"

# printf 명령을 사용하여 출력하는 예제이다. 
printf "배열 출력: %s\n" ${array[@]}

# 배열 특정 요소만 지울 수 있다. 사용 방법은 배열 번호 unset을 추가하면 된다. 
unset array[4]
echo "배열 전체 출력: ${array[@]}"

# 배열의 값들을 모두 지우는 방법이다. 
unset array
echo "배열 전체 출력: ${array[@]}"
