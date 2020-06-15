package org.lks.dao.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Iterator;
import java.util.Set;

public abstract class AbstractBaseDAO {

	protected Connection conn;
	
	public AbstractBaseDAO(Connection conn){
		this.conn = conn;
	}
	
	public boolean removeHandle(Set<Long> ids, String tableName, String idName) throws Exception {
		StringBuffer sql = new StringBuffer("DELETE FROM "+ tableName +" WHERE " + idName +" IN(");
		Iterator<Long> iter = ids.iterator();
		while(iter.hasNext()){
			sql.append(iter.next()).append(",");
		}
		sql.delete(sql.length() - 1, sql.length()).append(")");
		PreparedStatement pstmt = this.conn.prepareStatement(sql.toString());
		return pstmt.executeUpdate() == ids.size();
	}
	
	public Long getAllCountHandle(String column, String keyWord, String tableName) throws Exception {
		String sql = "SELECT COUNT(*) FROM " + tableName + " WHERE " + column + " LIKE ?";
		PreparedStatement pstmt = this.conn.prepareStatement(sql);
		pstmt.setString(1, "%" + keyWord + "%");
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
			return rs.getLong(1);
		}
		return 0L;
	}
}
