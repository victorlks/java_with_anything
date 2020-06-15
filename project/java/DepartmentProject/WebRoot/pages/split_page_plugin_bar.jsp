<%@ page pageEncoding="UTF-8" %>

<%
    request.setCharacterEncoding("UTF-8");
%>

<%
    int currentPage = 1;
    int lineSize = 10;
    Long allRecorders = 0L;
    int pageSize = 1;
    String location = "";
    int[] lineSizeData = new int[]{1, 5, 10, 15, 20, 30, 50, 100};
%>
<%//接收数据
    try{
        currentPage = Integer.parseInt(request.getParameter("currentPage"));
    }catch(Exception e){}
    try{
        lineSize = Integer.parseInt(request.getParameter("lineSize"));
    }catch(Exception e){}
    try{
        allRecorders = Long.parseLong(request.getParameter("allRecorders"));
    }catch(Exception e){}
    location = request.getParameter("location");
%>
<%//计算总页数
    pageSize = (allRecorders.intValue() + lineSize - 1) / lineSize;
    if(pageSize < 1){
        pageSize = 1;
    }
%>
<script type="text/javascript">
    function splitPage(page){
        var size = document.getElementById("selectLineSize").value;
        try{
            var keyWord = document.getElementById("keyWord").value;
            var searchColumn = document.getElementById("searchColumnSelect").value;
            window.location = "<%=location%>" + "?currentPage=" + page + "&lineSize=" + size + "&keyWord=" + keyWord + "&column=" + searchColumn;
        }catch(Exception){
            window.location = "<%=location%>" + "?currentPage=" + page + "&lineSize=" + size;
        }
    }
</script>

<input type="button" value="首页" onclick="splitPage(1)" <%=(currentPage == 1 ? "disabled" : "")%>/>
<input type="button" value="上一页" onclick="splitPage(<%=(currentPage - 1)%>)"  <%=(currentPage == 1 ? "disabled" : "")%>/>
<input type="button" value="下一页"  onclick="splitPage(<%=(currentPage + 1)%>)" <%=(currentPage == pageSize ? "disabled" : "")%>/>
<input type="button" value="尾页" <%=(currentPage == pageSize ? "disabled" : "")%>/>
第<select id="selectPage" onchange="splitPage(this.value)">
<%
    for(int i = 1; i <= pageSize; i++){
%>
        <option value="<%=i%>" <%=(currentPage == i ? "selected" : "")%>><%=i%></option>
<%   
    }
%>  
</select>页, 每页显示<select id="selectLineSize" onchange="splitPage(1)">
<%
    for(int i = 0; i < lineSizeData.length; i++){
%>
        <option value="<%=lineSizeData[i]%>" <%=(lineSize == lineSizeData[i] ? "selected" : "")%>><%=lineSizeData[i]%></option>
<%
    }
%>
</select>
条,&nbsp;共<%=allRecorders%>条记录。