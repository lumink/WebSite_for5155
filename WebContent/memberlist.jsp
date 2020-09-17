<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
  // 세션의 masterLoginID 속성 읽어옴
String masterID = (String)session.getAttribute("MasterLoginID");  
if (masterID != null) {   // 세션 정보가 유지되고 있다면 

   // paginator
   String pageNum = request.getParameter("pageNum");
   if(pageNum == null){
      pageNum = "1";
   }

   int listSize = 10;
   int currentPage = Integer.parseInt(pageNum);
   int nextPage = currentPage + 1;
   int startRow = (currentPage - 1) * listSize + 1;
   int endRow = currentPage * listSize;
   int lastRow = 0;
   int i = 0;
   int num[] = {0};
   int row = startRow;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE> 회원관리 </TITLE>
<STYLE>

	#footer_list > ul{overflow: hidden;}
    #footer_list > ul > li {float: left;}
    #footer_list > ul > li > a {
        display: block;
        background: lightgray;
        color: gray;
        padding: 2px 60px;
        border: 1px solid lightgray;
    }	
    
    #section {
        width: 1100px;
        float: center;
    }
    
    a {text-decoration : none; color:gray;}
    
    .table{
    	left:100px;
        display: block;
        padding: 10px 15px;
        background: white;
        border-bottom: 1px solid gray;
        border-top: 1px solid gray;
        color : black;
        line-height:200%;
        word-sapcing:150%;
        cell-spacing:150%;
        letter-spacing:180%;
    }
    
</STYLE>
</HEAD>
<BODY>

	<div>
	<jsp:include page="mainbar.jsp" flush="false" />
	</div>
	
	<center id = section>
	<H1>회원 관리 화면</H1>
	<br>
	<br>
	<a href=signup.jsp>회원추가 </a>&nbsp&nbsp<a href=logout.jsp>관리자로그아웃 </a>&nbsp<a href=mainsection.jsp>메인페이지</a>
	<br>
	<br>
	<TABLE class=table >
	<TR>
   	<TD> 아이디 </TD>
   	<TD> 이름 </TD>
   	<TD> 이메일 </TD>
   	<TD> 학번 </TD>
   	<TD> 생년월일 </TD>
   	<TD> 전화번호 </TD>
   	<TD> 관심분야 </TD>
   	<TD> 가입날짜 </TD>
   	<TD> 관리 </TD>   
	</TR>
	</center>
	
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
      String strSQL = "SELECT count(*) FROM member";
      ResultSet rs = stmt.executeQuery(strSQL);
      if(rs.next())
         lastRow = rs.getInt(1);
      rs.close();
      
      // ResultSet에 레코드가 존재할 때
      if(lastRow > 0) {
            strSQL = "SELECT * FROM member";
            rs = stmt.executeQuery(strSQL);            
            for(i=1;rs.next(); i++){
               if(i >= startRow && i <=endRow){
%>
               <TR>
                  <TD><%=rs.getString("id") %></TD>
                  <TD><%=rs.getString("name") %></TD>
                  <TD><%=rs.getString("email") %></TD>
                  <TD><%=rs.getString("studentID") %></TD>
                  <TD><%=rs.getString("birth") %></TD>
                  <TD><%=rs.getString("tel") %></TD>
                  <TD><%=rs.getString("favorite") %></TD>
                  <TD><%=rs.getDate("registerDate") %></TD>
                  
                  <TD><a href=updateForm.jsp?id=<%=rs.getString("id")%>>수정</a> 
                  <a href=memberDelete.jsp?id=<%=rs.getString("id")%>>삭제</a></TD>
               </TR>
               
               
<%                  row++;
               }
            }
            rs.close();
//         }
         // 사용한 Statement 종료
         stmt.close();
         // 커넥션 종료
         //conn.close();
      }
      else
      {
%>
<TR>
   <TD colspan="4"> 레코드 없음 </TD>
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
         <a href="memberlist.jsp?pageNum=<%=currentPage-1%>">[◀]</a>
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
            <a href="memberlist.jsp?pageNum=<%=setPage%>">[<%=setPage%>]</a>
            <%
            }
         setPage = setPage + 1;
         }
   
      // 현재 쪽번호에 따라 다음 쪽의 번호를 파라메터로 넘겨준다.
      if(lastPage > currentPage) {
%>
      <a href="memberlist.jsp?pageNum=<%=currentPage+1%>">[▶]</a>
<%
      }
   }
}
else{
   %>
   권한이 없습니다. <br/>
   <%}%>
	
	<br><br><br>
	<footer id="footer">
        <nav id="footer_list">
            <ul>
                <li><font size="2" color="gray">
                Copyright (c) SISS-Corporation. All Rights Reserved.</font></li>	
            </ul>
        </nav>
    </footer>

</BODY>
</HTML>