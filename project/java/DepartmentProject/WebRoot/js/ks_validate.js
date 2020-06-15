function validateTextEmpty(eleId){
    var element = document.getElementById(eleId);
    var hintMsg = document.getElementById(eleId + "HintMsg");
    var title = document.getElementById(eleId + "Title");
    if(element.value == ""){
        hintMsg.innerHTML = "<font color='red'>" + title.innerHTML + "内容为空</font>";
        return false;
    }else{
        hintMsg.innerHTML = "<font color='green'>" + title.innerHTML + "内容正确</font>";
        return true;
    }
}

// JS验证格式：/^regex$/
// 中国大陆手机号：/^(\d{3,4}|\d{3,4}-)?\d{7,8}$/
// Email：/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/
// 中国大陆身份证：/^\d{17}[0-9Xx]$/
function validateTextRegex(eleId, regex){
    var element = document.getElementById(eleId);
    var hintMsg = document.getElementById(eleId + "HintMsg");
    var title = document.getElementById(eleId + "Title");
    if(!regex.test(element.value)){
        hintMsg.innerHTML = "<font color='red'>" + title.innerHTML + "格式有误</font>";
        return false;
    }else{
        hintMsg.innerHTML = "<font color='green'>" + title.innerHTML + "格式正确</font>";
        return true;
    }
}

