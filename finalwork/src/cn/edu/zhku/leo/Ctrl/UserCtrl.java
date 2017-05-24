package cn.edu.zhku.leo.Ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import cn.edu.zhku.leo.Model.Address;
import cn.edu.zhku.leo.Model.Card;
import cn.edu.zhku.leo.Model.Order;
import cn.edu.zhku.leo.Model.User;
import cn.edu.zhku.leo.Service.UserService;

public class UserCtrl extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		System.out.println(action);
	        
		if ("del".equals(action)) {
			try {
				this.del(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("get".equals(action)) {
			try {
				this.getJson(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("getNum".equals(action)) {
			try {
				this.getNum(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("getone".equals(action)) {
			try {
				this.getOne(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("edit".equals(action)) {
			try {
				this.edit(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if("cPassword".equals(action)){
			try {
				this.cPassword(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if("getaddress".equals(action)){
			try {
				this.getJson_address(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if("getcard".equals(action)){
			try {
				this.getJson_card(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if("getorder".equals(action)){
			try {
				this.getJson_order(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if("add_address".equals(action)){
			try {
				this.add_address(request,response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if("add_card".equals(action)){
			try {
				this.add_card(request,response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if("del_address".equals(action)){
			try {
				this.del_address(request,response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if("del_card".equals(action)){
			try {
				this.del_card(request,response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	private void del_card(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		UserService g = new UserService();
		String id=request.getParameter("id") ;

		if (g.del_card(id)) {
			response.sendRedirect(request.getContextPath()
					+ "/html_shop/person/cardlist.html?r=1");
		} else {
			response.sendRedirect(request.getContextPath()
					+ "/html_shop/person/cardlist.html?r=1");
		}
	}

	private void add_card(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String id=request.getParameter("id");
		int user_id=Integer.parseInt(request.getParameter("user_id"));
		String name = request.getParameter("name");
		String phone= request.getParameter("phone");
		String id_number= request.getParameter("id_number");
		String bank=request.getParameter("bank");
		
		Card c=new Card();
		UserService g= new UserService();
		c.setBank(bank);
		c.setId(id);
		c.setId_number(id_number);
		c.setName(name);
		c.setPhone(phone);
		c.setUser_id(user_id);
		if (g.add_card(c)) {
			response.sendRedirect(request.getContextPath()
					+ "/html_shop/person/cardlist.html?r=1");
		} else {
			response.sendRedirect(request.getContextPath()
					+ "/html_shop/person/cardlist.html?r=1");
		}
	}

	private void del_address(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		UserService g = new UserService();
		int id =Integer.parseInt(request.getParameter("id")) ;

		if (g.del_address(id)) {
			response.sendRedirect(request.getContextPath()
					+ "/html_shop/person/index.html?r=1");
		} else {
			response.sendRedirect(request.getContextPath()
					+ "/html_shop/person/index.html?r=1");
		}

		
	}

	/**
	 * 
	 * 修改数据库的对应数据
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 * 
	 */
	private void cPassword(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		UserService g = new UserService();
		
		String password0 = (String)request.getParameter("password0");
		String password1 = (String)request.getParameter("password1");
		int id =Integer.parseInt(request.getParameter("id")) ;

		if (g.cPassword(password0,password1,id)) {
			response.sendRedirect(request.getContextPath()
					+ "/html_shop/person/index.html?r=1");
		} else {
			response.sendRedirect(request.getContextPath()
					+ "/html_shop/person/index.html?r=0");
		}

	}


	/**
	 * 
	 * 添加地址
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 * 
	 */
	private void add_address(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		UserService g = new UserService();
		int user_id =Integer.parseInt(request.getParameter("user_id")) ;
		int de_fault =Integer.parseInt(request.getParameter("de_fault")) ;
		String name = (String)request.getParameter("name");
		String province = (String)request.getParameter("province");
		String city = (String)request.getParameter("city");
		String dist = (String)request.getParameter("dist");
		String street = (String)request.getParameter("street");
		String telephone = (String)request.getParameter("telephone");

		Address a=new Address();
		
		a.setCity(city);
		a.setDe_fault(de_fault);
		a.setDist(dist);
		a.setName(name);
		a.setProvince(province);
		a.setStreet(street);
		a.setTelephone(telephone);
		a.setUser_id(user_id);
		if (g.add_address(a)) {
			response.sendRedirect(request.getContextPath()
					+ "/html_shop/person/index.html?r=1");
		} else {
			response.sendRedirect(request.getContextPath()
					+ "/html_shop/person/index.html?r=0");
		}

	}
	
	/**
	 * 
	 * 修改数据库的对应数据
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 * 
	 */
	private void edit(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		UserService g = new UserService();
		int id =Integer.parseInt(request.getParameter("id")) ;
		String name = (String)request.getParameter("name");
		String nickname = (String)request.getParameter("nickname");
		String birth = (String)request.getParameter("birth");
		String telephone = (String)request.getParameter("telephone");
		String email = (String)request.getParameter("email");
		int sex = Integer.parseInt(request.getParameter("sex"));

		User u = new User();
		u.setBirth(birth);
		u.setEmail(email);
		u.setName(name);
		u.setNickname(nickname);
		u.setSex(sex);
		u.setTelephone(telephone);
		u.setId(id);
		if (g.edit(u)) {
			response.sendRedirect(request.getContextPath()
					+ "/html_shop/person/index.html?r=1");
		} else {
			response.sendRedirect(request.getContextPath()
					+ "/html_shop/person/index.html?r=0");
		}

	}

	/**
	 * 
	 * 删除数据库的对应数据
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 * 
	 */
	private void del(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		UserService g = new UserService();
		String id = (String) request.getParameter("id");

		if (g.del(id)) {
			response.sendRedirect(request.getContextPath()
					+ "/html_manager/customer.html?r=1");
		} else {
			response.sendRedirect(request.getContextPath()
					+ "/html_manager/customer.html?r=0");
		}

	}

	/**
	 * 
	 * 将数据度读来的User对象数组整理成json格式输出
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 * 
	 */
	private void getJson(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();

		UserService g = new UserService();

		ArrayList<User> a = g.get();
		JSONObject resultJson = new JSONObject();// 创建最后结果的json
		JSONArray jsonArray = new JSONArray();

		for (int i = 0; i < a.size(); i++) {
			User m = a.get(i);

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("id", m.getId());
			jsonObject.put("password", m.getPassword());
			jsonObject.put("name", m.getName());
			jsonObject.put("nickname", m.getNickname());
			jsonObject.put("money", m.getMoney());
			jsonObject.put("telephone", m.getTelephone());
			jsonObject.put("sex", m.getSex());
			jsonObject.put("birth", m.getBirth());
			jsonArray.add(jsonObject);
		}
		resultJson.put("users", jsonArray);
		out.println(resultJson);
		out.flush();
		out.close();

	}

	/**
	 * 
	 * 将数据度读来的address对象数组整理成json格式输出
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 * 
	 */
	private void getJson_address(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		UserService g = new UserService();

		ArrayList<Address> a = g.getAddress(user_id);
		JSONObject resultJson = new JSONObject();// 创建最后结果的json
		JSONArray jsonArray = new JSONArray();

		for (int i = 0; i < a.size(); i++) {
			Address m = a.get(i);

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("id", m.getId());
			jsonObject.put("user_id", m.getUser_id());
			jsonObject.put("name", m.getName());
			jsonObject.put("telephone", m.getTelephone());
			jsonObject.put("province", m.getProvince());
			jsonObject.put("city", m.getCity());
			jsonObject.put("dist", m.getDist());
			jsonObject.put("street", m.getStreet());
			jsonObject.put("de_fault", m.getDe_fault());
			jsonArray.add(jsonObject);
		}
		resultJson.put("address", jsonArray);
		out.println(resultJson);
		out.flush();
		out.close();

	}
	
	/**
	 * 
	 * 将数据度读来的Card对象数组整理成json格式输出
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 * 
	 */
	private void getJson_card(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		UserService g = new UserService();

		ArrayList<Card> a = g.getCard(user_id);
		JSONObject resultJson = new JSONObject();// 创建最后结果的json
		JSONArray jsonArray = new JSONArray();

		for (int i = 0; i < a.size(); i++) {
			Card m = a.get(i);

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("id", m.getId());
			jsonObject.put("user_id", m.getUser_id());
			jsonObject.put("name", m.getName());
			jsonObject.put("phone", m.getPhone());
			jsonObject.put("id_number", m.getId_number());
			jsonObject.put("bank", m.getBank());
			jsonArray.add(jsonObject);
		}
		resultJson.put("card", jsonArray);
		out.println(resultJson);
		out.flush();
		out.close();

	}
	
	/**
	 * 
	 * 将数据度读来的order对象数组整理成json格式输出
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 * 
	 */
	private void getJson_order(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		UserService g = new UserService();

		ArrayList<Order> a = g.getOrder(user_id);
		JSONObject resultJson = new JSONObject();// 创建最后结果的json
		JSONArray jsonArray = new JSONArray();

		for (int i = 0; i < a.size(); i++) {
			Order m = a.get(i);

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("id", m.getId());
			jsonObject.put("user_id", m.getUser_id());
			jsonObject.put("address_id", m.getAddress_id());
			jsonObject.put("total", m.getTotal());
			jsonObject.put("transfee", m.getTransfee());
			jsonObject.put("status", m.getStatus());
			jsonObject.put("date", m.getDate());
			jsonArray.add(jsonObject);
		}
		resultJson.put("order", jsonArray);
		out.println(resultJson);
		out.flush();
		out.close();

	}
	
	
	/**
	 * 
	 * 将数据度读来的User对象数组整理成json文件-->暂时保留 输出数据库读来的数据
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 * 
	 */
	private void getOne(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		PrintWriter out = response.getWriter();

		int id = Integer.parseInt(request.getParameter("id"));
		UserService g = new UserService();

		ArrayList<User> a = g.get();
		JSONObject resultJson = new JSONObject();// 创建最后结果的json
		JSONArray jsonArray = new JSONArray();

		for (int i = 0; i < a.size(); i++) {
			User m = a.get(i);
			if (m.getId() == id) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("id", m.getId());
				jsonObject.put("password", m.getPassword());
				jsonObject.put("name", m.getName());
				jsonObject.put("nickname", m.getNickname());
				jsonObject.put("money", m.getMoney());
				jsonObject.put("telephone", m.getTelephone());
				jsonObject.put("sex", m.getSex());
				jsonObject.put("birth", m.getBirth());
				jsonObject.put("email",m.getEmail());
				jsonArray.add(jsonObject);
			}
		}
		resultJson.put("users", jsonArray);
		out.println(resultJson);
		out.flush();
		out.close();

	}

	/**
	 * 
	 * 输出顾客数量
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 * 
	 */
	private void getNum(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		PrintWriter out = response.getWriter();

		UserService g = new UserService();

		ArrayList<User> a = g.get();

		out.println(a.size());
		out.flush();
		out.close();

	}
}