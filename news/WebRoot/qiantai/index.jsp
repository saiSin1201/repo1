<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		
		<link href="<%=path %>/css/layout.css" type="text/css" rel="stylesheet" />
		
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
		<script type="text/javascript">
		    function reg()
	        {
	             var url="<%=path %>/qiantai/userinfo/userReg.jsp";
                 var n="";
                 var w="480px";
                 var h="500px";
                 var s="resizable:no;help:no;status:no;scroll:yes";
				 openWin(url,n,w,h,s);
	        }

            function login()
            {
               if(document.userLogin.userName.value=="")
               {
                   alert("请输入用户名");
                   return;
               }
               if(document.userLogin.userPw.value=="")
               {
                   alert("请输入密码");
                   return;
               }
               document.userLogin.submit();
            }
            
            function toupiao()
	        {
                 var toupiaoName;
				 var j=document.toupiaoForm.toupiaoName;
       			 for(i=0;i<j.length;i++)
                 {
    				if(j[i].checked==true)
   				    {
                      toupiaoName=j[i].value;
                    }
                 }
	             var url="<%=path %>/toupiaoAdd.action?toupiaoName="+toupiaoName;
	             //alert(url);
                 var n="dd";
                 var w="480px";
                 var h="500px";
                 var s="resizable:no;help:no;status:no;scroll:yes";
				 openWin(url,n,w,h,s);
	        }

            function toupiaoChakan()
	        {
	             var url="<%=path %>/toupiaoChakan.action";
                 var n="";
                 var w="820px";
                 var h="500px";
                 var s="resizable:no;help:no;status:no;scroll:no";
				 openWin(url,n,w,h,s);
	        }
		</script>
	</head>

	<body>
		<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>
		<div class="page_row">
		    <!--左边的 -->
			<div class="page_main_msg left">
				<div class="left_row">
					<div class="list pic_news">
						<div class="list_bar">
							精彩图文
						</div>
						<div id="tw" class="list_content">
							<div style="width:100%;overflow:hidden;white-space:nowrap;">
								<table width="100%" align="left" cellpadding="0" cellspacing="0" border="0">
									<tr>
									    <s:iterator value="#request.picNewsList" id="picNews">
										<td>
											<table width="100%" cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td sytle="height:28px;">
														<dl style="width:100%;height:130px;padding-right:10px;">
															<dd style="margin-left:0;">
																<a href="<%=path %>/picNewsDetailQian.action?picNewsId=<s:property value="#picNews.picNewsId"/>"><img width="140" height="110" src="<%=path %>/<s:property value="#picNews.picNewsPic"/>"/></a>
															</dd>
															<dt>
																<s:property value="#picNews.picNewsTitle"/>
															</dt>
														</dl>
													</td>
												</tr>
											</table>
										</td>
										</s:iterator>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="cycle_news_row">
					<s:iterator value="#request.cateLogList" id="catelog">
					<div class="list cycle_news">
						<div class="list_bar">
							<a href="<%=path %>/newsAll.action"><s:property value="#catelog.catelogName"/></a>
						</div>
						<div class="list_content">
							<s:iterator value="#catelog.newsList" id="news">
							<div class="c1-body">
								<div class="" style="padding:3px 0px;">
									<div class="f-left" align="left">
										&middot;
										<a href="<%=path %>/newsDetailQian.action?newsId=<s:property value="#news.newsId"/>"><span style=""><s:property value="#news.newsTitle"/>.........</span></a>
									</div>
									<div class="f-right">
										<s:property value="#news.newsDate"/>
									</div>
									<div class="clear"></div>
								</div>
							</div>
							</s:iterator>
						</div>
					</div>
					</s:iterator>
					<div style="clear: both"></div>
				</div>
			</div>
			<!--左边的 -->
			
			<!-- 右边的用户登录。留言。投票 -->
			<div class="page_other_msg right">
				<div class="left_row">
					<div class="list">
						<div class="list_bar">
							用户登录
						</div>
						<div class="list_content">
							<div id="div">
								<s:if test="#session.user==null">
								<form action="<%=path %>/userLogin.action" name="userLogin" method="post">
								      <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
								          <tr>
								            <td align="center" colspan="2" height="10"></td>
								          </tr>
								          <tr>
								            <td align="right" width="31%" height="30" style="font-size: 11px;">用户名：</td>
								            <td align="left" width="69%"><input class="input" id="username" title="用户名不能为空" size="14" name="userName" type="text" /></td>
								          </tr>
								          <tr>
								            <td align="right" height="30" style="font-size: 11px;">密　码：</td>
								            <td align="left"><input class="input" title="密码不能为空" type="password" size="16" name="userPw"/></td>
								          </tr>
								          <tr>
								            <td align="center" colspan="2" height="10"><font color="red"><s:property value="#request.error"/></font></td>
								          </tr>
								          <tr>
								            <td align="center" colspan="2" height="30">
								               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								               <input type="button" value="登  录" onclick="login()" style="border:#ccc 1px solid; background-color:#FFFFFF; font-size:12px; padding-top:3px;" />
											   &nbsp;
											   <input type="button" value="注  册" onclick="reg()" style="border:#ccc 1px solid; background-color:#FFFFFF; font-size:12px; padding-top:3px;" />
								            </td>
								          </tr>
								      </table>
							    </form>
							    </s:if>
							    <s:else>
							        <br/>
								     欢迎您：<s:property value="#session.user.userName"/> &nbsp;&nbsp;&nbsp;&nbsp;
								    <a href="<%=path %>/userLogout.action">安全退出</a> &nbsp;&nbsp;&nbsp;&nbsp;
								    <br/><br/><br/>
								</s:else>
							</div>
						</div>
					</div>
				</div>

				<div class="left_row">
				    <div class="list">
				        <div class="list_bar">网站公告</div>
				        <div class="list_content">
				            <div id="div"> 
				                   <div style="overflow:hidden;height:150px;">
							             <div id="roll-orig-1607838439">
										 <s:action name="gonggaoQian5" executeResult="true" flush="true"></s:action>
							             </div>
						                 <div id="roll-copy-1607838439"></div>
				                   </div>
					        </div>
					    </div>
				    </div>
				</div>
				<div class="left_row">
					<div class="list">
						<div class="list_bar">
							 网友投票
						</div>
						<div class="list_content">
							<form name="toupiaoForm" action="<%=path %>/toupiaoAdd.Action" method="post">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td height="30" colspan="2" align="left">
											&nbsp;你是从哪儿得知本站的？
										</td>
									</tr>
									<tr>
										<td width="12%" height="20" align="right">
											<input type="radio" name="toupiaoName" value="pengyou" checked="checked"/>
										</td>
										<td width="88%" align="left">
											朋友介绍
										</td>
									</tr>
									<tr>
										<td width="12%" height="20" align="right">
											<input type="radio" name="toupiaoName" value="menhu"/>
										</td>
										<td width="88%" align="left">
											门户网站的搜索引擎
										</td>
									</tr>
									<tr>
										<td width="12%" height="20" align="right">
											<input type="radio" name="toupiaoName" value="googlebaidu"/>
										</td>
										<td width="88%" align="left">
											Google或百度搜索
										</td>
									</tr>
									<tr>
										<td width="12%" height="20" align="right">
											<input type="radio" name="toupiaoName" value="qitazhan"/>
										</td>
										<td width="88%" align="left">
											别的网站上的链接
										</td>
									</tr>
									<tr>
										<td width="12%" height="20" align="right">
											<input type="radio" name="toupiaoName" value="qita"/>
										</td>
										<td width="88%" align="left">
											其它途径
										</td>
									</tr>
									<tr>
										<td height="30" colspan="2" align="center">
											<input type="button" value="投 票" onclick="toupiao()" style="border:#ccc 1px solid; background-color:#FFFFFF; font-size:12px; padding-top:3px;" />
											&nbsp;
											<input type="button" value="查看结果" onclick="toupiaoChakan()" style="border:#ccc 1px solid; background-color:#FFFFFF; font-size:12px; padding-top:3px;" />
										</td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div style="clear: both"></div>
			<!-- 右边的用户登录。留言。投票 -->
		</div>
		
		<div class="foot">
		   <jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
	    </div>
	</body>
</html>
