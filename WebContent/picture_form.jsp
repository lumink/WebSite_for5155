<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>활동 사진</title>
<style>
   /* 콘텐츠 */
	#thumbnail_section {
        width: 1200px;
        float: center;
        left:100px;
        position : absloute;
    }
    
    #footer_list > ul{overflow: hidden;}
    #footer_list > ul > li {float: left;}
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
	<center>
	<form id="thumbnail_section">
		
		<H1>활동 사진</H1>
		<br />
		<br />
		<% String masterID = (String)session.getAttribute("MasterLoginID"); %>
				<% if(masterID != null){ %>
				<a href=picture_add.jsp>추가</a>
				<% } %>
		<br />
		<br />
		<%
   		// paginator
   		String pageNum = request.getParameter("pageNum");
   		if(pageNum == null){
     	 pageNum = "1";
   		}

   		int listSize = 3;
   		int currentPage = Integer.parseInt(pageNum);
   		int nextPage = currentPage + 1;
   		int startRow = (currentPage - 1) * listSize + 1;
   		int endRow = currentPage * 4;
   		int lastRow = 0;
   		int i = 0;
   		int num[] = {0};
   		int row = startRow;
   		int col = 1;
		%>
		
		<hr />
		<TABLE>
		<TR>
		<td width=300>제목</td>
		<td width=500>사진</td>
		<td width=200>작성일</td>
		<td width=50></td>
		</TR>
<%
   Connection conn = null;      
   Statement stmt  = null;
   
   String url = "jdbc:mysql://203.252.195.138:3306/sissdb?useSSL=false";        
   String dbuser = "siss";                                       
   String dbpass = "siss404b";
   
   try{
      Class.forName("com.mysql.jdbc.Driver");            
      conn=DriverManager.getConnection(url,dbuser,dbpass);

      // Statement 생성
      stmt = conn.createStatement();
      
      // ReseltSet의 레코드 수를 lastRow 변수에 저장
      String strSQL = "SELECT count(*) FROM thumbnail";
      ResultSet rs = stmt.executeQuery(strSQL);
      if(rs.next())
         lastRow = rs.getInt(1);
      rs.close();
      
      // ResultSet에 레코드가 존재할 때
      if(lastRow > 0) {
            strSQL = "SELECT * FROM thumbnail";
            rs = stmt.executeQuery(strSQL);            
            for(i=1;rs.next(); i++){
               if(i >= startRow && i <=endRow){
	  %>
               <TR>
                  <TD><%=rs.getString("title") %></TD>
                 
                  <td><a target="_blank" href="picture_plus.jsp?thumb=<%=rs.getString("thumb")%>" width="500" height="600">
                  <img src=<%=rs.getString("thumb") %> width="250" height=200/></a></TD>
                               
                  <TD><%=rs.getDate("date") %></TD>
                  
				  <% if(masterID != null){ %>
				  <td><a href=picture_delete.jsp?title=<%=rs.getString("title")%>>삭제</a></TD>
				  <% } %>
               </TR>
			  <% row++;
               }
            }
            rs.close();
         // 사용한 Statement 종료
        stmt.close();
         // 커넥션 종료
         //conn.close();
      }
      else
      {
%>
<TR>
   <TD colspan="4"> 사진 없음 </TD>
</TR>
<%
      }

   }catch(SQLException ex){ 
%>
<TR>
   <TD colspan="4"> 에러: <%=ex %> </TD>
</TR>
<%
   }
%>
</TABLE>
<%
   if(lastRow > 0) {
      // 페이지가 넘어갈 때 넘겨줄 파라미터
      int setPage = 1;
      
      // 마지막 페이지의 번호를 저장
      int lastPage = 0;
      if(lastRow % listSize == 0)
         lastPage = lastRow / listSize;
      else
         lastPage = lastRow / listSize + 1;
      
      
      // 현재 쪽번호에 따라 이전 쪽의 번호를 파라메터로 넘겨준다.
      if(currentPage > setPage) {
         %>
         <a href="picture_form.jsp?pageNum=<%=currentPage-1%>">[◀]</a>
   <%
         }
      
      
      // 레코드 수에 따라 쪽번호를 매긴다.   
      while(setPage <= lastPage) {
         
         if (setPage == currentPage) {
            %>
            [<%=setPage%>]
            <% 
            }
         else {
            %>
            <a href="picture_form.jsp?pageNum=<%=setPage%>">[<%=setPage%>]</a>
            <%
            }
         setPage = setPage + 1;
         }
   
      // 현재 쪽번호에 따라 다음 쪽의 번호를 파라메터로 넘겨준다.
      if(lastPage > currentPage) {
		%>
      <a href="picture_form.jsp?pageNum=<%=currentPage+1%>">[▶]</a>
		<%
       }
  	 }
	%>
	<br><br><hr><br><br><br><br>
	
	</form>
	
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