<%@ page import="com.shilko.ru.servlet.ResultRow" %>
<%@ page import="com.shilko.ru.servlet.Results" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="results" class="com.shilko.ru.servlet.Results" scope="session">
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
    <title>Лаба 2</title>
    <meta charset="utf-8">
    <style>
        body {
            background: #5FC0CE;
        }

        header {
            font-size: medium;
            color: #FFAE00;
            text-shadow: 1px 1px 2px #FF1300;
        }

        header > table {
            background-color: #03899C;
            width: 100%;
            line-height: 0;
            min-width: 450px;
        }

        table.rounded-corners {
            border-radius: 50px;
            border: 3px solid #03799D;
        }

        header h1 {
            text-align: center
        }

        article div.error-div {
            text-align: center;
            color: #dd0c00;
            text-shadow: 1px 1px 2px #FFAE00;
            font-size: larger;
        }

        #back-page-button {
            height: 60px;
            width: 200px;
            border-radius: 15px;
            border: 3px solid #03799D;
            background-color: #03899C;
            text-shadow: 1px 1px 2px #FF1300;
            color: #FFAE00;
            padding: 0 2% 0 2%;
            outline: none;
            cursor: pointer;
        }

        #back-page-button:active {
            background-color: #5FC0CE;
        }

        article table {
            text-align: center;
            width: 100%;
        }

        table.article-table {
            border-collapse: collapse;
            border: 3px solid #03799D;
        }

        table.article-table td {
            border: 3px solid #03799D;
        }

        table.article-table th {
            border: 3px solid #03799D;
        }

        article span#yes {
            color: #009000;
            font-weight: bold;
        }

        article span#no {
            color: #aa2223;
            font-weight: bold;
        }

        span.sort-symbol {
            font-size: medium;
            cursor: pointer;
        }

    </style>
</head>
<body>
<header>
    <table class="rounded-corners">
        <tr>
            <td><h1>Результаты проверки</h1></td>
        </tr>
    </table>
</header>
<article>
    <br>
    <%
        Results resultsTemp = (Results) request.getSession().getAttribute("results");
        ResultRow lastRow = resultsTemp.getResults().get(resultsTemp.getResults().size() - 1);
        if (lastRow.getMatch() == null) {
            resultsTemp.getResults().remove(resultsTemp.getResults().size() - 1);
            String x = lastRow.getX() == null ? "Неизвестно" : lastRow.getX();
            String y = lastRow.getY() == null ? "Неизвестно" : lastRow.getY();
            String r = lastRow.getR() == null ? "Неизвестно" : lastRow.getR();
            out.println("    <table>\n" +
                    "        <tr>\n" +
                    "            <td>\n" +
                    "                <br>\n" +
                    "                <div class=\"error-div\">Введены неправильные данные!</div>\n" +
                    "                <br>\n" +
                    "            </td>\n" +
                    "        </tr>\n" +
                    "        <tr>\n" +
                    "            <td>\n" +
                    "                <div style=\"font-size: large\">\n" +
                    "X = " + x +
                    "                    <br>\n" +
                    "Y = " + y +
                    "                    <br>\n" +
                    "R = " + r +
                    "                </div>\n" +
                    "                <br>\n" +
                    "            </td>\n" +
                    "        </tr>\n" +
                    "    </table>");
        } else {
            String match = lastRow.getMatch() ? "<span id=\"yes\">да</span>" : "<span id=\"no\">нет</span>";
            out.println("<table class=\"article-table\" rules=\"all\">\n" +
                    "        <colgroup style=\"background-color: #21cfda\">\n" +
                    "            <col>\n" +
                    "            <col>\n" +
                    "            <col>\n" +
                    "        </colgroup>\n" +
                    "        <colgroup style=\"background-color: #51c7da\">\n" +
                    "            <col>\n" +
                    "        </colgroup>\n" +
                    "        <thead>\n" +
                    "        <tr>\n" +
                    "            <th>X</th>\n" +
                    "            <th>Y</th>\n" +
                    "            <th>R</th>\n" +
                    "            <th>Попадание</th>\n" +
                    "        </tr>\n" +
                    "        </thead>\n" +
                    "        <tr>\n" +
                    "            <td>" + lastRow.getX() + "</td>\n" +
                    "            <td>" + lastRow.getY() + "</td>\n" +
                    "            <td>" + lastRow.getR() + "</td>\n" +
                    "            <td>" + match + "</td>\n" +
                    "        </tr>\n" +
                    "\n" +
                    "    </table>");
        }
    %>
    <table>
        <tr>
            <td colspan="6">
                <form action="${pageContext.request.contextPath}/index.html">
                    <button id="back-page-button" type="submit">Вернуться на страницу ввода параметров</button>
                </form>
            </td>
        </tr>
    </table>
</article>
</body>
</html>
