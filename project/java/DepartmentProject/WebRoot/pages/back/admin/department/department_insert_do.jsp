<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.lks.factory.*" %>
<%@ page import="org.lks.vo.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String insertUrl = basePath + "pages/back/admin/department/" + "department_insert.jsp";
%>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>部门管理</title>

  </head>
  
  <body>
<%
	 request.setCharacterEncoding("UTF-8");
	 Department vo = new Department();
	 vo.setDid(Long.parseLong(request.getParameter("did")));
	 vo.setDname(request.getParameter("dname"));
	 vo.setDlocation(request.getParameter("dlocation"));
	 String promptMessage = "Add Fail!";
	 if(ServiceFactory.getIDepartmentServiceInstance().insert(vo)){
	 	promptMessage = "Add Success!";
	 }
%>
	<script>
		alert('<%=promptMessage%>');
		window.location = '<%=insertUrl%>';
	</script>
  </body>
</html>
