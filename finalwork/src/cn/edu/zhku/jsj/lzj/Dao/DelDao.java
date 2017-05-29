package cn.edu.zhku.jsj.lzj.Dao;

import java.sql.Connection;
import java.sql.Statement;

import cn.edu.zhku.jsj.lzj.Util.ConnectionManager;

public class DelDao {
		public void delgoods(String id) throws Exception{
			Connection con = null;
			con = ConnectionManager.getConnection();
			if (con == null) {
				throw new Exception("数据库连接不成功！");
			}
			 Statement stmt = con.createStatement();
			 String strSql = "update goods set status = 1 where id = "+id;
			 stmt.executeUpdate(strSql);
		}
		
		public void delorder(String id,String status)throws Exception{
			Connection con = null;
			con = ConnectionManager.getConnection();
			if (con == null) {
				throw new Exception("数据库连接不成功！");
			}
			 Statement stmt = con.createStatement();		 
			 int s = Integer.parseInt(status);
			 System.out.println(s);
			 String strSql = "update `order` set status = 9 where id = "+id;
			 if(s==2||s==6)
			 {
				 strSql = "update `order` set status = 3 where id = "+id;
			 }
			 if(s==8)
			 {
				 strSql = "update `order` set status = 89 where id = "+id;
			 }
			 stmt.executeUpdate(strSql);
		}
}
