<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.lks.factory.*" %>
<%@ page import="org.lks.vo.*" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String updateUrl = basePath + "pages/back/admin/department/" + "department_update.jsp";
String deleteUrl = basePath + "pages/back/admin/department/" + "department_delete_do.jsp";
String insertUrl = basePath + "pages/back/admin/department/" + "department_insert.jsp";
String showDepartmentUrl = basePath + "pages/back/admin/department/" + "department_show.jsp";
String addEmployeeUrl = basePath + "pages/back/admin/employee/" + "employee_insert.jsp";
String searchColumns = "编号:did|名称:dname|地点:dlocation";
String location = basePath + "pages/back/admin/department/" + "department_split_list.jsp";
%>

<%
	int currentPage = 1;
	int lineSize = 5;
	String column = "dname";
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
	List<Department> all = (List<Department>)ServiceFactory.getIDepartmentServiceInstance().list(currentPage, lineSize, column, keyWord).get("all");
	Long allRecorders = (Long)ServiceFactory.getIDepartmentServiceInstance().list(currentPage, lineSize, column, keyWord).get("allRecorders");
 %>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>部门管理</title>
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
	    		<td colspan="7" style="text-align:center"><h1>部门列表</h1></td>
	    	</tr>
	    	<tr>
	    		<th><input type="checkbox" name="selectAll" id="selectAll" onclick="selectAll(this)"/></th>
	    		<th>部门编号</th>
	    		<th>部门名称</th>
	    		<th>部门地址</th>
	    		<th>操作</th>
	    		<th>操作</th>
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
				<td><a style="text-decoration:none;color:green;cursor:pointer" onclick="detailsInfo('<%=showDepartmentUrl%>?&did=<%=all.get(i).getDid()%>')">查看</a></td>
				<td><a style="text-decoration:none;color:green;cursor:pointer" href="<%=updateUrl %>?did=<%=all.get(i).getDid()%>">修改</a></td>
				<td><a style="text-decoration:none;color:green;cursor:pointer" href="<%=addEmployeeUrl %>?departmentid=<%=all.get(i).getDid()%>">增加雇员</a></td>
			</tr>
<%
		} 
%>
		<tr>
			<td colspan="7">
				<button type="button" onclick="deleteById('<%=deleteUrl%>')">删除</button>
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