<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<html>
<head><title>회원 정보 수정</title></head>
<body>
<div>
	<jsp:include page="mainbar.jsp" flush="false" />
	</div>
<%
   request.setCharacterEncoding("utf-8");

   Connection conn = null;
   Statement stmt  = null;
   PreparedStatement pstmt = null;
   String strSQL= null;
   ResultSet rs;

   String url = "jdbc:mysql://203.252.195.138:3306/sissdb?useSSL=false";        
   String dbuser = "siss";                                       
   String dbpass = "siss404b"; 
   
   String id = request.getParameter("id");
   String formName = request.getParameter("name");
   String formPass = request.getParameter("password");
   String formEmail = request.getParameter("email");
   String formStuid = request.getParameter("stuid");
   String formBirth= request.getParameter("birth");
   String formTel = request.getParameter("tel");
   
   String formFavorite=null;

	
	String[] chkbox = request.getParameterValues("interest");
	for( int i = 0; i < chkbox.length; i++ )
	{
		if(i == 0)
			formFavorite = chkbox[0];
		else
		formFavorite += ","+chkbox[i];
	}
   
   
   
   Date regDate = new Date();

   try{
      Class.forName("com.mysql.jdbc.Driver");            
      conn=DriverManager.getConnection(url,dbuser,dbpass);
      
       stmt = conn.createStatement();
       stmt.executeUpdate("UPDATE member SET name='"+formName+"',password='"+formPass+"',studentID='"+formStuid+"',birth='"+formBirth+"',tel='"+formTel+"',favorite='"+formFavorite+"',email='"+formEmail+"'WHERE id='"+id+"';");
   
      %>
   
   <center>
      회원 수정 처리 완료 <br/>
      <table width="400" border="1">
         <tr><td>ID</td><td><%=id%></td></tr>
         <tr><td>이름</td><td><%=formName %></td></tr>
         <tr><td>이메일</td><td><%=formEmail %></td></tr>
         <tr><td>수정일시</td><td><%=regDate %></td></tr>
         <tr><td>학번</td><td><%=formEmail %></td></tr>
         <tr><td>생년월일</td><td><%=formBirth %></td></tr>
         <tr><td>전화번호</td><td><%=formTel %></td></tr>
         <tr><td>관심분야</td><td><%=formFavorite %></td></tr>
         
         
      </table>
      <%
      String masterID = (String)session.getAttribute("MasterLoginID");  
      if(masterID != null){
         %><a href="memberlist.jsp">회원 목록 페이지</a><%
      }
      else{
         session.setAttribute("userID", id); 
         %><a href="member.jsp">회원 기본 페이지</a><%
      }      
   }catch(SQLException ex){
      out.println("에러: "+ex);      
   }finally{
      if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){} 
      if(conn != null) try{conn.close();}catch(SQLException sqle){}   
   }      
%>
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