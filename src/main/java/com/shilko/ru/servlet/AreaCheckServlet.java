package com.shilko.ru.servlet;

import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class AreaCheckServlet extends HttpServlet {

    public String escapeHTML(String s) {
        StringBuilder out = new StringBuilder();
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c > 127 || c == '"' || c == '<' || c == '>' || c == '&') {
                out.append("&#");
                out.append((int) c);
                out.append(';');
            } else {
                out.append(c);
            }
        }
        return out.toString();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ResultRow resultRow = new ResultRow();
        final String xString = request.getParameter("param-x");
        final String yString = request.getParameter("param-y");
        final String rString = request.getParameter("param-r");
        resultRow.setX(escapeHTML(xString));
        resultRow.setY(escapeHTML(yString));
        resultRow.setR(escapeHTML(rString));
        try {
            String xStringTemp = xString.replace(',', '.');
            String yStringTemp = yString.replace(',', '.');
            String rStringTemp = rString.replace(',', '.');
            double x, y, r;
            x = Double.parseDouble(xStringTemp);
            y = Double.parseDouble(yStringTemp);
            r = Double.parseDouble(rStringTemp);
            if (x < -3 || x > 5 || y < -5 || y > 3 || r < 1 || r > 4)
                throw new IllegalArgumentException();
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
