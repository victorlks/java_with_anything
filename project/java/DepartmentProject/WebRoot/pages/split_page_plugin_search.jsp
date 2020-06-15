<%@ page pageEncoding="UTF-8" %>

<%
    request.setCharacterEncoding("UTF-8");
%>

<%
    String searchColumns = null;
    String column = "uname";
    String keyWord = "";
    String location = "";
%>

<%
    if(request.getParameter("searchColumns") != null){
        searchColumns = request.getParameter("searchColumns");
    }
    if(request.getParameter("column") != null){
        column = request.getParameter("column");
    }
    if(request.getParameter("keyWord") != null){
        keyWord = request.getParameter("keyWord");
    }
    if(request.getParameter("location") != null){
        location = request.getParameter("location");
    }
%>
请输入查询关键字:
<%
if(searchColumns != null){
%>
    <select id="searchColumnSelect">
<%
        String[] searchColumnsArray = searchColumns.split("\\|");
        for(int i = 0; i < searchColumnsArray.length; i++){
            String searchColumn[] = searchColumnsArray[i].split(":");
%>
            <option value="<%=searchColumn[1]%>" <%=(column.equals(searchColumn[1]) ? "selected" : "")%>><%=searchColumn[0]%></option>
<%
        }
%>
    </select>
<%
}
%>
<input type="text" name="keyWord" id="keyWord" value="<%=keyWord%>"/><button type="button" id="searchBtn" name="searchBtn" onclick="splitPage(1)">查找</button>