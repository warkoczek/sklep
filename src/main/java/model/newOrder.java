package model;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;
import java.util.*;
import java.util.Date;

@WebServlet("/newOrder")
public class newOrder extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public newOrder() {
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName =  request.getParameter("firstName");
        String lastName  =  request.getParameter("lastName");
        String city      =  request.getParameter("city");
        String street    =  request.getParameter("street");
        String streetNumber    =  request.getParameter("streetNumber");
        String code      =  request.getParameter("code");
        String comment   =  request.getParameter("comments");
        System.out.println(firstName + " " + lastName + " " + city + " " + comment);
        HttpSession session = request.getSession();
        String dbUSER    = (String)session.getAttribute("dbUSER");
        String dbPASS    = (String)session.getAttribute("dbPASS");
        String login     = (String)session.getAttribute("user");
        System.out.println("Parametry:");
        Enumeration<String> nazwy = request.getParameterNames();
        while(nazwy.hasMoreElements())  {
            String nazwa = nazwy.nextElement();
            System.out.println(nazwa + " " + request.getParameter(nazwa));
        }
        Statement stmt = null;
        ResultSet rs;
        rs = null;
        try {
            Connection conn = DatabaseConnection.initializeDatabase("sklep", dbUSER, dbPASS);
            stmt = conn.createStatement();
            // status zamówienia na sztywno zapisany jako: new (inne to: accepted, pending, realized, deleted
            String status = "new";
            //tymczasowo forma płatności i forma dostarczenia są sztywno zaszyte
            String delivery = "pocztex";
            String payment = "blik";
            LocalDate dzisiaj = LocalDate.now();
            String sql = "INSERT INTO ORDERS (ORDERDATE, LOGIN,STATUS,DELIVERYMETHOD,PAYMENTMETHOD,COMMENTS,FIRSTNAME,LASTNAME,CITY,CODE,STREET,STREETNUMBER) VALUES(" +
                    "\'" +
                    dzisiaj + "\',\'" +
                    login + "\',\'" +
                    status + "\',\'" +
                    delivery + "\',\'" +
                    payment + "\',\'" +
                    comment + "\',\'" +
                    firstName + "\',\'" +
                    lastName + "\',\'" +
                    city + "\',\'" +
                    code + "\',\'" +
                    street + "\',\'" +
                    streetNumber + "\'" +
                ");";
            System.out.println(sql);
            int count = stmt.executeUpdate(sql);
            System.out.println("wstawiono: " + count);
            // pobranie zamówień tego użytkownika, żeby poznać orderID ostatniego zamówienia
            sql = "SELECT * FROM ORDERS WHERE LOGIN =\'" + login + "';";
            PreparedStatement ps;
            rs = stmt.executeQuery(sql);
            int orderID = -1;
            while(rs.next())
                if (rs.getString("login").equals(login))
                    orderID = rs.getInt("orderID");
                    // wstawienie rekordu do orderDetails
            sql = "INSERT INTO ORDERDETAILS (ORDERID,PRODUCTID,PRODUCTQUANTITY,PRODUCTPRICE) VALUES";
            List<Item> koszyk = (ArrayList<Item>)session.getAttribute("shoppingCart");
            int ile = 0;
            for(Item item : koszyk) {
                if (ile > 0) sql = sql + ",";
                sql = sql + "(" + orderID + "," + item.getProduct() +"," + item.getQuantity() + "," + item.getPrice() + ")";
                ile++;
            }
            sql = sql + ";";
            count = stmt.executeUpdate(sql);
            System.out.println(count + " items inserted");
            // czyszczenie koszyka
            koszyk = new ArrayList<>();
            session.setAttribute("shoppingCart", koszyk);
            session.setAttribute("shoppingCartSize", 0);
            // usunięcie ciasteczka (login)
            Cookie[] ciastka = request.getCookies();
            for(Cookie cookie : ciastka) {
                if (cookie.getName().equals(login)) {
                    Gson json = new GsonBuilder().create();
                    String ciastko = json.toJson(koszyk);
                    ciastko = ciastko.replace("\"", "^%");
                    ciastko = ciastko.replace(",",  "!%");
                    System.out.println(ciastko);
                    cookie = new Cookie(login, ciastko);
                    response.addCookie(cookie);
                }
            }
            // redirect
            response.sendRedirect("products.jsp");
        }
        catch(ClassNotFoundException cnfe) {
            System.out.println("!!!" + cnfe.getMessage());
        }
        catch(SQLException se) {
            System.out.println("@@@"  +se.getMessage());
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
