<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.lks.factory.*" %>
<%@ page import="org.lks.vo.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String doUpdateUrl = basePath + "pages/back/admin/department/" + "department_update_do.jsp";
String listUrl = basePath + "pages/back/admin/department/" + "department_list.jsp";
Department vo = ServiceFactory.getIDepartmentServiceInstance().updatePre(Long.parseLong(request.getParameter("did")));
%>

<html>
  <head>
    <base href="<%=basePath%>">
    <title>部门管理</title>
    <link type="text/css" rel="stylesheet" href="css/table.css">
    <link type="text/css" rel="stylesheet" href="css/main.css">
    <script type="text/javascript" src="js/ks_validate.js"></script>
    <script type="text/javascript" src="js/department.js"></script>
  </head>
  
  <body>
  <div class="header">
  		<ul>
  			<li><a href="<%=listUrl%>">部门列表</a></li>
  		</ul>
  	</div>
  	<div class="departmentTable">
  	<form action="<%=doUpdateUrl%>" method="POST">
  		<input type="hidden" name="did" value="<%=vo.getDid()%>" />
  		<table class="blueTable">
  			<tr>
  				<td colspan="3"><h1>修改部门信息</h1></td>
  			</tr>
  			<tr>
  				<td>部门编号</td>
  				<td><span><%=vo.getDid() %></span></td>
  			</tr>
  			<tr>
  				<td style="width:8%"><span id="dnameTitle">部门名称</span></td>
  				<td style="width:8%"><input type="text" name="dname" id="dname" value="<%=vo.getDname()%>" onblur="validateTextEmpty(this.id)" onkeyup="validateTextEmpty(this.id)"/></td>
  				<td style="width:14%"><span id="dnameHintMsg"></span></td>
  			</tr>
  			<tr>
  				<td><span id="dlocationTitle">部门地址</span></td>
  				<td><input type="text" name="dlocation" id="dlocation" value="<%=vo.getDlocation()%>" onblur="validateTextEmpty(this.id)" onkeyup="validateTextEmpty(this.id)"/></td>
  				<td style="width:14%"><span id="dlocationHintMsg"></span></td>
  			</tr>
  			<tr>
  				<td colspan="3" style="text-align:center">
  					<input type="submit" value="修改" onclick="return validateDepartmentUpdate()"/>
  					<input type="reset" value="重置"/>
  				</td>
  			</tr>
  		</table>
  	</form>
  	</div>
  </body>
</html>
