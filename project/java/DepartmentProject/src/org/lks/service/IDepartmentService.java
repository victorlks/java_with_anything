package org.lks.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.lks.vo.Department;

/**
 * 实现Department表的业务层的执行标准，此类一定要负责数据库的打开与关闭操作<br>
 * 此类可以通过DAOFactory类取得IDepartmentDAO接口对象
 * @author 海燕大笨蛋
 *
 */
public interface IDepartmentService {

	/**
	 * 实现部门数据的增加操作，本次操作要调用IDepartmentDAO接口的如下方法：<br>
	 * <li>需要调用IDepartmentDAO.findById()方法，判断要增加数据的id是否已经存在；
	 * <li>如果现在要增加的数据id不存在则调用IDepartmentDAO.doCreate()方法，返回操作结果。
	 * @param vo 包含了要增加数据的VO对象
	 * @return 如果增加数据的ID重复或保存失败返回false，否则返回true
	 * @throws Exception SQL执行异常
	 */
	public boolean insert(Department vo) throws Exception;
	/**
	 * 实现部门数据的修改操作，本次要调用IDepartmentDAO.doUpdate()方法，本次修改属于全部内容的修改；
	 * @param vo 包含了要修改数据的VO对象
	 * @return 修改成功返回true，否则返回false
	 * @throws Exception SQL执行异常
	 */
	public boolean update(Department vo) throws Exception;
	/**
	 * 执行部门数据的删除操作，可以删除多个部门信息，调用IDepartmentDAO.doRemoveBatch()方法
	 * @param ids 包含了全部要删除数据的集合，没有重复数据
	 * @return 删除成功返回true，否则返回false
	 * @throws Exception SQL执行异常
	 */
	public boolean delete(Set<Long> ids) throws Exception;
	/**
	 * 根据部门id查找部门的完整信息，调用IDepartmentDAO.findById()方法
	 * @param id 要查找的部门ID
	 * @return 如果找到了部门信息以VO对象返回，否则返回null
	 * @throws Exception SQL执行异常
	 */
	public Department updatePre(long id) throws Exception;
	/**
	 * 查询全部部门信息，调用IDepartmentDAO.findAll()方法
	 * @return 查询结果以List集合的形式返回，如果没有数据则集合的长度为0
	 * @throws Exception SQL执行异常
	 */
	public List<Department> list() throws Exception;
	
	/**
	 * 分页显示部门数据，调用IDepartmentDAO.findAllSplit()方法和IDepartmentDAO.getAllCount()方法
	 * @param currentPage 当前页码
	 * @param lineSize 每页显示数据数量
	 * @param column 查询列
	 * @param keyWord 查询列的关键字
	 * @return Map对象，其中key为“all”的值为该页部门数据信息，key为“allRecorders”的值为所有部门数据的数量
	 * @throws Exception SQL执行异常
	 */
	public Map<String, Object> list(int currentPage, int lineSize, String column, String keyWord) throws Exception;
	
	/**
	 * 列出所有部门的详细信息，调用的是IDepartmentDAO.findAllStatus()操作
	 * @return 所有的部门详细信息以及统计信息将以List集合返回
	 * @throws Exception
	 */
	public List<Department> listDetails() throws Exception;
	
	/**
	 * 查看一个部门的完整信息，调用的是IDepartmentDAO.findByIdDetails()方法
	 * @param id 部门编号
	 * @return 如果有部门信息则以VO对象的形式返回，否则返回null
	 * @throws Exception
	 */
	public Department show(long id, int currentPage, int lineSize, String column, String keyWord) throws Exception; 
}
