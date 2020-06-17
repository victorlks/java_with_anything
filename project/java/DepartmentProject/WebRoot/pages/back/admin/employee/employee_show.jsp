<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.lks.factory.*" %>
<%@ page import="org.lks.vo.*" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String listUrl = basePath + "pages/back/admin/employee/" + "employee_split_list_details.jsp";
Employee vo = ServiceFactory.getIEmployeeServiceInstance().show(Long.parseLong(request.getParameter("eid")));
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
  	<div class="employeeTable">
  		<table class="blueTable" style="width:100%;text-align:center">
  			<tr>
  				<td colspan="2"><h1>查看雇员信息</h1></td>
  			</tr>
  			<tr>
  				<td style="width:10%">雇员编号</td>
  				<td style="width:20%"><span><%=vo.getEid() %></span></td>
  			</tr>
  			<tr>
  				<td><span id="enameTitle">雇员名字</span></td>
  				<td><%=vo.getEname()%></td>
  			</tr>
  			<tr>
  				<td><span id="ejobTitle">雇员职位</span></td>
  				<td><%=vo.getEjob()%></td>
  			</tr>
  			<tr>
  				<td><span id="ehiredateTitle">雇佣日期</span></td>
  				<td><%=vo.getEhiredate()%></td>
  			</tr>
  			<tr>
  				<td><span id="esalaryTitle">薪资</span></td>
  				<td><%=vo.getEsalary()%></td>
  			</tr>
  			<tr>
  				<td><span id="ebonusTitle">奖金</span></td>
  				<td><%=vo.getEbonus()%></td>
  			</tr>
  			<tr>
  				<td><span id="emanagerTitle">领导</span></td>
  				<td><%=(vo.getEmanager().getEid().equals(vo.getEid()) ? "无" : vo.getEmanager().getEname())%></td>
  			</tr>
  			<tr>
  				<td colspan="2" style="text-align:center">
  					<button type="button" onclick="window.close()">关闭窗口</button>
  				</td>
  			</tr>
  		</table>
  	</div>
  </body>
</html>
