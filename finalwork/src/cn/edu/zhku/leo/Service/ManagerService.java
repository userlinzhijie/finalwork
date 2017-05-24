package cn.edu.zhku.leo.Service;

import java.util.ArrayList;

import cn.edu.zhku.leo.Dao.ManagerDao;
import cn.edu.zhku.leo.Model.*;

public class ManagerService {
	/**
	 *  �÷���������ݿ⣬������һ���������飬
	 * @param
	 * @return Manager��������
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
	 * del�������� �����ݿ������Ӧ���ݲ�ɾ��
	 * 
	 * @param
	 * @return �ɹ�����1��ʧ�ܷ���0
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
	 * add�������� �����ݿ����һ������
	 * 
	 * @param Manager m
	 * @return �ɹ�����1��ʧ�ܷ���0
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
	 * getone�������� �����ݿ��ѯһ������
	 * 
	 * @param int id
	 * @return �ɹ�����Manager����
	 * @throws Exception
	 * 
	 */
	public Manager getone(int id) throws Exception{
    	
    	ManagerDao ld = new ManagerDao();
    	return ld.getone(id);
    }

	/**
	 * 
	 * edit�������� �����ݿ��޸�һ������
	 * 
	 * @param int id,String info
	 * @return �ɹ�����true
	 * @throws Exception
	 * 
	 */
	public boolean edit(Manager m) throws Exception {
		ManagerDao ld = new ManagerDao();
		if(ld.edit(m)!=0){
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 * 
	 * edit�������� �����ݿ��޸�һ������
	 * 
	 * @param int id,String info
	 * @return �ɹ�����true
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
