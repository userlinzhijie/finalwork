package cn.edu.zhku.jsj.lzj.Ctrl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cn.edu.zhku.jsj.lzj.Service.PageService;


@SuppressWarnings("serial")
public class Pagectrl extends HttpServlet {
	
	public Pagectrl(){
		super();
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String page = request.getParameter("page");
		int curPage=1;
		if(page!=null && page.length()>0){
			curPage = Integer.parseInt(page);
		}	
		PageService ps = new PageService();
		try {
			request.setAttribute("pageBean",ps.goGetResult(curPage));
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("jsp/keyboard.jsp").forward(request,response);
		out.flush();
		out.close();	
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
