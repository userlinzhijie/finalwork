package cn.edu.zhku.jsj.ctrl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

public class CheckUserNameServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String userName =(String)request.getParameter("userName");
		System.out.println(userName);
		JSONObject resultJson = new JSONObject();
		if(userName.equalsIgnoreCase("zheng")){
			resultJson.put("flag", "true");
		}else{
			resultJson.put("flag", "false");
		}
		out.println(resultJson);
		out.flush();
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}
}
