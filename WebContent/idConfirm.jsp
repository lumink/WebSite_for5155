<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import = "java.io.*" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>id 중복체크</title>
</head>
<script>
function inputClose(){
        
    self.close();
 }

</script>

<body>
<%
 request.setCharacterEncoding("utf-8");
 Connection conn = null;
 Statement stmt = null;
 PreparedStatement pstmt = null;
 ResultSet rs = null;
 try
 {
	 	String url = "jdbc:mysql://203.252.195.138:3306/sissdb?useSSL=false";        
		String dbuser = "siss";                                       
		String dbpass = "siss404b";   
		
		Class.forName("com.mysql.jdbc.Driver");                  
		conn=DriverManager.getConnection(url,dbuser,dbpass); 

	   String id = request.getParameter("id");
		String storedid="";
		pstmt = conn.prepareStatement("select * from member where id=?");
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			storedid=rs.getString("id");
			if(id.equals(storedid))
      		{
%>		
				<center>
				<br><br><br>
				사용할 수 없는 아이디입니다.
				<br><br><br><br>
				<input type="hidden" value="1" id="child">
				<input type="button" value="닫기" onclick="inputClose()"/>
				</center>
   				 <script language="javascript">
					history.go(-1);
    			</script>
<%
   			}
  		}
   		else
   		{
%>			
			<center>
				<br><br><br>
				사용 가능한 아이디입니다.
				<br><br><br><br>
				<input type="hidden" value="2" id="child2">
				<input type="button" value="닫기" onclick="inputClose()"/>
			</center>
			<script language="javascript">
				history.go(-1);
			</script>
<%
   		}
}catch(Exception e){          
    e.printStackTrace();
    out.println("test 테이블 호출에 실패했습니다.");
 }finally{          
    if(rs != null) try{rs.close();}catch(SQLException sqle){}
    if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
    if(conn != null) try{conn.close();}catch(SQLException sqle){} 
 }
 %>
	
</body>
</html>