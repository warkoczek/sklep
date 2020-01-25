package model;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/baza")
public class baza extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public baza() {
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String login = "darek";
        String password = "abc012";
        String md5 = makeMD5(password);
        md5 = "darek1";
        String USER = "darek";
        String PASS = "darek1";
        Statement stmt = null;
        ResultSet rs = null;
        /*
         usunięcie ciasteczka dla użytkownika 'darecc'
         */
        Cookie[] ciastka = request.getCookies();
        Cookie toCiastko  = null;
        for(Cookie cookie : ciastka)
            if (cookie.getName().equals("darecc")) {
                cookie.setMaxAge(0);
                toCiastko = cookie;
                System.out.println("usunięto ciasteczko 'darecc");
            }
        else
                System.out.println("@" + cookie.getName() + "@");
        try {
            Connection conn = DatabaseConnection.initializeDatabase("sklep", USER, PASS);
            System.out.println("po conn");
            stmt = conn.createStatement();
            System.out.println("po stmt");
            String sql = "SELECT * FROM users where login = '" + login + "' AND md5='" + md5 + "';";
            System.out.println("sql=@" + sql + "@");
            rs = stmt.executeQuery(sql);
            System.out.println("result set: " + rs.first());
            boolean ile = rs.first();
            System.out.println("rs.size= " + ile);

        }
        catch(ClassNotFoundException cnfe) {
            System.out.println("!!!" + cnfe.getMessage());
        }
        catch(SQLException se) {
            System.out.println("@@@"  +se.getMessage());
        }
        String page = "products.jsp";
        response.addCookie(toCiastko);
        RequestDispatcher dd = request.getRequestDispatcher(page);
        dd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

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
}
