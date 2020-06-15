<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.lks.factory.*" %>
<%@ page import="org.lks.vo.*" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String doInsertUrl = basePath + "pages/back/admin/employee/" + "employee_insert_do.jsp";
String listUrl = basePath + "pages/back/admin/employee/" + "employee_split_list.jsp";
%>
<%
	Map<String,Object> map = ServiceFactory.getIEmployeeServiceInstance().insertPre();
	List<Employee> all = (List<Employee>)map.get("allEmployees");
%>

<html>
  <head>
    <base href="<%=basePath%>">
    <title>雇员管理</title>
    <link type="text/css" rel="stylesheet" href="css/table.css">
    <link type="text/css" rel="stylesheet" href="css/main.css">
    <script type="text/javascript" src="js/ks_validate.js"></script>
    <script type="text/javascript" src="js/employee.js"></script>
  </head>
  
  <body>
  	<div class="header">
  		<ul>
  			<li><a href="<%=listUrl%>">雇员列表</a></li>
  		</ul>
  	</div>
  	<div class="employeeForm">
	  	<form action="<%=doInsertUrl%>" method="POST">
	  		<table class="blueTable" style="width:60%">
	  			<tr>
	  				<td colspan="3" style="text-align:center"><h1>添加雇员信息</h1></td>
	  			</tr>
	  			<tr>
	  				<td style="width:8%"><span id="eidTitle">雇员编号</span>:</td>
	  				<td style="width:8%"><input type="text" name="eid" id="eid" onblur="validateTextRegex(this.id, /^\d{10}$/)" onkeyup="validateTextRegex(this.id, /^\d{10}$/)"/></td>
	  				<td style="width:14%"><span id="eidHintMsg"></span></td>
	  			</tr>
	  			<tr>
	  				<td><span id="enameTitle">雇员名字</span>:</td>
	  				<td><input type="text" name="ename" id="ename" onblur="validateTextEmpty(this.id)" onkeyup="validateTextEmpty(this.id)"/></td>
	  				<td><span id="enameHintMsg"></span></td>
	  			</tr>
	  			<tr>
	  				<td><span id="ejobTitle">雇员职位</span>:</td>
	  				<td><input type="text" name="ejob" id="ejob" onblur="validateTextEmpty(this.id)" onkeyup="validateTextEmpty(this.id)"/></td>
	  				<td><span id="ejobHintMsg"></span></td>
	  			</tr>
	  			<tr>
	  				<td><span id="ehiredateTitle">雇佣日期</span>:</td>
	  				<td><input type="text" name="ehiredate" id="ehiredate" onblur="validateTextRegex(this.id,/^\d{4}-\d{2}-\d{2}$/)" onkeyup="validateTextRegex(this.id,/^\d{4}-\d{2}-\d{2}$/)"/></td>
	  				<td><span id="ehiredateHintMsg"></span></td>
	  			</tr>
	  			<tr>
	  				<td><span id="esalaryTitle">薪资</span>:</td>
	  				<td><input type="text" name="esalary" id="esalary" onblur="validateTextEmpty(this.id)" onkeyup="validateTextEmpty(this.id)"/></td>
	  				<td><span id="esalaryHintMsg"></span></td>
	  			</tr>
	  			<tr>
	  				<td><span id="ebonusTitle">奖金</span>:</td>
	  				<td><input type="text" name="ebonus" id="ebonus" onblur="validateTextEmpty(this.id)" onkeyup="validateTextEmpty(this.id)"/></td>
	  				<td><span id="ebonusHintMsg"></span></td>
	  			</tr>
	  			<tr>
	  				<td><span id="emanagerTitle">领导</span>:</td>
	  				<td>
	  					<select name="emanager" id="emanager" onclick="validateTextEmpty(this.id)">
	  						<option value="0">==== 未选择领导 ====</option>
<%
	  						for(int i = 0; i < all.size(); i++){
%>
	  							<option value="<%=all.get(i).getEid()%>"><%=all.get(i).getEname()%></option>
<%
	  						}
%>
	  					</select>
	  				</td>
	  				<td><span id="emanagerHintMsg"></span></td>
	  			</tr>
	  			<tr>
	  				<td colspan="3" style="text-align:center">
	  					<input type="submit" value="提交" onclick="return validateEmployeeAll()"/>
	  					<input type="reset" value="重置"/>
	  				</td>
	  			</tr>
	  		</table>
	  	</form>
  	</div>
  </body>
</html>
