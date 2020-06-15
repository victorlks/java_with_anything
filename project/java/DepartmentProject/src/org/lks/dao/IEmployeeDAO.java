package org.lks.dao;

import java.util.List;
import java.util.Set;

import org.lks.vo.Employee;

public interface IEmployeeDAO extends IBaseDAO<Long, Employee> {
	
	/**
	 * 根据部门的编号删除本部门的所有雇员信息。
	 * @param ids 部门编号
	 * @throws Exception SQL执行异常
	 */
	public void doRemoveBatchByDepartmentId(Set<Long> ids) throws Exception;
	
	/**
	 * 表示要查询一个雇员的完整信息，包括领导信息以及所在部门信息
	 * @param id 要查询的雇员编号
	 * @return 如果查询到内容则以VO对象返回，否则返回null
	 * @throws Exception SQL执行异常
	 */
	public Employee findByIdDetails(Long id) throws Exception;
	
	/**
	 * 查询详细的雇员信息，包含有雇员的完整信息、领导信息、部门信息
	 * @param currentPage 当前所在的页
	 * @param lineSize 每页显示数据行数
	 * @param column 要进行模糊查询的数据列
	 * @param keyWord 模糊查询的关键字
	 * @return 以List集合的方式返回，如果没有数据返回集合长度为0（size() == 0）
	 * @throws Exception SQL执行异常
	 */
	public List<Employee> findAllSplitDetails(Integer currentPage, Integer lineSize, String column, String keyWord) throws Exception;
	
	/**
	 * 根据部门编号查询出此部门的全部雇员信息
	 * @param id 部门编号
	 * @param currentPage 当前所在页
	 * @param lineSize 每页显示的数据行数
	 * @param column 模糊查询列
	 * @param keyWord 模糊查询关键字
	 * @return 返回的是一个部门的所有雇员信息，如果此部门没有雇员，则返回数据长度为0
	 * @throws Exception SQL执行异常
	 */
	public List<Employee> findAllByDepartmentId(Long id, Integer currentPage, Integer lineSize, String column, String keyWord) throws Exception;
}
