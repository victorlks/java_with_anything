function validateEmployeeAll(){
	var eidValidate = validateTextRegex("eid", /^\d{10}$/);
	
	return eidValidate && validateEmployeeUpdate();
}

function validateEmployeeUpdate(){
	var enameValidate = validateTextEmpty("ename");
	var ejobValidate = validateTextEmpty("ejob");
	var ehiredateValidate = validateTextRegex("ehiredate", /^\d{4}-\d{2}-\d{2}$/);
	var esalaryValidate = validateTextEmpty("esalary");
	var ebonusValidate = validateTextEmpty("ebonus");
	return eidValidate && enameValidate && ejobValidate
		&& ehiredateValidate && esalaryValidate && ebonusValidate;
}
