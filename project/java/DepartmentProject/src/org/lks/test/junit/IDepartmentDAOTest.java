package org.lks.test.junit;

import static org.junit.Assert.fail;

import java.util.HashSet;
import java.util.Set;

import org.junit.Test;
import org.lks.factory.DAOFactory;
import org.lks.utils.DatabaseConnection;
import org.lks.vo.Department;

import junit.framework.TestCase;

public class IDepartmentDAOTest {
	
	private DatabaseConnection databaseConnection = new DatabaseConnection();

	@Test
	public void testDoCreate() {
		Department vo = new Department();
		vo.setDid(10L);
		vo.setDname("lks");
		vo.setDlocation("henan");
		try {
			TestCase.assertTrue(DAOFactory.getIDepartmentDAOInstance(this.databaseConnection.getConnection()).doCreate(vo));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	public void testDoUpdate() {
		Department vo = new Department();
		vo.setDid(10L);
		vo.setDname("hhy");
		vo.setDlocation("henan");
		try {
			TestCase.assertTrue(DAOFactory.getIDepartmentDAOInstance(this.databaseConnection.getConnection()).doUpdate(vo));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	public void testDoRemoveBatch() {
		Set<Long> ids = new HashSet<Long>();
		ids.add(10L);
		try {
			TestCase.assertTrue(DAOFactory.getIDepartmentDAOInstance(this.databaseConnection.getConnection()).doRemoveBatch(ids));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	public void testFindById() {
		try {
			TestCase.assertTrue(DAOFactory.getIDepartmentDAOInstance(this.databaseConnection.getConnection()).findById(10L).getDname().equals("hhy"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	public void testFindAll() {
		try {
			TestCase.assertTrue(DAOFactory.getIDepartmentDAOInstance(this.databaseConnection.getConnection()).findAll().size() > 0);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	public void testFindAllSplit() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetAllCount() {
		try {
			TestCase.assertTrue(DAOFactory.getIDepartmentDAOInstance(this.databaseConnection.getConnection()).getAllCount("dname", "") > 0);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
