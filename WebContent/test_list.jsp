<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.*,java.text.SimpleDateFormat,java.util.Date"%>
<%@ page import="java.util.Date" %>

<%
String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}

	int listSize = 10;
	int blockSize = 5;
	int currentPage = Integer.parseInt(pageNum);
	int nextPage = currentPage + 1;
	int startRow = (currentPage - 1) * listSize + 1;
	int endRow = currentPage * listSize;
	int lastRow = 0;
	int i = 0;
	int num[] = {0};
	int row = startRow;
	
	int startPage = ((Integer.parseInt(pageNum)-1)/blockSize * blockSize) +1;
	int endPage = ((Integer.parseInt(pageNum)-1)/blockSize * blockSize) +1;
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
 <%
 	Class.forName("com.mysql.jdbc.Driver"); 

 	String url = "jdbc:mysql://203.252.195.138:3306/sissdb?useSSL=false";        
 	String id = "siss";                                       
 	String pass = "siss404b";
	
	try {
		Connection conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();

		String strSQL = "SELECT COUNT(*) FROM board1";
		ResultSet rs2 = stmt.executeQuery(strSQL);
		
		if(rs2.next())
			lastRow = rs2.getInt(1);
		rs2.close();

		out.print("총 게시물 : " + lastRow + "개");
		
	//String sqlList = "SELECT NUM, USERNAME, TITLE, TIME, HIT from board1 order by NUM DESC";
		String sqlList = "SELECT NUM, USERNAME, TITLE, TIME, HIT, INDENT from board1 order by REF DESC, STEP ASC";
		ResultSet rs = stmt.executeQuery(sqlList);
		
%>
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
	if(lastRow==0) {
%>
		<tr align="center" bgcolor="#FFFFFF" height="30">
	 	<td colspan="6">등록된 글이 없습니다.</td>
	 	</tr>
<%
	} else {
	 		
	 		if(lastRow > 0) {
				//strSQL = "SELECT * FROM board1";
				//rs = stmt.executeQuery(strSQL);				
				for(i=1;rs.next(); i++) {
					
					if(i >= startRow && i <=endRow) {
						
						int idx = rs.getInt(1);
						String name = rs.getString(2);
						String title = rs.getString(3);
						String time = rs.getString(4);
						int hit = rs.getInt(5);
						int indent = rs.getInt(6); //
			
						//Date date = new Date();
						//SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd"); 
						//String year = (String)simpleDate.format(date);
						//String yea = time.substring(0,10);
			
			
						%>
						<tr height="25" align="center">
						<td>&nbsp;</td>
						<td><%=idx %></td>
						<td align="left">
						<% 
		
						for(int j=0;j<indent;j++) {
						%>		&nbsp;&nbsp;&nbsp;<%
						}
						if(indent!=0){
						%>		<img src='reply_icon.gif' />
						<%
						}
						%>
						<a href="test_view.jsp?idx=<%=idx%>"><%=title %></a>
						</td>
						<td align="center"><%=name %></td>
						<td align="center"><%=time %></td>
						<td align="center"><%=hit %></td>
						<td>&nbsp;</td>
						</tr>
  						<tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
						<% 

						row++;
						}
					}
				}
	 		}
	rs.close();
	stmt.close();
	conn.close();
	}
	
	catch(SQLException e) {
	out.println( e.toString() );
}
%>
 <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
 </table>
 
 
 
 
 
 
 
 		<form action="test_search.jsp">
		<table>
		<tr>
		<td align="center" width="700px">
		<input type="text" name="search" placeholder="검색할 내용"  >
		<select name=search_value>
			<option value="search_title"> 제목 </option>
			<option value="search_content"> 내용 </option>
			<option value="search_writer"> 작성자 </option>
		</select>
		<input type="submit" value="검색"></td>
		</tr>
		</table>
		</form>
		
 
 
 
 
 
 
 
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
			<a href="test_list.jsp?pageNum=1">[<<]</a>
			<a href="test_list.jsp?pageNum=<%=currentPage-1%>">[<]</a>
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
				<a href="test_list.jsp?pageNum=<%=setPage%>">[<%=setPage%>]</a>
				<%
				}
			setPage = setPage + 1;
			}
	
		// 현재 쪽번호에 따라 다음 쪽의 번호를 파라메터로 넘겨준다.
		if(lastPage > currentPage) {
%>
		<a href="test_list.jsp?pageNum=<%=currentPage+1%>">[>]</a>
		<a href="test_list.jsp?pageNum=<%=lastPage%>">[>>]</a>
<%
		}
	}
 %>
 
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr><td colspan="4" height="5"></td></tr>
  <tr align="center">
   <td><input type=button value="글쓰기" OnClick="window.location='test_write.jsp'"></td>
  </tr>
</table>

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