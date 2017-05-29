package cn.edu.zhku.jsj.lzj.Ctrl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.zhku.jsj.lzj.Service.DelService;

@SuppressWarnings("serial")
public class Delctrl extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String goodsid = request.getParameter("goodsid");
		String userid = request.getParameter("userid");
		String orderid = request.getParameter("orderid");
		String status = request.getParameter("status");
		DelService ds = new DelService();
		if(goodsid!=null)
		try {
			ds.todelgoods(goodsid);
			response.sendRedirect("Pagectrl?userid="+userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(orderid!=null)
		try{
			ds.todelorder(orderid,status);
			response.sendRedirect("Shoporderctrl?user_id="+userid);
		}catch (Exception e) {
			e.printStackTrace();
		}
		out.flush();
		out.close();
	}

}
