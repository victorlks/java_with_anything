package org.lks.test.junit;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.junit.Test;
import org.lks.factory.ServiceFactory;
import org.lks.vo.Department;

import junit.framework.TestCase;

public class IDepartmentServiceTest {

	@Test
	public void testInsert() {
		Department vo = new Department();
		vo.setDid(10L);
		vo.setDname("lks");
		vo.setDlocation("henan");
		try {
			TestCase.assertTrue(ServiceFactory.getIDepartmentServiceInstance().insert(vo));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	public void testUpdate() {
		Department vo = new Department();
		vo.setDid(10L);
		vo.setDname("hhy");
		vo.setDlocation("henan");
		try {
			TestCase.assertTrue(ServiceFactory.getIDepartmentServiceInstance().update(vo));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	public void testDelete() {
		Set<Long> ids = new HashSet<Long>();
		ids.add(10L);
		try {
			TestCase.assertTrue(ServiceFactory.getIDepartmentServiceInstance().delete(ids));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	public void testUpdatePre() {
		try {
			TestCase.assertTrue(ServiceFactory.getIDepartmentServiceInstance().updatePre(10L).getDname().equals("hhy"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	public void testList() {
		try {
			TestCase.assertTrue(ServiceFactory.getIDepartmentServiceInstance().list().size() > 0);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Test
	public void testList2(){
		try {
			TestCase.assertTrue(((List<Department>) ServiceFactory.getIDepartmentServiceInstance().list(1,5,"dname","").get("all")).size() > 0);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
