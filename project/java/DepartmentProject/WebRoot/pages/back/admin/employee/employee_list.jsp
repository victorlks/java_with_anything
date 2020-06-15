<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.lks.factory.*" %>
<%@ page import="org.lks.vo.*" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String updateUrl = basePath + "pages/back/admin/employee/" + "employee_update.jsp";
String deleteUrl = basePath + "pages/back/admin/employee/" + "employee_delete_do.jsp";
String backUrl = basePath + "pages/back/admin/employee/" + "employee_list.jsp";
%>

<%
	List<Employee> all = ServiceFactory.getIEmployeeServiceInstance().list();
 %>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>雇员管理</title>
    <link type="text/css" rel="stylesheet" href="css/table.css">
    <link type="text/css" rel="stylesheet" href="css/main.css">
    <script type="text/javascript" src="js/main.js"></script>
  </head>
  
  <body>
    <table border="1" style="width:80%;">
    	<tr>
    		<td colspan="8" style="text-align:center"><h1>雇员列表</h1></td>
    	</tr>
    	<tr>
    		<th><input type="checkbox" name="selectAll" id="selectAll" onclick="selectAll(this)"/></th>
    		<th>雇员编号</th>
    		<th>雇员名字</th>
    		<th>雇员职位</th>
    		<th>雇佣日期</th>
    		<th>薪资</th>
    		<th>奖金</th>
    		<th>操作</th>
    	</tr>
<%
	for(int i = 0; i < all.size(); i++){	 
%>
		<tr style="text-align:center">
			<td><input type="checkbox" name="select" id="select" value="<%=all.get(i).getEid()%>"/></td>
			<td><%=all.get(i).getEid()%></td>
			<td><%=all.get(i).getEname()%></td>
			<td><%=all.get(i).getEjob()%></td>
			<td><%=all.get(i).getEhiredate()%></td>
			<td><%=all.get(i).getEsalary()%></td>
			<td><%=all.get(i).getEbonus()%></td>
			<td><a href="<%=updateUrl %>?eid=<%=all.get(i).getEid()%>&backUrl=<%=backUrl%>">修改</a></td>
		</tr>
<%
	} 
%>
	<tr>
		<td colspan="8"><button type="button" onclick="return deleteById('<%=deleteUrl%>','<%=backUrl%>')">删除</button></td>
	</tr>
    </table>
  </body>
</html>