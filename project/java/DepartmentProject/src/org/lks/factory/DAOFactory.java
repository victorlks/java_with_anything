package org.lks.factory;

import java.sql.Connection;

import org.lks.dao.IDepartmentDAO;
import org.lks.dao.IEmployeeDAO;
import org.lks.dao.impl.DepartmentDAOImpl;
import org.lks.dao.impl.EmployeeDAOImpl;

public class DAOFactory {

	private DAOFactory(){}
	
	public static IDepartmentDAO getIDepartmentDAOInstance(Connection conn){
		return new DepartmentDAOImpl(conn);
	}
	
	public static IEmployeeDAO getIEmployeeDAOInstance(Connection conn){
		return new EmployeeDAOImpl(conn);
	}
}
