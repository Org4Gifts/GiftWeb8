package com.giftweb.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tw.youth.project.gift2016.consts.ConstValue;
import tw.youth.project.gift2016.func.Login;
import tw.youth.project.gift2016.func.Orders;
import tw.youth.project.gift2016.sql.DBManager;
import tw.youth.project.gift2016.sql.SQLCmd;
import tw.youth.project.gift2016.sql.aodr.AODR;
import tw.youth.project.gift2016.sql.user.AUSER;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(description = "For Login Check Up", urlPatterns = { "/Login.do" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static DBManager manager;
	private static Map<String, Object[]> changePassList;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
		manager = new DBManager(SQLCmd.DB_URL, SQLCmd.DB_NAME, SQLCmd.DB_USER, SQLCmd.DB_PASS);
		manager.starup();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());

		request.setCharacterEncoding("UTF-8"); // 指定取得POST請求參數時使用的編碼。例如若瀏覽器以UTF-8來發送請求，則你接收時也要使用UTF-8編碼字串。記得，一定要在取得任何請求參數前執行。否則是沒有任何作用的。
		
		HttpSession session = request.getSession();
		String username = request.getParameter("username") == null ? (String) session.getAttribute("username")
				: request.getParameter("username");
		String pass = request.getParameter("pass") == null ? (String) session.getAttribute("pass")
				: request.getParameter("pass");

		if (username == null || pass == null) {
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}

		Login login = new Login(manager, username, pass);

		String action = request.getParameter("action"); // 取得
														// client端送來的某(①name)請求參數的【值
														// (②value)。 例如: <input
														// type="hidden"
														// name="①action"
														// value="②login">
		// System.out.println("action=" + action);

		// 前端網頁 1.登入
		if ("Login".equals(action)) {
			String check = login.checkLogin();
			// System.out.println("check = " + check);
			if ("登入失敗".equals(check)) {
				request.setAttribute("error", check);
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			} else {
				session.setAttribute("username", username);
				session.setAttribute("pass", pass);
				
				// 查詢訂單 by Department
				System.out.println("查詢訂單");
				AUSER auser = login.getUser();				
				Orders orders = new Orders(manager, auser);
				AODR aodr = new AODR();
				for (Object obj : orders.queryOrders(manager, auser, aodr.getTableName())) {
					aodr = (AODR) obj;
					System.out.println(aodr.getEmpno() + " ; " + aodr.getOrder1());
				}
				ArrayList<Object> aodrlst = orders.queryOrders(manager, auser, aodr.getTableName());		
				request.setAttribute("aodrlst", aodrlst);
				
				//request.getRequestDispatcher("/index.jsp").forward(request, response);
				//request.getRequestDispatcher("/FrontEnd/frame2/index_new2.jsp").forward(request, response);
				request.getRequestDispatcher("/index_new.jsp").forward(request, response);				
			}
		}

		// 前端網頁 2.忘記密碼
		if ("forgot".equals(action)) {
			Object[] info = login.forgotPass(manager, request.getParameter("email"), "");
			request.setAttribute("error", info[0]);
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}

		// 前端網頁 3.修改密碼
		if ("ChangePwd".equals(action)) {
			String newpass = request.getParameter("newpass");
			String repass = request.getParameter("repass");

			AUSER auser = login.getUser();

			// System.out.println("login=" + login);
			// System.out.println("auser=" + auser);

			if (auser != null && auser.toMD5Pass(pass).equals(auser.getPass())) {
				String info = login.changPassword(manager, auser, pass, newpass, repass);
				// System.out.println("info = " + info);
				request.setAttribute("error", "ChangePwd-True-您的密碼已修改完成，下次登入請使用新密碼，謝謝!");
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			} else {
				request.setAttribute("error", ConstValue.LOGIN_OLD_PASS_ERROR);
				request.getRequestDispatcher("/FrontEnd/Staff/ChangePwd.jsp").forward(request, response);
			}
		}
	}
}
