<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String doInsertUrl = basePath + "pages/back/admin/department/" + "department_insert_do.jsp";
String listUrl = basePath + "pages/back/admin/department/" + "department_split_list.jsp";
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
  	<div class="departmentForm">
	  	<form action="<%=doInsertUrl%>" method="POST">
	  		<table class="blueTable">
	  			<tr>
	  				<td colspan="3" style="text-align:center"><h1>添加部门信息</h1></td>
	  			</tr>
	  			<tr>
	  				<td style="width:8%"><span id="didTitle">部门编号</span>:</td>
	  				<td style="width:8%"><input type="text" name="did" id="did" onblur="validateTextRegex(this.id, /^\d{4}$/)" onkeyup="validateTextRegex(this.id, /^\d{4}$/)"/></td>
	  				<td style="width:14%"><span id="didHintMsg"></span></td>
	  			</tr>
	  			<tr>
	  				<td><span id="dnameTitle">部门名称</span>:</td>
	  				<td><input type="text" name="dname" id="dname" onblur="validateTextEmpty(this.id)" onkeyup="validateTextEmpty(this.id)"/></td>
	  				<td><span id="dnameHintMsg"></span></td>
	  			</tr>
	  			<tr>
	  				<td><span id="dlocationTitle">部门地址</span>:</td>
	  				<td><input type="text" name="dlocation" id="dlocation" onblur="validateTextEmpty(this.id)" onkeyup="validateTextEmpty(this.id)"/></td>
	  				<td><span id="dlocationHintMsg"></span></td>
	  			</tr>
	  			<tr>
	  				<td colspan="3" style="text-align:center">
	  					<input type="submit" value="提交" onclick="return validateDepartmentAll()"/>
	  					<input type="reset" value="重置"/>
	  				</td>
	  			</tr>
	  		</table>
	  	</form>
  	</div>
  </body>
</html>
