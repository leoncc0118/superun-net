<?php
# FileName="Connection_php_mysql.htm"
# Type="MYSQL"
# HTTP="true"
$hostname_connect = "localhost";
$database_connect = "citiarco_superun";
$username_connect = "citiarco_superun";
$password_connect = "superun123";
$connect = mysql_pconnect($hostname_connect, $username_connect, $password_connect) or trigger_error(mysql_error(),E_USER_ERROR); 
mysql_query("SET NAMES 'UTF8'");
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

if (!function_exists("CuttingStr")) {
function CuttingStr($str, $strlen) {
//把' '先轉成空白
	$str = str_replace(' ', ' ', $str);

	$output_str_len = 0; //累計要輸出的擷取字串長度
	$output_str = ''; //要輸出的擷取字串

	//逐一讀出原始字串每一個字元
	for($i=0; $i<$strlen; $i++){
		//擷取字數已達到要擷取的字串長度，跳出回圈
		if($output_str_len >= $strlen){
			break;
		}

		//取得目前字元的ASCII碼
		$str_bit = ord(substr($str, $i, 1));

		if($str_bit < 128) {
			//ASCII碼小於 128 為英文或數字字符
			$output_str_len += 1; //累計要輸出的擷取字串長度，英文字母算一個字數
			$output_str .= substr($str, $i, 1); //要輸出的擷取字串

		}elseif($str_bit > 191 && $str_bit < 224) {
			//第一字節為落於192~223的utf8的中文字(表示該中文為由2個字節所組成utf8中文字)
			$output_str_len += 2; //累計要輸出的擷取字串長度，中文字需算二個字數
			$output_str .= substr($str, $i, 2); //要輸出的擷取字串
			$i++;

		}elseif($str_bit > 223 && $str_bit < 240) {
			//第一字節為落於223~239的utf8的中文字(表示該中文為由3個字節所組成的utf8中文字)
			$output_str_len += 2; //累計要輸出的擷取字串長度，中文字需算二個字數
			$output_str .= substr($str, $i, 3); //要輸出的擷取字串
			$i+=2;

		}elseif($str_bit > 239 && $str_bit < 248) {
			//第一字節為落於240~247的utf8的中文字(表示該中文為由4個字節所組成的utf8中文字)
			$output_str_len += 2; //累計要輸出的擷取字串長度，中文字需算二個字數
			$output_str .= substr($str, $i, 4); //要輸出的擷取字串
			$i+=3;
		}
	}

	//要輸出的擷取字串為空白時，輸出原始字串
	return ($output_str == '') ? $str : $output_str;
}
}
?>