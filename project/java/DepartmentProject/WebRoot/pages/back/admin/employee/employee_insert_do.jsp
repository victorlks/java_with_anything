<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.lks.factory.*" %>
<%@ page import="org.lks.vo.*" %>
<%@ page import="java.text.*" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String insertUrl = basePath + "pages/back/admin/employee/" + "employee_insert.jsp";
%>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>雇员管理</title>

  </head>
  
  <body>
<%
	 request.setCharacterEncoding("UTF-8");
	 Employee vo = new Employee();
	 vo.setEid(Long.parseLong(request.getParameter("eid")));
	 vo.setEname(request.getParameter("ename"));
	 vo.setEjob(request.getParameter("ejob"));
	 vo.setEhiredate(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("ehiredate")));
	 vo.setEsalary(Double.parseDouble(request.getParameter("esalary")));
	 vo.setEbonus(Double.parseDouble(request.getParameter("ebonus")));
	 if(Long.parseLong(request.getParameter("emanager")) != 0){
		 vo.setEmanager(new Employee());
		 vo.getEmanager().setEid(Long.parseLong(request.getParameter("emanager")));
	 }
	 String promptMessage = "Add Fail!";
	 if(ServiceFactory.getIEmployeeServiceInstance().insert(vo)){
	 	promptMessage = "Add Success!";
	 }
%>
	<script>
		alert('<%=promptMessage%>');
		window.location = '<%=insertUrl%>';
	</script>
  </body>
</html>
