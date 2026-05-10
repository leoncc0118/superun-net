<?php require_once('Connections/connect.php'); ?>
<?php
$colname_RecNews = "-1";
if (isset($_GET['id'])) {
  $colname_RecNews = $_GET['id'];
}
mysqli_select_db($connect,$database_connect);
$query_RecNews = sprintf("SELECT * FROM news WHERE show_front = 1 AND id = %s", GetSQLValueString($colname_RecNews, "int"));
$RecNews = mysqli_query($connect,$query_RecNews) or die(mysqli_error());
$row_RecNews = mysqli_fetch_assoc($RecNews);
$totalRows_RecNews = mysqli_num_rows($RecNews);
if(!isset($_GET['id'])|| !is_numeric($_GET['id']) || $totalRows_RecNews==0) header("Location: albums_list.php");
?>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Language" content="zh-tw"> 
<meta name="ROBOTS" content="INDEX,FOLLOW">
<meta name="revisit-after" content="1 days">
<meta name="description" content="Superun全壘打-最新棒球打擊練習機，整合 運動、挑戰、娛樂、遊戲、影音。棒球競賽、棒球運動、棒球練習機">
<meta name="keywords" content="<?php echo $row_RecNews['keyword']; ?>">
<meta name="copyright" content="Copyright © 2012 駿博工程有限公司 版權所有">
<meta name="author" content="CITIAR Technology for Leon Design">
<title><?php echo $row_RecNews['title']; ?></title>
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
<link href="css/AlbumStyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/includehtml.js"></script>
<script type="text/javascript" src="js/jquery.lightbox-0.5.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/jquery.lightbox-0.5.css" media="screen" />
 <script type="text/javascript">
    $(function() {
        $('#gallery a').lightBox();
    });
</script>
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
    <div class="mhead"><h1 class="title-h1">動態內容</h1></div>
      
<section>
<div class="cont-m">
<p><?php echo $row_RecNews['title']; ?></p>
<p><?php echo nl2br($row_RecNews['des']); ?></p>
</div>
<div class="videos">
<?php echo $row_RecNews['content']; ?>
</div>
<?php 
							mysqli_select_db($connect,$database_connect);
$query_RecPhoto = "SELECT * FROM photo WHERE photo_id = ".$row_RecNews['id']." ORDER BY sort ASC";
$RecPhoto = mysqli_query($connect,$query_RecPhoto) or die(mysqli_error());
$row_RecPhoto = mysqli_fetch_assoc($RecPhoto);
$totalRows_RecPhoto = mysqli_num_rows($RecPhoto);
							?>
<ul class="album_main" id="gallery">
<?php if($totalRows_RecPhoto>0) { ?>
   							<?php do { ?>
       <li><div class="pic-v"><a href="a/photo/news/<?php echo $row_RecPhoto['url']; ?>"><img src="a/photo/news/s<?php echo $row_RecPhoto['url']; ?>"  /></a></div></li>
        <?php } while ($row_RecPhoto = mysqli_fetch_assoc($RecPhoto)); ?>
          					<?php } //$totalRows_RecPhoto>0 ?>       </ul>
                            
                            <div id="NM-footer">
    <ul class="news-button">
    	<li class="NB-back" onclick="history.go(-1);"><a style="cursor:pointer">back</a></li>
    </ul>
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
