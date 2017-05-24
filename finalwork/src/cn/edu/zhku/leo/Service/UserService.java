package cn.edu.zhku.leo.Service;

import java.util.ArrayList;

import cn.edu.zhku.leo.Dao.UserDao;
import cn.edu.zhku.leo.Model.Address;
import cn.edu.zhku.leo.Model.Card;
import cn.edu.zhku.leo.Model.Order;
import cn.edu.zhku.leo.Model.User;

public class UserService {

	/**
	 * 该方法检测数据库，并返回一个对象数组，
	 * 
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
	public boolean del(String id) throws Exception {

		UserDao ld = new UserDao();
		if (ld.del(id)) {
			return true;
		} else {
			return false;
		}
	}

	public boolean edit(User u) throws Exception {
		UserDao ld = new UserDao();
		if (ld.edit(u)) {
			return true;
		} else {
			return false;
		}
	}

	public boolean cPassword(String oldpassword, String newpassword, int id)
			throws Exception {
		UserDao ld = new UserDao();
		if (ld.check(id, oldpassword)) {
			if (ld.cPassword(id, newpassword)) {
				return true;
			}
		}
		return false;
	}

	public ArrayList<Address> getAddress(int user_id) throws Exception {

		UserDao ld = new UserDao();
		ArrayList<Address> A = ld.getAllAddress();
		ArrayList<Address> B = new ArrayList<Address>();

		for (int i = 0; i < A.size(); i++) {
			Address a = A.get(i);
			if (a.getUser_id() == user_id) {
				B.add(a);
			}
		}
		return B;
	}
	
	public ArrayList<Card> getCard(int user_id) throws Exception {

		UserDao ld = new UserDao();
		ArrayList<Card> A = ld.getAllCard();
		ArrayList<Card> B = new ArrayList<Card>();

		for (int i = 0; i < A.size(); i++) {
			Card a = A.get(i);
			if (a.getUser_id() == user_id) {
				B.add(a);
			}
		}
		return B;
	}

	public boolean add_address(Address a) throws Exception {

		UserDao ld = new UserDao();
		if (ld.add_address(a)) {
			return true;
		} else {
			return false;
		}
	}

	public boolean add_card(Card a) throws Exception {

		UserDao ld = new UserDao();
		if (ld.add_card(a)) {
			return true;
		} else {
			return false;
		}
	}

	public boolean del_address(int id) throws Exception {

		UserDao ld = new UserDao();
		if (ld.del_address(id)) {
			return true;
		} else {
			return false;
		}
	}

	public boolean del_card(String id) throws Exception{
		UserDao ld = new UserDao();
		if (ld.del_card(id)) {
			return true;
		} else {
			return false;
		}
	}

	public ArrayList<Order> getOrder(int user_id) throws Exception{
		UserDao ld = new UserDao();
		ArrayList<Order> A = ld.getAllOrder();
		ArrayList<Order> B = new ArrayList<Order>();

		for (int i = 0; i < A.size(); i++) {
			Order a = A.get(i);
			if (a.getUser_id() == user_id) {
				B.add(a);
			}
		}
		return B;
	}
}
