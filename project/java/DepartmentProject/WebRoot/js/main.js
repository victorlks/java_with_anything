function selectAll(obj){
	var arr = document.all("select");
	for(var i = 0; i < arr.length; i++){
		arr[i].checked = obj.checked;
	}
}

function deleteById(location, backInfo){
	var arr = document.all("select");
	var deleteIds = "";
	for(var i = 0; i < arr.length; i++){
		if(arr[i].checked){
			deleteIds += "ids=" + arr[i].value + "&";
		}
	}
	if(deleteIds == ""){
		alert("请选择要删除的雇员！！！");
		return false;
	}else{
		if(window.confirm("确认删除" + deleteIds)){
			window.location = location + "?" + deleteIds + backInfo;
		}
	}
}

function detailsInfo(url){
	window.open(url,"雇员详细信息","top=100,left=300,width=800,height=600");
}