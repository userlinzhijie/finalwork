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
		// Ϊ�˼򵥣�����Ҳֱ�Ӿ���fileName��Ϊ�����ļ�������
		String fileName = request.getParameter("name")+".jpg";
		Part part = request.getPart("file");
		// ���ļ����浽��Ŀ�µ�uploads�ļ����£�Ϊ�˼�����ûд�ж�Ŀ¼�Ƿ���ڼ�����Ŀ¼�Ĳ�����Ҫ��ȷ����Ŀ¼�Ѿ�����
		part.write(getServletContext().getRealPath("/upload") + "/" + fileName);
	}

}
