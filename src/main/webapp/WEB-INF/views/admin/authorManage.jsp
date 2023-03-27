<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작가 관리</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>


</head>
<body>
	<%@include file="./include/admin/header.jsp"%>

	<style>
.admin_list_04 {
	background-color: #c8c8c8;
}
</style>


	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span>작가 관리</span>
		</div>

		<div class="author_table_wrap">
			<c:if test="${listCheck != 'empty'}">
				<table class="author_table">
					<thead>
						<tr>
							<td></td>
						</tr>
					</thead>
					<c:forEach items="${list}" var="list">
					<tbody>
						<tr>
							<td></td>
						</tr>
					</tbody>
					</c:forEach>
				</table>
			</c:if>

			<c:if test="${listCheck == 'empty'}">
				<div class="table_empty">등록된 작가가 업습니다.</div>
			</c:if>

		</div>

		<!-- 검색 영역 -->


		<!-- 페이지 이동 인터페이스 영역 -->




	</div>

	<div class="clearfix"></div>



	<%@include file="./include/admin/footer.jsp"%>

	<script>
		$(document).ready(function() {

			let result = '<c:out value="${enroll_result}"/>';

			checkResult(result);

			function checkResult(result) {

				if (result === '') {

					return;

				}
				alert(" 작가 '${enroll_result}' 을 등록하였습니다.");

			}

		});
	</script>


</body>
</html>