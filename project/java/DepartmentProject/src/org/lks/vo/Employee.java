package org.lks.vo;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class Employee implements Serializable {
	private Long eid;
	private String ename;
	private String ejob;
	private Date ehiredate;
	private Double esalary;
	private Double ebonus;
	private Employee emanager;
	private Department edepartment;

	public Employee() {
	}

	public void setEdepartment(Department edepartment) {
		this.edepartment = edepartment;
	}
	
	public Department getEdepartment() {
		return edepartment;
	}

	public Employee getEmanager() {
		return emanager;
	}

	public void setEmanager(Employee emanager) {
		this.emanager = emanager;
	}

	public Long getEid() {
		return eid;
	}

	public void setEid(Long eid) {
		this.eid = eid;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getEjob() {
		return ejob;
	}

	public void setEjob(String ejob) {
		this.ejob = ejob;
	}

	public Date getEhiredate() {
		return ehiredate;
	}

	public void setEhiredate(Date ehiredate) {
		this.ehiredate = ehiredate;
	}

	public Double getEsalary() {
		return esalary;
	}

	public void setEsalary(Double esalary) {
		this.esalary = esalary;
	}

	public Double getEbonus() {
		return ebonus;
	}

	public void setEbonus(Double ebonus) {
		this.ebonus = ebonus;
	}

}
