package cn.edu.zhku.jsj.lzj.Service;

import cn.edu.zhku.jsj.lzj.Dao.UploadDao;
import cn.edu.zhku.jsj.lzj.Model.Keyboard;

public class UploadService {
	public void toUpload(Keyboard keyboard) throws Exception{
		UploadDao ud = new UploadDao();
		ud.upload(keyboard);
	}
}
