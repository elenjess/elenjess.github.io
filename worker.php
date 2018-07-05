<?php
$mysqli = new  mysqli('test.ru', 'root', '', 'Inc');

if( $mysqli->connect_errno ) {
	  $error =  "Не удалось подключиться к MySQL: " . $mysqli->connect_error;
}
//получаем результат запроса
$res = $mysqli->query('SELECT * FROM worker');

	if( $musqli->errno) {
		$error = $mysqli->error;
	}

//здесь мы получаем строку (запись) в виде ассоциативного массива
$worker_table = [];

while ( $row = $res->fetch_assoc() ) {
	$worker_table[] = $row;
}

$first_record = current( $worker_table );

$worker_table_columns = array_keys( $first_record );

?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>

<pre>
	<?php
	if( isset($error) )
		echo 'text:' . $error;
	else 
		print_r($worker_table);
	?>
</pre>

<table style="border: 1px solid black; width: 100%;">
	<thead>
		<?php /*перебираем в цикле массив с записями из таблицы*/foreach ($worker_table_columns as $column_name ):?>
		<td><?= $column_name ?></td>
		<?php endforeach; ?>
	</thead>
	<tbody>
		<?php foreach ( $worker_table as $worker ):?>
			<tr>
				<?php foreach ( $worker as $property ):?>
					<td><?= $property ?></td>
				<?php endforeach; ?>
			</tr>
		<?php endforeach;?>
		}
	</tbody>
</table>

</body>
</html>