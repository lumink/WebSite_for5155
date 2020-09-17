<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
    
<%
//세션의 masterLoginID 또는 ID 속성 읽어옴
String masterID = (String)session.getAttribute("MasterLoginID");  
String UserID = (String)session.getAttribute("ID");

String title = request.getParameter("title");

Connection conn = null;		
Statement stmt  = null;
PreparedStatement pstmt = null;
	
String url = "jdbc:mysql://203.252.195.138:3306/sissdb?useSSL=false";        
String dbuser = "siss";                                       
String dbpass = "siss404b";
String strSQL= null;
ResultSet rs;
	
try {
	Class.forName("com.mysql.jdbc.Driver");            
	conn=DriverManager.getConnection(url,dbuser,dbpass);

		// Statement 생성
		stmt = conn.createStatement();
		
		
		strSQL = "SELECT * FROM thumbnail";
		rs = stmt.executeQuery(strSQL);


if (masterID != null) {	// 세션 정보가 유지되고 있다면 
	
	pstmt = conn.prepareStatement("delete from thumbnail where title=?");
	pstmt.setString(1, title);
	pstmt.executeUpdate();
	response.sendRedirect("picture_form.jsp");
}

rs.close();
stmt.close();
}

catch(SQLException ex){
%>
<TR>
<TD colspan="4"> 에러: <%=ex %> </TD>
</TR>
<%
}
%>

