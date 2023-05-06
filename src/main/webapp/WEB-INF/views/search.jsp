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
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>

	<div class="wrapper">
		<div class="wrap">

			<div class="top_gnb_area">

				<ul class="list">
					<c:if test="${member == null }">
						<li><a href="/member/login">로그인</a></li>
						<li><a href="/member/join">회원가입</a></li>

					</c:if>

					<c:if test="${member != null}">
						<c:if test="${member.adminCk == 1}">
							<li><a href="/admin/main">관리자 페이지</a></li>
						</c:if>
						<li><a href="" id="gnb_logout_button">로그아웃</a></li>
						<li><a href="">마이룸</a></li>
						<li><a href="">장바구니</a></li>
					</c:if>

					<li><a href="">고객센터</a></li>
				</ul>
			</div>

			<div class="top_area">
				<div class="logo_area">
					<h1>
						<a href="/main">logo area</a>
					</h1>
				</div>
				<div class="search_area">
					<h1>search area</h1>
					<form id="searchForm" action="/search" method="get">
						<div class="search_input">

							<select name="type">
								<option value="T">책 제목</option>
								<option value="A">작가</option>
							</select> 
							<input type="text" name="keyword" value="<c:out value="${pageMaker.cri.keyword}"/>">
							<button class="btn search_btn">검색</button>
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
							<span>회원 : ${member.memberName }</span> <span>충전금액 : <fmt:formatNumber
									value="${member.money }" pattern="#,###.##" />원
							</span> <span>포인트: <fmt:formatNumber value="${member.point }"
									pattern="#,###" />원
							</span>
						</div>
					</c:if>



				</div>

				<div class="clearfix"></div>
			</div>



			<div class="content_area">
				<!-- 게시물 있을 때 -->
				<c:if test="${listcheck != 'empty'}">
					<div class="list_search_result">
						<table>
							<colgroup>
								<col width="110">
								<col width="*">
								<col width="120">
								<col width="120">
								<col width="120">
							</colgroup>
							<tbody id="searchList">
								<c:forEach items="${list}" var="list">
									<tr>
										<td class="image"></td>
										<td class="detail">
											<div class="category">[${list.cateName}]</div>
											<div class="title">${list.bookName }</div>
											<div class="author" lang="en">${list.authName } 지음 | ${list.publisher} | ${list.publeYear}</div>

										</td>
										<td>
											<div class="rating">평점 (추후 추가 )</div>
										</td>
										<td class="price">
											<div class="org_price">
												<del>
													<fmt:formatNumber value="${list.bookPrice }"
														pattern="#,###원 " />
												</del>
											</div>
											<div class="sell_price">
												<strong lang="en"> <fmt:formatNumber
														value="${list.bookPrice * ( 1 - list.bookDiscount)}"
														pattern="#,### 원" />
												</strong>
											</div>
										</td>

										<td class="option"></td>

									</tr>

								</c:forEach>
							</tbody>
						</table>
					</div>

					<!-- 페이지 인터페이스 -->
					<div class="pageMaker_wrap">
						<ul class="pageMaker">
							<!-- 이전버튼 -->
							<c:if test="${pageMaker.prev}">
								<li class="pageMaker_btn prev"><a
									href="${pageMaker.pageStart-1}">이전</a></li>
							</c:if>

							<!-- 페이지 번호  -->
							<c:forEach begin="${pageMaker.pageStart}" end="${pageMaker.pageEnd}"
								var="num">
								<li
									class="pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active':''}">
									<a href="${num}">${num}</a>
								</li>
							</c:forEach>

							<!-- 다음 버튼 -->
							<c:if test="${pageMaker.next}">
								<li class="pageMaker_btn next"><a
									href="${pageMaker.pageEnd + 1}">다음</a></li>
							</c:if>
						</ul>
					</div>
					
					<form id="moveForm" action="/search" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					<input type="hidden" name="amout" value="${pageMaker.cri.amount}">
					<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
					<input type="hidden" name="type" value="${pageMaker.cri.type}">
					</form>



				</c:if>
				<!-- 게시물 없을 때 -->
				<c:if test="${listcheck == 'empty'}">
					<div class="table_empty">검색결과가 없습니다.</div>
				</c:if>

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
		</div>
		<!-- class="footer_nav" -->

		<div class="footer">
			<div class="footer_container">

				<div class="footer_left">
					<img src="resources/img/Logo.png">
				</div>
				<div class="footer_right">
					(주) VamBook 대표이사 : OOO <br> 사업자등록번호 : ooo-oo-ooooo <br>
					대표전화 : oooo-oooo(발신자 부담전화) <br> <br> COPYRIGHT(C) <strong>dd.tistory.com</strong>
					ALL RIGHTS RESERVED.
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<!-- class="footer" -->


	</div>


	<script>
		/* gnb_area 로그아웃 버튼 작동 */
		$("#gnb_logout_button").click(function() {
			//alert("버튼 작동");
			$.ajax({
				type : "post",
				url : "/member/logout",
				success : function(data) {
					alert("로그아웃 성공");
					document.location.reload();
				}
			}); //ajax
		})
		
		/* 페이지 이동 버튼 */
		const moveForm = $('#moveForm');
		$(".pageMaker_btn a").on("click", function(e){
			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.submit();
		});
		
		/* 검색 타입  */
		$(document).ready(function(){
			const selectedType='<c:out value="${pageMaker.cri.type}" />';
			if(selectedType != ""){
				$("select[name='type']").val(selectedType).attr("selected", "selected");
			}
		});
		
	</script>
</body>
</html>