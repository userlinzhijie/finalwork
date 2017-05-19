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
		
		if ("getstatus".equals(action)) {
			try {
				this.get1(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if("getapply".equals(action)){
			try {
				this.get2(request, response);
			} catch (Exception e) {
				// TODO 
				e.printStackTrace();
			}
		}
		
	}

	/**
	 * 
	 * 将数据度读来的User对象数组整理成json文件-->暂时保留 输出数据库读来的数据
	 * 构成
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 * 
	 */
	private void get1(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
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
	private void get2(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
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
}
