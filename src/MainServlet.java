
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tw.youth.project.gift2016.consts.ConstValue;
import tw.youth.project.gift2016.func.Login;
import tw.youth.project.gift2016.sql.DBManager;
import tw.youth.project.gift2016.sql.SQLCmd;
import tw.youth.project.gift2016.sql.user.AUSER;

/**
 * Servlet implementation class Main
 */
@WebServlet("/Service.do")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static DBManager manager;
	private static Map<String, Object[]> userList;
	private static Map<String, Object[]> changePassList;
	private Timer timer;
	private long time = 30 * 60 * 1000;
	// 30分

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MainServlet() {
		super();
		// TODO Auto-generated constructor stub
		manager = new DBManager(SQLCmd.DB_URL, SQLCmd.DB_NAME, SQLCmd.DB_USER, SQLCmd.DB_PASS);
		manager.starup();
		userList = new HashMap<>();
		changePassList = new HashMap<>();

		startTimer();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());
		Enumeration<String> parameterNames = request.getParameterNames();

		while (parameterNames.hasMoreElements()) {
			String paramName = parameterNames.nextElement();

			switch (paramName) {
			case "logout":
				logout(request, response);
				break;
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		Enumeration<String> parameterNames = request.getParameterNames();

		while (parameterNames.hasMoreElements()) {
			String paramName = parameterNames.nextElement();
			System.out.println("paramName = " + paramName);

			switch (paramName) {
			case "login_user":
				chkLogin(request, response);
				break;
			case "mailKey":
				if (request.getParameter(paramName).equals(""))
					changePwd(request, response);
				else
					changePwdByMail(request, response);
				break;
			case "email":
				sendEmail(request, response);
				break;
			}
		}
	}

	private void chkLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 登入功能實作
		Login login = new Login(manager, request.getParameter("login_user"), request.getParameter("login_pass"));
		// 檢查登入成功否? 成功則用Cookie儲存使用者的userCode作驗證並返回首頁，失敗則回到登入頁面繼續登入動作
		if (login.checkLogin().equals(ConstValue.LOGIN_SUCCESS)) {
			AUSER user = login.getUser();
			Long currentTime = System.currentTimeMillis();
			String userCode = user.toMD5Pass((currentTime + "").substring(9));
			Object[] objs = { currentTime, user };
			userList.put(userCode, objs);
			Cookie cookie = new Cookie("userCode", userCode);
			cookie.setMaxAge(60 * 60); // 7*24*60*60 = 7天時間 現在設定1小時
			response.addCookie(cookie);// 儲存Cookie
			response.sendRedirect(this.getServletContext().getContextPath() + "/index.jsp");
			// request.getRequestDispatcher("/index.jsp").forward(request,
			// response);
		} else {
			request.setAttribute("errorLogin", login.checkLogin());
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}

	}

	private void startTimer() {
		// 啟動定時器，設定每30分鐘啟動chkTimeOut功能
		TimerTask task = new TimerTask() {

			@Override
			public void run() {
				// TODO Auto-generated method stub
				chkTimeOut();
			}
		};

		timer = new Timer();
		timer.schedule(task, time, time);
	}

	private void chkTimeOut() {
		// 檢查登入之使用者是否超時(30分鐘)?
		Long currentTime = System.currentTimeMillis();
		for (Map.Entry<String, Object[]> entry : userList.entrySet()) {
			// String str = entry.getKey();
			if (currentTime - ((Long) entry.getValue()[0]) > 1800 * 1000)
				userList.remove(entry.getKey());
		}
	}

	private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 登出功能
		Cookie[] cookies = request.getCookies();
		String userCode = null;
		for (Cookie cook : cookies) {
			if (cook.getName().equals("userCode")) {
				userCode = cook.getValue();
				userList.remove(userCode);
				cook.setValue("");
				response.addCookie(cook);
				break;
			}
		}
		request.setAttribute("logout", "您已登出，歡迎再次登入使用");
		request.getRequestDispatcher("/index.jsp").forward(request, response);

	}

	private void sendEmail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 發送電子郵件
		Login login = new Login();
		// 電子郵件的網址
		// String url =
		// "http://localhost:8080/GiftWeb8/change_pwd.jsp?mailKey=";
		String url = "http://localhost:8080/GiftWeb8/FrontEnd/Staff/change_pwd.jsp?mailKey=";
		Long time = System.currentTimeMillis();
		// 設定亂碼供郵件修改密碼的驗證用途
		String val = new AUSER().toMD5Pass((time + "").substring(9));
		Object[] info = login.forgotPass(manager, request.getParameter("email"), url + val);
		// 檢查郵件地址是否錯誤?錯誤則返回登入畫面，正確則回到首頁
		if (info[0].equals(ConstValue.LOGIN_CHECK_EMAIL_FAILURE)) {
			request.setAttribute("errorEmail", info[0]);
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		} else {
			info[0] = time;
			changePassList.put(val, info);
			request.setAttribute("mail_success", "已發送忘記密碼郵件至您的信箱");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}

	private void changePwd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 已登入的修改密碼功能
		Cookie[] cookies = request.getCookies();
		String userCode = null;
		for (Cookie cook : cookies) {
			if (cook.getName().equals("userCode")) {
				userCode = cook.getValue();
				break;
			}
		}

		Login login = new Login();
		String msg = login.changPassword(manager, (AUSER) userList.get(userCode)[1], request.getParameter("oldpass"),
				request.getParameter("newpass"), request.getParameter("repass"));
		msg = msg.equals("update true") ? "修改成功" : msg;
		request.setAttribute("changePwd", msg);
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

	private void changePwdByMail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 電子郵件的修改密碼功能
		Login login = new Login();
		String key = request.getParameter("mailKey");
		String msg = "已超過允許修改時效，請重新使用";
		Object[] obj = changePassList.get(key);
		// 檢查時效 預設30分鐘，超過就不執行修改密碼功能
		if (System.currentTimeMillis() - ((Long) obj[0]) < 1800 * 1000)
			msg = login.changPasswordByMail(manager, (AUSER) obj[1], request.getParameter("newpass"));
		changePassList.remove(key);
		// 不論執行結果為何都跳回首頁
		msg = msg.equals("update true") ? "修改成功" : msg;
		request.setAttribute("changePwd", msg);
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}
	
	public ArrayList<String> searchByUser(){
		return null;
	}

}
