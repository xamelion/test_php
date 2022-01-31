<?php
/***
 * Счётчик посещений
 */

error_reporting(E_ALL);

ini_set('display_errors', 1);

$db = new PDO("mysql:host=".$_ENV["MYSQL_SERVER"].";dbname=".$_ENV["MYSQL_DATABASE"]."", $_ENV["MYSQL_USER"], $_ENV["MYSQL_PASSWORD"]);
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

try {
	$ip_address = $_SERVER['REMOTE_ADDR'];
	$user_agent = $_SERVER['HTTP_USER_AGENT'];
	$page_url = $_SERVER['REQUEST_URI'];

	$stmt = $db->prepare("INSERT INTO `visitors` (`ip_address`, `user_agent`, `page_url`)
		VALUES (?, ?, ?)
		ON DUPLICATE KEY UPDATE view_date=now(), views_count=views_count+1
	");
	$stmt->execute(array($ip_address, $user_agent, $page_url));

	header('Content-Type: image/png');
	echo ' ';

} catch (PDOException $e) {
	print "An error occurred: ".$e->getMessage();
}

?>