package org.lks.vo;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

@SuppressWarnings("serial")
public class Department implements Serializable{
	private Long did;
	private String dname;
	private String dlocation;
	private List<Employee> employees;
	private Map<String,Object> status;
	
	public Department(){}
	
	public void setStatus(Map<String, Object> status) {
		this.status = status;
	}
	
	public Map<String, Object> getStatus() {
		return status;
	}
	
	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
	}
	
	public List<Employee> getEmployees() {
		return employees;
	}

	public Long getDid() {
		return did;
	}

	public void setDid(Long did) {
		this.did = did;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getDlocation() {
		return dlocation;
	}

	public void setDlocation(String dlocation) {
		this.dlocation = dlocation;
	}
}
