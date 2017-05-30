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

import cn.edu.zhku.leo.Model.Shop;
import cn.edu.zhku.leo.Service.ShopService;

public class ShopCtrl extends HttpServlet {

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
		System.out.println("Shop:"+action);
		if ("getstatus".equals(action)) {
			try {
				this.get1(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("getapply".equals(action)) {
			try {
				this.get2(request, response);
			} catch (Exception e) {
				// TODO
				e.printStackTrace();
			}
		} else if ("agree".equals(action)) {
			try {
				this.agree(request, response);
			} catch (Exception e) {
				// TODO
				e.printStackTrace();
			}
		} else if ("start".equals(action)) {
			try {
				this.start(request, response);
			} catch (Exception e) {
				// TODO
				e.printStackTrace();
			}
		} else if ("stop".equals(action)) {
			try {
				this.stop(request, response);
			} catch (Exception e) {
				// TODO
				e.printStackTrace();
			}
		} else if ("getNum1".equals(action)) {
			try {
				this.getNum1(request, response);
			} catch (Exception e) {
				// TODO logout
				e.printStackTrace();
			}
		} else if ("getNum2".equals(action)) {
			try {
				this.getNum2(request, response);
			} catch (Exception e) {
				// TODO logout
				e.printStackTrace();
			}
		}

	}

	/**
	 * 
	 * 将数据度读来的User对象数组整理成json文件-->暂时保留 输出数据库读来的数据 构成
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 * 
	 */
	private void get1(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		PrintWriter out = response.getWriter();

		ShopService g = new ShopService();

		ArrayList<Shop> a = g.get1();
		JSONObject resultJson = new JSONObject();// 创建最后结果的json
		JSONArray jsonArray = new JSONArray();

		for (int i = 0; i < a.size(); i++) {
			Shop m = a.get(i);

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("shop_id", m.getShop_id());
			jsonObject.put("user_id", m.getUser_id());
			jsonObject.put("status", m.getStatus());
			jsonArray.add(jsonObject);
		}
		resultJson.put("shops", jsonArray);
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
	private void get2(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		PrintWriter out = response.getWriter();

		ShopService g = new ShopService();

		ArrayList<Shop> a = g.get2();
		JSONObject resultJson = new JSONObject();// 创建最后结果的json
		JSONArray jsonArray = new JSONArray();

		for (int i = 0; i < a.size(); i++) {
			Shop m = a.get(i);

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("shop_id", m.getShop_id());
			jsonObject.put("user_id", m.getUser_id());
			jsonObject.put("status", m.getStatus());
			jsonArray.add(jsonObject);
		}
		resultJson.put("shops", jsonArray);
		out.println(resultJson);
		out.flush();
		out.close();

	}

	/**
	 * 
	 * 批准用的开店申请 改变数据库相应属性status
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 * 
	 */
	private void agree(HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		int sid = Integer.parseInt(request.getParameter("shopid"));
		ShopService s = new ShopService();
		s.agree(sid);
		response.sendRedirect(request.getContextPath()
				+ "/html_manager/apply.html");
	}

	/**
	 * 
	 * 根据传入的shop_id开启相应的店铺
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 * 
	 */
	private void start(HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		int sid = Integer.parseInt(request.getParameter("sid"));
		ShopService s = new ShopService();
		s.start(sid);
		response.sendRedirect(request.getContextPath()
				+ "/html_manager/store.html");
	}

	/**
	 * 
	 * 根据传入的shop_id关闭相应的店铺
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 * 
	 */
	private void stop(HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		int sid = Integer.parseInt(request.getParameter("sid"));
		ShopService s = new ShopService();
		s.stop(sid);
		response.sendRedirect(request.getContextPath()
				+ "/html_manager/store.html");
	}

	/**
	 * 
	 * 获取店铺申请的个数
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 * 
	 */
	private void getNum2(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		ShopService g = new ShopService();

		ArrayList<Shop> a = g.get2();
		int num = a.size();
		out.print(num);
		out.flush();
		out.close();
	}

	/**
	 * 
	 * 输出已批准店铺的个数
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 * 
	 */
	private void getNum1(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		ShopService g = new ShopService();

		ArrayList<Shop> a = g.get1();
		int num = a.size();
		out.print(num);
		out.flush();
		out.close();
	}
}
