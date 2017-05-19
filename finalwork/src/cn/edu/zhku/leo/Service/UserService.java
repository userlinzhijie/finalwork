package cn.edu.zhku.leo.Service;

import java.util.ArrayList;


import cn.edu.zhku.leo.Dao.UserDao;
import cn.edu.zhku.leo.Model.User;

public class UserService {

	/**
	 *  该方法检测数据库，并返回一个对象数组，
	 * @param
	 * @return Manager对象数组
	 * @throws Exception
	 *            
	 * 
	 */
	public ArrayList<User> get() throws Exception {

		UserDao ld = new UserDao();

		return ld.getAll();
	}

	/**
	 * 
	 * del（）函数 在数据库检索相应数据并删除
	 * 
	 * @param
	 * @return 成功返回1，失败返回0
	 * @throws Exception
	 * 
	 */
	public boolean del(String id) throws Exception{
    	
    	UserDao ld = new UserDao();
    	if(ld.del(id)){
    		return true;
    	}else{
    		return false;
    	}
    }
}
