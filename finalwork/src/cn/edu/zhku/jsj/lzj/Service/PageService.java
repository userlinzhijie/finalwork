package cn.edu.zhku.jsj.lzj.Service;

import cn.edu.zhku.jsj.lzj.Dao.PageDao;
import cn.edu.zhku.jsj.lzj.Model.PageBean;

public class PageService {
	public PageBean goGetResult(int page,String type) throws Exception {
		PageBean pageBean = new PageBean();
		PageDao pd = new PageDao();
		pageBean=pd.getResult(page,type);
		return pageBean;
	}
	
	public PageBean goGetSearch(String search,int page) throws Exception{
		PageBean pageBean = new PageBean();
		PageDao pd = new PageDao();
		pageBean=pd.getSearch(search,page);
		return pageBean;
	}
	
	public PageBean goGetDetail(int id) throws Exception{
		PageBean pageBean = new PageBean();
		PageDao pd = new PageDao();
		pageBean=pd.getDetail(id);
		return pageBean;
	}
}
