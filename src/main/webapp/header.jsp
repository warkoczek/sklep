<div class="header">
      <%
            HttpSession sesja =request.getSession();
            Object user = sesja.getAttribute("user");
            Object rozmiarKoszyka = sesja.getAttribute("shoppingCartSize");
            int rozmiar = 0;
            if (rozmiarKoszyka != null)
               rozmiar = (Integer)rozmiarKoszyka;
            if (user == null)
                user ="";
            else
                user = "user: " + user;
            String napisKoszyka = "";
            if (rozmiar > 0)
                napisKoszyka = "shopping cart: " + rozmiar;
          Object visit = application.getAttribute("visitCount");
          if (visit == null)
              application.setAttribute("visitCount", 0);
          else {
              int x = (int)application.getAttribute("visitCount") + 1;
              application.setAttribute("visitCount", x);
          }
          Object yourVisit = session.getAttribute("visitCount");
          if (yourVisit == null)
              session.setAttribute("visitCount", 1);
          else {
              int x = (int)session.getAttribute("visitCount") + 1;
              session.setAttribute("visitCount", x);
          }
      %>
      <h3>Welcome in garden shop JSP&Servlets</h3>
      <div>
          <div style="float: left;width: 50%;">
            <%=user%><br/>
            <%= napisKoszyka%>
          </div>
          <div style="float: right; width: 20%;">
              <img src="https://www.agromart.pl/images/design/page/layout/i11_orig.png" width="64" height="64"/>
          </div>
      </div>
    <div style="clear: left; clear:right;"></div>
</div>