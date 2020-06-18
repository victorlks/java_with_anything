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
    int sideNumber = 3;
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
<link type="text/css" rel="stylesheet" href="style.css">
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

<ul class="pagination">
<%
    if(pageSize > (2 + 2 * sideNumber)){
%>
        <li class="<%=(currentPage == 1 ? "active" : "")%>"><a onclick="splitPage(1)">1</a></li>
<%
        if(currentPage - sideNumber <= 2){
            for(int i = 2; i <= (2 + 2 * sideNumber); i++){
%>
                <li class="<%=(currentPage == i ? "active" : "")%>"><a onclick="splitPage(<%=i%>)"><%=i%></a></li>
<%
            }
%>
            <li class="disabled"><a>...</a></li>
<%
        }else if(currentPage + sideNumber < pageSize - 1){
%>
            <li class="disabled"><a>...</a></li>
<%
            for(int i = currentPage - sideNumber; i <= currentPage + sideNumber; i++){
%>
                <li class="<%=(currentPage == i ? "active" : "")%>"><a onclick="splitPage(<%=i%>)"><%=i%></a></li>
<%
            }
%>
            <li class="disabled"><a>...</a></li>
<%
        }else{
%>
            <li class="disabled"><a>...</a></li>
<%
            for(int i = pageSize - 2 * sideNumber - 1; i <= pageSize - 1; i++){
%>
                <li class="<%=(currentPage == i ? "active" : "")%>"><a onclick="splitPage(<%=i%>)"><%=i%></a></li>
<%
            }
        }
%>
        <li class="<%=(currentPage == pageSize ? "active" : "")%>"><a onclick="splitPage(<%=pageSize%>)"><%=pageSize%></a></li>
<%        
    }else{
        for(int i = 1; i <= pageSize; i++){
%>
            <li class="<%=(currentPage == i ? "active" : "")%>"><a onclick="splitPage(<%=i%>)"><%=i%></a></li>
<%        
        }
    }
%>
<br><br>
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
</ul>