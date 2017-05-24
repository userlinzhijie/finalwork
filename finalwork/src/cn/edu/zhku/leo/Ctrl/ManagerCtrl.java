package cn.edu.zhku.leo.Ctrl;

import java.io.*;
import java.net.*;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import cn.edu.zhku.leo.Service.*;
import cn.edu.zhku.leo.Model.Manager;

public class ManagerCtrl extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");

		if ("login".equals(action)) {
			try {
				this.login(request, response);
			} catch (Exception e) {
				// TODO login
				e.printStackTrace();
			}
		} else if ("editmy".equals(action)) {
			try {
				this.editMy(request, response);
			} catch (Exception e) {
				// TODO edit
				e.printStackTrace();
			}
		} else if ("editinfo".equals(action)) {
			try {
				this.editInfo(request, response);
			} catch (Exception e) {
				// TODO edit
				e.printStackTrace();
			}
		} else if ("del".equals(action)) {
			try {
				this.del(request, response);
			} catch (Exception e) {
				// TODO del
				e.printStackTrace();
			}
		} else if ("add".equals(action)) {
			try {
				this.add(request, response);
			} catch (Exception e) {
				// TODO add
				e.printStackTrace();
			}
	
		} else if ("get".equals(action)) {
			try {
				this.getJson(request, response);
			} catch (Exception e) {
				// TODO get
				e.printStackTrace();
			}
		} else if("getone".equals(action)){
			try {
				this.getone(request, response);
			} catch (Exception e) {
				// TODO getone
				e.printStackTrace();
			}
		} else if("gets".equals(action)){
			try {
				this.getCookie_user(request, response);
			} catch (Exception e) {
				// TODO gets
				e.printStackTrace();
			}
		} else if("logout".equals(action)){
			try {
				this.logout(request, response);
			} catch (Exception e) {
				// TODO logout
				e.printStackTrace();
			}
		} else if("getNum".equals(action)){
			try {
				this.getNum(request, response);
			} catch (Exception e) {
				// TODO getnum
				e.printStackTrace();
			}
		}
	}
		
	
	/**
	 * 
	 * �����ݶȶ�����Manager�������������json�ļ�-->��ʱ���� ������ݿ����������
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 * 
	 */
	private void getJson(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		// File file = new File(
		// "D:\\�ҵ��ĵ�\\GitHub\\finalwork\\finalwork\\WebRoot\\html_manager\\tables\\managers.json");
		// if (!file.exists())
		// file.createNewFile();
		ManagerService g = new ManagerService();

		ArrayList<Manager> a = g.get();
		JSONObject resultJson = new JSONObject();// �����������json
		JSONArray jsonArray = new JSONArray();

		for (int i = 0; i < a.size(); i++) {
			Manager m = a.get(i);

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("id", m.getId());
			jsonObject.put("password", m.getPassword());
			jsonObject.put("info", m.getInfo());
			jsonArray.add(jsonObject);
		}
		resultJson.put("managers", jsonArray);
		out.println(resultJson);
		out.flush();
		out.close();

		// PrintStream p = new PrintStream(file);
		// p.println(jsonArray);
		// p.close();
	}

	/**
	 * 
	 * ɾ�����ݿ�Ķ�Ӧ����
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 * 
	 */
	private void del(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		ManagerService g = new ManagerService();
		String id = (String) request.getParameter("id");

		if (g.del(id)) {
			
			Cookie[] cookies = null;

			String value = null;
			if (request.getCookies() == null) {
				value = "�ο�";
			} else {
				cookies = request.getCookies();
				String name = URLDecoder.decode(cookies[0].getName(), "utf-8");
				value = URLDecoder.decode(cookies[0].getValue(), "utf-8");

				for (int i = 0; i < cookies.length; i++) {
					name = URLDecoder.decode(cookies[i].getName(), "utf-8");
					if (name.equals("user")) {
						value = URLDecoder.decode(cookies[i].getValue(), "utf-8");
					}
				}
				if(value==null){
					value="�ο�";
				}
			}
			if (value.equals(id)) {
				this.logout(request, response);
			} else {
				response.sendRedirect(request.getContextPath()
						+ "/html_manager/manager.html?r=1");
			}
		} else {
			response.sendRedirect(request.getContextPath()
					+ "/html_manager/manager.html?r=0");
		}

	}

	/**
	 * 
	 * ��ѯ���ݿ��һ�����ݴ治����
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 * 
	 */
	private void getone(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		ManagerService g = new ManagerService();
		int id =  Integer.parseInt(request.getParameter("id"));

		if (g.getone(id)!=null) {
			
			JSONObject resultJson = new JSONObject();// �����������json
			JSONArray jsonArray = new JSONArray();


			Manager m = g.getone(id);

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("id", m.getId());
			jsonObject.put("password", m.getPassword());
			jsonObject.put("info", m.getInfo());
			jsonArray.add(jsonObject);
			resultJson.put("managers", jsonArray);
			out.println(resultJson);
			out.flush();
			out.close();
		} else {
			
		}

	}
	
	/**
	 * 
	 * �޸����ݿ�һ��ָ�����ݵ�info,password
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 * 
	 */
	private void editMy(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		ManagerService g = new ManagerService();
		Manager m= new Manager();
		int id =  Integer.parseInt(request.getParameter("id"));
		String password = (String)request.getParameter("passworde");
		String info = (String) request.getParameter("infoe");
		
		m.setId(id);
		m.setInfo(info);
		m.setPassword(password);
		if(g.edit(m)){
			response.sendRedirect(request.getContextPath()
					+ "/html_manager/manager.html?r=4");
		} else {
			response.sendRedirect(request.getContextPath()
					+ "/html_manager/manager.html?r=5");
		}
	

	}
	
	/**
	 * 
	 * �޸����ݿ�һ��ָ�����ݵ�info
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 * 
	 */
	private void editInfo(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		ManagerService g = new ManagerService();
		Manager m= new Manager();
		int id =  Integer.parseInt(request.getParameter("id"));
		String password = (String)request.getParameter("password");
		String info = (String) request.getParameter("infoe");
		
		m.setId(id);
		m.setInfo(info);
		m.setPassword(password);
		if(g.edit(m)){
			response.sendRedirect(request.getContextPath()
					+ "/html_manager/manager.html?r=4");
		} else {
			response.sendRedirect(request.getContextPath()
					+ "/html_manager/manager.html?r=5");
		}
	

	}
	
	/**
	 * 
	 * ��ȡid��password�������ݿ�
	 * ƥ��ɹ�-��¼�ɹ�
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 * 
	 */
	private void login(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		//HttpSession session = request.getSession();

		
		ManagerService g = new ManagerService();
		if(request.getParameter("id")==""||request.getParameter("password")==""){
			response.sendRedirect(request.getContextPath()+ "/html_manager/login.html");
			return;
		}
		int id =  Integer.parseInt(request.getParameter("id"));
		String password = request.getParameter("password");
		
		Manager m = new Manager();
		m.setId(id);
		m.setPassword(password);
		
		if(g.login(m)){
			//session.setAttribute("user","����Ա"+id); 
			Cookie cookie = new Cookie(URLEncoder.encode("user", "utf-8"),URLEncoder.encode(String.valueOf(id), "utf-8"));
			cookie.setMaxAge(60*60*24); 
			response.addCookie(cookie);
			response.sendRedirect(request.getContextPath()
					+ "/html_manager/manager.html");
		} else {
			response.sendRedirect(request.getContextPath()
					+ "/html_manager/login.html");
		}
	

	}
	
	/**
	 * 
	 * ���cookie��userֵ������˳�
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 * 
	 */
	private void logout(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Cookie[] cookies = null;
		cookies = request.getCookies();
		
		String name = URLDecoder.decode(cookies[0].getName(),"utf-8");
		
		for(int i=0;i<cookies.length;i++){
			name = URLDecoder.decode(cookies[i].getName(),"utf-8");
			if(name.equals("user")){
				cookies[i].setValue(URLEncoder.encode("�ο�", "utf-8"));
				response.addCookie(cookies[i]);
			}
		}
		response.sendRedirect(request.getContextPath()
				+ "/html_manager/login.html");
	}
	
	/**
	 * 
	 * ��cookie�ж���user��ֵ
	 * �������� ��¼���û�������
	 * ͬʱ����Ƿ��¼��������ת��¼����
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 * 
	 */
	private void getCookie_user(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		PrintWriter out = response.getWriter();
		
		Cookie[] cookies = null;

		String value = null;
		if (request.getCookies() == null) {
			value = "�ο�";
		} else {
			cookies = request.getCookies();
			String name = URLDecoder.decode(cookies[0].getName(), "utf-8");
			value = URLDecoder.decode(cookies[0].getValue(), "utf-8");

			for (int i = 0; i < cookies.length; i++) {
				name = URLDecoder.decode(cookies[i].getName(), "utf-8");
				if (name.equals("user")) {
					value = URLDecoder.decode(cookies[i].getValue(), "utf-8");
				}
			}
			if(value==null){
				value="�ο�";
			}
		}
		out.print(value);
		out.flush();
		out.close();
	}
	
	private void getNum(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		PrintWriter out = response.getWriter();
		ManagerService g = new ManagerService();

		ArrayList<Manager> a = g.get();
		int num = a.size();
		out.print(num);
		out.flush();
		out.close();
	}
	/**
	 * 
	 * ���һ��Manager�������ݵ����ݿ�
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 * 
	 */
	private void add(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		if(request.getParameter("id")==""||request.getParameter("password")==""){
			response.sendRedirect(request.getContextPath()+ "/html_manager/manager.html?r=3");
			return;
		}
		int a =  Integer.parseInt(request.getParameter("id"));
		
		String b = request.getParameter("password");
		String c = request.getParameter("info");
		
		ManagerService g = new ManagerService();
		Manager m= new Manager();
		m.setId(a);
		m.setPassword(b);
		m.setInfo(c);

		if (g.add(m)) {
			response.sendRedirect(request.getContextPath()
					+ "/html_manager/manager.html?r=2");
		} else {
			response.sendRedirect(request.getContextPath()
					+ "/html_manager/manager.html?r=3");
		}

	}

}
