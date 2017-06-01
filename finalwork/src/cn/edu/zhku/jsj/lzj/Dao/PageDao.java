package cn.edu.zhku.jsj.lzj.Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import cn.edu.zhku.jsj.lzj.Util.ConnectionManager;
import cn.edu.zhku.jsj.lzj.Model.PageBean;
import cn.edu.zhku.jsj.lzj.Model.Keyboard;

public class PageDao {
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public PageBean getResult(int page,String type) throws Exception {  
        try {  
            PageBean pageBean = new PageBean();             
			ArrayList list = new ArrayList();   
            int pageNum = page;   
            pageBean=this.setTypePageBean(pageBean,type);
            pageBean.setCurPage(pageNum); 
            pageNum=pageBean.getCurPage();
            Connection con=ConnectionManager.getConnection();  
            if (con == null) {
    			throw new Exception("数据库连接不成功！");
    		}
            Statement stmt = con.createStatement();  
            String strSql = "select * from goods where type like '%"+type+"%' limit "+(pageNum-1) * pageBean.getPageSize()+","+pageBean.getPageSize();
            ResultSet rs = stmt.executeQuery(strSql);  
            while (rs.next()) {    
                    Keyboard kb=new Keyboard();  
                    kb.setId(rs.getString("id"));
                    kb.setBrand(rs.getString("brand")); 
                    kb.setPrice(rs.getString("price")); 
                    kb.setType(rs.getString("type"));
                    kb.setName(rs.getString("name"));
                    kb.setColor(rs.getString("color"));
                    kb.setVersion(rs.getString("version"));
                    kb.setBacklight(rs.getString("backlight"));
                    kb.setDetails(rs.getString("details"));
                    kb.setErgo(rs.getString("ergo"));
                    kb.setInter(rs.getString("interface"));
                    kb.setMaterial(rs.getString("material"));
                    kb.setBacklight(rs.getString("backlight"));
                    kb.setSize(rs.getString("size"));
                    kb.setStandard(rs.getString("standard"));
                    kb.setWeight(rs.getString("weight"));
                    kb.setStatus(rs.getString("status"));
                    list.add(kb);  
            }  
            pageBean.setData(list); 
            con.close();
            return pageBean;  
        } catch (Exception e) {  
            e.printStackTrace();  
            System.out.println("PageBean显示本页数据逻辑erro");  
            throw e;  
  
        }  
    }
	
	public int getAvailableCount() throws Exception {  
        int ret = 0;  
        Connection con=ConnectionManager.getConnection();  
        Statement stmt = con.createStatement();  
        String strSql = "select * from goods";
        ResultSet rs = stmt.executeQuery(strSql);  
        while (rs.next()) {  
            ret++;  
        }  
        return ret;  
    }  
	
	public PageBean setPageBean(PageBean pageBean) throws Exception {  
        pageBean.setTotalRows(this.getAvailableCount());  
        if (pageBean.getTotalRows() % pageBean.getPageSize() == 0) { 
            pageBean.setTotalPages(pageBean.getTotalRows()/ pageBean.getPageSize());  
        } else {  
        	pageBean.setTotalPages(pageBean.getTotalRows() / pageBean.getPageSize() + 1);  
        }  
        return pageBean;
    }
	
	public int getTypeCount(String type) throws Exception {  
        int ret = 0;  
        Connection con=ConnectionManager.getConnection();  
        Statement stmt = con.createStatement();  
        String strSql = "select * from goods where type = '"+type+"'";
        ResultSet rs = stmt.executeQuery(strSql);  
        while (rs.next()) {  
            ret++;  
        }  
        return ret;  
    }  
	
	public PageBean setTypePageBean(PageBean pageBean,String type) throws Exception {  
        pageBean.setTotalRows(this.getTypeCount(type));  
        if (pageBean.getTotalRows() % pageBean.getPageSize() == 0) { 
            pageBean.setTotalPages(pageBean.getTotalRows()/ pageBean.getPageSize());  
        } else {  
        	pageBean.setTotalPages(pageBean.getTotalRows() / pageBean.getPageSize() + 1);  
        }  
        return pageBean;
    }
	
	
	
	public int getSearchCount(String search) throws Exception {  
        int ret = 0;  
        Connection con=ConnectionManager.getConnection();  
        Statement stmt = con.createStatement();  
        String strSql = "select * from goods where name like '%"+search+"%'";
        ResultSet rs = stmt.executeQuery(strSql);  
        while (rs.next()) {  
            ret++;  
        }  
        return ret;  
    }  
	
	public PageBean setSearchPageBean(PageBean pageBean,String search) throws Exception {  
        pageBean.setTotalRows(this.getSearchCount(search));  
        if (pageBean.getTotalRows() % pageBean.getPageSize() == 0) { 
            pageBean.setTotalPages(pageBean.getTotalRows()/ pageBean.getPageSize());  
        } else {  
        	pageBean.setTotalPages(pageBean.getTotalRows() / pageBean.getPageSize() + 1);  
        }  
        return pageBean;
    }

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public PageBean getSearch(String search,int page) throws Exception {
		try {  
            PageBean pageBean = new PageBean();             
			ArrayList list = new ArrayList(); 
            int pageNum = page;   
            pageBean=this.setSearchPageBean(pageBean,search);
            pageBean.setCurPage(pageNum); 
            pageNum=pageBean.getCurPage();
            Connection con=ConnectionManager.getConnection();  
            if (con == null) {
    			throw new Exception("数据库连接不成功！");
    		}
            Statement stmt = con.createStatement();  
            String strSql = "select * from goods where name like '%"+search+"%' limit "+(pageNum-1)*pageBean.getPageSize()+","+pageBean.getPageSize();
            ResultSet rs = stmt.executeQuery(strSql);  
            while (rs.next()) {    
                    Keyboard kb=new Keyboard();  
                    kb.setId(rs.getString("id"));
                    kb.setBrand(rs.getString("brand")); 
                    kb.setPrice(rs.getString("price")); 
                    kb.setType(rs.getString("type"));
                    kb.setName(rs.getString("name"));
                    kb.setColor(rs.getString("color"));
                    kb.setVersion(rs.getString("version"));
                    kb.setBacklight(rs.getString("backlight"));
                    kb.setDetails(rs.getString("details"));
                    kb.setErgo(rs.getString("ergo"));
                    kb.setInter(rs.getString("interface"));
                    kb.setMaterial(rs.getString("material"));
                    kb.setBacklight(rs.getString("backlight"));
                    kb.setSize(rs.getString("size"));
                    kb.setStandard(rs.getString("standard"));
                    kb.setWeight(rs.getString("weight"));
                    kb.setStatus(rs.getString("status"));
                    list.add(kb);  
            }  
            pageBean.setData(list); 
            con.close();
            return pageBean;  
        } catch (Exception e) {  
            e.printStackTrace();  
            System.out.println("PageBean显示search数据逻辑erro");  
            throw e;  
  
        }  
	}  
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public PageBean getDetail(int id) throws Exception {
		try {  
            PageBean pageBean = new PageBean();             
			ArrayList list = new ArrayList();    
            Connection con=ConnectionManager.getConnection();  
            if (con == null) {
    			throw new Exception("数据库连接不成功！");
    		}
            Statement stmt = con.createStatement();  
            String strSql = "select * from goods where id = '"+id+"'";
            ResultSet rs = stmt.executeQuery(strSql);  
            while (rs.next()) {    
                    Keyboard kb=new Keyboard();  
                    kb.setId(rs.getString("id"));
                    kb.setBrand(rs.getString("brand")); 
                    kb.setPrice(rs.getString("price")); 
                    kb.setType(rs.getString("type"));
                    kb.setName(rs.getString("name"));
                    kb.setColor(rs.getString("color"));
                    kb.setVersion(rs.getString("version"));
                    kb.setBacklight(rs.getString("backlight"));
                    kb.setDetails(rs.getString("details"));
                    kb.setErgo(rs.getString("ergo"));
                    kb.setInter(rs.getString("interface"));
                    kb.setMaterial(rs.getString("material"));
                    kb.setBacklight(rs.getString("backlight"));
                    kb.setSize(rs.getString("size"));
                    kb.setStandard(rs.getString("standard"));
                    kb.setWeight(rs.getString("weight"));
                    kb.setUser(rs.getString("seller_id"));
                    kb.setStatus(rs.getString("status"));
                    list.add(kb);  
            }  
            pageBean.setData(list); 
            con.close();
            return pageBean;  
        } catch (Exception e) {  
            e.printStackTrace();  
            System.out.println("PageBean显示本页数据逻辑erro");  
            throw e;  
        }  
	}  
	
	//得到排序页面的页数数据
	public int getOrderCount(String type,String search) throws Exception {  
        int ret = 0;  
        Connection con=ConnectionManager.getConnection();  
        Statement stmt = con.createStatement();  
        String strSql="select * from goods order by price ";
        if(type!="")
        {
        	strSql = "select * from goods  where type = '"+type+"' order by price ";
        }
        if(search!="")
        {
        	strSql = "select * from goods  where name like '%"+search+"%' order by price ";
        }
        ResultSet rs = stmt.executeQuery(strSql);  
        while (rs.next()) {  
            ret++;  
        }  
        return ret;  
    }  
	
	public PageBean setOrderPageBean(PageBean pageBean,String type,String search) throws Exception {  
        pageBean.setTotalRows(this.getOrderCount(type,search));  
        if (pageBean.getTotalRows() % pageBean.getPageSize() == 0) { 
            pageBean.setTotalPages(pageBean.getTotalRows()/ pageBean.getPageSize());  
        } else {  
        	pageBean.setTotalPages(pageBean.getTotalRows() / pageBean.getPageSize() + 1);  
        }  
        return pageBean;
    }
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public PageBean getOrder(String order,String type,String search,int page) throws Exception {
		try {  
            PageBean pageBean = new PageBean();             
			ArrayList list = new ArrayList();   
            int pageNum = page;   
            pageBean=this.setOrderPageBean(pageBean,type,search);
            pageBean.setCurPage(pageNum); 
            pageNum=pageBean.getCurPage();
            String strSql=null;
            Connection con=ConnectionManager.getConnection();  
            if (con == null) {
    			throw new Exception("数据库连接不成功！");
    		}
            Statement stmt = con.createStatement();
            if(type==""&&search=="")
            {
            	strSql = "select * from goods order by price "+order+" limit "+(pageNum-1) * pageBean.getPageSize()+","+pageBean.getPageSize();
            }
            if(type!="")
            {
            	strSql = "select * from goods  where type = '"+type+"' order by price "+order+" limit "+(pageNum-1) * pageBean.getPageSize()+","+pageBean.getPageSize();
            }
            if(search!="")
            {
            	strSql = "select * from goods  where name like '%"+search+"%' order by price "+order+" limit "+(pageNum-1) * pageBean.getPageSize()+","+pageBean.getPageSize();
            }
            ResultSet rs = stmt.executeQuery(strSql);  
            while (rs.next()) {    
                    Keyboard kb=new Keyboard();  
                    kb.setId(rs.getString("id"));
                    kb.setBrand(rs.getString("brand")); 
                    kb.setPrice(rs.getString("price")); 
                    kb.setType(rs.getString("type"));
                    kb.setName(rs.getString("name"));
                    kb.setColor(rs.getString("color"));
                    kb.setVersion(rs.getString("version"));
                    kb.setBacklight(rs.getString("backlight"));
                    kb.setDetails(rs.getString("details"));
                    kb.setErgo(rs.getString("ergo"));
                    kb.setInter(rs.getString("interface"));
                    kb.setMaterial(rs.getString("material"));
                    kb.setBacklight(rs.getString("backlight"));
                    kb.setSize(rs.getString("size"));
                    kb.setStandard(rs.getString("standard"));
                    kb.setWeight(rs.getString("weight"));
                    kb.setStatus(rs.getString("status"));
                    list.add(kb);  
            }  
            pageBean.setData(list); 
            con.close();
            return pageBean;  
        } catch (Exception e) {  
            e.printStackTrace();  
            System.out.println("PageBean显示本页数据逻辑erro");  
            throw e;  
  
        }  
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public PageBean getGoods(String userid,int page) throws Exception {  
        try {  
            PageBean pageBean = new PageBean();             
			ArrayList list = new ArrayList();   
            int pageNum = page;   
            pageBean=this.setPageBean(pageBean);
            pageBean.setCurPage(pageNum); 
            pageNum=pageBean.getCurPage();
            Connection con=ConnectionManager.getConnection();  
            if (con == null) {
    			throw new Exception("数据库连接不成功！");
    		}
            Statement stmt = con.createStatement();  
            String strSql = "select * from goods where seller_id = '"+userid+"' limit "+(pageNum-1) * pageBean.getPageSize()+","+pageBean.getPageSize();
            ResultSet rs = stmt.executeQuery(strSql);  
            while (rs.next()) {    
                    Keyboard kb=new Keyboard();  
                    kb.setId(rs.getString("id"));
                    kb.setBrand(rs.getString("brand")); 
                    kb.setPrice(rs.getString("price")); 
                    kb.setType(rs.getString("type"));
                    kb.setName(rs.getString("name"));
                    kb.setColor(rs.getString("color"));
                    kb.setVersion(rs.getString("version"));
                    kb.setBacklight(rs.getString("backlight"));
                    kb.setDetails(rs.getString("details"));
                    kb.setErgo(rs.getString("ergo"));
                    kb.setInter(rs.getString("interface"));
                    kb.setMaterial(rs.getString("material"));
                    kb.setBacklight(rs.getString("backlight"));
                    kb.setSize(rs.getString("size"));
                    kb.setStandard(rs.getString("standard"));
                    kb.setWeight(rs.getString("weight"));
                    kb.setStatus(rs.getString("status"));
                    list.add(kb);  
            }  
            pageBean.setData(list); 
            con.close();
            return pageBean;  
        } catch (Exception e) {  
            e.printStackTrace();  
            System.out.println("PageBean显示本页数据逻辑erro");  
            throw e;  
  
        }  
    }
}
