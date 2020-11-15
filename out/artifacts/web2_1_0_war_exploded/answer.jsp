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
  <p class="head"> 2 дуры, группа Р3231, вариант 2721 </p>
</head>
<body>
<link rel="stylesheet" href = "css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<table width="1000">
  <tr>
    <td width="200" rowspan="0">
      <svg width="310" height="310">
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
				L 155 155 Z" fill="DeepPink" opacity="0.5"></path>

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
</html>