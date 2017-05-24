package cn.edu.zhku.jsj.lzj.Ctrl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
		PrintWriter out = response.getWriter();
		String brand = (String)request.getParameter("brand");
		String type = (String)request.getParameter("type");
		String color = (String)request.getParameter("color");
		String trans = (String)request.getParameter("trans");
		// 为了简单，后面也直接就以fileName作为保存文件的名称
		String fileName = request.getParameter("name")+".jpg";
		Part part = request.getPart("file");
		// 将文件保存到项目下的uploads文件夹下，为了简单这里没写判断目录是否存在及创建目录的操作，要先确保该目录已经存在
		part.write(getServletContext().getRealPath("/upload") + "/" + fileName);
		Keyboard keyboard = new Keyboard();
		keyboard.setBrand(brand);
		keyboard.setType(type);
		keyboard.setColor(color);
		keyboard.setTrans(trans);
		keyboard.setPicture(fileName);
		try {
			us.toUpload(keyboard);
		} catch (Exception e) {
			e.printStackTrace();
		}
		out.flush();
		out.close();
	}

}
