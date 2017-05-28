package cn.edu.zhku.jsj.lzj.Service;

import cn.edu.zhku.jsj.lzj.Dao.ShowDao;

public class ShowService {
	public String toGetPic(String id) throws Exception{
		ShowDao sd=new ShowDao();
		String pic=sd.getPic(id);
		return pic;
	}
}
