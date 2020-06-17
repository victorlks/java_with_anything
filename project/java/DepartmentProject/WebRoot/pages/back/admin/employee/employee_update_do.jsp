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
	 if(Long.parseLong(request.getParameter("edepartmentid")) != 0){
		 vo.setEmanager(new Employee());
		 vo.getEmanager().setEid(Long.parseLong(request.getParameter("edepartmentid")));
	 }
	String promptMessage = "Modify Fail!";
	if(ServiceFactory.getIEmployeeServiceInstance().update(vo)){
		promptMessage = "Modify Success!";
	}
%>
	<script>
		alert('<%=promptMessage%>');
		window.location = '<%=backUrl%>';
	</script>
  </body>
</html>
