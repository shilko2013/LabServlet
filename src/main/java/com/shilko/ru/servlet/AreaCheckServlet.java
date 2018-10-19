package com.shilko.ru.servlet;

import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/WEB-INF/check")
public class AreaCheckServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ResultRow resultRow = new ResultRow();
        final String xString = request.getParameter("param-x");
        final String yString = request.getParameter("param-y");
        final String rString = request.getParameter("param-r");
        resultRow.setX(xString);
        resultRow.setY(yString);
        resultRow.setR(rString);
        try {
            String xStringTemp = xString.replace(',', '.');
            String yStringTemp = yString.replace(',', '.');
            String rStringTemp = rString.replace(',', '.');
            double x, y, r;
            x = Double.parseDouble(xStringTemp);
            y = Double.parseDouble(yStringTemp);
            r = Double.parseDouble(rStringTemp);
            resultRow.setMatch(x < 0 && x > -r / 2 && y > 0 && y < r
                    || x >= 0 && y > 0 && y < -x + r / 2
                    || x < 0 && y <= 0 && x * x + y * y < r * r / 4);
        } catch (Exception ignore) {
            resultRow.setMatch(null);
        }
        ((Results)request.getSession().getAttribute("results")).add(resultRow);
        request.getRequestDispatcher("/WEB-INF/result.jsp").forward(request, response);
    }
}
