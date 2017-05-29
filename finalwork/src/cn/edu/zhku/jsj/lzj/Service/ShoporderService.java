package cn.edu.zhku.jsj.lzj.Service;

import cn.edu.zhku.jsj.lzj.Dao.ShoporderDao;
import cn.edu.zhku.jsj.lzj.Model.PageBean;

public class ShoporderService {
	public PageBean goGetOrder(String id,int page) throws Exception{
		PageBean pageBean = new PageBean();
		ShoporderDao sd = new ShoporderDao();
		pageBean=sd.getOrder(id,page);
		return pageBean;
	}
	public String goGetShopId(String id) throws Exception{
		ShoporderDao sd = new ShoporderDao();
		String shopid=sd.GetShopId(id);
		return shopid;
	}
}
