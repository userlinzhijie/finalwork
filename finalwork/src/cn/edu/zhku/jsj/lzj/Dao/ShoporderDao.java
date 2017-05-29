package cn.edu.zhku.jsj.lzj.Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import cn.edu.zhku.jsj.lzj.Model.Shoporder;
import cn.edu.zhku.jsj.lzj.Model.PageBean;
import cn.edu.zhku.jsj.lzj.Util.ConnectionManager;

public class ShoporderDao {
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public PageBean getOrder(String id,int page) throws Exception {  
        try {  
            PageBean pageBean = new PageBean();             
			ArrayList list = new ArrayList();   
            int pageNum = page;   
            pageBean=this.setPageBean(pageBean,id);
            pageBean.setCurPage(pageNum); 
            pageNum=pageBean.getCurPage();
            Connection con=ConnectionManager.getConnection();
            Connection newcon=ConnectionManager.getConnection();  
            if (con == null) {
    			throw new Exception("数据库连接不成功！");
    		}
            if (newcon == null) {
    			throw new Exception("数据库连接不成功！");
    		}
            Statement stmt = con.createStatement(); 
            Statement newstmt = con.createStatement(); 
            String strSql = "select * from `order` where seller_id = '"+id+"' limit "+(pageNum-1) * pageBean.getPageSize()+","+pageBean.getPageSize();       
            String goods_id=null;
            ResultSet rs = stmt.executeQuery(strSql);  
            while (rs.next()) { 
            	 	Shoporder so=new Shoporder();
                    so.setId(rs.getString("id"));
                    goods_id=rs.getString("goods_id");                   
                    so.setNumber(rs.getString("number"));
                    so.setTotal(rs.getString("total"));
                    so.setTransfee(rs.getString("transfee"));
                    so.setDate(rs.getString("date"));
                    so.setStatus(rs.getString("status"));    
                    String newstrSql = "select * from goods where id = "+goods_id;
                    ResultSet result = newstmt.executeQuery(newstrSql);
                    if(result.next())
                    {
                    	so.setGoods(result.getString("name"));
                    }
                    list.add(so); 
            	}           
            pageBean.setData(list); 
            con.close();
            newcon.close();
            return pageBean;  
        } catch (Exception e) {  
            e.printStackTrace();  
            System.out.println("PageBean显示本页数据逻辑erro");  
            throw e;  
  
        }  
    }
	public int getAvailableCount(String id) throws Exception {  
        int ret = 0;  
        Connection con=ConnectionManager.getConnection();  
        Statement stmt = con.createStatement();
        String strSql = "select * from `order` where seller_id = "+id;
        ResultSet rs = stmt.executeQuery(strSql);  
        while (rs.next()) {  
            ret++;  
        }  
        return ret;  
    }  
	
	public PageBean setPageBean(PageBean pageBean,String id) throws Exception {  
        pageBean.setTotalRows(this.getAvailableCount(id));  
        if (pageBean.getTotalRows() % pageBean.getPageSize() == 0) { 
            pageBean.setTotalPages(pageBean.getTotalRows()/ pageBean.getPageSize());  
        } else {  
        	pageBean.setTotalPages(pageBean.getTotalRows() / pageBean.getPageSize() + 1);  
        }  
        return pageBean;
    }
	
	public String GetShopId(String id) throws Exception{
		Connection con=ConnectionManager.getConnection();  
        if (con == null) {
			throw new Exception("数据库连接不成功！");
		}
        Statement stmt = con.createStatement();  
        String strSql = "select * from shop where user_id = "+id;
        ResultSet rs = stmt.executeQuery(strSql);  
        if(rs.next()) {  
        	id=rs.getString("shop_id");
        }
		return id;		
	}
}
