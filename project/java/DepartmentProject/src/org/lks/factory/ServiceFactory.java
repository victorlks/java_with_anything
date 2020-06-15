package org.lks.factory;

import org.lks.service.IDepartmentService;
import org.lks.service.IEmployeeService;
import org.lks.service.impl.DepartmentServiceImpl;
import org.lks.service.impl.EmployeeServiceImpl;

public class ServiceFactory {

	private ServiceFactory(){}
	
	public static IDepartmentService getIDepartmentServiceInstance(){
		return new DepartmentServiceImpl();
	}
	
	public static IEmployeeService getIEmployeeServiceInstance(){
		return new EmployeeServiceImpl();
	}
}
