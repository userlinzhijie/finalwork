package cn.edu.zhku.jsj.lzj.Service;

import cn.edu.zhku.jsj.lzj.Dao.DelDao;


public class DelService {
	public void todelgoods(String id) throws Exception{
		DelDao dd = new DelDao();	
		dd.delgoods(id);
	}	
	
	public void todelorder(String id,String status) throws Exception{
		DelDao dd = new DelDao();	
		dd.delorder(id,status);
	}
}
