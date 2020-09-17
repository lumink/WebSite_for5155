<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy, java.io.File" %>
<html>
<body>
<%
String savePath=application.getRealPath("/");
int sizeLimit = 5 * 1024 * 1024 ;
MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
File file = multi.getFile("upfile");
String fileName=file.getName();
String textArea=multi.getParameter("content");
%>
<p style="text-align:center;">게시글 등록 완료</p>
<hr/>
<table>
<tr><td bgcolor="gray"><p style="text-align:center;">제목</td>
<td><input type="text" size="60" name="type" value=<%=multi.getParameter("type") %> disabled></td></tr>

<tr><td bgcolor="gray" rowspan="2"><p style="text-align:center;">
사진</td>
<td><img src="./<%=fileName %>" width=400/></td></tr>
<tr>
	<td><%=savePath %></td>
</tr>
</table>
<hr/>
<table>
<tr>
<td bgcolor="gray"><p style="text-align:center;">내용</td>
<td><textarea name="content" rows="30" cols="100" style="overflow: scroll;" disabled><%=textArea %>
</textarea></td>
</tr>
</table>
<hr/>

</body>
</html>
