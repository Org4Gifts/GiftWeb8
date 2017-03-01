
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.TreeMap;
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
import tw.youth.project.gift2016.func.Querys;
import tw.youth.project.gift2016.sql.DBManager;
import tw.youth.project.gift2016.sql.SQLCmd;
import tw.youth.project.gift2016.sql.adep.ADEP;
import tw.youth.project.gift2016.sql.afab.AFAB;
import tw.youth.project.gift2016.sql.ainventory.AINVENTORY;
import tw.youth.project.gift2016.sql.aio.AIO;
import tw.youth.project.gift2016.sql.aio.AIODT;
import tw.youth.project.gift2016.sql.aodr.AODR;
import tw.youth.project.gift2016.sql.aodr.AODRDT;
import tw.youth.project.gift2016.sql.apresent.APRESENT;
import tw.youth.project.gift2016.sql.aqty.AQTY;
import tw.youth.project.gift2016.sql.asignlog.ASIGNLOG;
import tw.youth.project.gift2016.sql.avdr.AVDR;
import tw.youth.project.gift2016.sql.normal.Bulletin;
import tw.youth.project.gift2016.sql.user.AEMP;
import tw.youth.project.gift2016.sql.user.AUSER;

/**
 * Servlet implementation class Main
 */
@WebServlet("/Service.do")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static DBManager manager;
	// 資料庫功能
	private static Map<String, Object[]> userList;
	// 目前登入的使用者名單
	private static Map<String, Object[]> changePassList;
	// 修改密碼時候的暫存名單
	private Timer timer;
	// 定時器，用來清除上面兩個名單用
	private long time = 30 * 60 * 1000;
	// 30分
	
	private TreeMap<String, TreeMap<String, TreeMap<String, ArrayList<Object>>>> mapsYear;
	private TreeMap<String, TreeMap<String, ArrayList<Object>>> mapsMonth;
	private TreeMap<String, ArrayList<Object>> mapsDate;
	private ArrayList<Object> days;
	//儲存全查詢用的功能

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MainServlet() {
		super();
		// TODO Auto-generated constructor stub
		manager = new DBManager(SQLCmd.DB_URL, SQLCmd.DB_NAME, SQLCmd.DB_USER, SQLCmd.DB_PASS);
		manager.starup();
		// 啟動資料庫
		userList = new TreeMap<>();
		changePassList = new TreeMap<>();

		startTimer();
		// 啟動定時器
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
		// 強制Servlet編碼為UTF-8
		request.setCharacterEncoding("UTF-8");

		Enumeration<String> parameterNames = request.getParameterNames();

		while (parameterNames.hasMoreElements()) {
			String paramName = parameterNames.nextElement();

			switch (paramName) {
			case "logout":
				logout(request, response);
				break;
			case "queryAll":
				queryUser(request, response);
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

		// 強制Servlet編碼為UTF-8
		request.setCharacterEncoding("UTF-8");

		// 取得所有的request名稱
		Enumeration<String> parameterNames = request.getParameterNames();

		// 將所有request的名稱一一提出來過濾
		while (parameterNames.hasMoreElements()) {
			String paramName = parameterNames.nextElement();

			switch (paramName) {
			case "loginUser":
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
			case "queryOption":
				if (!request.getParameter("queryType").equals("change"))
					queryKey(request, response);
				else
					request.getRequestDispatcher("/queryKey.jsp").forward(request, response);
				break;
			case "queryBulletin":
				queryBulletin(request, response);
				break;
			case "queryOrder":
				queryOrder(request, response);
				break;
			case "queryAll":
				queryUser(request, response);
				break;
			case "addOrderdt":
				addOrderdt(request, response);
			}
		}
	}

	private void chkLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 登入功能實作
		Login login = new Login(manager, request.getParameter("loginUser"), request.getParameter("loginPass"));
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
			// response.sendRedirect(this.getServletContext().getContextPath() +
			// "/index.jsp");
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

	private boolean chkLoginExist(String userCode) {
		return userList.containsKey(userCode);
	}

	private String getUserCode(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		String userCode = null;
		for (Cookie cook : cookies) {
			if (cook.getName().equals("userCode")) {
				userCode = cook.getValue();
				break;
			}
		}
		return userCode;
	}

	private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 登出功能
		Cookie[] cookies = request.getCookies();
		String userCode = null;
		for (Cookie cook : cookies) {
			if (cook.getName().equals("userCode")) {
				userCode = cook.getValue();
				// 非一般取得方法，不能使用上面的getUserCode;
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
			request.setAttribute("mailSuccess", "已發送忘記密碼郵件至您的信箱");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}

	private void changePwd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 已登入的修改密碼功能
		String userCode = getUserCode(request);

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
	
	private void setMaps(String[] yymmdd,
//			TreeMap<String, TreeMap<String, TreeMap<String, ArrayList<Object>>>> mapsYear,
//	TreeMap<String, TreeMap<String, ArrayList<Object>>> mapsMonth,
//	TreeMap<String, ArrayList<Object>> mapsDate,
//	ArrayList<Object> days,
	Object obj){
		if(obj.toString().contains("aodr")){
		}
		if(!mapsYear.containsKey(yymmdd[0])){
			mapsMonth = new TreeMap<>();
			mapsDate = new TreeMap<>();
			days = new ArrayList<>();
			mapsYear.put(yymmdd[0], mapsMonth);
			mapsMonth.put(yymmdd[1], mapsDate);
			mapsDate.put(yymmdd[2], days);
			days.add(obj);
		}else{
			if(!mapsMonth.containsKey(yymmdd[1])){
				mapsDate = new TreeMap<>();
				days = new ArrayList<>();
				mapsMonth.put(yymmdd[1], mapsDate);
				mapsDate.put(yymmdd[2], days);
				days.add(obj);
			}else{
				if(!mapsDate.containsKey(yymmdd[2])){
					days = new ArrayList<>();
					mapsDate.put(yymmdd[2], days);
					days.add(obj);
				}else{
					days.add(obj);
				}
			}
		}
			
	
	}

	private void queryUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 全查詢
		String userCode = getUserCode(request);

		if (userCode != null && !userCode.equals("") && chkLoginExist(userCode)) {
			Querys querys = new Querys((AUSER) userList.get(userCode)[1]);
//			TreeMap<String, TreeMap<String, TreeMap<String, ArrayList<Object>>>> mapsYear = new TreeMap<>();
//			TreeMap<String, TreeMap<String, ArrayList<Object>>> mapsMonth = new TreeMap<>();
//			TreeMap<String, ArrayList<Object>> mapsDate = new TreeMap<>();
//			ArrayList<Object> days = new ArrayList<>();
			mapsYear = new TreeMap<>();
			mapsMonth = new TreeMap<>();
			mapsDate = new TreeMap<>();
			days = new ArrayList<>();
			
			ArrayList<AODR> aodrs = querys.getAodrs(manager);
			if (aodrs != null) {
				for (AODR aodr : aodrs) {
					String[] yymmdd = aodr.getCreated().toString().substring(0, 10).split("-");
//					setMaps(yymmdd,mapsYear,mapsMonth,mapsDate,days,aodr);
					setMaps(yymmdd, aodr);
				}
				request.setAttribute("aodr", mapsYear);
				mapsYear = new TreeMap<>();
				mapsMonth = new TreeMap<>();
				mapsDate = new TreeMap<>();
			}
			
			ArrayList<AIO> aios = querys.getAios(manager, new AIO().getKeys()[1], "");
			if(aios != null){
				for (AIO aio : aios) {
					String[] yymmdd = aio.getCreated().toString().substring(0, 10).split("-");
//					setMaps(yymmdd,mapsYear,mapsMonth,mapsDate,days,aio);
					setMaps(yymmdd, aio);
				}
				request.setAttribute("aio", mapsYear);
				mapsYear = new TreeMap<>();
				mapsMonth = new TreeMap<>();
				mapsDate = new TreeMap<>();
			}
			
			ArrayList<AEMP> aemps = querys.getAemps(manager, new AEMP().getKeys()[1], "");
			if(aemps != null){
				for (AEMP aemp : aemps) {
					String[] yymmdd = aemp.getCreated().toString().substring(0, 10).split("-");
//					setMaps(yymmdd,mapsYear,mapsMonth,mapsDate,days,aemp);
					setMaps(yymmdd, aemp);
				}
				request.setAttribute("aemp", mapsYear);
				mapsYear = new TreeMap<>();
				mapsMonth = new TreeMap<>();
				mapsDate = new TreeMap<>();
			}
			
			
			ArrayList<ADEP> adeps = querys.getAdeps(manager, new ADEP().getKeys()[1], "");
			if(adeps != null){
				for (ADEP adep : adeps) {
					String[] yymmdd = adep.getCreated().toString().substring(0, 10).split("-");
//					setMaps(yymmdd,mapsYear,mapsMonth,mapsDate,days,adep);
					setMaps(yymmdd, adep);
				}
				request.setAttribute("adep", mapsYear);
				mapsYear = new TreeMap<>();
				mapsMonth = new TreeMap<>();
				mapsDate = new TreeMap<>();
			}
			
			ArrayList<AFAB> afabs = querys.getAfabs(manager, new AFAB().getKeys()[1], "");
			if(afabs != null){
				for (AFAB afab : afabs) {
					String[] yymmdd = afab.getCreated().toString().substring(0, 10).split("-");
//					setMaps(yymmdd,mapsYear,mapsMonth,mapsDate,days,afab);
					setMaps(yymmdd, afab);
				}
				request.setAttribute("afab", mapsYear);
				mapsYear = new TreeMap<>();
				mapsMonth = new TreeMap<>();
				mapsDate = new TreeMap<>();
			}
			
			ArrayList<AINVENTORY> ainventorys = querys.getAinventorys(manager, new AINVENTORY().getKeys()[1], "");
			if(ainventorys != null){
				for (AINVENTORY ainventory : ainventorys) {
					String[] yymmdd = ainventory.getCreated().toString().substring(0, 10).split("-");
//					setMaps(yymmdd,mapsYear,mapsMonth,mapsDate,days,ainventory);
					setMaps(yymmdd, ainventory);
				}
				request.setAttribute("ainventory", mapsYear);
				mapsYear = new TreeMap<>();
				mapsMonth = new TreeMap<>();
				mapsDate = new TreeMap<>();
			}

			ArrayList<AIODT> aiodts = querys.getAiodts(manager, "");
			if(aiodts != null){
				for (AIODT aiodt : aiodts) {
					String[] yymmdd = aiodt.getCreated().toString().substring(0, 10).split("-");
//					setMaps(yymmdd,mapsYear,mapsMonth,mapsDate,days,aiodt);
					setMaps(yymmdd, aiodt);
				}
				request.setAttribute("aiodt", mapsYear);
				mapsYear = new TreeMap<>();
				mapsMonth = new TreeMap<>();
				mapsDate = new TreeMap<>();
			}
			
			ArrayList<AODRDT> aodrdts = querys.getAodrdts(manager, "");
			if(aodrdts != null){
				for (AODRDT aodrdt : aodrdts) {
					String[] yymmdd = aodrdt.getCreated().toString().substring(0, 10).split("-");
//					setMaps(yymmdd,mapsYear,mapsMonth,mapsDate,days,aodrdt);
					setMaps(yymmdd, aodrdt);
				}
				request.setAttribute("aodrdt", mapsYear);
				mapsYear = new TreeMap<>();
				mapsMonth = new TreeMap<>();
				mapsDate = new TreeMap<>();
			}

			ArrayList<APRESENT> apresents = querys.getApresents(manager, new APRESENT().getKeys()[1], "");
			if(apresents != null){
				for (APRESENT apresent : apresents) {
					String[] yymmdd = apresent.getCreated().toString().substring(0, 10).split("-");
//					setMaps(yymmdd,mapsYear,mapsMonth,mapsDate,days,apresent);
					setMaps(yymmdd, apresent);
				}
				request.setAttribute("apresent", mapsYear);
				mapsYear = new TreeMap<>();
				mapsMonth = new TreeMap<>();
				mapsDate = new TreeMap<>();
			}

			ArrayList<AQTY> aqtys = querys.getAqtys(manager, new AQTY().getKeys()[1], "");
			if(aqtys != null){
				for (AQTY aqty : aqtys) {
					String[] yymmdd = aqty.getCreated().toString().substring(0, 10).split("-");
//					setMaps(yymmdd,mapsYear,mapsMonth,mapsDate,days,aqty);
					setMaps(yymmdd, aqty);
				}
				request.setAttribute("aqty", mapsYear);
				mapsYear = new TreeMap<>();
				mapsMonth = new TreeMap<>();
				mapsDate = new TreeMap<>();
			}

			ArrayList<ASIGNLOG> asignlogs = querys.getAsignlogs(manager, "");
			if(asignlogs != null){
				for (ASIGNLOG asignlog : asignlogs) {
					String[] yymmdd = asignlog.getCreated().toString().substring(0, 10).split("-");
//					setMaps(yymmdd,mapsYear,mapsMonth,mapsDate,days,asignlog);
					setMaps(yymmdd, asignlog);
				}
				request.setAttribute("asignlog", mapsYear);
				mapsYear = new TreeMap<>();
				mapsMonth = new TreeMap<>();
				mapsDate = new TreeMap<>();
			}
			
			ArrayList<AVDR> avdrs = querys.getAvdrs(manager, new AVDR().getKeys()[1], "");
			if(avdrs != null){
				for (AVDR avdr : avdrs) {
					String[] yymmdd = avdr.getCreated().toString().substring(0, 10).split("-");
//					setMaps(yymmdd,mapsYear,mapsMonth,mapsDate,days,avdr);
					setMaps(yymmdd, avdr);
				}
				request.setAttribute("avdr", mapsYear);
				mapsYear = new TreeMap<>();
				mapsMonth = new TreeMap<>();
				mapsDate = new TreeMap<>();
			}
			
			ArrayList<AUSER> ausers = querys.getUsers(manager, new AUSER().getKeys()[1], "");
			if(ausers != null){
				for (AUSER auser : ausers) {
					String[] yymmdd = auser.getCreated().toString().substring(0, 10).split("-");
//					setMaps(yymmdd,mapsYear,mapsMonth,mapsDate,days,auser);
					setMaps(yymmdd, auser);
				}
				request.setAttribute("auser", mapsYear);
				mapsYear = new TreeMap<>();
				mapsMonth = new TreeMap<>();
				mapsDate = new TreeMap<>();
			}
			request.getRequestDispatcher("/FrontEnd/Querys/query_all.jsp").forward(request, response);
		} else {
			request.setAttribute("notLogin", ConstValue.LOGIN_NOT_LOGIN);
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}

	}

	private void queryKey(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 關鍵字查詢

		String userCode = getUserCode(request);
		// 檢查是否有登入?
		if (userCode != null && !userCode.equals("") && chkLoginExist(userCode)) {
			ArrayList<Object> objs = new ArrayList<>();
			Querys querys = new Querys(((AUSER) userList.get(userCode)[1]));

			String option = request.getParameter("queryOption");
			String key = request.getParameter("queryKey");
			String value = request.getParameter("queryValue");
			if (key != null) // 如果有key的話
				value = value != null ? value : "";// 檢查value如果是null，則可能是全查詢，設定空白做全查詢
			switch (option) {
			case "auser":
				ArrayList<AUSER> query1 = querys.getUsers(manager, key, value);
				if (query1 != null) {
					objs.addAll(query1);
					Collections.reverse(objs);
				}
				break;
			case "aemp":
				ArrayList<AEMP> query2 = querys.getAemps(manager, key, value);
				if (query2 != null) {
					objs.addAll(query2);
					Collections.reverse(objs);
				}
				break;
			case "avdr":
				ArrayList<AVDR> query3 = querys.getAvdrs(manager, key, value);
				if (query3 != null) {
					objs.addAll(querys.getAvdrs(manager, key, value));
					Collections.reverse(objs);
				}
				break;
			case "aqty":
				ArrayList<AQTY> query4 = querys.getAqtys(manager, key, value);
				if (query4 != null) {
					objs.addAll(query4);
					Collections.reverse(objs);
				}
				break;
			case "apresent":
				ArrayList<APRESENT> query5 = querys.getApresents(manager, key, value);
				if (query5 != null) {
					objs.addAll(query5);
					Collections.reverse(objs);
				}
				break;
			case "aodr":
				ArrayList<AODR> query6 = querys.getAodrs(manager);
				if (query6 != null) {
					objs.addAll(query6);
					Collections.reverse(objs);
				}
				break;
			case "aio":
				ArrayList<AIO> query7 = querys.getAios(manager, key, value);
				if (query7 != null) {
					objs.addAll(query7);
					Collections.reverse(objs);
				}
				break;
			case "ainventory":
				ArrayList<AINVENTORY> query8 = querys.getAinventorys(manager, key, value);
				if (query8 != null) {
					objs.addAll(query8);
					Collections.reverse(objs);
				}
				break;
			case "afab":
				ArrayList<AFAB> query9 = querys.getAfabs(manager, key, value);
				if (query9 != null) {
					objs.addAll(query9);
					Collections.reverse(objs);
				}
				break;
			case "adep":
				ArrayList<ADEP> query0 = querys.getAdeps(manager, key, value);
				if (query0 != null) {
					objs.addAll(query0);
					Collections.reverse(objs);
				}
				break;
			}
			request.setAttribute("resultOption", option);
			request.setAttribute("resultValue", objs);

			request.getRequestDispatcher("/FrontEnd/Querys/query_key.jsp").forward(request, response);

		} else {
			request.setAttribute("notLogin", ConstValue.LOGIN_NOT_LOGIN);
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}

	private void queryBulletin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 查詢公告事項
		String userCode = getUserCode(request);
		// 檢查是否有登入?
		if (userCode != null && !userCode.equals("") && chkLoginExist(userCode)) {
			ArrayList<Bulletin> objs = new ArrayList<>();

			Bulletin bull = new Bulletin();
			for (Object[] obj : manager.query(bull.getTableName(), bull.getKeys()[1], "", bull.getLength())) {
				bull.setValuesFull(obj);
				objs.add(bull);
				bull = new Bulletin();
			}

			request.setAttribute("resultOption", request.getParameter("queryBulletin"));
			request.setAttribute("resultValue", objs);
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		} else {
			request.setAttribute("notLogin", ConstValue.LOGIN_NOT_LOGIN);
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}

	private void queryOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 查詢訂單
		String userCode = getUserCode(request);
		// 檢查是否有登入?
		if (userCode != null && !userCode.equals("") && chkLoginExist(userCode)) {
			Querys querys = new Querys(((AUSER) userList.get(userCode)[1]));
			ArrayList<AFAB> query1 = querys.getAfabs(manager, new AFAB().getKeys()[1], "");
			ArrayList<APRESENT> query2 = querys.getApresents(manager, new APRESENT().getKeys()[1], "");
			request.setAttribute("resultAfab", query1);
			request.setAttribute("resultApresent", query2);
			request.getRequestDispatcher("/FrontEnd/Orders/add_order.jsp").forward(request, response);
		} else {
			request.setAttribute("notLogin", ConstValue.LOGIN_NOT_LOGIN);
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}
	
	private void addOrderdt(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 查詢訂單
				String userCode = getUserCode(request);
				// 檢查是否有登入?
				if (userCode != null && !userCode.equals("") && chkLoginExist(userCode)) {
//					ArrayList<APRESENT> resultApresent = (ArrayList<APRESENT>) request.getAttribute("resultApresent");
//					ArrayList<AFAB> resultAfab = (ArrayList<AFAB>) request.getAttribute("resultAfab");
					ArrayList<AODRDT> aodrdts = (ArrayList<AODRDT>)request.getAttribute("aodrdts");
					AODRDT aodrdt = new AODRDT();
					aodrdt.setComname(request.getParameter("comname"));
					System.out.println(aodrdt.getComname());
					aodrdt.setPername(request.getParameter("pername"));
					aodrdt.setAuthority(Integer.parseInt(request.getParameter("authority")));
					aodrdt.setFgno(request.getParameter("fgno"));
					aodrdt.setQty(Integer.parseInt(request.getParameter("qty")));
					aodrdt.setNote1(request.getParameter("note1"));
					if(aodrdts==null)
						aodrdts = new ArrayList<>();
					aodrdts.add(aodrdt);
					
					request.setAttribute("aodrdts", aodrdts);
					request.getRequestDispatcher("/FrontEnd/Orders/add_order.jsp").forward(request, response);
				} else {
					request.setAttribute("notLogin", ConstValue.LOGIN_NOT_LOGIN);
					request.getRequestDispatcher("/login.jsp").forward(request, response);
				}
	}
}
