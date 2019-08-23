my_test1() {
    echo "string test"
}

function my_test2() {
    echo "string test 2"
    echo "인자값: ${@}"
}

my_test1
my_test2
my_test2 "hello" "world"
