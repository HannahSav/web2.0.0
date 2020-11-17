<%--
  Created by IntelliJ IDEA.
  User: Hannah
  Date: 13/11/2020
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;
	charset=utf-8">
  <link rel="stylesheet" href = "css/head.css">
  <title> кто прочитал, тот котик </title>
  <p class="head"> Салмова Анна, Савон Ганна, группа Р3231, вариант 2738 </p>
</head>
<body>
<link rel="stylesheet" href = "css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<table width="1000">
  <tr>
    <td>
      <table>
        <tr><td width="250" class="infotext">Введите координаты своего города, чтобы проверить является ли он свалкой Москвы.</td></tr>
        <td>
          <form id = "dataForm">
            <div class="container">
              <tr>
                <td>
                  <p class="infotext">X
                    <input type="text" id = "xId" class="x_in" name="koordx" size="15" maxlength="30" placeholder="от -3 до 3"/>
                  </p>
                  <p id = "xText"></p>
                  <br>
                </td>
              </tr>
              <tr>
                <td>
                  <p class="infotext">Y
                    <input type="text" id = "yId" class="y_in" name="koordy" size="15" maxlength="30" placeholder="от -3 до 3"/>
                  </p>
                  <p id = "yText"></p>
                  <br>
                </td>
              </tr>
              <tr>
                <td width="500">
                  <p class = "infotext"> Введите радиус глубины познания
                    <br />
                  <table onclick="forR()">
                    <tr>
                      <td><input type="radio" id = "rId1" name="radius" value="1" />1</td>
                      <td><input type="radio" id = "rId2" name="radius" value="2" />2</td>
                      <td><input type="radio" name="radius" id = "rId3" value="3" />3</td>
                      <td><input type="radio" name="radius" id = "rId4" value="4" />4</td>
                      <td><input type="radio" name="radius" id = "rId5" value="5" />5</td>
                    </tr>
                  </table>
                  </p>
                  <p id = "rText"></p>
                  <br>
                </td>
              </tr>
              <tr><td>
                <input type = "button" id="submit" class = "button" value="За Родину!!!" onclick="createRequest()" >
              </td>
              </tr>
            </div>
          </form>
        </td>
      </table>
    </td>
    <td width="200" rowspan="0">
      <svg width="310" height="310" class="graph">
        <rect id="rect" height="310" width="310" fill="#FFF0F0" opacity="0.9"></rect>
        <line stroke="#000000" x1="5" x2="305" y1="155" y2="155"></line>
        <line stroke="#000000" x1="155" x2="155" y1="5" y2="305"></line>
        <polygon points="155,5 163,15, 147 ,15" fill="#000000" ></polygon>
        <polygon points="305,155 295,163 295,147" fill="#000000" ></polygon>
        <text x="163" y="15" font-size="20" font-weight="700">Y</text>
        <text x="294" y="145" font-size="20" font-weight="700">X</text>

        <polygon points="155,155 205,155 155,105" fill="DeepPink" opacity="0.5"></polygon>
        <polygon points="55,155 155,155 155,55 55,55" fill="DeepPink" opacity="0.5"></polygon>
        <path d="M 105 155
				A 55 55, 0, 0, 0, 155 205
				L 155 155 Z" fill="DeepPink" opacity="0.5"/>

        <line stroke="#000000" x1="205" x2="205" y1="147" y2="163"></line>
        <line stroke="#000000" x1="255" x2="255" y1="147" y2="163"></line>
        <line stroke="#000000" x1="105" x2="105" y1="147" y2="163"></line>
        <line stroke="#000000" x1="55" x2="55" y1="147" y2="163"></line>

        <text x="200" y="145">R/2</text>
        <text x="250" y="145">R</text>
        <text x="95" y="145">-R/2</text>
        <text x="45" y="145">-R</text>

        <line stroke="#000000" x1="147" x2="163" y1="205" y2="205"></line>
        <line stroke="#000000" x1="147" x2="163" y1="255" y2="255"></line>
        <line stroke="#000000" x1="147" x2="163" y1="105" y2="105"></line>
        <line stroke="#000000" x1="147" x2="163" y1="55" y2="55"></line>

        <text x="165" y="110"> R/2</text>
        <text x="165" y="60"> R</text>
        <text x="165" y="210"> -R/2</text>
        <text x="165" y="260"> -R</text>

        <circle r="3" cx="155" cy="155" id="point" fill="black" ></circle>

        <%
          System.out.println("Enter parameter:\nX:"+request.getParameter("x")+"\nY:"+request.getParameter("y")+"\nR:"+request.getParameter("r"));
          ArrayList<String> points = (ArrayList<String>) request.getServletContext().getAttribute("points");
          if (points != null )
            for(String point: points)
              out.println(point);
        %>
      </svg>
    </td>
    <td>
      <div style="height:310px;overflow:auto;width: 300px">
        <table class = "resultTable" id = "resultTable">
          <tr>
            <th width="25"> X </th>
            <th width="25"> Y </th>
            <th width="25"> R </th>
            <th> Попал? </th>
            <th> Текущее время </th>
            <th> Время работы </th>
          </tr>
          <%
            ArrayList<String> rows = (ArrayList<String>) request.getServletContext().getAttribute("rows");
            if (rows != null )
              for(String row: rows)
                out.println(row);
          %>
        </table>
      </div>
    </td>
  </tr>
</table>
</body>
<script src ="script.js"></script>
<script src="map.js"></script>
</html>