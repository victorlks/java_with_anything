<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.lks.factory.*" %>
<%@ page import="org.lks.vo.*" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String doUpdateUrl = basePath + "pages/back/admin/employee/" + "employee_update_do.jsp";
String listUrl = basePath + "pages/back/admin/employee/" + "employee_list_split.jsp";
%>
<%
	Map<String,Object> map = ServiceFactory.getIEmployeeServiceInstance().updatePre(Long.parseLong(request.getParameter("eid")));
	List<Employee> allEmployees = (List<Employee>)map.get("allEmployees");
	List<Department> allDepartments = (List<Department>)map.get("allDepartments");
	Employee vo = (Employee)map.get("employee");
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
  	<div class="employeeTable">
  	<form action="<%=doUpdateUrl%>" method="POST">
  		<input type="hidden" name="eid" value="<%=vo.getEid()%>" />
  		<input type="hidden" name="backUrl" value="<%=request.getParameter("backUrl")%>" />
  		<input type="hidden" name="currentPage" value="<%=request.getParameter("currentPage")%>" />
  		<input type="hidden" name="lineSize" value="<%=request.getParameter("lineSize")%>" />
  		<input type="hidden" name="column" value="<%=request.getParameter("column")%>" />
  		<input type="hidden" name="keyWord" value="<%=request.getParameter("keyWord")%>" />
  		<table class="blueTable">
  			<tr>
  				<td colspan="3"><h1>修改雇员信息</h1></td>
  			</tr>
  			<tr>
  				<td>雇员编号</td>
  				<td><span><%=vo.getEid() %></span></td>
  			</tr>
  			<tr>
  				<td style="width:8%"><span id="enameTitle">雇员名字</span></td>
  				<td style="width:8%"><input type="text" name="ename" id="ename" value="<%=vo.getEname()%>" onblur="validateTextEmpty(this.id)" onkeyup="validateTextEmpty(this.id)"/></td>
  				<td style="width:14%"><span id="enameHintMsg"></span></td>
  			</tr>
  			<tr>
  				<td><span id="ejobTitle">雇员职位</span></td>
  				<td><input type="text" name="ejob" id="ejob" value="<%=vo.getEjob()%>" onblur="validateTextEmpty(this.id)" onkeyup="validateTextEmpty(this.id)"/></td>
  				<td style="width:14%"><span id="ejobHintMsg"></span></td>
  			</tr>
  			<tr>
  				<td><span id="ehiredateTitle">雇佣日期</span></td>
  				<td><input type="text" name="ehiredate" id="ehiredate" value="<%=vo.getEhiredate()%>" onblur="validateTextRegex(this.id,/^\d{4}-\d{2}-\d{2}$/)" onkeyup="validateTextRegex(this.id,/^\d{4}-\d{2}-\d{2}$/)"/></td>
  				<td style="width:14%"><span id="ehiredateHintMsg"></span></td>
  			</tr>
  			<tr>
  				<td><span id="esalaryTitle">薪资</span></td>
  				<td><input type="text" name="esalary" id="esalary" value="<%=vo.getEsalary()%>" onblur="validateTextEmpty(this.id)" onkeyup="validateTextEmpty(this.id)"/></td>
  				<td style="width:14%"><span id="esalaryHintMsg"></span></td>
  			</tr>
  			<tr>
  				<td><span id="ebonusTitle">奖金</span></td>
  				<td><input type="text" name="ebonus" id="ebonus" value="<%=vo.getEbonus()%>" onblur="validateTextEmpty(this.id)" onkeyup="validateTextEmpty(this.id)"/></td>
  				<td style="width:14%"><span id="ebonusHintMsg"></span></td>
  			</tr>
  			<tr>
	  				<td><span id="edepartmentidTitle">部门</span>:</td>
	  				<td>
	  					<select name="edepartmentid" id="edepartmentid" onclick="validateTextEmpty(this.id)">
	  						<option value="0">==== 未选择部门 ====</option>
<%
	  						for(int i = 0; i < allDepartments.size(); i++){
%>
	  							<option value="<%=allDepartments.get(i).getDid()%>" <%=(vo.getEdepartment().getDid().equals(allDepartments.get(i).getDid()) ? "selected" : "")%>><%=allDepartments.get(i).getDname()%></option>
<%
	  						}
%>
	  					</select>
	  				</td>
	  				<td><span id="edepartmentidHintMsg"></span></td>
	  			</tr>
  			<tr>
  			<tr>
	  				<td><span id="emanagerTitle">领导</span>:</td>
	  				<td>
	  					<select name="emanager" id="emanager" onclick="validateTextEmpty(this.id)">
	  						<option value="0">==== 未选择领导 ====</option>
<%
	  						for(int i = 0; i < allEmployees.size(); i++){
%>
	  							<option value="<%=allEmployees.get(i).getEid()%>" <%=(vo.getEmanager().getEid().equals(allEmployees.get(i).getEid()) ? "selected" : "")%>><%=allEmployees.get(i).getEname()%></option>
<%
	  						}
%>
	  					</select>
	  				</td>
	  				<td><span id="emanagerHintMsg"></span></td>
	  			</tr>
  			<tr>
  				<td colspan="3" style="text-align:center">
  					<input type="submit" value="修改" onclick="return validateEmployeeUpdate()"/>
  					<input type="reset" value="重置"/>
  				</td>
  			</tr>
  		</table>
  	</form>
  	</div>
  </body>
</html>
