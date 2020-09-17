<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
	<title>사진 등록</title>
<script>
	function picture_submit() {
		var fr = document.getElementById("picture");
		
		if (fr.type.value.length<1){
			alert("제목을 입력하세요");
			fr.type.focus();
			return false;
		}
		
		if (fr.upfile.value.length<1){
			alert("사진을 추가하세요");
			return false;
		}

		else 
			fr.submit();
	}
</script>

	<style>
	
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
	</style>

</head>
<body>


	<div>
	<jsp:include page="mainbar.jsp" flush="false" />
	</div>
	
	
<center id ="section">
	<h3>사진 등록</h3>
	<br>
	<hr />
	<br>

	
	<form id="insertTable" action="picture_register.jsp" enctype="multipart/form-data" method="post" onsubmit="return picture_submit()">
<table>
	<tr>
		<td bgcolor="gray"><p style="text-align:center;">제목 :</td>
		<td><input type = "text" name="type" size="60"></td>
	</tr>
	<tr>
		<td bgcolor="gray"><p style="text-align:center;">사진등록 :</td>
		<td><input type="file" name="upfile" size=60></td>
	</tr>
	
	
</table>
<hr>

<hr>
<table>
	<tr>
		<td><input type="reset" value="다시 작성" style="text-align: center;"></td>
		<td><input type="submit" value="등록" style="text-align: center;" ></td>
	</tr>
</table>

</form>
	
	
	<br><br><br>
	</center>
	
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