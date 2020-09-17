<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>검색 완료</title>
<style>
*{margin: 0; padding: 0;}
 li {list-style: none;}
 a {text-decoration: none;}
 img {border: 0;}
 
	 #footer {
        margin: 0 auto;

        height: 90px;
        position: relative;
        background-color: lightgray;
        color: black;
       }
       
        #footer > #footer_list {
        position: absolute;
        left:140px; bottom:20px;
    }
    
    /*메뉴*/
    #footer_list > ul{overflow: hidden;}
    #footer_list > ul > li {float: right;}
    #footer_list > ul > li > a {
        display: block;
        background: lightgray;
        color: gray;
        padding: 2px 60px;
        border: 1px solid lightgray;
    }
</style>
</head>
<body>
<div>
	<jsp:include page="mainbar.jsp" flush="false" />
	<div>
<%request.setCharacterEncoding("utf-8"); %>
	<center>
		<h1>SEARCH</h1>
		<h3>SEARCH RESULT</h3>
	<form>
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr height="5"><td width="5"></td></tr>
		
		<tr style="background:url('table_mid.gif') repeat-x; text-align:center;">
        <td width="5"><img src="table_left.gif" width="5" height="30" /></td>
   		<td width="73">번호</td>
   		<td width="379">제목</td>
 		<td width="73">작성자</td>
   		<td width="164">작성일</td>
  		<td width="58">조회수</td>
        <td width="7"><img src="table_right.gif" width="5" height="30" /></td>
        </tr>
	
	<%
		Connection conn = null;                     
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		try{
			String url = "jdbc:mysql://203.252.195.138:3306/sissdb?useSSL=false";        
			String dbuser = "siss";                                       
			String dbpass = "siss404b";                         
		Class.forName("com.mysql.jdbc.Driver");            
			conn=DriverManager.getConnection(url,dbuser,dbpass);  
			request.setCharacterEncoding("utf-8");
			String search = request.getParameter("search");
			String search_value = request.getParameter("search_value");
			request.setCharacterEncoding("utf-8");
			
			if (search_value.equals("search_title")){
				String sql = "select * from board1 where TITLE like '%"+ search +"%'"; 
				pstmt = conn.prepareStatement(sql);                
				rs = pstmt.executeQuery();
			}
			
			else if (search_value.equals("search_content")){
				String sql = "select * from board1 where MEMO like '%"+ search +"%'"; 
				pstmt = conn.prepareStatement(sql);                
				rs = pstmt.executeQuery();
			} 
			
			else {
				String sql = "select * from board1 where USERNAME like '%"+ search +"%'"; 
				pstmt = conn.prepareStatement(sql);                
				rs = pstmt.executeQuery();
			}
%>
			<center><h3>'<%=search%>'에 대한 검색결과</h3><br></center>
			<%
			while(rs.next()){
				int idx = rs.getInt("NUM");
				String title = rs.getString("TITLE");
				String name = rs.getString("USERNAME");
				String date = rs.getString("TIME");
				String hit = rs.getString("HIT");
	%>
			<tr>
				<td width="5"></td>
			    <td align="center" bgcolor="white" width="75px"><%=idx%></td>
				<td align="center" bgcolor="white" width="379px"><a href="test_view.jsp?idx=<%=idx%>"><%=title%></td>
				<td align="center" bgcolor="white" width="73px"><%=name%></td>
				<td align="center" bgcolor="white" width="164px"><%=date%></td>
				<td align="center" bgcolor="white" width="65px"><%=hit%></td>
			</tr>
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
	</table>
	<input type="button" value="목록" OnClick="window.location='test_list.jsp'">
		</form>
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