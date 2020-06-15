<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.lks.factory.*" %>
<%@ page import="org.lks.vo.*" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
StringBuffer backUrl = new StringBuffer(basePath + "pages/back/admin/employee/" + "employee_split_list.jsp");
%>
<%
	String temp;
	try{
		backUrl.delete(0, backUrl.length()).append(request.getParameter("backUrl"));
	}catch(Exception e){}
	
	try{
		temp = request.getParameter("currentPage");
		if( temp != null && !("".equals(temp))){
			backUrl.append("?").append("&currentPage=" + temp);
		}
	}catch(Exception e){}
	
	try{
		temp = request.getParameter("lineSize");
		if( temp != null && !("".equals(temp))){
			backUrl.append("&lineSize=" + temp);
		}
	}catch(Exception e){}
	
	try{
		temp = request.getParameter("column");
		if( temp != null && !("".equals(temp))){
			backUrl.append("&column=" + temp);
		}
	}catch(Exception e){}
	
	try{
		temp = request.getParameter("keyWord");
		if( temp != null && !("".equals(temp))){
			backUrl.append("&keyWord=" + temp);
		}
	}catch(Exception e){}
%>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>雇员管理</title>

  </head>
  
  <body>
<%
	 request.setCharacterEncoding("UTF-8");
	 Set<Long> ids = new HashSet<Long>();
	 String[] allid = request.getParameterValues("ids");
	 for(int i = 0; i < allid.length; i++){
		 ids.add(Long.parseLong(allid[i]));
	 }
	 String promptMessage = "Delete Fail!";
	 if(ServiceFactory.getIEmployeeServiceInstance().delete(ids)){
	 	promptMessage = "Delete Success!";
	 }
%>
	<script>
		alert('<%=promptMessage%>');
		window.location = '<%=backUrl%>';
	</script>
  </body>
</html>
