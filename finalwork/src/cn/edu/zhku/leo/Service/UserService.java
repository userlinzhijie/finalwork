package cn.edu.zhku.leo.Service;

import java.util.ArrayList;

import cn.edu.zhku.leo.Dao.UserDao;
import cn.edu.zhku.leo.Model.*;

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

	public boolean del_card(String id) throws Exception {
		UserDao ld = new UserDao();
		if (ld.del_card(id)) {
			return true;
		} else {
			return false;
		}
	}

	public ArrayList<Order> getOrder(int user_id) throws Exception {
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

	public Shop getShop(int user_id) throws Exception {
		UserDao d = new UserDao();
		return d.getShop(user_id);
	}

	public boolean shopApply(Shop s) throws Exception {
		UserDao ld = new UserDao();
		if (ld.add_shop(s)) {
			return true;
		} else {
			return false;
		}
	}

	public boolean register(User u) throws Exception {
		UserDao ld = new UserDao();
		ArrayList<User> a = new ArrayList<User>();
		boolean unexisted = true;
		a = ld.getAll();
		for (int i = 0; i < a.size(); i++) {
			if (a.get(i).getName().equals(u.getName()))
				unexisted = false;
		}

		if (unexisted) {
			if (ld.register(u)) {
				return true;
			} else {
				return false;
			}
		} else
			return false;
	}

	public boolean login(User u) throws Exception {
		UserDao ld = new UserDao();
		if (ld.checkByNamePwd(u.getName(), u.getPassword())) {
			return true;
		} else {
			return false;
		}
	}

	public int getIdByName(String name) throws Exception {
		ArrayList<User> a = this.get();
		for (int i = 0; i < a.size(); i++) {
			if (a.get(i).getName().equals(name)) {
				return a.get(i).getId();
			}
		}
		return 0;
	}

	public ArrayList<Cartlog> getCart(int user_id) throws Exception {
		UserDao ld = new UserDao();
		ArrayList<Cartlog> A = ld.getCart();
		ArrayList<Cartlog> B = new ArrayList<Cartlog>();
		for (int i = 0; i < A.size(); i++) {
			Cartlog a = A.get(i);
			if (a.getUser_id() == user_id) {
				B.add(a);
			}
		}
		return B;
	}

	public Goods getGoodsById(int goods_id) throws Exception {
		UserDao ld = new UserDao();
		return ld.getGoodsById(goods_id);
	}

	public boolean del_cart(int id) throws Exception {
		UserDao ld = new UserDao();
		if (ld.del_cart(id)) {
			return true;
		} else {
			return false;
		}
	}

	public ArrayList<Goods> getGoodsByArr(String arr, String num)
			throws Exception {

		UserDao ld = new UserDao();
		ArrayList<Goods> A = new ArrayList<Goods>();
		String[] arr1 = arr.split("_");
		String[] num1 = num.split("_");
		for (int i = 0; i < arr1.length; i++) {
			int id = Integer.parseInt(arr1[i]);
			int n = Integer.parseInt(num1[i]);
			Goods g = ld.getGoodsById(id);
			g.setNumber(n);
			A.add(g);
		}
		return A;
	}

	public boolean add_order(Order c, String arr_n, String arr_g, String arr_s,
			String arr_v,int mode) throws Exception {
		UserDao d = new UserDao();

		String[] an = arr_n.split("_");
		String[] ag = arr_g.split("_");
		String[] as = arr_s.split("_");
		String[] av = arr_v.split("_");
		for (int i = 0; i < ag.length; i++) {
			int g = Integer.parseInt(ag[i]);
			int n = Integer.parseInt(an[i]);
			int s = Integer.parseInt(as[i]);
			int v = Integer.parseInt(av[i]);

			c.setGoods_id(g);
			c.setNumber(n);
			c.setSeller_id(s);
			c.setTotal(v);
			try {
				d.add_order(c);
			} catch (Exception e) {
				return false;
			}
		}
		if(mode==1)
			d.clear_cart();
		return true;
	}

	public boolean orderTo(int order_id, int status) throws Exception {
		UserDao ld = new UserDao();
		if (ld.orderStatusTo(order_id, status)) {
			return true;
		} else {
			return false;
		}
	}

	public boolean del_order(int id) throws Exception {
		UserDao ld = new UserDao();
		if (ld.getOrderStatusById(id) == 9) {
			ld.orderStatusTo(id, 89);
			return true;
		} else {
			if (ld.orderStatusTo(id, 8)) {
				return true;
			} else {
				return false;
			}
		}
	}

	public boolean add_collect(int uid, int gid) throws Exception {
		UserDao ld = new UserDao();
		if (ld.add_collect(uid, gid)) {
			return true;
		} else {
			return false;
		}
	}

	public boolean del_collect(int id) throws Exception {
		UserDao ld = new UserDao();
		if (ld.del_collect(id)) {
			return true;
		} else {
			return false;
		}
	}

	public ArrayList<Collect> getCollect(int user_id) throws Exception {
		UserDao ld = new UserDao();
		return ld.getCollect(user_id);
	}

	public boolean add_cart(Cartlog c) throws Exception {
		UserDao ld = new UserDao();
		if (ld.add_cart(c)) {
			return true;
		} else {
			return false;
		}
	}

	public int getSellerIdByGoodsId(int goods_id) throws Exception {
		UserDao ld = new UserDao();
		return ld.getSidByGid(goods_id);
	}

	public Address getDefaultAddressByUid(int user_id) throws Exception {
		UserDao ld = new UserDao();
		ArrayList<Address> A = new ArrayList<Address>();
		A = ld.getAllAddress();
		for (int i = 0; i < A.size(); i++) {
			Address a = A.get(i);
			if (a.getId() == user_id && a.getDe_fault() == 1) {
				return a;
			}
		}
		return null;
	}

	public Card getDefaultCardByUid(int user_id) throws Exception {
		UserDao ld = new UserDao();
		ArrayList<Card> A = new ArrayList<Card>();
		A = ld.getAllCard();
		for (int i = 0; i < A.size(); i++) {
			Card a = A.get(i);
			if (a.getUser_id() == user_id && a.getDe_fault() == 1) {
				return a;
			}
		}
		return null;
	}

	public void setDefault_a(int address_id) throws Exception{
		UserDao d = new UserDao();
		d.setDefault_a(address_id);
		System.out.println("?");
	}
	
	public void setDefault_c(String card_id) throws Exception{
		UserDao d = new UserDao();
		d.setDefault_c(card_id);
		System.out.println("?");

	}

	public Order getOrderById(int order_id) throws Exception{
		UserDao d= new UserDao();
		ArrayList<Order> A = d.getAllOrder();
		Order b = new Order();
		for(int i=0;i<A.size();i++){
			b=A.get(i);
			if(b.getId()==order_id){
				return b;
			}
		}
		return b;//null?
	}

	public Address getAddressById(int address_id) throws Exception{
		UserDao d= new UserDao();
		ArrayList<Address> A = d.getAllAddress();
		Address b = new Address();
		for(int i=0;i<A.size();i++){
			b=A.get(i);
			if(b.getId()==address_id){
				return b;
			}
		}
		return b;//null?
	}

	public Card getCardById(String card_id) throws Exception{
		UserDao d= new UserDao();
		ArrayList<Card> A = d.getAllCard();
		Card b = new Card();
		for(int i=0;i<A.size();i++){
			b=A.get(i);
			if(b.getId().equals(card_id)){
				return b;
			}
		}
		return b;//null?
	}

	public void add_advice(Advice a) throws Exception{
		UserDao d=new UserDao();
		d.add_advice(a);
	}
}
