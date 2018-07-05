<?php	// получаем данные из таблицы
	$mysqli = mysqli_connect('test.ru', 'root', '', 'Inc');
	$res = $mysqli->query('SELECT * FROM worker');
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
	<meta charset="utf-8">
	<title></title>
</head>
<body>
	<?php
	foreach ($worker_table_columns as $column_name ):?>
		<td><?= $column_name ?></td>
		<?php endforeach; ?>
	?>
	<?php foreach ( $worker_table as $worker ):?>
			<tr>
				<?php foreach ( $worker as $property ):?>
					<td><?= $property ?></td>
				<?php endforeach; ?>
			</tr>
		<?php endforeach;?>
	<form action="server.php">
   <p><select name="worker">
   	<?php foreach ($variable as $key => $value)
   <option></option>
   <option value="i"></option>
   <option value="id"></option>
   </select>
   <input type="submit" value="Отправить"></p>
  </form> 


</body>
</html>