package cn.edu.zhku.leo.Service;

import java.util.ArrayList;

import cn.edu.zhku.leo.Dao.ManagerDao;
import cn.edu.zhku.leo.Model.*;

public class ManagerService {
	/**
	 *  该方法检测数据库，并返回一个对象数组，
	 * @param
	 * @return Manager对象数组
	 * @throws Exception
	 *            
	 * 
	 */
	public ArrayList<Manager> get() throws Exception {

		ManagerDao ld = new ManagerDao();

		return ld.getManager();
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
    	
    	ManagerDao ld = new ManagerDao();
    	if(ld.del(id)){
    		return true;
    	}else{
    		return false;
    	}
    }
	
	/**
	 * 
	 * add（）函数 在数据库添加一个数据
	 * 
	 * @param Manager m
	 * @return 成功返回1，失败返回0
	 * @throws Exception
	 * 
	 */
	public boolean add(Manager m) throws Exception{
    	
    	ManagerDao ld = new ManagerDao();
    	if(ld.add(m)){
    		return true;
    	}else{
    		return false;
    	}
    }
	
	/**
	 * 
	 * getone（）函数 在数据库查询一个数据
	 * 
	 * @param int id
	 * @return 成功返回Manager对象
	 * @throws Exception
	 * 
	 */
	public Manager getone(int id) throws Exception{
    	
    	ManagerDao ld = new ManagerDao();
    	return ld.getone(id);
    }

	/**
	 * 
	 * edit（）函数 在数据库修改一个数据
	 * 
	 * @param int id,String info
	 * @return 成功返回true
	 * @throws Exception
	 * 
	 */
	public boolean edit(int id, String info) throws Exception {
		ManagerDao ld = new ManagerDao();
		if(ld.edit(id,info)!=0){
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 * 
	 * edit（）函数 在数据库修改一个数据
	 * 
	 * @param int id,String info
	 * @return 成功返回true
	 * @throws Exception
	 * 
	 */
	public boolean login(Manager m) throws Exception {
		ManagerDao ld = new ManagerDao();
		Manager n = ld.getone(m.getId());
		if(m.getId()==n.getId() && m.getPassword().equals(n.getPassword())){
			return true;
		}else{
			return false;
		}
	}
	
}
