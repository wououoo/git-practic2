<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	System.out.println("session-name: " + session.getAttribute("name"));
    %>
    
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/style.css">
     <script defer src="./js/jquery-3.7.1.min.js"></script>
    <title>공지사항 쓰기</title>
</head>
<body>
    <div class="card">
        <div class="card-header1">
            <h1><a href="./adminNoticeList.jsp">스타벅스 공지사항 글 등록</a></h1>
        </div>
        <form action="./adminNoticeInsert.jsp" method="post" id="form1" onSubmit = "return false" enctype = "multipart/form-data">
	        <div class="card-write">
	            <div class="myinfo">
	                이름<input type="text" name="korname" placeholder="이름을 입력하세요." id = "korname">
	       
	            </div>
	            <div class="title-w">
	                제목<input type="text" name="title" placeholder="제목을 입력하세요." id = "title">
	            </div>
	            <div class="msg">
	                내용<textarea placeholder="내용을 입력하세요." name="content" id = "content"></textarea>
	                <div><div>1. <input type="file" name="filecontent1" id="filecontent1"></div></div>
	                <div><div>2. <input type="file" name="filecontent2" id="filecontent2"></div></div>
	            </div>
	        </div>
	        <div class="btn-w">
	        	<input type="submit" value="작성" class="input-btn-w" onClick="javascript: prevCheckTextBox()"/>
        	</div>
        </form>
    </div>
    <script>
    	function prevCheckTextBox() {
    		// 실제 FORM의 action의 값으로 전송
     		if(!$('#korname').val()){
					alert('이름을 입력하세요.'); // 이름 입력하라고 팝업 뜸
					$('#korname').focus();
					return;
    		} 
    		
     		else if(!$('#title').val()){
				alert('제목을 입력하세요.'); // 이름 입력하라고 팝업 뜸
				$('#title').focus();
				return;
				} 

    	
     		else if(!$('#content').val()){
				alert('내용을 입력하세요.'); // 이름 입력하라고 팝업 뜸
				$('#content').focus();
				return;
    		}
			
     		else if($('#korname').val().length>5){
				alert('5글자 이하로 입력해주세요'); // 이름 입력하라고 팝업 뜸
				$('#korname').focus();
				return;
     		}
     		
     		document.getElementById('form1').submit();

    	}
    	

    </script>
    
</body>
</html>