<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<link rel="stylesheet" href="../resources/css/admin/page.css">
<link rel="stylesheet" href="../resources/css/admin/goodsEnroll.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

</head>
<body>

	<style>
.admin_list_01 {
	background-color: #c8c8c8;
}
</style>
	<%@include file="./include/admin/header.jsp"%>

	<div class="admin_content_wrap">

		<div class="admin_content_subject">
			<span>상품 등록</span>
		</div>


		<div class="admin_content_main">
			<form action="/admin/goodsEnroll" method="post" id="enrollForm">

				<div class="form_section">
					<div class="form_section_title">
						<label>책 제목</label>
					</div>

					<div class="form_section_content">
						<input name="bookName"> <span
							class="ck_warn bookName_warn">책이름을 입력해주세요.</span>
					</div>
				</div>

				<div class="form_section">
					<div class="form_section_title">
						<label>작가 </label>
					</div>

					<div class="form_section_content">
						<input id="authName_input" readonly="readonly">
						<input id="authorId_input" name="authorId" type="hidden">
						<button class="authorId_btn">작가선택</button>
						<span class="ck_warn authorId_warn">작가를 선택하세요.</span>
						
					</div>
				</div>

				<div class="form_section">
					<div class="form_section_title">
						<label> 출판일 </label>
					</div>

					<div class="form_section_content">
						<input name="publeYear" autocomplete="off" readonly="readonly">
						<span class="ck_warn publeYear_warn">출판일을 선택하세요.</span>
					</div>
				</div>

				<div class="form_section">
					<div class="form_section_title">
						<label>출판사 </label>
					</div>

					<div class="form_section_content">
						<input name="publisher">
						<span
							class="ck_warn publisher_warn"> 출판사를 입력해주세요.</span>>
					</div>
				</div>

				<div class="form_section">
					<div class="form_section_title">
						<label>책 카테고리</label>
					</div>
					<div class="form_section_content">
						<div class="cate_wrap">
						 <span>대분류 </span>
						 <select class="cate1">
						 <option selected value="none"> 선택</option>
						 </select>
						</div>
						<div class="cate_wrap">
						 <span>중분류 </span>
						 <select class="cate2">
						 <option selected value="none"> 선택</option>
						 </select>
						</div>
						<div class="cate_wrap">
						 <span>소분류 </span>
						 <select class="cate3" name="cateCode">
						 <option selected value="none"> 선택</option>
						 </select>
						</div>
						<span class="ck_warn cateCode_warn">카테고리를 선택하세요.</span>
						
					</div>
				</div>


				<div class="form_section">
					<div class="form_section_title">
						<label>상품가격 </label>
					</div>

					<div class="form_section_content">
						<input name="bookPrice" value="0">
						<span class="ck_warn bookPrice_warn">상품가격을 입력해주세요.</span>
					</div>
				</div>

				<div class="form_section">
					<div class="form_section_title">
						<label>상품재고 </label>
					</div>

					<div class="form_section_content">
						<input name="bookStock" value="0">
						<span class="ck_warn bookStock_warn">상품가격을 입력하세요.</span>
					</div>
				</div>

				<div class="form_section">
					<div class="form_section_title">
						<label>상품할인율 </label>
					</div>

					<div class="form_section_content">
						<input name="bookDiscount" value="0">
						<span class="ck_warn bookDiscount_warn">상품할인율을 입력하세요.</span>
					</div>
				</div>

				<div class="form_section">
					<div class="form_section_title">
						<label>책 소개 </label>
					</div>

					<div class="form_section_content bit">
						<textarea name="bookIntro" id="bookIntro_textarea"></textarea>
						<span class="ck_warn bookIntro_warn">책 소개를 입력해주세요.</span>
					</div>
				</div>

				<div class="form_section">
					<div class="form_section_title">
						<label>책 목차</label>
					</div>

					<div class="form_section_content bct">
						<textarea name="bookContents" id="bookContents_textarea"></textarea>
						<span class="ck_warn bookContents_warn">책 목차를 입력해주세요.</span>
					</div>
				</div>

			</form>

			<div class="btn_section">
				<button id="cancelBtn" class="btn">취소</button>
				<button id="enrollBtn" class="btn enroll_btn">등록</button>
			</div>

		</div>

	</div>

	<%@include file="./include/admin/footer.jsp"%>

	<script>

let enrollForm = $("#enrollForm")
	
/* 취소 버튼 */
$("#cancelBtn").click(function(){
	
	location.href="/admin/goodsManage"
	
});

/* 상품 등록 버튼 */
$("#enrollBtn").on("click",function(e){
	
	e.preventDefault();
	
	/* 체크 변수 */
	let bookNameCk = false;
	/* let authorIdCk = false;
	let publeYearCk = false;
	let publisherCk = false;
	let cateCodeCk = false;
	let bookPriceCk = false;
	let bookStockCk = false;
	let bookDiscountCk = false;
	let bookIntroCk = false; 
	let bookCotentsCk = false; */
	
	/* 체크 대상 변수 값 */
	let bookName = $("input=[name='bookName']").val();
	/* let authorId = $("input=[name='authorId']").val();
	let publeYear = $("input=[name='publeYear']").val();
	let publisher = $("input=[name='publisher']").val();
	let cateCode = $("input=[name='cateCode']").val();
	let bookPrice = $("input=[name='bookPrice']").val();
	let bookStock = $("input=[name='bookStock']").val();
	let bookDiscount= $("input=[name='bookDiscount']").val();
	let bookIntro= $(".bit p").html();
	let bookContents= $(".bct p").html(); */
	
	                                                                                                                                                                                                                                      
	
	/* 공란 체크 */
	if(bookName) {
		$(".bookName_warn").css("display", "none");
		bookNameCk = true;
	}else{
		$(".bookName_warn").css("display", "block");
		bookNameCk = false;
		return false;
	}
	
	/* if(bookNameCk){
		alert()
		enrollForm.submit();
	} else{
		
	} */
	//enrollForm.submit();
	
});

/* 위지윅 적용 */

/* 책 소개 */
ClassicEditor
.create(document.querySelector('#bookIntro_textarea'))
.catch(error=>{
	console.error(error);
});

/* 책 목차 */
ClassicEditor
.create(document.querySelector('#bookContents_textarea'))
.catch(error => {
	console.error(error);
});


/* 캘린더 위젯 적용 */
 
/* 설정 */
const config = {
		dateFormat: 'yy-mm-dd',
		showOn : "button",
		buttonText:"날짜 선택",
		prevText: '이전 달 ',
		nextText:'다음 달 ',
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dayNames: ['일','월','화','수','목','금','토'],
	    dayNamesShort: ['일','월','화','수','목','금','토'],
	    dayNamesMin: ['일','월','화','수','목','금','토'],
	    yearSuffix: '년',
        changeMonth: true,
        changeYear: true
		
	
};
	

 $(function(){
	$("input[name='publeYear']").datepicker(config); 
 });
 
 /* 작가 선택 버튼 */
$(".authorId_btn").on("click", function(e){
	e.preventDefault();
	
	let popUrl =  "/admin/authorPop";
	let popOption =  "width = 600px, height = 500px, top=300px, left=300px, scrollbars=yes";
	window.open(popUrl, "작가찾기 ", popOption);
	
});
 
 
/* $(document).ready(function(){
	console.log('${cateList}'); 
 });
*/

/* 카테고리 */
 let cateList = JSON.parse('${cateList}');
 
 let cate1Array = new Array();
 let cate2Array = new Array();
 let cate3Array = new Array();
 
 let cate1Obj = new Object();
 let cate2Obj = new Object();
 let cate3Obj = new Object();
 
 let cateSelect1 = $(".cate1");
 let cateSelect2 = $(".cate2");
 let cateSelect3 = $(".cate3");
 

 
 function makeCateArray(obj, array, cateList, tier){
	 for(let i = 0; i < cateList.length; i++){
		 if(cateList[i].tier === tier){ //국내, 국외 
			 //console.log("tier === 1");
			 //console.log(cateList);
			 obj = new Object();
			 
			 //console.log("cate1Obj");
			 //console.log(cate1Obj);
			 obj.cateName = cateList[i].cateName;
			 obj.cateCode = cateList[i].cateCode;
			 obj.cateParent = cateList[i].cateParent;
			 array.push(obj);
		 }
	 }
 };
 
 /* 배열초기화 */
 makeCateArray(cate1Obj, cate1Array, cateList, 1);
 makeCateArray(cate2Obj, cate2Array, cateList, 2);
 makeCateArray(cate3Obj, cate3Array, cateList, 3);
 
  /* $(document).ready(function(){
	 console.log(cate1Array);
	 console.log(cate2Array);
	 console.log(cate3Array);
 }); */ 
 
 
/* 대분류 option */
for(let i =0; i< cate1Array.length; i++){
	cateSelect1.append("<option value='" + cate1Array[i].cateCode+"'>" + cate1Array[i].cateName + "</option>");
};
/* 중분류 option */ 
$(cateSelect1).on("change", function(){
 	let selectVal1 = $(this).find("option:selected").val();
 	cateSelect2.children().remove();
 	cateSelect3.children().remove();

 	cateSelect2.append("<option value='none'> 선택</option>");
 	cateSelect3.append("<option value='none'> 선택</option>");
 	
 	for(let i = 0; i< cate2Array.length ; i++){
 		if(selectVal1 === cate2Array[i].cateParent){
 			cateSelect2.append("<option value='" + cate2Array[i].cateCode + "'>" + cate2Array[i].cateName + "</option>");
 		}
 	}// 
});

/* 소분류 option */

$(cateSelect2).on("change", function(){
	let selectVal2 = $(this).find("option:selected").val();
	
	cateSelect3.children().remove();
	cateSelect3.append("<option value='none'>선택</option>");
	
	for(let i=0; i<cate3Array.length; i++){
		if(selectVal2 === cate3Array[i].cateParent){
			cateSelect3.append("<option value='" +cate3Array[i].cateCode + "'>" + cate3Array[i].cateName +  "</option>")
		}
	}
});
 

</script>



</body>
</html>