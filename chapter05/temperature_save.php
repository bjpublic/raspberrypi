<?php

// MySQL 데이타베이스 계정 정보를 입력한다.
$mysql_host = 'localhost';
$mysql_user = 'root';
$mysql_password = 'raspberry';
$mysql_db = 'rpi';

//  MySQL 데이터 베이스에 접속한다.
$db_conn = mysqli_connect($mysql_host, $mysql_user, $mysql_password, $mysql_db);

// 한글 깨짐 현상을 방지하기 위하여 utf8 포맷으로 charset 설정
mysqli_query($db_conn, "set names utf8"); 


// cat 명령을 이용하여 “/sys/bus/w1/drivers/w1” 폴더로부터 온도센서의 데이터를 읽어 들인다.
$sensor_value=exec("cat /sys/bus/w1/drivers/w1_slave_driver/28-*/w1_slave");

// 데이터중에서 온도 값만 추출 하도록 한다.  "t="기준으로 배열을 이용하여 값을 추출한다.
$tem_c=explode("t=",$sensor_value);

// 온도정보
$data['temp_c']=round($tem_c[1]/1000,2);

// 날짜정보
$data['temp_ymd']=date("Ymd");

// 시간정보
$data['temp_hms']=date("His");

// 추출한 온도 값 정보들을 Mysql 데이터베이스의 temperature 테이블에 저장한다. 
$query = "INSERT INTO `temperature`(`time_ymd`, `time_hms`, `temperature`, `regday`) ";
$query .= "VALUES ('".$data['temp_ymd']."','".$data['temp_hms']."', '".$data['temp_c']."', now() )";

// 웹프포그램의 디버깅을 위하여 Mysql의 insert Query 문장 내용을 화면에 출력한다. 
echo ("Mysql Query:  <br>");
echo $query;

// Mysql Query를 실행한다.
$result = mysqli_query($db_conn, $query);

// Mysql DB를 닫는다. 
mysqli_close($db_conn);

?>

