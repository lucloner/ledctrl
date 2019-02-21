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
      <style type="text/css">
          .bigbutton {
              border: 1px solid black;
              padding: 3em 4em;
              text-align: center;
              font-size: 1em;
          }

          body {
              font-size: 2em;
          }
      </style>
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
        <button class="bigbutton">全开</button>
    </a>
    &nbsp;
    <a href="index.jsp?cmd=DLR00000000ZDRR00000000Z">
        <button class="bigbutton">全关</button>
    </a>
    <BR/>
    <div>
        单个开启<BR/>
        <input type="checkbox" id="led1" value="1024"><label for="led1">左右上1</label><BR/>
        <input type="checkbox" id="led2" value="32"><label for="led2">左下1</label> &#9;
        <input type="checkbox" id="led3" value="4096"><label for="led3">右下1</label><BR/>
        <input type="checkbox" id="led4" value="512"><label for="led4">左右上2</label><BR/>
        <input type="checkbox" id="led5" value="128"><label for="led5">左下2</label> &#9;
        <input type="checkbox" id="led6" value="8192"><label for="led6">右下2 </label> &#9;蓝<BR/>
        <input type="checkbox" id="led7" value="2"><label for="led7">左下3</label> &#9;
        <input type="checkbox" id="led8" value="32768"><label for="led8">右下3 </label><BR/>
        <input type="checkbox" id="led9" value="1"><label for="led9">左下4</label> &#9;
        <input type="checkbox" id="led10" value="4"><label for="led10">右下4 </label> &#9;蓝<BR/>
        <input type="checkbox" id="led11" value="64"><label for="led11">左下5</label> &#9;
        <input type="checkbox" id="led12" value="8"><label for="led12">右下5 </label><BR/>
        <input type="checkbox" id="led13" value="16"><label for="led13">左下6</label> &#9;
        <input type="checkbox" id="led14" value="16384"><label for="led14">右下6</label><BR/>

        <script language="javascript" type="text/javascript">
            function doled() {
                var value = 65536;
                for (i = 1; i < 15; i++) {
                    var c = document.getElementById("led" + i);
                    if (c.checked) {
                        value += parseInt(c.value);
                    }
                }
                // alert(value.toString(2));
                var cmdstr = value.toString(2);
                cmdstr = cmdstr.substr(1);
                window.location.href = "index.jsp?cmd=DLR" + cmdstr.substr(0, 8) + "ZDRR" + cmdstr.substr(8) + "Z";
            }
        </script>

        <button class="bigbutton" onclick=doled()>开</button>
    </div>
    <BR/>
  </body>
</html>
