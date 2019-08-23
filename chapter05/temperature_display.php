<?php
$mysql_host = 'localhost';
$mysql_user = 'root';
$mysql_pass = 'raspberry';
$mysql_db   = 'rpi';

// MySQL 데이터베이스에 접속한다. 
$db_conn = mysqli_connect($mysql_host, $mysql_user, $mysql_pass, $mysql_db);

// charset 설정
mysqli_query($db_conn, "set names utf8");

// 내등록일을 기준으로 하여 내림차순으로 정보를 추출한다. 
$query="SELECT * FROM `temperature` ORDER BY regday DESC limit 12";
echo "[DEBUG] MySQL Query:<br>";
echo "$query";

$stmt = mysqli_prepare($db_conn, $query);
$exec = mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);

$str_mdh="";
$str_atemper="";
while ($row = mysqli_fetch_assoc($result)) {
  echo("[DEBUG] ".$row['time_ymd'].": ".$row['temperature']."<br>");
  $str_mdh .="'".$row['time_ymd']."',";
  $str_temperature .="".$row['temperature'].",";
}
//$str_mdh= substr($str_mdh,0,-1);
//$str_temperature= substr($str_temperature,0,-1);

$result = mysqli_query($db_conn, $query);

mysqli_close($db_conn);

?> 

<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Highcharts Example</title>

		<style type="text/css">
#container {
	min-width: 310px;
	max-width: 800px;
	height: 400px;
	margin: 0 auto
}
		</style>
	</head>
	<body>
<script src="../../code/highcharts.js"></script>
<script src="../../code/modules/series-label.js"></script>
<script src="../../code/modules/exporting.js"></script>
<script src="../../code/modules/export-data.js"></script>

<div id="container"></div>



		<script type="text/javascript">
Highcharts.chart('container', {

    title: {
        text: 'Average Temperature'
    },

    subtitle: {
    text: 'Author: Geunsik Lim'
    },

    xAxis: {
        categories: [<?php echo $str_mdh ?>]
    },
    yAxis: {
        title: {
            text: 'Temperature Level'
        }
    },

    plotOptions: {
        line: {
            dataLabels: {
	    enabled: true
            },
	    enableMouseTracking: false
        }
    },

    series: [{
        name: 'Home Temperature',
	data: [<?php echo $str_temperature ?>]
        <!--data: [27, 26, 28, 24, 21, 23, 25, 28] //-->
    }],

    responsive: {
        rules: [{
            condition: {
                maxWidth: 500
            },
            chartOptions: {
                legend: {
                    layout: 'horizontal',
                    align: 'center',
                    verticalAlign: 'bottom'
                }
            }
        }]
    }

});
		</script>
	</body>
</html>
