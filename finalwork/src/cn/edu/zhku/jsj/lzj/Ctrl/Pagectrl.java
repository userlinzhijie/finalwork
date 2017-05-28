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
		String type = request.getParameter("type");
		String page = request.getParameter("page");
		String recid = request.getParameter("id");
		String search = request.getParameter("search");
		String order =request.getParameter("order");
		PageService ps = new PageService();
		int id=0;
		if(recid!=null && recid.length()>0){
			id=Integer.parseInt(recid);
		}		
		int curPage=1;
		if(page!=null && page.length()>0){
			curPage = Integer.parseInt(page);
		}
		//排序显示
		if(order!=null)
		{
			try {
				request.setAttribute("order",order);
				request.setAttribute("pageBean",ps.goGetOrder(order,type,search,curPage));
				request.getRequestDispatcher("jsp/search.jsp").forward(request,response);
			} catch (Exception e) {
			e.printStackTrace();
			}
		}
		//进入详细界面
		if(id!=0)
		{
			try {	
				request.setAttribute("pageBean",ps.goGetDetail(id));
				request.getRequestDispatcher("jsp/detail.jsp").forward(request,response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//进入搜索界面
		if(search!=null)
		{
			try {
				request.setAttribute("search",search);
				request.setAttribute("pageBean",ps.goGetSearch(search,curPage));
				int result=1;
				if(ps.goGetSearch(search,curPage).getData().isEmpty())
				{
					result=0;				
				}
				request.setAttribute("result",result);
				request.getRequestDispatcher("jsp/search.jsp").forward(request,response);
			} catch (Exception e) {
			e.printStackTrace();
			}
		}
		//常规进入
		if(search==null&&page!=null)
		{
			try {	
				request.setAttribute("type",type);
				request.setAttribute("pageBean",ps.goGetResult(curPage,type));
				request.getRequestDispatcher("jsp/keyboard.jsp").forward(request,response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}	
		out.flush();
		out.close();	
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
