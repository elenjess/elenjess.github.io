<?php
	$mysqli = mysqli_connect('test.ru', 'root', '', 'Inc');
//ввод записи
	if (isset($_POST['save'])) {
		$name = $_POST['name'];
		$function = $_POST['fuction'];

		$mysqli->query ("INSERT INTO Worker (name, fuction) VALUES ('$name', '$fuction')"); 
		$_SESSION['message'] = "SAVED"; 
		header('location: input.php');
	}
?>