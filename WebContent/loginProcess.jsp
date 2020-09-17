<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
 String storedMID = application.getInitParameter("MasterID");
 String storedMPW = application.getInitParameter("MasterPassword");
 String storedID = null;
 String storedPW = null;
 String corID = null;
 String corPW = null;
 String id = request.getParameter("id");
 String pw = request.getParameter("password");
 int i=0;


 Connection conn = null;		
	Statement stmt  = null;
	
	String url = "jdbc:mysql://203.252.195.138:3306/sissdb?useSSL=false";        
	String dbuser = "siss";                                       
	String dbpass = "siss404b";
	String strSQL= null;
	ResultSet rs;
	
try{
		Class.forName("com.mysql.jdbc.Driver");            
		conn=DriverManager.getConnection(url,dbuser,dbpass);

		// Statement 생성
		stmt = conn.createStatement();
		
		
		strSQL = "SELECT * FROM member";
		rs = stmt.executeQuery(strSQL);
		
		for(i=1; rs.next();i++){
			storedID = rs.getString("id");
			storedPW = rs.getString("password");
			
			
			
			if(id.equals(storedID)){
				corID = rs.getString("id"); //아이디만 일치할 경우 아이디 따로 저장
			}
			else if(pw.equals(storedPW)){
				corPW = rs.getString("password"); //패스워드만 일치할 경우의 패스워드 따로 저장
			}
			
			
			if (id.equals(storedID)&&pw.equals(storedPW)){
			    session.setAttribute("ID", id);
			    response.sendRedirect("mainsection.jsp");
			    }
			
			
		}
		
		
		
		
		rs.close();
		stmt.close();
}catch(SQLException ex){
	%>
	<TR>
	   <TD colspan="4"> 에러: <%=ex %> </TD>
	</TR>
	<%
	   }

 
 if (id.equals(storedMID) && pw.equals(storedMPW)) { // 아이디와 패스워드 모두 일치
    session.setAttribute("MasterLoginID", id); // 로그인 성공을 나타내는 특정속성 설정
    response.sendRedirect("mainsection.jsp");
 }
 
 
 else if (id.equals(storedMID)||id.equals(corID)) { // 아이디 일치 & 패스워드 불일치
%>
<script>
alert("패스워드가 다릅니다.");
history.go(-1);
</script>
<%
 } else { // 아이디 불일치
%>
<script>
alert("로그인 ID가 다릅니다.");
history.go(-1);
</script>
<%
 }
%>