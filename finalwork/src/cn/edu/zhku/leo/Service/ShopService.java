package cn.edu.zhku.leo.Service;

import java.util.ArrayList;

import cn.edu.zhku.leo.Dao.ShopDao;
import cn.edu.zhku.leo.Model.Shop;

public class ShopService {
	
	/**
	 *  �÷���������ݿ⣬������һ���������飬
	 *  ����׼����
	 * @param
	 * @return Manager��������
	 * @throws Exception
	 *            
	 * 
	 */
	public ArrayList<Shop> get1() throws Exception {

		ShopDao ld = new ShopDao();
		ArrayList<Shop> a = ld.get();
		ArrayList<Shop> b = new ArrayList<Shop>();
		
		for (int i = 0; i < a.size(); i++) {
			if(a.get(i).getStatus()!=0){
				b.add(a.get(i));
			}
		}
		return b;
	}


	/**
	 *  �÷���������ݿ⣬������һ���������飬
	 *  ��������
	 * @param
	 * @return Manager��������
	 * @throws Exception
	 *            
	 * 
	 */
	public ArrayList<Shop> get2() throws Exception {

		ShopDao ld = new ShopDao();
		ArrayList<Shop> a = ld.get();
		ArrayList<Shop> b = new ArrayList<Shop>();
		
		for (int i = 0; i < a.size(); i++) {
			if(a.get(i).getStatus()==0){
				b.add(a.get(i));
			}
		}
		return b;
	}


	public void agree(int sid) throws Exception {
		ShopDao ld = new ShopDao();
		ld.agree(sid);
	}
	
	public void start(int sid) throws Exception {
		ShopDao ld = new ShopDao();
		ld.start(sid);
	}
	
	public void stop(int sid) throws Exception {
		ShopDao ld = new ShopDao();
		ld.stop(sid);
	}
}
