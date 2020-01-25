package model;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/deleteItem")
public class deleteItem extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String productID = request.getParameter("productID");

        ArrayList<Item> shoppingCart = (ArrayList<Item>) request.getSession().getAttribute("shoppingCart");

        for (int i = 0; i < shoppingCart.size(); i++) {
            if (productID.equals(shoppingCart.get(i).getProduct())) {
                shoppingCart.remove(i);
            }
        }

        request.getSession().setAttribute("shoppingCartSize", shoppingCart.size());

        Cookie[] cookies = request.getCookies();

        String user = (String) request.getSession().getAttribute("user");

        for (Cookie cookie : cookies) {
            if (cookie.getName().equals(user)) {
                request.getSession().setAttribute("shoppingCartSize", shoppingCart.size());
                request.getSession().setAttribute("shoppingCart", shoppingCart);
                Gson json = new GsonBuilder().create();
                String ciastko = json.toJson(shoppingCart);
                ciastko = ciastko.replace("\"", "^%");
                ciastko = ciastko.replace(",", "!%");
                Cookie newCookie = new Cookie(user, ciastko);
                response.addCookie(newCookie);
            }
        }
        response.sendRedirect("showShoppingCart.jsp");
    }
}