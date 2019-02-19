<%@ page import="com.yujin99.net.wifi.serial.Wifi232" %>
<%@ page import="java.util.Arrays" %><%--
  Created by IntelliJ IDEA.
  User: lucloner
  Date: 19-2-19
  Time: 下午1:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Lu's 简易灯控</title>
  </head>
  <body>
    <%
      if(request.getParameter("cmd")!=null){
        String c=request.getParameter("cmd");
        StringBuffer sb=new StringBuffer();
        sb.append("已经执行命令:");
        sb.append(c);
        sb.append("<BR />其他信息:[");
        try{
          sb.append(new Wifi232().sendCmd(request.getParameter("cmd")));
//          sb.append((new com.yujin99.net.wifi.serial.Wifi232()).testTouch(request.getParameter("cmd")));
        }
        catch (Exception e){
          sb.append(e.getLocalizedMessage());
          sb.append("&nbsp;");
          sb.append(Arrays.toString(e.getStackTrace()));
        }
        sb.append("]<BR /><BR />");
        out.println(sb);
      }
    %>
    <a href="index.jsp?cmd=DLR11111111ZDRR11111111Z">
      <button>开灯</button>
    </a>
    &nbsp;
    <a href="index.jsp?cmd=DLR00000000ZDRR00000000Z">
      <button>关灯</button>
    </a>
  </body>
</html>
