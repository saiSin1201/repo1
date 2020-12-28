<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'uzhuzhuangtu.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
	* {margin:0; padding:0;}
	body {padding:0;margin:10px;font-size:9pt;font-family:Helvetica,Geneva,sans-serif;}
	table#q-graph 
	{
		width:750px;
		height:300px;
		caption-side:top;
		border:2px solid #0063be;
		background:transparent;
		position:relative;
		display:block; z-index:2;
	}
	table#q-graph caption 
	{
		width:100%;
		position:absolute;
		top:-20px;
	}
	table#q-graph tbody tr,table#q-graph tbody th
	 {
		position:absolute;
		width:150px;
		height:296px;
		vertical-align: top;
		bottom:0;
		border-right:1px dotted #41a3e2;
	}
	tr#q1 {left:0;}
	tr#q2 {left:149px;}
	tr#q3 {left:298px;}
	tr#q4 {left:447px;}
	tr#q5 {left:600px;border-right:none;}
	td.bar
	{
		position:absolute;
		text-align:center;
		width:34px;
		bottom:0;
		.bottom:2px;
		z-index:2;
	}
	th.north,td.north
	{
		left:36px;
		background:#ddd url(<%=path %>/images/tu.gif) no-repeat 0 0;
	}
	
	table#q-graph thead tr 
	{
		bottom:auto;
		left:100%;
		margin:-2.5em 0pt 0pt 5em;
		top:50%;
		position:absolute;
	}
	table#q-graph thead th 
	{
		width:34px;
		position:absolute;
		left:0;
		height:auto;
		color:#fff;
	}
	table#q-graph thead th.north {top:30px;}
	ul#ticks 
	{
		list-style-type:none;
		width:750px;
		position:relative;
		top:-300px;#top:-302px;z-index:1;
        background:#adfe12;
	}
	ul#ticks li
    {
		border-top:1px dotted #41a3e2;
		height:59px;
	}
	ul#ticks li:first-child 
	{
		border:none;
	}
    .fix_IE{border:none!important;#height:45px!important;}
	ul#ticks li p 
	{
		position:absolute;
		left:100%;
	}
    </style>
  </head>
  <body> 
	<%--<table id="q-graph" cellspacing="0">
		<caption>投票结果柱状图<br></caption>
			<tr id="q1">
				<th scope="row" style="font-size: 11px;">朋友介绍</th>
				<td class="north bar" style="height:<s:property value="#request.pengyou"/>px"><s:property value="#request.pengyou"/></td>
			</tr>
			<tr id="q2">
				<th scope="row" style="font-size: 11px;">门户网站的搜索引擎</th>
				<td class="north bar" style="height:<s:property value="#request.menhu"/>px"><s:property value="#request.menhu"/></td>
			</tr>
			<tr id="q3">
				<th scope="row" style="font-size: 11px;">Google或百度搜索</th>
				<td class="north bar" style="height:<s:property value="#request.googlebaidu"/>px"><s:property value="#request.googlebaidu"/></td>
				
			</tr>
			<tr id="q4">
				<th scope="row" style="font-size: 11px;">别的网站上的链接</th>
				<td class="north bar" style="height:<s:property value="#request.qitazhan"/>px"><s:property value="#request.qitazhan"/></td>
			</tr>
			<tr id="q5">
				<th scope="row" align="center" style="font-size: 11px;">其它途径</th>
				<td class="north bar" style="height:<s:property value="#request.qita"/>px"><s:property value="#request.qita"/></td>
			</tr>
	
	</table>
	<ul id="ticks">
	 <li class="fix_IE"><p></p></li>
	 <li><p></p></li>
	 <li><p></p></li>
	 <li><p></p></li>
	 <li><p></p></li>
	</ul>--%>
	<table>
	   <tr>
	      <td style="font-size: 11px;" width="150">朋友介绍:</td>
	      <td style="font-size: 11px;" width="150"><s:property value="#request.pengyou"/></td>
	   </tr>
	   <tr>
	      <td style="font-size: 11px;" width="150">门户网站的搜索引擎:</td>
	      <td style="font-size: 11px;" width="150"><s:property value="#request.menhu"/></td>
	   </tr>
	   <tr>
	      <td style="font-size: 11px;" width="150">Google或百度搜索:</td>
	      <td style="font-size: 11px;" width="150"><s:property value="#request.googlebaidu"/></td>
	   </tr>
	   <tr>
	      <td style="font-size: 11px;" width="150">别的网站上的链接:</td>
	      <td style="font-size: 11px;" width="150"><s:property value="#request.qitazhan"/></td>
	   </tr>
	   <tr>
	      <td style="font-size: 11px;" width="150">其它途径:</td>
	      <td style="font-size: 11px;" width="150"><s:property value="#request.qita"/></td>
	   </tr>
	</table>
</body>
</html>
