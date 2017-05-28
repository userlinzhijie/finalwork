package cn.edu.zhku.jsj.lzj.Service;

import cn.edu.zhku.jsj.lzj.Dao.ShopinfoDao;
import cn.edu.zhku.jsj.lzj.Model.Shopinfo;

public class ShopinfoService {
	public Shopinfo toGetShopInfo(String id) throws Exception{
		ShopinfoDao sd = new ShopinfoDao();
		Shopinfo si = new Shopinfo();
		si=sd.getShopInfo(id);
		return si;
	}
}
