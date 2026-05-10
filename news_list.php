<?php require_once('Connections/connect.php'); ?>
<?php
function buildNavigation($pageNum_Recordset1,$totalPages_Recordset1,$prev_Recordset1,$next_Recordset1,$separator=" | ",$max_links=10, $show_page=true)
{
                GLOBAL $maxRows_RecNews,$totalRows_RecNews;
	$pagesArray = ""; $firstArray = ""; $lastArray = "";
	if($max_links<2)$max_links=2;
	if($pageNum_Recordset1<=$totalPages_Recordset1 && $pageNum_Recordset1>=0)
	{
		if ($pageNum_Recordset1 > ceil($max_links/2))
		{
			$fgp = $pageNum_Recordset1 - ceil($max_links/2) > 0 ? $pageNum_Recordset1 - ceil($max_links/2) : 1;
			$egp = $pageNum_Recordset1 + ceil($max_links/2);
			if ($egp >= $totalPages_Recordset1)
			{
				$egp = $totalPages_Recordset1+1;
				$fgp = $totalPages_Recordset1 - ($max_links-1) > 0 ? $totalPages_Recordset1  - ($max_links-1) : 1;
			}
		}
		else {
			$fgp = 0;
			$egp = $totalPages_Recordset1 >= $max_links ? $max_links : $totalPages_Recordset1+1;
		}
		if($totalPages_Recordset1 >= 1) {
			#	------------------------
			#	Searching for $_GET vars
			#	------------------------
			$_get_vars = '';			
			if(!empty($_GET) || !empty($HTTP_GET_VARS)){
				$_GET = empty($_GET) ? $HTTP_GET_VARS : $_GET;
				foreach ($_GET as $_get_name => $_get_value) {
					if ($_get_name != "pageNum_RecNews") {
						$_get_vars .= "&$_get_name=$_get_value";
					}
				}
			}
			$successivo = $pageNum_Recordset1+1;
			$precedente = $pageNum_Recordset1-1;
			$firstArray = ($pageNum_Recordset1 > 0) ? "<li class=\"pgNext pgprev\" onclick=\"window.location.href='$_SERVER[PHP_SELF]?pageNum_RecNews=$precedente$_get_vars'\">$prev_Recordset1</li>" :  "<li class=\"pgNext pgEmpty pgprev\">$prev_Recordset1</li>";
			# ----------------------
			# page numbers
			# ----------------------
			for($a = $fgp+1; $a <= $egp; $a++){
				$theNext = $a-1;
				if($show_page)
				{
					$textLink = $a;
				} else {
					$min_l = (($a-1)*$maxRows_RecNews) + 1;
					$max_l = ($a*$maxRows_RecNews >= $totalRows_RecNews) ? $totalRows_RecNews : ($a*$maxRows_RecNews);
					$textLink = "$min_l - $max_l";
				}
				$_ss_k = floor($theNext/26);
				if ($theNext != $pageNum_Recordset1)
				{
					$pagesArray .= "<li class='page-number' onclick=\"window.location.href='$_SERVER[PHP_SELF]?pageNum_RecNews=$theNext$_get_vars'\">";
					$pagesArray .= "$textLink</li>" . ($theNext < $egp-1 ? $separator : "");
				} else {
					$pagesArray .= "<li class='page-number pgCurrent'>$textLink</li>"  . ($theNext < $egp-1 ? $separator : "");
				}
			}
			$theNext = $pageNum_Recordset1+1;
			$offset_end = $totalPages_Recordset1;
			$lastArray = ($pageNum_Recordset1 < $totalPages_Recordset1) ? "<li class='pgNext pgprev' onclick=\"window.location.href='$_SERVER[PHP_SELF]?pageNum_RecNews=$successivo$_get_vars'\">$next_Recordset1</li>" : "<li class='pgNext pgEmpty pgprev'>$next_Recordset1";
		}
	}
	return array($firstArray,$pagesArray,$lastArray);
}
?>
<?php
if (isset($_GET['news_year'])) {
  $_SESSION['news_year'] = $_GET['news_year'];
}else{
	$_SESSION['news_year'] = date("Y");
}

$maxRows_RecNews = 10;
$pageNum_RecNews = 0;
if (isset($_GET['pageNum_RecNews'])) {
  $pageNum_RecNews = $_GET['pageNum_RecNews'];
}
$startRow_RecNews = $pageNum_RecNews * $maxRows_RecNews;

mysqli_select_db($connect,$database_connect);
$query_RecNews = "SELECT * FROM news WHERE show_front = 1 AND class_id = 1 ORDER BY news_date DESC";
$query_limit_RecNews = sprintf("%s LIMIT %d, %d", $query_RecNews, $startRow_RecNews, $maxRows_RecNews);

$RecNews = mysqli_query($connect,$query_limit_RecNews) or die(mysqli_error());
$row_RecNews = mysqli_fetch_array($RecNews);

while($row = mysqli_fetch_array($RecNews)){
	$RecNews[] = $row; //all data
}
if (isset($_GET['totalRows_RecNews'])) {
  $totalRows_RecNews = $_GET['totalRows_RecNews'];
} else {
  $all_RecNews = mysqli_query($query_RecNews);
  $totalRows_RecNews = mysqli_num_rows($all_RecNews);
  
}
$totalPages_RecNews = ceil($totalRows_RecNews/$maxRows_RecNews)-1;
?>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Language" content="zh-tw"> 
<meta name="ROBOTS" content="INDEX,FOLLOW">
<meta name="revisit-after" content="1 days">
<meta name="description" content="Superun全壘打-最新棒球打擊練習機，整合 運動、挑戰、娛樂、遊戲、影音。棒球競賽、棒球運動、棒球練習機">
<meta name="keywords" content="棒球競賽,棒球運動,棒球練習機,superun,全壘打,指定格,棒球九宮格,大魯閣棒球,全壘打棒球,homeruns,棒球遊戲,打擊運動,棒球打擊,棒球全壘打,棒球揮棒練習,運動練習機,棒球打擊機,棒球打擊選手,棒球聯盟,棒球競賽,棒球運動,棒球練習機,superun,全壘打,指定格,棒球九宮格,大魯閣棒球,全壘打棒球,homeruns,棒球遊戲,打擊運動,棒球打擊,棒球全壘打,棒球揮棒練習,運動練習機,棒球打擊機,棒球打擊選手,棒球聯盟,棒球競賽,棒球運動,棒球練習機,superun,全壘打,指定格,棒球九宮格,大魯閣棒球,全壘打棒球,homeruns,棒球遊戲,打擊運動,棒球打擊,棒球全壘打,棒球揮棒練習,運動練習機,棒球打擊機,棒球打擊選手,棒球聯盟,">
<meta name="copyright" content="Copyright © 2012 駿博工程有限公司 版權所有">
<meta name="author" content="CITIAR Technology for Leon Design">
<title>Superun全壘打-棒球發球機、棒球打擊運動、棒球練習機</title>
<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<![endif]-->
<!--[if lte IE 6]>
<script type="text/javascript" src="iepngfix_tilebg.js"></script>
<![endif]-->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/swfobject.js"></script>
<link href="css/sSRStyle.css" rel="stylesheet" type="text/css" />
<link href="css/NewsListStyle.css" rel="stylesheet" type="text/css" />
<link href="css/NewsMainStyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/includehtml.js"></script>
</head>
<body>
<div id="outer-wrapper">
	<header id="header-wrapper">

    </header>
        <div id="banner-wrapper">
<div id="sflash" style="position:relative;"><img src="images/cnews_06.jpg" width="980" height="239"></div> 
</div>
   <div id="content-wrapper" class="content-w">
    <article>
    <div class="mhead"><h1 class="title-h1">最新消息</h1></div>
      <section><div id="News-List-Board">
    <div id="NL-header">
    <table>
    <col class="LC-01" />
    <col class="LC-02"/>
    <col class="LC-03" />
    <col class="LC-04" />
    <col class="LC-05" />
    <col class="LC-06" />
            <tr>
                <td class="TB-number">編號</td>
                <td class="TB-title">標題</td>
                <td class="TB-date">日期</td>
                <td class="TB-writer">發表人</td>
                <td class="TB-ratio">預覽數</td>
                <td class="TB-remark">備註</td>
            </tr>
        </table>
    </div>
    <div id="NL-content">
    <table>
    <col class="LC-01" />
    <col class="LC-02"/>
    <col class="LC-03" />
    <col class="LC-04" />
    <col class="LC-05" />
	<col class="LC-06" />
			 <?php foreach ($RecNews as $key => $value) :?>
				<tr class="LB-t1">
					<td class="LC-number"><?php echo $i+$pageNum_RecNews*$maxRows_RecNews; ?></td>
					<td class="LC-title"><a href="news_detail.php?id=<?php echo $value['id']; ?>"><?php echo cut($value['title'],35); ?></a></td>   
					<td class="LC-date"><?php echo $value['news_date']; ?></td>
					<td class="LC-writer">writer</td>
					<td class="LC-ratio"><?php echo $value['hit']; ?></td>
					<td class="LC-remark">remark</td>
				</tr>
			<?php endforeach;?>
					<?php $i=1; ?>
                    		<?php if($totalRows_RecNews>0) { ?>
   							<?php do { ?>
                            <tr <?php if ($i%2==1) { ?>class="LB-t1"<?php }else{ ?> class="LB-t2" <?php } ?>>
                                <td class="LC-number"><?php echo $i+$pageNum_RecNews*$maxRows_RecNews; ?></td>
                                <td class="LC-title"><a href="news_detail.php?id=<?php echo $row_RecNews['id']; ?>"><?php echo cut($row_RecNews['title'],35); ?></a></td>   
                                <td class="LC-date"><?php echo $row_RecNews['news_date']; ?></td>
                                <td class="LC-writer">writer</td>
                                <td class="LC-ratio"><?php echo $row_RecNews['hit']; ?></td>
                                <td class="LC-remark">remark</td>
                            </tr>
                            <?php $i++; ?>
                            <?php } while ($row_RecNews = mysqli_fetch_assoc($RecNews)); ?>
          					<?php } //$totalRows_ReNews>0 ?>
     
    </table>
    </div>
     <div id="NL-footer">
     	<div id="pager">
        	<ul class="pages">
            	<?php 
                    # variable declaration
                    $prev_RecNews = "<span>上一頁</span>";
                    $next_RecNews = "<span>下一頁</span>";
                    $separator = " ";
                    $max_links = 10;
                    $pages_navigation_RecNews = buildNavigation($pageNum_RecNews,$totalPages_RecNews,$prev_RecNews,$next_RecNews,$separator,$max_links,true); 
                    
                    print $pages_navigation_RecNews[0]; 
                    ?>
                      <?php print $pages_navigation_RecNews[1]; ?> <?php print $pages_navigation_RecNews[2]; ?>
            </ul>
         </div>
	</div>
</div>

         </section>
        </article>
        <aside class="snlist">
        	<dl id="side-list">     
            	<dt><strong>動態訊息</strong></dt>
        		<dd><a href="news_list.php">最新消息</a></dd>
               	<dd><a href="albums_list.php">動態內容</a></dd>
       		</dl>
            <ul id="slink-list">
               
            </ul>
        </aside>
      <div class="clear"></div>
</div>
	
</div><footer id="footer-wrapper">
        
	</footer>
</body>
</html>
