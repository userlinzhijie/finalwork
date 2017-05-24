package cn.edu.zhku.jsj.lzj.Service;

import cn.edu.zhku.jsj.lzj.Dao.CheckDao;
import cn.edu.zhku.jsj.lzj.Model.User;

public class CheckService {
	public boolean checkUser(User user) throws Exception{
		CheckDao cd = new CheckDao();
		boolean result=cd.getUser(user);
		return result;
	}
}
