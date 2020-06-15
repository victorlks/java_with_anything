<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.lks.factory.*" %>
<%@ page import="org.lks.vo.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String updateUrl = basePath + "pages/back/admin/department/" + "department_update.jsp";
String deleteUrl = basePath + "pages/back/admin/department/" + "department_delete_do.jsp";
%>

<%
	List<Department> all = ServiceFactory.getIDepartmentServiceInstance().list();
 %>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>部门管理</title>
    <link type="text/css" rel="stylesheet" href="css/table.css">
    <link type="text/css" rel="stylesheet" href="css/main.css">
    <script type="text/javascript" src="js/main.js"></script>
  </head>
  
  <body>
    <table border="1" style="width:80%;">
    	<tr>
    		<td colspan="5" style="text-align:center"><h1>部门列表</h1></td>
    	</tr>
    	<tr>
    		<th><input type="checkbox" name="selectAll" id="selectAll" onclick="selectAll(this)"/></th>
    		<th>部门编号</th>
    		<th>部门名称</th>
    		<th>部门地址</th>
    		<th>操作</th>
    	</tr>
<%
	for(int i = 0; i < all.size(); i++){	 
%>
		<tr style="text-align:center">
			<td><input type="checkbox" name="select" id="select" value="<%=all.get(i).getDid()%>"/></td>
			<td><%=all.get(i).getDid()%></td>
			<td><%=all.get(i).getDname()%></td>
			<td><%=all.get(i).getDlocation()%></td>
			<td><a href="<%=updateUrl %>?did=<%=all.get(i).getDid()%>">修改</a></td>
		</tr>
<%
	} 
%>
	<tr>
		<td colspan="5"><button type="button" onclick="deleteById('<%=deleteUrl%>')">删除</button></td>
	</tr>
    </table>
  </body>
</html>