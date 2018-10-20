<%@ page import="com.shilko.ru.servlet.Results" %>
<%@ page import="com.shilko.ru.servlet.ResultRow" %>
<%@ page import="java.util.List" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="results" class="com.shilko.ru.servlet.Results" scope="session">
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
    <title>Лаба 2</title>
    <script type="text/javascript" language="text/javascript" src="../sort_table.js"></script>
    <script type="text/javascript" language="text/javascript" src="../jquery-3.3.1.js"></script>
    <script type="text/javascript" language="text/javascript" src="../script.js?v=1.1.6"></script>
    <style>
        /**
            General colors
        COLOR1 = #FFAE00
        COLOR2 = #03899C
        COLOR3 = #FF1300
        BACKGROUND = #5FC0CE9

         */
        body {
            background: #5FC0CE; /* #69eafc*/
        }

        header {
            color: #FFAE00;
            text-shadow: 1px 1px 2px #FF1300;
            font-size: medium;
        }

        header > table {
            background-color: #03899C;
            width: 100%;
            line-height: 0;
            min-width: 450px;
        }

        table.rounded-corners {
            border-radius: 50px;
            border: 3px solid #03799D; /*background-color - #FFF*/
        }

        header > table td {
            text-align: center;
        }

        .left-header {
            text-align: left;
            padding-left: 2%;
        }

        .right-header {
            text-align: right;
            padding-right: 2%;
        }

        header h3 {
            font-style: italic;
        }

        article table {
            width: 100%;
            text-align: center;
            /*line-height: 0;*/
        }

        article td {
            empty-cells: show;
        }

        article span.param {
            font-style: italic;
            font-weight: bold;
        }

        article span.check-text {
            color: #925c00;
            font-weight: bold;
        }

        article .param-button {
            width: 95%;
            height: 100%;
            padding: 5% 0 5% 0;
            cursor: pointer;
        }

        article .param-button:disabled {
            background-color: #03899C;
            color: #FFAE00;
            border-radius: 10px;
            border: 2px solid #03799D;
        }

        article [name*='param-y'] {
            min-width: 160px;
        }

        article [name*='param-r'] {
            min-width: 160px;
        }

        [name='param-x'] {
            padding: 0 20% 0 20%;
        }

        #canvas:hover {
            transform: scale(1.3);
            cursor: pointer;
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
            text-shadow: 1px 1px 2px #FF1300;
            color: #FFAE00;
            font-size: medium;
            cursor: pointer;
        }

        canvas#canvas {
            display: block;
            margin: 0 auto;
            transition: transform ease-in-out 1s;
        }

    </style>
</head>
<body>
<header>
    <table class="rounded-corners">
        <tr>
            <td colspan="2"><h1>Лабораторная работа №2</h1></td>
        </tr>
        <tr>
            <td colspan="2"><h2>Подготовил Шилко Даниил Сергеевич</h2></td>
        </tr>
        <tr>
            <td><h3 class="right-header">Группа: Р3201</h3></td>
            <td><h3 class="left-header">Вариант: 18125</h3></td>
        </tr>
    </table>
</header>
<article>
    <br>
    <table>
        <tr>
            <td colspan="2">
                <div id="description">Эта страница предназначена для проверки
                    вхождения точки с координатами <span class="param">X</span>
                    и <span class="param">Y</span> в область,
                    отмеченную на графике синим цветом. Для начала работы
                    выберите нужные значения <span class="param">X</span>, <span class="param">Y</span>,
                    параметра <span class="param">R</span>
                    и нажмите на <span class="check-text">График</span>.
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <form id="form" action="/index.html" method="GET">
                    <input type="hidden" name="param-x" value="-3">
                    <fieldset>
                        <legend style="text-align: left;"><span class="check-text">Данные для проверки</span></legend>
                        <table rules="groups">
                            <colgroup>
                                <col>
                                <col>
                                <col>
                            </colgroup>
                            <colgroup>
                                <col>
                            </colgroup>
                            <thead>
                            <tr>
                                <th colspan="5"></th>
                            </tr>
                            </thead>
                            <tbody onclick="clickTable(event);">
                            <tr>
                                <td colspan="3" style="width: 35%">
                                    Координата <span class="param">X</span>
                                </td>
                                <td>
                                    Координата <span class="param">Y</span>
                                </td>
                                <td>
                                    Параметр <span class="param">R</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <button type="button" class="param-button" disabled>-3</button>
                                </td>
                                <td>
                                    <button type="button" class="param-button">-2</button>
                                </td>
                                <td>
                                    <button type="button" class="param-button">-1</button>
                                </td>
                                <td>
                                    <input type="text" name="param-y" title="Целое или дробное число"
                                           placeholder="Введите число от -5 до 3" onkeyup="return check(this);"
                                           onchange="return check(this);"
                                           maxlength="16">
                                </td>
                                <td>
                                    <input type="text" name="param-r" title="Целое или дробное число"
                                           placeholder="Введите число от 1 до 4" onkeyup="return check(this);"
                                           onchange="return check(this);"
                                           maxlength="16">
                                </td>
                            </tr>
                            <tr>
                                <td rowspan="2">
                                    <button type="button" class="param-button">0</button>
                                </td>
                                <td rowspan="2">
                                    <button type="button" class="param-button">1</button>
                                </td>
                                <td rowspan="2">
                                    <button type="button" class="param-button">2</button>
                                </td>
                                <td class="error-y"></td>
                                <td class="error-r"></td>
                            </tr>
                            <tr>
                                <td class="error-y"></td>
                                <td class="error-r"></td>
                            </tr>
                            <tr>
                                <td rowspan="2">
                                    <button type="button" class="param-button">3</button>
                                </td>
                                <td rowspan="2">
                                    <button type="button" class="param-button">4</button>
                                </td>
                                <td rowspan="2">
                                    <button type="button" class="param-button">5</button>
                                </td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                            </tr>
                            </tbody>
                        </table>
                    </fieldset>
                </form>
            </td>
        </tr>
    </table>
    <p align="center"><span class="check-text">График области:</span></p>
    <canvas id="canvas" onclick="formSubmit();" title="График области" width="360px" height="360px"></canvas>
    <br>
    <table class="article-table" rules="all" id="result-table">
        <colgroup style="background-color: #21cfda">
            <col>
            <col>
            <col>
        </colgroup>
        <colgroup style="background-color: #51c7da">
            <col>
        </colgroup>
        <thead onclick="sort(event);">
        <tr>
            <th>X <span class="sort-symbol">⮃</span></th>
            <th>Y <span class="sort-symbol">⮃</span></th>
            <th>R <span class="sort-symbol">⮃</span></th>
            <th data-type="reverse">Попадание <span class="sort-symbol">⮃</span></th>
        </tr>
        </thead>
        <tbody>
        <%
            Object obj = request.getSession().getAttribute("results");
            if (!(obj == null)) {
                List<ResultRow> result = ((Results) obj).getResults();
                for (int i = 0; i < result.size(); ++i) {
                    ResultRow resultRow = result.get(i);
                    out.println("<tr>");
                    out.println("<td>" + resultRow.getX() + "</td>");
                    out.println("<td>" + resultRow.getY() + "</td>");
                    out.println("<td>" + resultRow.getR() + "</td>");
                    if (resultRow.getMatch())
                        out.println("<td><span id=\"yes\">да</span></td>");
                    else
                        out.println("<td><span id=\"no\">нет</span></td>");
                    out.println("</tr>");
                }
                if (result.size() == 0)
                    out.println("<div align=\"center\">Здесь будут храниться данные о предыдущих точках<div>");
            }
        %>
        </tbody>
    </table>
</article>
</body>
</html>