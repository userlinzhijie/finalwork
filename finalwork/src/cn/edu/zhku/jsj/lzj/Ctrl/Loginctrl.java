package cn.edu.zhku.jsj.lzj.Ctrl;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import cn.edu.zhku.jsj.lzj.Model.User;
import cn.edu.zhku.jsj.lzj.Service.LoginService;

@SuppressWarnings("serial")
public class Loginctrl extends HttpServlet {

	LoginService ls = new LoginService();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		String userid = (String)request.getParameter("lguserName");
		String userPassword =(String) request.getParameter("lgpwd");
		User user  = new User();
		user.setUserid(userid);
		user.setUserPassword(userPassword);
		String msg = null;
		boolean checkResult = false;
	    RequestDispatcher rd = null;
	    try{		
			checkResult = ls.checkUserNameAndPassword(user);			
			if(checkResult == true){
				msg = "��ӭ"+userid+"����!";	
				session.setAttribute("user",userid);
			}else{
				msg = "�Բ����û����������벻��ȷ";	
			}
		}catch(Exception e){
			msg = "fail";
			e.printStackTrace();
			
		}finally{
			rd = request.getRequestDispatcher("index.jsp");
			request.setAttribute("MSG", msg);
			rd.forward(request, response);		
		}
		out.flush();
		out.close();
	}

}