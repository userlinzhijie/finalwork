package cn.edu.zhku.jsj;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class Showimg extends HttpServlet {
	private static final String JPG="image/jpeg;charset=GB2312";

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String test=request.getParameter("test1");
		 	String filePath = getServletContext().getRealPath("/")+"img\\"+File.separator+"SSR.jpg";
	        File file = new File(filePath);
	        // 获取输出流
	        OutputStream outputStream = response.getOutputStream();
	        FileInputStream fileInputStream = new FileInputStream(file);
	        // 读数据
	        byte[] data = new byte[fileInputStream.available()];
	        fileInputStream.read(data);
	        fileInputStream.close();
	        // 回写
	        response.setContentType(JPG);
	        outputStream.write(data);
	        outputStream.flush();
	        outputStream.close();
	}

}
