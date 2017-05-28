package cn.edu.zhku.jsj.lzj.Ctrl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.zhku.jsj.lzj.Model.Shopinfo;
import cn.edu.zhku.jsj.lzj.Service.GetService;
import cn.edu.zhku.jsj.lzj.Service.ShopinfoService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@SuppressWarnings("serial")
public class Shopinfoctrl extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		try {
			String id = request.getParameter("id");	
			Shopinfo si = new Shopinfo();
			ShopinfoService ss = new ShopinfoService();
			PrintWriter out = response.getWriter();
			JSONObject Shopinfo= new JSONObject();
			si = ss.toGetShopInfo(id);
			Shopinfo.put("shopname",si.getShopname());
			Shopinfo.put("username",si.getUsername());
			Shopinfo.put("truename",si.getTruename());
			out.println(Shopinfo);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
