package cn.edu.zhku.jsj.lzj.Ctrl;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.zhku.jsj.lzj.Service.ShowService;

@SuppressWarnings("serial")
public class Showctrl extends HttpServlet {
	private static final String JPG="image/jpeg;charset=GB2312";

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			ShowService ss = new ShowService();
			String id = request.getParameter("id");
			try {
				String pic = ss.toGetPic(id);
				String filePath = getServletContext().getRealPath("/")+"img\\"+File.separator+pic;
		        File file = new File(filePath);
		        OutputStream outputStream = response.getOutputStream();
		        FileInputStream fileInputStream = new FileInputStream(file);
		        // ¶ÁÊý¾Ý
		        byte[] data = new byte[fileInputStream.available()];
		        fileInputStream.read(data);
		        fileInputStream.close();
		        // »ØÐ´
		        response.setContentType(JPG);
		        outputStream.write(data);
		        outputStream.flush();
		        outputStream.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
}
