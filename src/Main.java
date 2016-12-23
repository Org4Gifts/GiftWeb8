
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

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
public class Main extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static DBManager manager;
	private static Map<String, Object> userList;
	private static Map<String, Object[]> changePassList;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Main() {
		super();
		// TODO Auto-generated constructor stub
		manager = new DBManager(SQLCmd.DB_URL, SQLCmd.DB_NAME, SQLCmd.DB_USER, SQLCmd.DB_PASS);
		manager.starup();
		userList = new HashMap<>();
		changePassList = new HashMap<>();
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
			System.out.println(paramName);

			switch (paramName) {
			case "mailKey":
				changePwd(request, response);
				break;
			case "login":
				chkLogin(request, response);
				break;
			case "ForgotPwd":
				sendEmail(request, response);
				break;
			case "notSet":
				break;
			}
		}
	}

	private void chkLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Login login = new Login(manager, request.getParameter("user"), request.getParameter("pass"));
		if (login.checkLogin().equals(ConstValue.LOGIN_SUCCESS)) {
			AUSER user = login.getUser();
			String userCode = user.toMD5Pass((System.currentTimeMillis() + "").substring(9));
			userList.put(userCode, user);
			Cookie cookie = new Cookie("userCode", userCode);
			cookie.setMaxAge(60 * 60); // 7*24*60*60 = 7天時間 現在設定1小時
			response.addCookie(cookie);// 儲存Cookie
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		} else {
			request.setAttribute("errorLogin", login.checkLogin());
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}

	}

	private void chkTimeOut() {

	}

	private void sendEmail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Login login = new Login(manager, "username", "passwd");
		String url = "http://192.168.64.254/change_pwd.jsp?";
		Long time = System.currentTimeMillis();
		String val = new AUSER().toMD5Pass((time + "").substring(9));
		Object[] info = login.forgotPass(manager, request.getParameter("email"), url + val);

		if (info[0].equals(ConstValue.LOGIN_CHECK_EMAIL_FAILURE)) {
			request.setAttribute("errorEmail", info[0]);
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		} else {
			info[0] = time;
			changePassList.put(val, info);
			request.setAttribute("mail_success", info[0]);
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}

	private void changePwd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Login login = new Login(manager, "username", "passwd");
		String key = request.getParameter("mailKey");
		String msg = "已超過允許修改時效，請重新使用";
		Object[] obj = changePassList.get(key);
		if (!(System.currentTimeMillis() - ((Long) obj[0]) > 1800 * 1000))
			msg = login.changPasswordByMail(manager, (AUSER) obj[1], request.getParameter("pass"));
		changePassList.remove(key);
		request.setAttribute("changePwd", msg);
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

}
