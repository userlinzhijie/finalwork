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
            pageBean=this.setPageBean(pageBean);
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
            String strSql = "select * from goods where name like '%"+search+"%' limit "+(pageNum-1) * pageBean.getPageSize()+","+pageBean.getPageSize();
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
