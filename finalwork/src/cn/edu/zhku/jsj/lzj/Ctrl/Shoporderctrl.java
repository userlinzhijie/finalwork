package cn.edu.zhku.jsj.lzj.Ctrl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.zhku.jsj.lzj.Service.ShoporderService;

@SuppressWarnings("serial")
public class Shoporderctrl extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		ShoporderService ss = new ShoporderService();
		String page = request.getParameter("page");
		String recid = request.getParameter("user_id");
		String shopid = null;
		try {
			shopid = ss.goGetShopId(recid);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		int curPage=1;
		if(page!=null && page.length()>0){
			curPage = Integer.parseInt(page);
		}
		try {	
			request.setAttribute("pageBean",ss.goGetOrder(shopid,curPage));
			request.getRequestDispatcher("jsp/shoporder.jsp").forward(request,response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		out.flush();
		out.close();
	}

}
