<%@ page language="java" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title></title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<style type="text/css">
			<!--
			*{margin:0;padding:0;border:0;}
			body {
			 font-family: arial, 宋体, serif;
			 font-size:12px;
			}
			#nav {
			 width:175px;
			    line-height: 24px; 
			 list-style-type: none;
			 text-align:left;
			    /*定义整个ul菜单的行高和背景色*/
			}
			/*==================一级目录===================*/
			#nav a {
			 width: 175px; 
			 display: block;
			 padding-left:20px;
			 /*Width(一定要)，否则下面的Li会变形*/
			}
			#nav li {
			 background:#CCC; /*一级目录的背景色*/
			 border-bottom:#FFF 1px solid; /*下面的一条白边*/
			 float:left;
			 /*float：left,本不应该设置，但由于在Firefox不能正常显示
			
			}
			#nav li a:hover{
			 background:red; /*一级目录onMouseOver显示的背景色*/
			}
			#nav a:link  {
			 color:#666; text-decoration:none;
			}
			#nav a:visited  {
			 color:#666;text-decoration:none;
			}
			#nav a:hover  {
			 color:#FFF;text-decoration:none;font-weight:bold;
			}
			/*==================二级目录===================*/
			#nav li ul {
			 list-style:none;
			 text-align:left;
			}
			#nav li ul li{ 
			 background: #EBEBEB; /*二级目录的背景色*/
			}
			#nav li ul a{
			         padding-left:20px;
			         width:160px;
			 /* padding-left二级目录中文字向右移动，但Width必须重新设置=(总宽度-padding-left)*/
			}
			/*下面是二级目录的链接样式*/
			#nav li ul a:link  {
			 color:#666; text-decoration:none;
			}
			#nav li ul a:visited  {
			 color:#666;text-decoration:none;
			}
			#nav li ul a:hover {
			 color:#F3F3F3;
			 text-decoration:none;
			 font-weight:normal;
			 background:#CC0000;
			 /* 二级onmouseover的字体颜色、背景色*/
			}
			/*==============================*/
			#nav li:hover ul {
			 left: auto;
			}
			#nav li.sfhover ul {
			 left: auto;
			}
			#content {
			 clear: left; 
			}
			#nav ul.collapsed {
			 display: none;
			}
			-->
			#PARENT{
			 width:175px;
			 padding-left:0px;
			}
		</style>
		
		
		<script type="text/javascript">
			var LastLeftID = "";
			function menuFix() {
			 var obj = document.getElementById("nav").getElementsByTagName("li");
			 
			 for (var i=0; i<obj.length; i++) {
			  obj[i].onmouseover=function() {
			   this.className+=(this.className.length>0? " ": "") + "sfhover";
			  }
			  obj[i].onMouseDown=function() {
			   this.className+=(this.className.length>0? " ": "") + "sfhover";
			  }
			  obj[i].onMouseUp=function() {
			   this.className+=(this.className.length>0? " ": "") + "sfhover";
			  }
			  obj[i].onmouseout=function() {
			   this.className=this.className.replace(new RegExp("( ?|^)sfhover\\b"), "");
			  }
			 }
			}
			function DoMenu(emid)
			{
			 var obj = document.getElementById(emid); 
			 obj.className = (obj.className.toLowerCase() == "expanded"?"collapsed":"expanded");
			 if((LastLeftID!="") && (emid!=LastLeftID)) //关闭上一个Menu
			 {
			  document.getElementById(LastLeftID).className = "collapsed";
			 }
			 LastLeftID = emid;
			}
			function GetMenuID()
			{
			 var MenuID="";
			 var _paramStr = new String(window.location.href);
			 var _sharpPos = _paramStr.indexOf("#");
			 
			 if (_sharpPos >= 0  &&  _sharpPos < _paramStr.length - 1)
			 {
			  _paramStr = _paramStr.substring(_sharpPos + 1, _paramStr.length);
			 }
			 else
			 {
			  _paramStr = "";
			 }
			 
			 if (_paramStr.length > 0)
			 {
			  var _paramArr = _paramStr.split("&");
			  if (_paramArr.length>0)
			  {
			   var _paramKeyVal = _paramArr[0].split("=");
			   if (_paramKeyVal.length>0)
			   {
			    MenuID = _paramKeyVal[1];
			   }
			  }
			  
			 }
			 
			 if(MenuID!="")
			 {
			  DoMenu(MenuID)
			 }
			}
			GetMenuID(); //*这两个function的顺序要注意一下，不然在Firefox里GetMenuID()不起效果
			menuFix();
			-->
		</script>
	</head>

	<body>
		<div id="PARENT">
		    <ul id="nav">
	            <li><a href="#" onclick="DoMenu('ChildMenu1')">系统属性</a>
	            <ul id="ChildMenu1" class="collapsed">
	               <li><a target="I1" href="<%=path %>/admin/index/sysPro.jsp" style="width: 175">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;系统属性</a></li>
	            </ul>
	            </li>
	            
	            <li><a href="#" onclick="DoMenu('ChildMenu2')">管理员维护</a>
	            <ul id="ChildMenu2" class="collapsed">
	               <li><a target="I1" href="<%=path %>/adminManage.action" style="width: 175">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;管理员维护</a></li>
	               <li><a target="I1" href="<%=path %>/admin/index/adminAdd.jsp" style="width: 175">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;管理员添加</a></li>
	            </ul>
	            </li>
	            
	            <li><a href="#" onclick="DoMenu('ChildMenu3')">用户管理</a>
	            <ul id="ChildMenu3" class="collapsed">
	               <li><a target="I1" href="<%=path %>/userMana.action" style="width: 175">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户管理</a></li>
	            </ul>
	            </li>
	            
	            <li><a href="#" onclick="DoMenu('ChildMenu4')">新闻分类</a>
	            <ul id="ChildMenu4" class="collapsed">
	               <li><a target="I1" href="<%=path %>/catelogMana.action" style="width: 175">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新闻分类</a></li>
	            </ul>
	            </li>
	            
	            
	            <li><a href="#" onclick="DoMenu('ChildMenu5')">新闻管理</a>
	            <ul id="ChildMenu5" class="collapsed">
	               <li><a target="I1" href="<%=path %>/newsMana.action" style="width: 175">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新闻管理</a></li>
	            </ul>
	            </li>
	            
	            <li><a href="#" onclick="DoMenu('ChildMenu97')">图片新闻</a>
	            <ul id="ChildMenu97" class="collapsed">
	               <li><a target="I1" href="<%=path %>/picNewsMana.action" style="width: 175">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;图片新闻</a></li>
	            </ul>
	            </li>
	            
	            
	            <li><a href="#" onclick="DoMenu('ChildMenu98')">投票查看</a>
	            <ul id="ChildMenu98" class="collapsed">
	               <li><a target="I1" href="<%=path %>/admin/toupiaoChakan.action" style="width: 175">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;投票查看</a></li>
	            </ul>
	            </li>
	            
	            
	            <li><a href="#" onclick="DoMenu('ChildMenu99')">公告管理</a>
	            <ul id="ChildMenu99" class="collapsed">
	               <li><a target="I1" href="<%=path %>/gonggaoMana.action" style="width: 175">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;公告管理</a></li>
	               <li><a target="I1" href="<%=path %>/admin/gonggao/gonggaoAdd.jsp" style="width: 175">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;公告添加</a></li>
	            </ul>
	            </li>
	            
	            
	            <li><a href="#" onclick="DoMenu('ChildMenu999')">留言管理</a>
	            <ul id="ChildMenu999" class="collapsed">
	               <li><a target="I1" href="<%=path %>/liuyanMana.action" style="width: 175">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;留言管理</a></li>
	            </ul>
	            </li>
	            
	            <li><a href="#" onclick="DoMenu('ChildMenu100')">安全退出系统</a>
	            <ul id="ChildMenu100" class="collapsed">
	               <li><a href="<%=path %>/logout.jsp" style="width: 175">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;安全退出系统</a></li>
	            </ul>
	            </li>
		    </ul>
        </div>
	</body>
</html>
