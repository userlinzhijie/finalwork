package cn.edu.zhku.jsj.lzj.Service;

import cn.edu.zhku.jsj.lzj.Dao.RegDao;
import cn.edu.zhku.jsj.lzj.Model.User;

public class RegService {
	public void towriteSql(User user) throws Exception{
	
		RegDao rd = new RegDao();
		rd.writeSql(user);
	}
}
