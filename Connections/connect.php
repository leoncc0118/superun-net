<?php
# FileName="Connection_php_mysql.htm"
# Type="MYSQL"
# HTTP="true"
$hostname_connect = "localhost";
$database_connect = "citiar_superun";
$username_connect = "citiar_superun";
$password_connect = "superun52052041";
$connect = mysqli_connect($hostname_connect, $username_connect, $password_connect) or trigger_error(mysql_error(),E_USER_ERROR); 
mysqli_query("SET NAMES 'UTF8'");
if (!isset($_SESSION)) {
  session_start();
}
if (!function_exists("GetSQLValueString")) {
function GetSQLValueString($theValue, $theType, $theDefinedValue = "", $theNotDefinedValue = "") 
{
  if (PHP_VERSION < 6) {
    $theValue = get_magic_quotes_gpc() ? stripslashes($theValue) : $theValue;
  }

  $theValue = function_exists("mysql_real_escape_string") ? mysql_real_escape_string($theValue) : mysql_escape_string($theValue);

  switch ($theType) {
    case "text":
      $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
      break;    
    case "long":
    case "int":
      $theValue = ($theValue != "") ? intval($theValue) : "NULL";
      break;
    case "double":
      $theValue = ($theValue != "") ? doubleval($theValue) : "NULL";
      break;
    case "date":
      $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
      break;
    case "defined":
      $theValue = ($theValue != "") ? $theDefinedValue : $theNotDefinedValue;
      break;
  }
  return $theValue;
}
}
if (!function_exists("PictureReSize")) {
function PictureReSize($maxWidth, $maxHeight, $width, $height){
	$newWH = array('0','0');
	if($width > $height){
		$newWH[0] = $maxWidth;
		$newWH[1] = ($maxWidth/$width)*$height;
		if($newWH[1] > $maxHeight) {
			$newWH[1] = $maxHeight;
			$newWH[0] = ($maxHeight/$height)*$width;
		}
		
	}
	if($width < $height){
		$newWH[0] = ($maxHeight/$height)*$width;
		$newWH[1] = $maxHeight;
	}
	if($width == $height){
		$newWH[0] = $maxHeight;
		$newWH[1] = $maxHeight;
	}
	if($maxWidth > $width && $maxHeight > $height){
		$newWH[0] = $width;
		$newWH[1] = $height;
	}
	if($maxWidth > $width && $maxHeight < $height){
		$newWH[0] = $width/($height/$maxHeight);
		$newWH[1] = $maxHeight;
	}
	echo "width='".$newWH[0]."' height='".$newWH[1]."'";
}
}
if (!function_exists("PictureReSizeForBigPhoto")) {
function PictureReSizeForBigPhoto($maxWidth, $maxHeight, $width, $height){
	$newWH = array('0','0');
	if($width > $height){
		$newWH[0] = $maxWidth;
		$newWH[1] = ($maxWidth/$width)*$height;
		if($newWH[1] > $maxHeight) {
			$newWH[1] = $maxHeight;
			$newWH[0] = ($maxHeight/$height)*$width;
		}
	}
	if($width < $height){
		$newWH[0] = ($maxHeight/$height)*$width;
		$newWH[1] = $maxHeight;
	}
	if($width == $height){
		$newWH[0] = $maxHeight;
		$newWH[1] = $maxHeight;
	}
	if($maxWidth > $width && $maxHeight > $height){
		$newWH[0] = $width;
		$newWH[1] = $height;
	}
	if($maxWidth > $width && $maxHeight < $height){
		$newWH[0] = $width/($height/$maxHeight);
		$newWH[1] = $maxHeight;
	}
	echo ",'".$newWH[0]."' ,'".$newWH[1]."'";
}
}

if (!function_exists("cut")) {
function cut($a,$b){
    $a = strip_tags($a); //�h��HTML����
    $sub_content = mb_substr($a, 0, $b, 'UTF-8'); //�^���l�r��
    echo $sub_content;  //��ܳB�z�᪺�K�n��r
    //��� "......"
    if (strlen($a) > strlen($sub_content)) echo "...";
}
}
?>