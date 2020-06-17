package org.lks.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.lks.factory.DAOFactory;
import org.lks.service.IEmployeeService;
import org.lks.utils.DatabaseConnection;
import org.lks.vo.Employee;

public class EmployeeServiceImpl implements IEmployeeService {
	private DatabaseConnection databaseConnection = new DatabaseConnection();

	@Override
	public boolean insert(Employee vo) throws Exception {
		try{
			if(DAOFactory.getIEmployeeDAOInstance(this.databaseConnection.getConnection()).findById(vo.getEid()) == null){
				return DAOFactory.getIEmployeeDAOInstance(this.databaseConnection.getConnection()).doCreate(vo);
			}
			return false;
		}catch(Exception e){
			throw e;
		}finally{
			this.databaseConnection.close();
		}
	}

	@Override
	public boolean update(Employee vo) throws Exception {
		try{
			return DAOFactory.getIEmployeeDAOInstance(this.databaseConnection.getConnection()).doUpdate(vo);
		}catch(Exception e){
			throw e;
		}finally{
			this.databaseConnection.close();
		}
	}

	@Override
	public boolean delete(Set<Long> ids) throws Exception {
		try{
			return DAOFactory.getIEmployeeDAOInstance(this.databaseConnection.getConnection()).doRemoveBatch(ids);
		}catch(Exception e){
			throw e;
		}finally{
			this.databaseConnection.close();
		}
	}

//	@Override
//	public Employee updatePre(long id) throws Exception {
//		try{
//			return DAOFactory.getIEmployeeDAOInstance(this.databaseConnection.getConnection()).findById(id);
//		}catch(Exception e){
//			throw e;
//		}finally{
//			this.databaseConnection.close();
//		}
//	}

	@Override
	public List<Employee> list() throws Exception {
		try{
			return DAOFactory.getIEmployeeDAOInstance(this.databaseConnection.getConnection()).findAll();
		}catch(Exception e){
			throw e;
		}finally{
			this.databaseConnection.close();
		}
	}

	@Override
	public Map<String, Object> list(int currentPage, int lineSize, String column, String keyWord) throws Exception {
		try{
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("all", DAOFactory.getIEmployeeDAOInstance(this.databaseConnection.getConnection()).findAllSplit(currentPage, lineSize, column, keyWord));
			map.put("allRecorders", DAOFactory.getIEmployeeDAOInstance(this.databaseConnection.getConnection()).getAllCount(column, keyWord));
			return map;
		}catch(Exception e){
			throw e;
		}finally{
			this.databaseConnection.close();
		}
	}

	@Override
	public Employee show(long id) throws Exception {
		try{
			return DAOFactory.getIEmployeeDAOInstance(this.databaseConnection.getConnection()).findByIdDetails(id);
		}catch(Exception e){
			throw e;
		}finally{
			this.databaseConnection.close();
		}
	}

	@Override
	public Map<String, Object> insertPre() throws Exception {
		try{
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("allEmployees", DAOFactory.getIEmployeeDAOInstance(this.databaseConnection.getConnection()).findAll());
			map.put("allDepartments", DAOFactory.getIDepartmentDAOInstance(this.databaseConnection.getConnection()).findAll());
			return map;
		}catch(Exception e){
			throw e;
		}finally{
			this.databaseConnection.close();
		}
	}

	@Override
	public Map<String, Object> updatePre(long id) throws Exception {
		try{
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("allEmployees", DAOFactory.getIEmployeeDAOInstance(this.databaseConnection.getConnection()).findAll());
			map.put("employee", DAOFactory.getIEmployeeDAOInstance(this.databaseConnection.getConnection()).findByIdDetails(id));
			map.put("allDepartments", DAOFactory.getIDepartmentDAOInstance(this.databaseConnection.getConnection()).findAll());
			return map;
		}catch(Exception e){
			throw e;
		}finally{
			this.databaseConnection.close();
		}
	}

	@Override
	public Map<String, Object> listDetails(int currentPage, int lineSize, String column, String keyWord)
			throws Exception {
		try{
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("allEmployees", DAOFactory.getIEmployeeDAOInstance(this.databaseConnection.getConnection()).findAllSplitDetails(currentPage, lineSize, column, keyWord));
			map.put("employeeCount", DAOFactory.getIEmployeeDAOInstance(this.databaseConnection.getConnection()).getAllCount(column, keyWord));
			map.put("allDepartments", DAOFactory.getIDepartmentDAOInstance(this.databaseConnection.getConnection()).findAll());
			return map;
		}catch(Exception e){
			throw e;
		}finally{
			this.databaseConnection.close();
		}
	}
	
	
}
