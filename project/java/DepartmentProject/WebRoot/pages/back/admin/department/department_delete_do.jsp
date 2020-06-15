<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.lks.factory.*" %>
<%@ page import="org.lks.vo.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String listUrl = basePath + "pages/back/admin/department/" + "department_list.jsp";
%>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>部门管理</title>

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
	 if(ServiceFactory.getIDepartmentServiceInstance().delete(ids)){
	 	promptMessage = "Delete Success!";
	 }
%>
	<script>
		alert('<%=promptMessage%>');
		window.location = '<%=listUrl%>';
	</script>
  </body>
</html>
