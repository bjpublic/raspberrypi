
# case문을 이용하여 입력되는 변수 값을 테스트하는 반복문 예제이다. 
for string in "HELLO" "BASH" "hello" "bash" "star" "start" "end" "finish"; do

    # case문 시작
    case ${string} in
        hello|HELLO)
            echo "${string}: hello 일때 실행하는 문장이다."
            ;;
        hard*)
            echo "${string}: hard로 시작하는 단어 일때 실행하는 문장이다."
            ;;
        star|start)
            echo "${string}: star 혹은 start 일때 실행하는 문장이다."
            ;;
        finish|end)
            echo "${string}: finish 혹은 end 일때 실행하는 문장이다."
            ;;
        *)
            echo "${string}: 기타"
            ;;
    esac

done
