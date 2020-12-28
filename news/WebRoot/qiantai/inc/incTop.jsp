<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <script type="text/javascript">
	        
	        function liuyanAll()
	        {
	                 var url="<%=path %>/liuyanAll.action";
				     window.open(url,"_blank");
	        }
     </script>
  </head>
  
  <body>
        <center><img src="<%=path %>/img/banner.jpg" width="966"></center>
		<div class="topmenu cbody1">
			<ul>
				<li class="thisclass">
					<A href="<%=path %>/qiantai/index.html">网站首页</A>
				</li>
				<li class="thisclass">
					<A href="#" onclick="liuyanAll()">就业信息交流</A>
				</li>
			</ul>
		</div>
		<form id="searchForm" action="<%=path %>/newsSearch.action" method="post">
			<div class="topsearch">
				<div class="title"></div>
				<div id="page_search_left">
					<input class="inputText" size="16" onkeypress="if(event.keyCode==13){searchFormSubmit();return false;}" name="newsTitle" type="text" />
				</div>
				<div id="page_search_btn">
					<input type="submit" value="搜索">
				</div>
				<div id="page_search_right">
					<script>
						<!--var day="";
						var month="";
						var ampm="";
						var ampmhour="";
						var myweekday="";
						var year="";
						mydate=new Date();
						myweekday=mydate.getDay();
						mymonth=mydate.getMonth()+1;
						myday= mydate.getDate();
						year= mydate.getFullYear();
						if(myweekday == 0)
						weekday=" 星期日 ";
						else if(myweekday == 1)
						weekday=" 星期一 ";
						else if(myweekday == 2)
						weekday=" 星期二 ";
						else if(myweekday == 3)
						weekday=" 星期三 ";
						else if(myweekday == 4)
						weekday=" 星期四 ";
						else if(myweekday == 5)
						weekday=" 星期五 ";
						else if(myweekday == 6)
						weekday=" 星期六 ";
						document.write(year+"年"+mymonth+"月"+myday+"日 "+weekday);
						//-->
					</script>
				</div>
				<div style="clear: both"></div>
			</div>
		</form>
  </body>
</html>
