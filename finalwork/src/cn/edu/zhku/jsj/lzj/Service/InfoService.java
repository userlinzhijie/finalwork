package cn.edu.zhku.jsj.lzj.Service;

import cn.edu.zhku.jsj.lzj.Dao.InfoDao;
import cn.edu.zhku.jsj.lzj.Model.User;

public class InfoService {
	public void tochangeInfo(User user) throws Exception{
		InfoDao ld = new InfoDao();
		ld.changeInfo(user);
	}		
}
