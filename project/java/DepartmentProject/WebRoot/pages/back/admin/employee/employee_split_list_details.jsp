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
String insertUrl = basePath + "pages/back/admin/employee/" + "employee_insert.jsp";
String showEmployeeUrl = basePath + "pages/back/admin/employee/" + "employee_show.jsp";
String showDepartmentUrl = basePath + "pages/back/admin/department/" + "department_show.jsp";
String searchColumns = "编号:eid|名字:ename|职位:ejob";
String location = basePath + "pages/back/admin/employee/" + "employee_split_list_details.jsp";
%>

<%
	int currentPage = 1;
	int lineSize = 5;
	String column = "ename";
	String keyWord = "";
%>
<%//接收客户端数据
    try{
        currentPage = Integer.parseInt(request.getParameter("currentPage"));
    }catch(Exception e){}
    try{
        lineSize = Integer.parseInt(request.getParameter("lineSize"));
    }catch(Exception e){}
    if(request.getParameter("keyWord") != null){
        keyWord = request.getParameter("keyWord");
    }
    if(request.getParameter("column") != null){
        column = request.getParameter("column");
    }
%>
<%//接受完数据后的数据判断
    if(currentPage < 1){
        currentPage = 1;
    }
    if(lineSize < 1){
        lineSize = 1;
    }
    if(lineSize > 100){
        lineSize = 100;
    }
%>
<%
	Map<String,Object> map = ServiceFactory.getIEmployeeServiceInstance().listDetails(currentPage, lineSize, column, keyWord);
	List<Employee> all = (List<Employee>)map.get("allEmployees");
	long allRecorders = (long)map.get("employeeCount");
 %>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>雇员管理</title>
    <link type="text/css" rel="stylesheet" href="css/table.css">
    <link type="text/css" rel="stylesheet" href="css/main.css">
    <link type="text/css" rel="stylesheet" href="css/pageBar.css">
    <script type="text/javascript" src="js/main.js"></script>
  </head>
  
  <body>
  	<div id="searchBar">
  		<jsp:include page="/pages/split_page_plugin_search.jsp">
  			<jsp:param name="searchColumns" value="<%=searchColumns%>"/>
	        <jsp:param name="column" value="<%=column%>"/>
	        <jsp:param name="keyWord" value="<%=keyWord%>"/>
	        <jsp:param name="location" value="<%=location%>"/>
  		</jsp:include>
  	</div>
    <div id="showData">
    	<table border="1" style="width:80%;">
	    	<tr>
	    		<td colspan="10" style="text-align:center"><h1>雇员列表</h1></td>
	    	</tr>
	    	<tr>
	    		<th><input type="checkbox" name="selectAll" id="selectAll" onclick="selectAll(this)"/></th>
	    		<th>雇员编号</th>
	    		<th>雇员名字</th>
	    		<th>雇员职位</th>
	    		<th>雇佣日期</th>
	    		<th>薪资</th>
	    		<th>奖金</th>
	    		<th>部门</th>
	    		<th>领导</th>
	    		<th>操作</th>
	    	</tr>
<%
		for(int i = 0; i < all.size(); i++){	 
%>
			<tr style="text-align:center">
				<td><input type="checkbox" name="select" id="select" value="<%=all.get(i).getEid()%>"/></td>
				<td><%=all.get(i).getEid()%></td>
				<td><a style="text-decoration:none;color:green;cursor:pointer" onclick="detailsInfo('<%=showEmployeeUrl%>?&eid=<%=all.get(i).getEid()%>')"><%=all.get(i).getEname()%></a></td>
				<td><%=all.get(i).getEjob()%></td>
				<td><%=all.get(i).getEhiredate()%></td>
				<td><%=all.get(i).getEsalary()%></td>
				<td><%=all.get(i).getEbonus()%></td>
				<td><a style="text-decoration:none;color:green;cursor:pointer" onclick="detailsInfo('<%=showDepartmentUrl%>?&did=<%=all.get(i).getEdepartment().getDid()%>')"><%=all.get(i).getEdepartment().getDname()%></a></td>
				<td><a style="text-decoration:none;color:green;cursor:pointer" onclick="detailsInfo('<%=showEmployeeUrl%>?&eid=<%=all.get(i).getEmanager().getEid()%>')"><%=all.get(i).getEmanager().getEname()%></a></td>
				<td><a href="<%=updateUrl %>?eid=<%=all.get(i).getEid()%>&backUrl=<%=location%>&currentPage=<%=currentPage%>&lineSize=<%=lineSize%>&column=<%=column%>&keyWord=<%=keyWord%>">修改</a></td>
			</tr>
<%
		} 
%>
		<tr>
			<td colspan="10">
				<button type="button" onclick="return deleteById('<%=deleteUrl%>','&backUrl=<%=location%>&currentPage=<%=currentPage%>&lineSize=<%=lineSize%>&column=<%=column%>&keyWord=<%=keyWord%>')">删除</button>
				<button type="button" onclick="window.location='<%=insertUrl%>'">增加</button>
			</td>
		</tr>
	    </table>
    </div>
    <div id="pageBar" style="text-align: center;">
  		<jsp:include page="/pages/split_page_plugin_bar_exp.jsp">
  			<jsp:param name="currentPage" value="<%=currentPage%>"/>
	        <jsp:param name="lineSize" value="<%=lineSize%>"/>
	        <jsp:param name="allRecorders" value="<%=allRecorders%>"/>
	        <jsp:param name="location" value="<%=location%>"/>
  		</jsp:include>
  	</div>
  </body>
</html>