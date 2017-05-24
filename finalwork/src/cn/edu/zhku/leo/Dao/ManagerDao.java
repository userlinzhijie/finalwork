package cn.edu.zhku.leo.Dao;

import java.sql.*;
import java.util.ArrayList;

import cn.edu.zhku.leo.Util.ConnectionManager;
import cn.edu.zhku.leo.Model.*;

public class ManagerDao {
	
	/**
	 * 
	 * �÷���Ϊ����ȡ����Ա���ݿ������
	 * ������ص�userΪ�գ���ʾ���ñ�������
	 * ������ص�user��Ϊ�գ���ʾ��ȡ�ɹ�
	 * 
	 * @param 
	 * @return
	 * @throws Exception
	 * 
	 */
	public ArrayList<Manager> getManager() throws Exception {
	
		ArrayList<Manager> a=new ArrayList<Manager>();

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		// �������ݿ�
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("���ݿ����Ӳ��ɹ���");
		}

		String sqlQuery = "Select * from manager";
		
		ps = conn.prepareStatement(sqlQuery);

		rs = ps.executeQuery();

		while (rs.next()) {
			int id = rs.getInt("id");
			String password = rs.getString("password");
			String info = rs.getString("info");
			
			Manager m = new Manager();
			m.setId(id);
			m.setPassword(password);
			m.setInfo(info);
			
			a.add(m);
		}
		return a;

	}
	
	/**
	 * ���ݴ����idɾ�����ݿ����Ӧ������
	 * 
	 * @param String id
	 * @return �ɹ�����true��ʧ�ܷ���false
	 * @throws Exception
	 * 
	 */
	public boolean del(String id) throws Exception {

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		// �������ݿ�
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("���ݿ����Ӳ��ɹ���");
		}

		String sqlQuery = "Select * from manager where id=?";
		
		ps = conn.prepareStatement(sqlQuery);
		ps.setString(1, id);
		rs = ps.executeQuery();
		
		if(rs.next()){
			sqlQuery = "delete from manager where id=?";
			
			ps = conn.prepareStatement(sqlQuery);
			ps.setString(1, id);
			int r= ps.executeUpdate();
			if(r!=0){
				return true;
			}else{
				return false;
			}
			
		}else{
			return false;
		}
	}
	
	/**
	 * ���ݴ����Manager����������ݿ�
	 * 
	 * @param Manager m
	 * @return �ɹ�����true��ʧ�ܷ���false
	 * @throws Exception
	 * 
	 */
	public boolean add(Manager m) throws Exception {

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		// �������ݿ�
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("���ݿ����Ӳ��ɹ���");
		}

		String sqlQuery = "Select * from manager where id=?";
		
		ps = conn.prepareStatement(sqlQuery);
		ps.setString(1, String.valueOf(m.getId()));
		rs = ps.executeQuery();
		
		if(!rs.next()){
			sqlQuery = "INSERT INTO manager VALUES (?,?,?)";
			
			ps = conn.prepareStatement(sqlQuery);
			ps.setString(1,String.valueOf(m.getId()));
			ps.setString(2,m.getPassword());
			ps.setString(3, m.getInfo());
			int r= ps.executeUpdate();
			if(r!=0){
				return true;
			}else{
				return false;
			}
			
		}else{
			return false;
		}
	}
	
	/**
	 * ���ݴ����id��ȡManager����from���ݿ�
	 * 
	 * @param int id
	 * @return �ɹ�����Manager m,ʧ�ܷ���null
	 * @throws Exception
	 * 
	 */
	public Manager getone(int id) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		// �������ݿ�
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("���ݿ����Ӳ��ɹ���");
		}

		String sqlQuery = "Select * from manager where id=?";
		
		ps = conn.prepareStatement(sqlQuery);
		ps.setString(1, String.valueOf(id));
		rs = ps.executeQuery();
		
		Manager m = new Manager();
		if(rs.next()){
			int id2 = rs.getInt("id");
			String password = rs.getString("password");
			String info = rs.getString("info");
			
			m.setId(id2);
			m.setPassword(password);
			m.setInfo(info);
		}
		return m;
	}

	/**
	 * ���ݴ����id��ȡһ�����ݲ��޸�info
	 * 
	 * @param int id
	 * @return �ɹ�����Manager m,ʧ�ܷ���null
	 * @throws Exception
	 * 
	 */
	public int edit(Manager m) throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		int rs =0;
		
		// �������ݿ�
		conn = ConnectionManager.getConnection();

		if (conn == null) {
			throw new Exception("���ݿ����Ӳ��ɹ���");
		}

		String sqlQuery = "update manager set info=?,password=? where id=?";

		ps = conn.prepareStatement(sqlQuery);
		ps.setString(1, m.getInfo());
		ps.setString(2, m.getPassword());
		ps.setInt(3, m.getId());
		rs = ps.executeUpdate();
		
		return rs;

	}
}
