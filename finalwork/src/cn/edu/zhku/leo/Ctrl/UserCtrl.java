package cn.edu.zhku.leo.Ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import cn.edu.zhku.leo.Model.*;
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
		System.out.println("User:"+action);
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
		} else if ("cPassword".equals(action)) {
			try {
				this.cPassword(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("getaddress".equals(action)) {
			try {
				this.getJson_address(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("getcard".equals(action)) {
			try {
				this.getJson_card(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("getorder".equals(action)) {
			try {
				this.getJson_order(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("getorderbyid".equals(action)) {
			try {
				this.getOrderById(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("add_address".equals(action)) {
			try {
				this.add_address(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("add_card".equals(action)) {
			try {
				this.add_card(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("add_order".equals(action)) {
			try {
				this.add_order(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("del_address".equals(action)) {
			try {
				this.del_address(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("del_card".equals(action)) {
			try {
				this.del_card(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("del_cart".equals(action)) {
			try {
				this.del_cart(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("del_order".equals(action)) {
			try {
				this.del_order(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("shopapply".equals(action)) {
			try {
				this.shopApply(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("getshop".equals(action)) {
			try {
				this.getShop(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("register".equals(action)) {
			try {
				this.register(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("login".equals(action)) {
			try {
				this.login(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("logout".equals(action)) {
			try {
				this.logout(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("getusercookie".equals(action)) {
			try {
				this.getCookie_user(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("getcookies".equals(action)) {
			try {
				this.getCookie(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("getidcookies".equals(action)) {
			try {
				this.getCookie_id(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("getcart".equals(action)) {
			try {
				this.getJson_cart(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("getgoods".equals(action)) {
			try {
				this.getJson_goods(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("oTo5".equals(action)) {
			try {
				this.orderTo5(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("oTo2".equals(action)) {
			try {
				this.orderTo2(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("oTo6".equals(action)) {
			try {
				this.orderTo6(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("oTo4".equals(action)) {
			try {
				this.orderTo4(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("oTo7".equals(action)) {
			try {
				this.orderTo7(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("add_collect".equals(action)) {
			try {
				this.add_collect(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("add_cart".equals(action)) {
			try {
				this.add_cart(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("del_collect".equals(action)) {
			try {
				this.del_collect(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("getcollect".equals(action)) {
			try {
				this.getJson_collect(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("setdefault_address".equals(action)) {
			try {
				this.setDefault_a(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("setdefault_card".equals(action)) {
			try {
				this.setDefault_c(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("add_advice".equals(action)) {
			try {
				this.add_advice(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	private void add_advice(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String tag = request.getParameter("tag");
		String details = request.getParameter("details");
		
		UserService u = new UserService();
		Advice a = new Advice();
		a.setTag(tag);
		a.setDetails(details);
		a.setId(0);
		u.add_advice(a);
		response.sendRedirect(request.getContextPath() + "/jsp/info.jsp");
	}

	private void setDefault_c(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");

		UserService u = new UserService();

		u.setDefault_c(id);
		response.sendRedirect(request.getContextPath() + "/jsp/card.jsp");
	}

	private void setDefault_a(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
		UserService u = new UserService();
		u.setDefault_a(id);
		System.out.println("!");
		response.sendRedirect(request.getContextPath() + "/jsp/address.jsp");
	}

	private void add_cart(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		int user_id = Integer.parseInt(request.getParameter("user_id"));
		int goods_id = Integer.parseInt(request.getParameter("goods_id"));
		int number = Integer.parseInt(request.getParameter("num"));

		Cartlog c = new Cartlog();
		UserService g = new UserService();
		c.setUser_id(user_id);
		c.setGoods_id(goods_id);
		c.setNumber(number);
		if (g.add_cart(c)) {
			response.sendRedirect(request.getContextPath() + "/jsp/cart.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/jsp/cart.jsp");
		}
	}

	private void del_collect(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		int id = Integer.parseInt(request.getParameter("id"));

		UserService g = new UserService();

		if (g.del_collect(id)) {
			response.sendRedirect(request.getContextPath() + "/jsp/collect.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/jsp/collect.jsp");
		}
	}

	private void add_collect(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		int uid = Integer.parseInt(request.getParameter("user_id"));
		int gid = Integer.parseInt(request.getParameter("goods_id"));

		UserService g = new UserService();

		if (g.add_collect(uid, gid)) {
			response.sendRedirect(request.getContextPath() + "/jsp/collect.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/jsp/collect.jsp");
		}
	}

	private void del_order(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		UserService g = new UserService();
		int id = Integer.parseInt(request.getParameter("id"));

		if (g.del_order(id)) {
			response.sendRedirect(request.getContextPath() + "/jsp/order.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/jsp/order.jsp");
		}

	}

	private void add_order(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		int mode = Integer.parseInt(request.getParameter("mode"));// 0one*1cart

		String arr_n = request.getParameter("arr_n");
		String arr_g = request.getParameter("arr_g");
		String arr_s = request.getParameter("arr_s");
		String arr_v = request.getParameter("arr_v");

		int user_id = Integer.parseInt(request.getParameter("user_id"));
		int address_id = Integer.parseInt(request.getParameter("address_id"));
		String card_id = request.getParameter("card_id");
		int status = Integer.parseInt(request.getParameter("status"));
		int transfee = Integer.parseInt(request.getParameter("transfee"));

		Order c = new Order();
		UserService g = new UserService();

		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString = formatter.format(currentTime);

		if (address_id == 0) {
			c.setAddress_id(g.getDefaultAddressByUid(user_id).getId());
		} else {
			c.setAddress_id(address_id);
		}
		if (card_id.equals("default")) {
			c.setCard_id(g.getDefaultCardByUid(user_id).getId());
		} else {
			c.setCard_id(card_id);
		}
		c.setDate(dateString);
		c.setId(0);
		c.setStatus(status);
		c.setTransfee(transfee);
		c.setUser_id(user_id);

		if (g.add_order(c, arr_n, arr_g, arr_s, arr_v, mode)) {
			response.sendRedirect(request.getContextPath() + "/jsp/order.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/jsp/order.jsp");
		}
	}

	private void getJson_cart(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		UserService s = new UserService();
		ArrayList<Cartlog> a = s.getCart(user_id);
		JSONObject resultJson = new JSONObject();// 创建最后结果的json
		JSONArray jsonArray = new JSONArray();

		for (int i = 0; i < a.size(); i++) {
			Cartlog m = a.get(i);

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("id", m.getId());
			jsonObject.put("goods_id", m.getGoods_id());
			jsonObject.put("name", m.getName());
			jsonObject.put("price", m.getPrice());
			jsonObject.put("number", m.getNumber());
			jsonObject
					.put("seller_id", s.getSellerIdByGoodsId(m.getGoods_id()));
			jsonArray.add(jsonObject);
		}
		resultJson.put("cartlog", jsonArray);
		out.println(resultJson);
		out.flush();
		out.close();
	}

	private void getJson_collect(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		UserService s = new UserService();
		ArrayList<Collect> a = s.getCollect(user_id);
		JSONObject resultJson = new JSONObject();// 创建最后结果的json
		JSONArray jsonArray = new JSONArray();

		for (int i = 0; i < a.size(); i++) {
			Collect m = a.get(i);

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("id", m.getId());
			jsonObject.put("goods_id", m.getGoods_id());
			jsonObject.put("user_id", m.getUser_id());
			jsonObject.put("price", m.getPrice());
			jsonObject.put("name", m.getName());
			jsonArray.add(jsonObject);
		}
		resultJson.put("collect", jsonArray);
		out.println(resultJson);
		out.flush();
		out.close();
	}

	private void register(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		User u = new User();
		u.setName(name);
		u.setPassword(password);
		UserService s = new UserService();
		if (s.register(u)) {
			login(request, response);// 注册成功自动登录
		} else {
			response.sendRedirect(request.getContextPath() + "/jsp/reg.jsp");
		}
	}

	private void login(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String name = request.getParameter("name");
		String password = request.getParameter("password");

		if (name.equals("") || password.equals("")) {
			response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
			return;
		}
		User u = new User();
		u.setName(name);
		u.setPassword(password);
		UserService s = new UserService();
		if (s.login(u)) {
			Cookie cookie1 = new Cookie(
					URLEncoder.encode("user_name", "utf-8"), URLEncoder.encode(
							u.getName(), "utf-8"));
			cookie1.setMaxAge(60 * 60 * 24);
			response.addCookie(cookie1);
			Cookie cookie2 = new Cookie(
					URLEncoder.encode("user_id", "utf-8"),
					URLEncoder.encode(
							String.valueOf(s.getIdByName(u.getName())), "utf-8"));
			cookie2.setMaxAge(60 * 60 * 24);
			response.addCookie(cookie2);
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
		}
	}

	private void logout(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Cookie[] cookies = null;
		cookies = request.getCookies();

		String name = URLDecoder.decode(cookies[0].getName(), "utf-8");

		for (int i = 0; i < cookies.length; i++) {
			name = URLDecoder.decode(cookies[i].getName(), "utf-8");
			if (name.equals("user_name")) {
				cookies[i].setValue(URLEncoder.encode("游客", "utf-8"));
				response.addCookie(cookies[i]);
			}
			if (name.equals("user_id")) {
				cookies[i].setValue(URLEncoder.encode("0", "utf-8"));
				response.addCookie(cookies[i]);
			}
		}
		response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
	}

	private void getCookie(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();

		Cookie[] cookies = null;
		String value = null;
		cookies = request.getCookies();
		String name = URLDecoder.decode(cookies[0].getName(), "utf-8");
		value = URLDecoder.decode(cookies[0].getValue(), "utf-8");
		out.println("num_cookies:" + cookies.length);
		for (int i = 0; i < cookies.length; i++) {
			name = URLDecoder.decode(cookies[i].getName(), "utf-8");
			value = URLDecoder.decode(cookies[i].getValue(), "utf-8");
			out.println("name:" + name + "--value:" + value);
		}
		out.flush();
		out.close();
	}

	private void getCookie_user(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();

		Cookie[] cookies = null;

		String value = null;
		if (request.getCookies() == null) {
			value = "游客";
		} else {
			cookies = request.getCookies();
			String name = URLDecoder.decode(cookies[0].getName(), "utf-8");
			value = URLDecoder.decode(cookies[0].getValue(), "utf-8");

			for (int i = 0; i < cookies.length; i++) {
				name = URLDecoder.decode(cookies[i].getName(), "utf-8");
				if (name.equals("user_name")) {
					value = URLDecoder.decode(cookies[i].getValue(), "utf-8");
				}
			}
			if (value == null) {
				value = "游客";
			}
		}
		out.print(value);
		out.flush();
		out.close();
	}

	private void getCookie_id(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();

		Cookie[] cookies = null;

		String value = null;
		if (request.getCookies() == null) {
			value = "0";
		} else {
			cookies = request.getCookies();
			String name = URLDecoder.decode(cookies[0].getName(), "utf-8");
			value = URLDecoder.decode(cookies[0].getValue(), "utf-8");

			for (int i = 0; i < cookies.length; i++) {
				name = URLDecoder.decode(cookies[i].getName(), "utf-8");
				if (name.equals("user_id")) {
					value = URLDecoder.decode(cookies[i].getValue(), "utf-8");
				}
			}
			if (value == null) {
				value = "0";
			}
		}
		out.print(value);
		out.flush();
		out.close();
	}

	private void shopApply(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		int user_id = Integer.parseInt(request.getParameter("user_id"));
		int status = Integer.parseInt(request.getParameter("status"));
		String name = request.getParameter("name");

		UserService u = new UserService();
		Shop s = new Shop();
		s.setStatus(status);
		s.setUser_id(user_id);
		s.setName(name);
		u.shopApply(s);
		if (u.shopApply(s)) {
			response.sendRedirect(request.getContextPath() + "/jsp/apply.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/jsp/apply.jsp");
		}
	}

	private void getShop(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		UserService u = new UserService();
		Shop s = u.getShop(user_id);
		PrintWriter out = response.getWriter();
		JSONObject r = new JSONObject();
		if (s != null) {
			r.put("shop", "one");
			r.put("shop_id", s.getShop_id());
			r.put("user_id", s.getUser_id());
			r.put("status", s.getStatus());
			r.put("name", s.getName());
		} else {
			r.put("shop", "none");
		}
		out.println(r);
		out.flush();
		out.close();
	}

	private void del_card(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		UserService g = new UserService();
		String id = request.getParameter("id");

		if (g.del_card(id)) {
			response.sendRedirect(request.getContextPath() + "/jsp/card.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/jsp/card.jsp");
		}
	}

	private void del_cart(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		UserService g = new UserService();
		int id = Integer.parseInt(request.getParameter("id"));

		if (g.del_cart(id)) {
			response.sendRedirect(request.getContextPath() + "/jsp/cart.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/jsp/cart.jsp");
		}
	}

	private void orderTo5(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		UserService g = new UserService();
		int order_id = Integer.parseInt(request.getParameter("id"));

		if (g.orderTo(order_id, 5)) {
			response.sendRedirect(request.getContextPath() + "/jsp/order.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/jsp/order.jsp");
		}
	}

	private void orderTo4(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		UserService g = new UserService();
		int order_id = Integer.parseInt(request.getParameter("id"));

		if (g.orderTo(order_id, 4)) {
			response.sendRedirect(request.getContextPath() + "/jsp/order.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/jsp/order.jsp");
		}
	}

	private void orderTo6(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		UserService g = new UserService();
		int order_id = Integer.parseInt(request.getParameter("id"));

		if (g.orderTo(order_id, 6)) {
			response.sendRedirect(request.getContextPath() + "/jsp/order.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/jsp/order.jsp");
		}
	}

	private void orderTo7(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		UserService g = new UserService();
		int order_id = Integer.parseInt(request.getParameter("id"));

		if (g.orderTo(order_id, 7)) {
			response.sendRedirect(request.getContextPath() + "/jsp/order.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/jsp/order.jsp");
		}
	}

	private void orderTo2(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		UserService g = new UserService();
		int order_id = Integer.parseInt(request.getParameter("id"));

		if (g.orderTo(order_id, 2)) {
			response.sendRedirect(request.getContextPath() + "/jsp/order.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/jsp/order.jsp");
		}
	}

	private void add_card(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String id_number = request.getParameter("id_number");
		String bank = request.getParameter("bank");

		Card c = new Card();
		UserService g = new UserService();
		c.setBank(bank);
		c.setId(id);
		c.setId_number(id_number);
		c.setName(name);
		c.setPhone(phone);
		c.setUser_id(user_id);
		if (g.add_card(c)) {
			response.sendRedirect(request.getContextPath() + "/jsp/card.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/jsp/card.jsp");
		}
	}

	private void del_address(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		UserService g = new UserService();
		int id = Integer.parseInt(request.getParameter("id"));

		if (g.del_address(id)) {
			response.sendRedirect(request.getContextPath() + "/jsp/address.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/jsp/address.jsp");
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
	private void cPassword(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		UserService g = new UserService();

		String password0 = (String) request.getParameter("password0");
		String password1 = (String) request.getParameter("password1");
		int id = Integer.parseInt(request.getParameter("id"));

		if (g.cPassword(password0, password1, id)) {
			response.sendRedirect(request.getContextPath() + "/jsp/info.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/jsp/info.jsp");
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
	private void add_address(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		UserService g = new UserService();
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		int de_fault = Integer.parseInt(request.getParameter("de_fault"));
		String name = (String) request.getParameter("name");
		String province = (String) request.getParameter("province");
		String city = (String) request.getParameter("city");
		String dist = (String) request.getParameter("dist");
		String street = (String) request.getParameter("street");
		String telephone = (String) request.getParameter("telephone");

		Address a = new Address();

		a.setCity(city);
		a.setDe_fault(de_fault);
		a.setDist(dist);
		a.setName(name);
		a.setProvince(province);
		a.setStreet(street);
		a.setTelephone(telephone);
		a.setUser_id(user_id);
		if (g.add_address(a)) {
			response.sendRedirect(request.getContextPath() + "/jsp/address.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/jsp/address.jsp");
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
		int id = Integer.parseInt(request.getParameter("id"));
		String truename = (String) request.getParameter("truename");
		String nickname = (String) request.getParameter("nickname");
		String birth = (String) request.getParameter("birth");
		String telephone = (String) request.getParameter("telephone");
		String email = (String) request.getParameter("email");
		int sex = Integer.parseInt(request.getParameter("sex"));

		User u = new User();
		u.setBirth(birth);
		u.setEmail(email);
		u.setTruename(truename);
		u.setNickname(nickname);
		u.setSex(sex);
		u.setTelephone(telephone);
		u.setId(id);
		if (g.edit(u)) {
			response.sendRedirect(request.getContextPath() + "/jsp/info.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/jsp/info.jsp");
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
	 * 将数据度读来的Goods对象数组整理成json格式输出
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 * 
	 */
	private void getJson_goods(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		String arr_g = request.getParameter("arr_g");
		String arr_n = request.getParameter("arr_n");

		UserService g = new UserService();

		ArrayList<Goods> a = g.getGoodsByArr(arr_g, arr_n);
		JSONObject resultJson = new JSONObject();// 创建最后结果的json
		JSONArray jsonArray = new JSONArray();

		for (int i = 0; i < a.size(); i++) {
			Goods gs = a.get(i);

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("id", gs.getId());
			jsonObject.put("name", gs.getName());
			jsonObject.put("price", gs.getPrice());
			jsonObject.put("number", gs.getNumber());
			jsonArray.add(jsonObject);
		}
		resultJson.put("goods", jsonArray);
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
			jsonObject.put("de_fault", m.getDe_fault());
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
			jsonObject.put("number", m.getNumber());
			jsonObject.put("goods_id", m.getGoods_id());
			jsonObject.put("seller_id", m.getSeller_id());

			Goods b = g.getGoodsById(m.getGoods_id());

			jsonObject.put("name", b.getName());
			jsonObject.put("price", b.getPrice());

			jsonArray.add(jsonObject);
		}
		resultJson.put("order", jsonArray);
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
	private void getOrderById(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		int order_id = Integer.parseInt(request.getParameter("order_id"));
		UserService g = new UserService();

		Order m = g.getOrderById(order_id);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("id", m.getId());
		jsonObject.put("user_id", m.getUser_id());
		jsonObject.put("address_id", m.getAddress_id());
		jsonObject.put("total", m.getTotal());
		jsonObject.put("transfee", m.getTransfee());
		jsonObject.put("status", m.getStatus());
		jsonObject.put("date", m.getDate());
		jsonObject.put("number", m.getNumber());
		jsonObject.put("goods_id", m.getGoods_id());
		jsonObject.put("seller_id", m.getSeller_id());
		jsonObject.put("card_id", m.getCard_id());

		Goods b = g.getGoodsById(m.getGoods_id());
		jsonObject.put("g_name", b.getName());
		jsonObject.put("g_price", b.getPrice());

		Address c = g.getAddressById(m.getAddress_id());
		jsonObject.put("a_name", c.getName());
		jsonObject.put("a_telephone", c.getTelephone());
		jsonObject.put("a_province", c.getProvince());
		jsonObject.put("a_city", c.getCity());
		jsonObject.put("a_dist", c.getDist());
		jsonObject.put("a_street", c.getStreet());

		Card d = g.getCardById(m.getCard_id());
		jsonObject.put("c_name", d.getName());
		jsonObject.put("c_phone", d.getPhone());
		jsonObject.put("c_id", d.getId().substring(d.getId().length()-4, d.getId().length()));
		jsonObject.put("c_bank", d.getBank());

		out.println(jsonObject);
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
				jsonObject.put("email", m.getEmail());
				jsonObject.put("truename", m.getTruename());
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