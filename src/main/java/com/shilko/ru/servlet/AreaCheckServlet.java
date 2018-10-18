package com.shilko.ru.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/WEB-INF/check")
public class AreaCheckServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String x = request.getParameter("param-x");
        String y = request.getParameter("param-y");
        String r = request.getParameter("param-r");
        x = x.replace(',','.');
        y = y.replace(',','.');
        r = r.replace(',','.');
        //проверка
        //добавление в массив бина
        //перенаправление в контроллер

    }
}
