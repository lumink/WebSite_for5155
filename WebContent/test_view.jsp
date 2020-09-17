<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date" %>
<%

Class.forName("com.mysql.jdbc.Driver"); 

String url = "jdbc:mysql://203.252.195.138:3306/sissdb?useSSL=false";        
String id = "siss";                                       
String pass = "siss404b";

	int idx = Integer.parseInt(request.getParameter("idx"));
	
	String loginid = null;
	String masterID = (String)session.getAttribute("MasterLoginID");
	if(masterID != null){
		 loginid = masterID;
	}
	else{
		 loginid = (String)session.getAttribute("ID");
	}
	
	try {
		
		Connection conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT USERNAME, TITLE, MEMO, TIME, HIT FROM board1 WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);
		 if(rs.next()){
				String name = rs.getString(1);
				String title = rs.getString(2);
				String memo = rs.getString(3);
				String time = rs.getString(4);
				int hit = rs.getInt(5);
				hit++;
				
				
			 	sql = "UPDATE board1 SET HIT=" + hit + " where NUM=" +idx;
			 	stmt.executeUpdate(sql);
		
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>게시판</title>
 </head>
<body>
<div>
	<jsp:include page="mainbar.jsp" flush="false" />
	<div>
<form method="post" action="test_comment.jsp?idx=<%=idx%>" >
<center>
<table>
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('table_mid.gif') repeat-x; text-align:center;">
      <td width="5"><img src="table_left.gif" width="5" height="30" /></td>
      <td>내 용</td>
      <td width="5"><img src="table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
    
   <table width="700">
     <tr>
      <td align="left" width="76">글번호</td>
      <td align="left" width="319"><%=idx%></td>
      <td width="0">&nbsp;</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td align="left" width="76">조회수</td>
      <td align="left" width="319"><%=hit%></td>
      <td width="0">&nbsp;</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td align="left" width="76">이름</td>
      <td align="left" width="319"><%=name%></td>
      <td width="0">&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td align="left" width="76">작성일</td>
      <td align="left" width="319"><%=time%></td>
      <td width="0">&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td align="left" width="76">제목</td>
      <td align="left" width="319"><%=title%></td>
      <td width="0">&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
                <tr>
                   <td width="600" colspan="2" height="200"><%=memo %>
                </tr>
         
<%}%>


<table width="700">
<tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
<tr height="1" bgcolor="#82B5DF"><td colspan="4" width="407"></td></tr>

        <tr>
             <td align="left" width="76">댓글</td>
             <td align="left"><textarea name="comment" rows=3 cols=100 placeholder="코멘트를 입력하세요."></textarea></td>
             <td><input type="submit" value="등록"  >
             </form>
         </tr></table>


			<hr width="700px" />
				
					<table width="700px">
					<tr><td colspan="2" align="left"><b> 댓 글 </b></td></tr>
						<tr>
							<TD align="center" bgcolor="#FF73B8" width="350px">ID</td>
							<TD align="center" bgcolor="#FF73B8" width="2400px">Comment</td>
							<TD align="center" bgcolor="#FF73B8" width="400px">Date</td>
							
						</tr>
					




<table width="700">
<%				
		String sql3 = "select * from comment where textnum =" + idx;
		stmt = conn.prepareStatement(sql3);
		rs = stmt.executeQuery(sql3);
		
		while(rs.next()){
			int num2 = rs.getInt("textnum");
			String name2 = rs.getString("name");
			String date2 = rs.getString("date");
			String content2 = rs.getString("content"); 
%>
						<tr>
							<TD align="center" bgcolor="white" width="50px"><b><%=name2%></b></td>
							<TD align="center" bgcolor="white" width="300px"><p><%=content2%></p></td>
							<TD align="center" bgcolor="white" width="60px"><%=date2%></td></tr>
							<tr>
							<td align="right" width="40px" colspan="3">
								<% if(name2.equals(loginid)) {%> 
								<input type="button" value="삭제"
								OnClick="window.location='test_comment_delete.jsp?textnum=<%=num2%>'">
								<%}%>
							</td>
						</tr>
						<%}%>
</table>
         <% 
         
 	rs.close();
 	stmt.close();
 	conn.close();
	 	
	}catch(SQLException e) {
}

%>
<table width="700">
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
     
     <tr align="center">
      <td width="0">&nbsp;</td>
      <td colspan="2" width="399"><input type=button value="글쓰기"  OnClick="window.location='test_write.jsp'">
	<input type=button value="답글" OnClick="window.location='test_reply.jsp?idx=<%=idx%>'">
	<input type=button value="목록" OnClick="window.location='test_list.jsp'">
	<input type=button value="수정" OnClick="window.location='test_modify.jsp?idx=<%=idx%>'">
	<input type=button value="삭제" OnClick="window.location='test_delete.jsp?idx=<%=idx%>'">
      <td width="0">&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
 </center>
 
 <br><br><br>
		 <footer id="footer">
        <nav id="footer_list">
            <ul>
                <li><font size="2" color="gray">
                Copyright (c) SISS-Corporation. All Rights Reserved.</font></li>	
                
            </ul>
        </nav>
    </footer>
</body>

 </html>