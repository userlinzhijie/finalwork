package cn.edu.zhku.jsj.lzj.Service;

import cn.edu.zhku.jsj.lzj.Dao.GetDao;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class GetService {
	public JSONObject toGetGoods() throws Exception{
		GetDao gd = new GetDao();
		JSONObject Keyboard = new JSONObject();
		JSONArray jsonArray = gd.getGoods();
		Keyboard.put("Keyboards",jsonArray);
		return Keyboard;		
	}
}
