package com.shilko.ru.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/index.html")
public class ControllerServlet extends HttpServlet { //TODO click y, button submit

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String x = request.getParameter("param-x");
        String y = request.getParameter("param-y");
        String r = request.getParameter("param-r");
        if (x == null || y == null || r == null) {
            request.getRequestDispatcher("/WEB-INF/input.jsp").forward(request, response);
            return;
        }
        if (request.getSession().getAttribute("results") == null)
            request.getSession().setAttribute("results", new Results());
        request.getRequestDispatcher("/WEB-INF/check").forward(request,response);
    }
}
