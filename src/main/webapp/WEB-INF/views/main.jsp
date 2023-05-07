<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome BookMall</title>
<link rel="stylesheet" href="resources/css/main.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>

	<div class="wrapper">
		<div class="wrap">

			<div class="top_gnb_area">

				<ul class="list">
					<c:if test="${member == null }">
						<li><a href="/member/login">로그인</a></li>
						<li><a href="/member/join">회원가입</a></li>
						<li><a href="">고객센터</a></li>
					</c:if>
					
					<c:if test="${member != null}">
						<c:if test="${member.adminCk == 1}">
							<li><a href="/admin/main">관리자 페이지</a></li>
						</c:if>
						<li><a href="" id="gnb_logout_button">로그아웃</a></li>
						<li><a href="">마이룸</a></li>
						<li><a href="">장바구니</a></li>
					</c:if>


				</ul>
			</div>

			<div class="top_area">
				<div class="logo_area">
					<h1><a href="/">logo area</a></h1>
				</div>
				<div class="search_area">
					<h1>search area</h1>
					<form id="searchForm" action="/search" method="get">
					<div class="search_input">
					
					<select name="type">
					<option value="T">책 제목 </option>
					<option value="A">작가 </option>
					</select>
					
					<input type="text" name="keyword">
					<button class="btn search_btn">검색 </button>
					</div>
					</form>
				</div>

				<div class="login_area">
					<!-- 로그인 하지 않은 상태 -->
					<!-- <c:if test="${member == null}">
						<div class="login_button">
							<a href="/member/login">로그인 </a>
						</div>
						<span><a href="/member/join">회원가입</a></span>
					</c:if>  --> 

					<!-- 로그인한 상태 -->
					<c:if test="${member != null}">
						<div class="login_success_area">
							<span>회원 : ${member.memberName }</span> 
							<span>충전금액 : <fmt:formatNumber value="${member.money }" pattern="#,###.##"/>원 </span> 
							<span>포인트: <fmt:formatNumber value="${member.point }" pattern="#,###" />원</span> 
						</div>
					</c:if>



				</div>

				<div class="clearfix"></div>
			</div>


			<div class="navi_bar_area">
				<div class="dropdown">
				  <button class="dropbtn">국내
				  <i class="fa fa-caret-down"></i>
				  </button>
				  <div class="dropdown-content">
				   <a href="/search?type=C&cateCode=202001">교양</a>
				   <a href="#">테스트2</a>
				   <a href="#">테스트3</a>
				   <a href="#">테스트4</a>
				   <a href="#">테스트5</a>
				   <a href="#">테스트6</a>
				  </div>
				</div>
				
				<div class="dropdown">
				<button class="dropbtn">국외
				  <i class="fa fa-caret-down"></i>
				  </button>
				  <div class="dropdown-content">
				   <a href="#">테스트1</a>
				   <a href="#">테스트2</a>
				   <a href="#">테스트3</a>
				   <a href="#">테스트4</a>
				   <a href="#">테스트5</a>
				   <a href="#">테스트6</a>
				  </div>
				</div>
			</div>
			
			<div class="content_area">
				<h1>content area</h1>
			</div>
		</div>
		
		<!-- Footer 영역 -->
        <div class="footer_nav">
            <div class="footer_nav_container">
                <ul>
                    <li>회사소개</li>
                    <span class="line">|</span>
                    <li>이용약관</li>
                    <span class="line">|</span>
                    <li>고객센터</li>
                    <span class="line">|</span>
                    <li>광고문의</li>
                    <span class="line">|</span>
                    <li>채용정보</li>
                    <span class="line">|</span>
                </ul>
            </div>
        </div> <!-- class="footer_nav" -->
        
        <div class="footer">
            <div class="footer_container">
                
                <div class="footer_left">
                    <img src="resources/img/Logo.png">
                </div>
                <div class="footer_right">
                    (주) VamBook    대표이사 : OOO
                    <br>
                    사업자등록번호 : ooo-oo-ooooo
                    <br>
                    대표전화 : oooo-oooo(발신자 부담전화)
                    <br>
                    <br>
                    COPYRIGHT(C) <strong>dd.tistory.com</strong>    ALL RIGHTS RESERVED.
                </div>
                <div class="clearfix"></div>
            </div>
        </div> <!-- class="footer" -->    
		
		
	</div>


<script>
 /* gnb_area 로그아웃 버튼 작동 */
$("#gnb_logout_button").click(function(){
	//alert("버튼 작동");
	$.ajax({
		type:"post",
		url: "/member/logout",
		success:function(data){
			alert("로그아웃 성공");
			document.location.reload();
		}
	});
})
 </script>
</body>
</html>