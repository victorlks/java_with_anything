function validateDepartmentAll(){
	var didValidate = validateTextRegex("did", /^\d{4}$/);
	return didValidate && validateDepartmentUpdate();
}

function validateDepartmentUpdate(){
	var dnameValidate = validateTextEmpty("dname");
	var dlocationValidate = validateTextEmpty("dlocation");
	return dnameValidate && dlocationValidate;
}
