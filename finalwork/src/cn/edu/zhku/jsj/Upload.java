package cn.edu.zhku.jsj;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@SuppressWarnings("serial")
@MultipartConfig
public class Upload extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		// 为了简单，后面也直接就以fileName作为保存文件的名称
		String fileName = request.getParameter("name")+".jpg";
		Part part = request.getPart("file");
		// 将文件保存到项目下的uploads文件夹下，为了简单这里没写判断目录是否存在及创建目录的操作，要先确保该目录已经存在
		part.write(getServletContext().getRealPath("/upload") + "/" + fileName);
	}

}
