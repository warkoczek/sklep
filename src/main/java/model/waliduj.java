package model;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/waliduj")
public class waliduj extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public waliduj() {
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String login    = request.getParameter("user");
		String password = request.getParameter("password");
		System.out.println("login@" + login + "@");
		System.out.println("password@" + password + "@");
    	String md5 = makeMD5(password);
		String dbUSER = "darek";
		String dbPASS = "darek1";
		String role = checkIfUserExists(login, md5, dbUSER, dbPASS);
		String page = "";
		if (role == "no") {
			page = "createUserAccount.jsp";
		}
		else {
			// wybór typu użytkownika
			if (role.equals("employee")) {
				HttpSession session = request.getSession();
				session.setAttribute("user", login);
				session.setAttribute("dbUSER", dbUSER);
				session.setAttribute("dbPASS", dbPASS);
				response.sendRedirect("changeOrdersState.jsp");
			}
			// pobranie ciasteczka o kluczu = login
			Cookie[] ciastka = request.getCookies();
			List<Item> koszyk = new ArrayList<>();
			for(Cookie cookie : ciastka)
				if (cookie.getName().equals(login)) {
					// utworzenie pustego koszyka zakupów
					Gson json = new Gson();
					String st = cookie.getValue();
					st = st.replace("^%", "\"");
					st = st.replace("!%", ",");
					System.out.println(st);
					// utworzenie kolekcji Item z ciasteczka i zapisanie kolekcji w koszyku
					Item[] items = json.fromJson(st, Item[].class);
					koszyk.addAll(Arrays.asList(items));
				}
			// utworzenie zmiennych sesyjnych dla user (login)
			HttpSession session = request.getSession();
			session.setAttribute("user", login);
			//utworzenie zmiennej sesyjnej z rozmiarem koszyka
			session.setAttribute("shoppingCart", koszyk);
			session.setAttribute("shoppingCartSize", koszyk.size());
			session.setAttribute("dbUSER", dbUSER);
			session.setAttribute("dbPASS", dbPASS);
			page = "products.jsp";
		}
		response.sendRedirect(page);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	/**
	 * Utworzenie MD5 dla hasla podanego przez uzytkownika
	 * @return
	 */
	private String makeMD5(String password)  {
		//region zamiana hasła na MD5
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] hashInBytes = md.digest(password.getBytes(StandardCharsets.UTF_8));

			StringBuilder sb = new StringBuilder();
			for (byte b : hashInBytes) {
				sb.append(String.format("%02x", b));
			}
			String md5 = sb.toString().toUpperCase();
			System.out.println("md5=" + md5);
			return md5;
		}
		catch(NoSuchAlgorithmException nsae) {
			return null;
		}
	}
	private String checkIfUserExists(String login, String md5, String dbUSER, String dbPASS) {
		Statement stmt = null;
		ResultSet rs = null;
		String role = "no";
		boolean jest = false;
		try {
			Connection conn = DatabaseConnection.initializeDatabase("sklep", dbUSER, dbPASS);
			stmt = conn.createStatement();
			String sql = "SELECT * FROM users where login = '" + login + "' AND md5='" + md5 + "';";
			rs = stmt.executeQuery(sql);
			jest = rs.first();
			role = rs.getString("role");
			System.out.println("result set: " + jest);
		}
		catch(ClassNotFoundException cnfe) {
			System.out.println("!!!" + cnfe.getMessage());
			return role;
		}
		catch(SQLException se) {
			System.out.println("@@@"  +se.getMessage());
			return role;
		}
		return role;
	}
}
