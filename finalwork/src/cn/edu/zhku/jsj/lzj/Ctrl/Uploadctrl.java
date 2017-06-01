package cn.edu.zhku.jsj.lzj.Ctrl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import cn.edu.zhku.jsj.lzj.Model.Keyboard;
import cn.edu.zhku.jsj.lzj.Service.UploadService;

@SuppressWarnings("serial")
@MultipartConfig
public class Uploadctrl extends HttpServlet {
	UploadService us = new UploadService();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		String name = (String)request.getParameter("name");
		String price = (String)request.getParameter("price");
		String brand = (String)request.getParameter("brand");
		String type = (String)request.getParameter("type");
		String color = (String)request.getParameter("color");
		String version = (String)request.getParameter("version");
		String standard = (String)request.getParameter("standard");
		String inter = (String)request.getParameter("inter");
		String backlight = (String)request.getParameter("backlight");
		String ergo = (String)request.getParameter("ergo");
		String size = (String)request.getParameter("size");
		String weight = (String)request.getParameter("weight");
		String material = (String)request.getParameter("material");
		String details = (String)request.getParameter("details");
		String user = (String)request.getParameter("user_id");
		
		// 为了简单，后面也直接就以fileName作为保存文件的名称
		String fileName = request.getParameter("picture");
		Part part = request.getPart("file");
		// 将文件保存到项目下的uploads文件夹下，为了简单这里没写判断目录是否存在及创建目录的操作，要先确保该目录已经存在
		part.write(getServletContext().getRealPath("/img") + "/" + fileName);
		Keyboard keyboard = new Keyboard();
		keyboard.setName(name);
		keyboard.setPrice(price);
		keyboard.setBrand(brand);
		keyboard.setType(type);
		keyboard.setColor(color);
		keyboard.setVersion(version);
		keyboard.setStandard(standard);
		keyboard.setInter(inter);
		keyboard.setBacklight(backlight);
		keyboard.setPicture(fileName);
		keyboard.setErgo(ergo);
		keyboard.setSize(size);
		keyboard.setWeight(weight);
		keyboard.setMaterial(material);
		keyboard.setDetails(details);
		keyboard.setPicture(fileName);
		keyboard.setUser(user);
		try {
			us.toUpload(keyboard);	
			String msg="上架成功";
			session.setAttribute("MSG", msg);
			response.sendRedirect("jsp/putonsale.jsp");	
		} catch (Exception e) {
			e.printStackTrace();
		}	
		out.flush();
		out.close();
	}

}
