<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style>
	header {
		width: 100%;
		height: 100px;
		background-color: #333333;
		position: relative;
	}

	
	.firstbox {
		width: 100%;
		height: 50px;
		background-color: #333333;
		display: flex;
		justify-content: end;
		text-align: center;
		align-items: center;
		gap: 20px;

	}
	
	.logout {
		width: 70px;
		height: 40px;
		background-color: grey;
		border: 2PX solid #fff;
		align-items: center;
		justify-content: center;
		text-align: center;
		display: flex;
		border-radius: 30px;
		margin-top: 10px;
		cursor: pointer;
		transition: all 0.3s;
	}
	
	.logout:hover {
		background-color: #333333;
		color: #fff;
		border: 1px solid #333333;
	}
	
	.modification:hover {
		background-color: #333333;
		color: #fff;
		border: 1px solid #333333;
	}
	
	.modification{
		width:70px;
		height: 40px;
		background-color: grey;
		border: 2PX solid #fff;
		align-items: center;
		justify-content: center;
		text-align: center;
		display: flex;
		border-radius: 30px;
		margin-right: 15px;
		margin-top: 10px;
		cursor: pointer;	
		transition: all 0.3s;
	}
	
	
	.logobox{
		width: 40px;
		height: 40px;
		cursor: pointer;
	}
	
	.secondbox{
		display: flex;
		position: relative;	
	}
	
	.logobox{
	  position: relative;	
	  bottom: 40px;
	  margin-left: 20px;
	}
	
	.secondbox .name{
		width: 1200px;
		height: 50px;
		COLOR: #FFF;
		font-size: 30px;
		position: relative;	
		display: flex;
		justify-content: center;
		text-align: center;
		align-items: center;
		bottom: 20px;
	}
	
	
	
</style>
  <link rel="icon" href="" />

	<!-- reset.css -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
</head>
<body>
<header>
	<div class="firstbox">
		<div class = "logout">
			Logout
		</div>
		<div class = "modification">
			modify
		</div>		
	</div>
	<div>
		<div class = "secondbox">
			<div class = "logobox">
				<img src = "./images/starbucks_logo.png" alt="logo"><a href = ""></a></img>
			</div>
			<div class = "name">
				1 조 입 니 다.
			</div>
		</div>
	</div>
</header>		

</body>
</html>