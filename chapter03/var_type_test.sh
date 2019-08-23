#!/user/bin/env bash
echo “Hello bash world.”
printf “Hello bash world.”
printf “%s %s %s” Hello bash world.

# 아래는 변수를 읽기 전용 타입을 선언하는 예이다. 
declare -r read_variable

# 정수타입으로 변수를 선언하는 예이다. 
# num_variable=10 문법과 동일하다. 
# 그러나, 가능하면 declear를 이용하여 정확히 명시하는 것이 좋다. 
declare -i num_variable=10

# 배열 타입으로 변수를 선언하는 예이다. 
# 또는 array_variable=() 이런 식으로 작성하여도 동일한 효과를 발휘한다. 
declare -a array_variable

# 환경 변수로 선언하는 예이다. 
# 또는 export export_variable="hello bash" 문법과 동일한 효과를 발휘한다. 
declare -x export_variable="hello bash"

# 현재 스크립트의 전체 함수 출력하고 싶을 때 사용하는 명령이다. 
declare -f

# 현재 스크립트에서 지정한 함수만 출력하고 싶을 때 사용하는 명령이다. 
declare -f 함수이름
