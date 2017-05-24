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
		// Ϊ�˼򵥣�����Ҳֱ�Ӿ���fileName��Ϊ�����ļ�������
		String fileName = request.getParameter("name")+".jpg";
		Part part = request.getPart("file");
		// ���ļ����浽��Ŀ�µ�uploads�ļ����£�Ϊ�˼�����ûд�ж�Ŀ¼�Ƿ���ڼ�����Ŀ¼�Ĳ�����Ҫ��ȷ����Ŀ¼�Ѿ�����
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
