package cn.edu.zhku.jsj.lzj.Service;

import cn.edu.zhku.jsj.lzj.Dao.PageDao;
import cn.edu.zhku.jsj.lzj.Model.PageBean;

public class PageService {
	public PageBean goGetResult(int page) throws Exception {
		PageBean pageBean = new PageBean();
		PageDao pd = new PageDao();
		pageBean=pd.getResult(page);
		return pageBean;
	}
}
