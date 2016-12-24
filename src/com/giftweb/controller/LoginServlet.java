package com.giftweb.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tw.youth.project.gift2016.consts.ConstValue;
import tw.youth.project.gift2016.func.Login;
import tw.youth.project.gift2016.sql.DBManager;
import tw.youth.project.gift2016.sql.SQLCmd;
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

		// String username = session.getAttribute("username") == null ? "" :
		// request.getParameter("username");

		HttpSession session = request.getSession();
		String username = request.getParameter("username") == null ? (String) session.getAttribute("username")
				: request.getParameter("username");
		System.out.println("(String)session.getAttribute(username)=" + (String) session.getAttribute("username"));
		// session.setAttribute("username", (username == null)?"":username);

		// String pass = request.getParameter("pass") == null ? "" :
		// request.getParameter("pass");
		String pass = request.getParameter("pass") == null ? (String) session.getAttribute("pass")
				: request.getParameter("pass");
		System.out.println("(String)session.getAttribute(pass)=" + (String) session.getAttribute("pass"));

		System.out.println("username = " + username);
		System.out.println("pass = " + pass);

		Login login = new Login(manager, username, pass);

		String action = request.getParameter("action"); // 取得
														// client端送來的某(①name)請求參數的【值
														// (②value)。 例如: <input
														// type="hidden"
														// name="①action"
														// value="②login">
		System.out.println("action=" + action);

		// 前端網頁 1.登入
		if ("Login".equals(action)) {
			String check = login.checkLogin();
			System.out.println("check = " + check);
			if ("登入失敗".equals(check)) {
				request.setAttribute("error", check);
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			} else {
				// AUSER user = login.getUser();
				// System.out.println("user.getEname() = " + user.getEname());
				// request.setAttribute("username", user.getEname());
				// System.out.println("request.setAttribute(username) = " +
				// request.getAttribute("username"));
				// request.setAttribute("username", username);
				// session.setAttribute("username", user.getEmpno());
				// System.out.println("session.getAttribute(username) = " +
				// session.getAttribute("username"));

				session.setAttribute("username", username);
				session.setAttribute("pass", pass);
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			}
		}

		// 前端網頁 2.忘記密碼
		if ("forgot".equals(action)) {

			// String info = login.forgotPass(manager,
			// request.getParameter("email"),);
			//
			// System.out.println("info = " + info);
			// System.out.println("mail = " + request.getParameter("email"));

			// request.setAttribute("error", info);
			// request.getRequestDispatcher("/login.jsp").forward(request,
			// response);

			Object[] info = login.forgotPass(manager, request.getParameter("email"), "");
			request.setAttribute("error", info[0]);
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}

		// 前端網頁 3.修改密碼
		if ("ChangePwd".equals(action)) {
			String pass1 = request.getParameter("pass1");
			String newpass = request.getParameter("newpass");
			String repass = request.getParameter("repass");

			System.out.println("pass = " + pass);
			System.out.println("pass1 = " + pass1);
			System.out.println("newpass = " + newpass);
			System.out.println("repass = " + repass);
			
			AUSER auser = login.getUser();

			System.out.println("login.getUser()!!");
			System.out.println("login=" + login);
			System.out.println("auser=" + auser);

			//System.out.println("auser.getPass()=" + auser.getPass());
			//System.out.println("auser.toMD5Pass(pass1)=" + auser.toMD5Pass(pass1));

			// if (pass1.equals(pass)) {
			if (auser != null && auser.toMD5Pass(pass).equals(auser.getPass())) {
				String info = login.changPassword(manager, pass1, newpass, repass);
				System.out.println("info = " + info);
				//if (info.equals(ConstValue.LOGIN_NOT_LOGIN)) {
				if (!info.equals("")) {				
					request.setAttribute("error", info);
					request.getRequestDispatcher("/FrontEnd/Staff/ChangePwd.jsp").forward(request, response);
				} else {
					request.getRequestDispatcher("/index.jsp").forward(request, response);
				}				
			} else {
				request.setAttribute("error", ConstValue.LOGIN_OLD_PASS_ERROR);
				request.getRequestDispatcher("/FrontEnd/Staff/ChangePwd.jsp").forward(request, response);
			}
		}

	}
}
