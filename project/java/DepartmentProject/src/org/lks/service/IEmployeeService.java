package org.lks.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.lks.vo.Employee;

/**
 * 实现Employee表的业务层的执行标准，此类一定要负责数据库的打开与关闭操作<br>
 * 此类可以通过DAOFactory类取得IEmployeeDAO接口对象
 * @author 海燕大笨蛋
 *
 */
public interface IEmployeeService {

	/**
	 * 实现雇员数据的增加操作，本次操作要调用IEmployeeDAO接口的如下方法：<br>
	 * <li>需要调用IEmployeeDAO.findById()方法，判断要增加数据的id是否已经存在；
	 * <li>如果现在要增加的数据id不存在则调用IEmployeeDAO.doCreate()方法，返回操作结果。
	 * @param vo 包含了要增加数据的VO对象
	 * @return 如果增加数据的ID重复或保存失败返回false，否则返回true
	 * @throws Exception SQL执行异常
	 */
	public boolean insert(Employee vo) throws Exception;
	/**
	 * 实现雇员数据的修改操作，本次要调用IEmployeeDAO.doUpdate()方法，本次修改属于全部内容的修改；
	 * @param vo 包含了要修改数据的VO对象
	 * @return 修改成功返回true，否则返回false
	 * @throws Exception SQL执行异常
	 */
	public boolean update(Employee vo) throws Exception;
	/**
	 * 执行雇员数据的删除操作，可以删除多个雇员信息，调用IEmployeeDAO.doRemoveBatch()方法
	 * @param ids 包含了全部要删除数据的集合，没有重复数据
	 * @return 删除成功返回true，否则返回false
	 * @throws Exception SQL执行异常
	 */
	public boolean delete(Set<Long> ids) throws Exception;
//	/**
//	 * 根据雇员id查找雇员的完整信息，调用IEmployeeDAO.findById()方法
//	 * @param id 要查找的雇员ID
//	 * @return 如果找到了雇员信息以VO对象返回，否则返回null
//	 * @throws Exception SQL执行异常
//	 */
//	public Employee updatePre(long id) throws Exception;
	/**
	 * 查询全部雇员信息，调用IEmployeeDAO.findAll()方法
	 * @return 查询结果以List集合的形式返回，如果没有数据则集合的长度为0
	 * @throws Exception SQL执行异常
	 */
	public List<Employee> list() throws Exception;
	
	/**
	 * 分页显示雇员数据，调用IEmployeeDAO.findAllSplit()方法和IEmployeeDAO.getAllCount()方法
	 * @param currentPage 当前页码
	 * @param lineSize 每页显示数据数量
	 * @param column 查询列
	 * @param keyWord 查询列的关键字
	 * @return Map对象，其中key为“all”的值为该页雇员数据信息，key为“allRecorders”的值为所有雇员数据的数量
	 * @throws Exception SQL执行异常
	 */
	public Map<String, Object> list(int currentPage, int lineSize, String column, String keyWord) throws Exception;
	
	/**
	 * 根据编号查看雇员信息
	 * @param id 雇员的编号
	 * @return 如果查询到数据以VO对象形式返回，否则返回null
	 * @throws Exception SQL执行异常
	 */
	public Employee show(long id) throws Exception;
	
	/**
	 * 表示在进行雇员增加前的准备操作，因为要增加雇员前需要查询出所有的雇员和所有的部门数据
	 * @return 返回两组信息，一个是全部的雇员信息，另外一个是全部的部门信息：<br>
	 * <li>key = allEmployees, value = IEmployeeDAO.findAll()查询出所有的雇员
	 * <li>key = allDepartments, value = IDepartmentDAO.findAll()查询出所有的部门
	 * @throws Exception SQL执行异常
	 */
	public Map<String,Object> insertPre() throws Exception;
	
	/**
	 * 表示 在进行雇员修改前的准备操作，因为要增加雇员前需要查询出所有的雇员和所有的部门数据
	 * @param id 雇员的编号
	 * @return 返回三种信息<br>
	 * <li>key = allEmployees, value = IEmployeeDAO.findAll()查询出所有的雇员
	 * <li>key = employee, value = IEmployeeDAO.findByIDDetails()查询雇员完整信息
	 * <li>key = allDepartments, value = IDepartmentDAO.findAll()查询出所有的部门
	 * @throws Exception SQL执行异常
	 */
	public Map<String,Object> updatePre(long id) throws Exception;
	
	/**
	 * 使用详细列表的方式列出雇员的完整信息，要执行如下操作：<br>
	 * <li>调用IEmployee.findAllSplitDetails()方法详细列出雇员信息；
	 * <li>调用IEmployee.getAllCount()方法列出详细的雇员人数，主要用于分页操作
	 * @param currentPage
	 * @param lineSize
	 * @param column
	 * @param keyWord
	 * @return 所有的内容以Map集合返回，返回的内容如下：<br>
	 * <li>key = allEmployees, value = IEmployeeDAO.findAllSplitDetails()，分页的详细信息
	 * <li>key = employeeCount, value = IEmployee.getAllCount()，取得全部记录数
	 * @throws Exception
	 */
	public Map<String,Object> listDetails(int currentPage, int lineSize, String column, String keyWord) throws Exception;
}
