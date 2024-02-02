<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.lang.Exception" %>    
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%
	// 한글 처리
	request.setCharacterEncoding("UTF-8");
	
	String korname = "";
	String title = "";
	String content = "";
	String num = "";
	
	String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
  String USER = "jsp";
  String PASSWORD = "123456";
	
  Connection conn = null; //디비 접속 성공시 접속 정보 저장
	PreparedStatement pstmt = null; // 쿼리 실행문
	
	Exception exception = null;
	
	String savePath = "D:\\java_web_sol\\workspace_stsb\\starbucks-notice\\src\\main\\webapp\\upload-files";
	
  try {
	  MultipartRequest multi = new MultipartRequest(
		  request,
		  savePath,			// 실제 파일을 저장할 서버의 디렉토리
		  1024 * 1024 * 5,  // 업로드 제한 파일 크기(단위 byte) -> 5MB
		  "utf-8",
		  new DefaultFileRenamePolicy()
	  );
	  
	  korname = multi.getParameter("korname");
		title = multi.getParameter("title");
		content = multi.getParameter("content");
		num = multi.getParameter("num");
		
		String filename1 = multi.getFilesystemName("filecontent1");	// 첫번째 첨부파일 이름
		String filename2 = multi.getFilesystemName("filecontent2");	// 두번째 첨부파일 이름
		  
		String file1prev = multi.getParameter("file1prev");
		String file2prev = multi.getParameter("file2prev");
		
		// 0.
	  Class.forName("oracle.jdbc.driver.OracleDriver");
	
		// 1. JDBC로 Oracle연결
	  conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
	  
		String fileQueryName1 = "";
		if(filename1 != null){
			File file = new File(savePath + "\\" + file1prev);
			if(file.exists()) {
				file.delete();
			}
			fileQueryName1 = ", FILE1_PATH = '" + filename1 + "'";
		}
		String fileQueryName2 = "";
		if(filename2 != null){
			File file = new File(savePath + "\\" + file1prev);
			if(file.exists()) {
				file.delete();
			}
			fileQueryName2 = ", FILE2_PATH = '" + filename2 + "'";
		}
		
		
		// 2. BO_FREE 테이블에 화면 폼으로부터 가져온 데이터 입력
		
		String updateQuery = "UPDATE BO_FREE SET NAME = ?, SUBJECT = ?, CONTENT = ? " 
			+ fileQueryName1 + fileQueryName2 + " WHERE NUM = ?";
		pstmt = conn.prepareStatement(updateQuery);
		pstmt.setString(1, korname);
		pstmt.setString(2, title);
		pstmt.setString(3, content);
		pstmt.setInt(4, Integer.parseInt(num));
		
		pstmt.executeUpdate();
  } catch(Exception e) {
	  exception = e;
	  e.printStackTrace();
  } finally {
	  if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
	  if (conn != null) try { conn.close(); } catch (SQLException ex) {}
  }
%>

<%
	if (exception == null) {	// 공지사항 글 수정이 성공할 경우
		// 1. 성공 팝업 생성
		// 2. 공지사항 리스트로 이동
%>		
<!-- 성공 케이스 html/css/js -->
<script>
	alert('공지사항 글이 성공적으로 수정되었습니다.');	// 1
	location.href = '<%= request.getContextPath() %>/adminNoticeList.jsp';
</script>
<%
	} else {									// 공지사항 글 수정이 실패할 경우
		// 1. 실패글
		// 2. 오류내용 표시
%>
<!-- 실패 케이스 html/css/js -->
공지사항 글 수정이 실패하였습니다. 시스템 관리자에게 문의하세요.<br>
오류내용: <%= exception.getMessage() %>
<%	
	}
%>







