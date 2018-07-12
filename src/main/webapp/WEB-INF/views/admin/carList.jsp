<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/nav.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/admin/sidebar.jsp"></jsp:include>

<style>
   .table-fixed {
    table-layout: fixed;
    overflow: hidden;
   }
   label{
      width:100px;
      text-align:center;
   }
   /* Hide the browser's default radio button */
   .container input[type=radio] {
       position: absolute;
       opacity: 0;
       cursor: pointer;
   }
   .form-check-label{
      height:50px;
   }
   .a{
      width: 66px;padding-bottom: 9px;padding-top: 9px;padding-left: 13px;padding-right: 13px;margin-top: 0px;
   }
</style>
<script>
$(function(){
	   $(".modalbtn").click(function() {
	      var td = $(this).parents().parents().children();
	      var number = td.eq(0).text();
	      var office = td.eq(8).text();
	      var price = td.eq(10).text();
	      var km = td.eq(11).text();
	      console.log($(this));
	      $("#exampleForm1").val(office);
	      $("#exampleForm2").val(uncomma(price));
	      $("#exampleForm3").val(km);
	      $("#exampleForm4").val(number);
	      $("#deletebtn").click(function(){
	         self.location = "/admin/deleteCarOK/"+number;
	      })
	   })
	})
	   function addComma(num) {
	      var regexp = /\B(?=(\d{3})+(?!\d))/g;
	       return num.toString().replace(regexp, ',');
	   }
	   function uncomma(num) {
	       var num = String(num);
	       return num.replace(/[^\d]+/g, '');
	   }
</script>


<div class="col-md-10" style="margin-top: 25px;">
<form:form action="/admin/insertCarOK?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
   <div class="card">
      <div class="card-body row">
      <h2 class="container-fluid">차량 추가</h2>
         <div class="container-fluid row">
         <div class="md-form col">
               <input type="text" id="form1" class="form-control" name="vnumber">
               <label for="form1">차 번호</label>
            </div>
               <div class="md-form col">
               <input type="text" id="form2" class="form-control" name="vmaker">
               <label for="form2">브랜드</label>
            </div>
            <div class="md-form col">
               <input type="text" id="form3" class="form-control" name="vmodel">
               <label for="form3">모델</label>
            </div>
            <div class="md-form col">
               <input type="text" id="form4" class="form-control" name="vtype">
               <label for="form4">타입</label>
            </div>
            <div class="md-form col">
               <input type="text" id="form5" class="form-control" name="vyear">
               <label for="form5">년식</label>
            </div>
            <div class="md-form col">
            	이미지 <input type="file" name="file" />
            </div>
            
         </div>
         <div class="container-fluid row">
            <div class="md-form col">
               <input type="text" id="form6" class="form-control" name="voil">
               <label for="form6">유종</label>
            </div>
         <div class="md-form col">
               		색상  <input type="color" id="" name="vcolor">
<!--                <input type="text" id="form7" class="form-control" name="vcolor"> -->
            </div>
            <div class="md-form col">
               <input type="text" id="form8" class="form-control" name="eoffice">
               <label for="form8">지역</label>
            </div>
            <!-- <div class="md-form col">
               <input type="text" id="form9" class="form-control" name="vstate">
               <label for="form9">상태</label>
            </div> -->
            <div class="md-form col">
               <input type="text" id="form10" class="form-control" name="vprice">
               <label for="form10">가격</label>
            </div>
            <div class="md-form col">
               <input type="text" id="form11" class="form-control" name="vkm">
               <label for="form11">주행거리</label>
            </div>
            <div class="md-form col" style="margin-top:10px; padding-left: 25px; padding-right: 5px;">
               <input type="submit" class="btn btn-primary"
               style="padding-left: 13px; padding-right: 13px;" value="차량추가" />
            </div>
         </div>
      </div>
   </div>
</form:form>
</div>
   <br />
   <div class="card">
    <div class="card-body">
        <!--Table-->
        <table class="table table-hover table-fixed" id="vehicleTable" style="text-align:center;">
         <h2>차량 목록</h2>
            <!--Table head-->
            <thead>
                <tr>
                    <th><h5>차 번호</h5></th>
                    <th><h5>브랜드</h5></th>
                    <th><h5>모델</h5></th>
                    <th><h5>타입</h5></th>
                    <th><h5>년식</h5></th>
                    <th><h5>유종</h5></th>
                    <th><h5>색</h5></th>
                    <th><h5>입고일</h5></th>
                    <th><h5>지역</h5></th>
                    <th><h5>상태</h5></th>
                    <th><h5>가격</h5></th>
                    <th><h5>KM</h5></th>
                </tr>
            </thead>
            <!--Table head-->

            <!--Table body-->
            <tbody id="carTableIn">
                <script>
            var str = "";
             <c:forEach items="${vlist }" var="vlist">
                 str += "<tr>";
                 str += "<td>${vlist.vnumber}</td>";
                 str += "<td>${vlist.vmaker}</td>";
                 str += "<td>${vlist.vmodel}</td>";
                 str += "<td>${vlist.vtype}</td>";
                 str += "<td>${vlist.vyear}</td>";
                 str += "<td>${vlist.voil}</td>";
                 str += "<td style='color:${vlist.vcolor}; background-color:#ececec;'><h3>●</h3></td>"; 
/*                  str += "<td>${vlist.vcolor}</td>";  */
                 str += "<td>${vlist.vdate}</td>";
                 str += "<td>${vlist.eoffice}</td>"; 
                 str += "<td>${vlist.vstate}</td>"; 
                 str += "<td>"+addComma("${vlist.vprice}")+"원</td>"; 
                 str += "<td>${vlist.vkm}</td>"; 
                 str += "<td><button class='btn btn-info px-3 a modalbtn' data-toggle='modal' data-target='#exampleModal'>"
                 str += "수정</button></td>"; 
                 str += "</tr>";
              </c:forEach>
              $("#carTableIn").html(str);
         </script>
            </tbody>
            <!--Table body-->

        </table>
        <!--Table-->
<%-- <a class='btn btn-info px-3' href='/admin/deleteCarOK/${vlist.vnumber}'>삭제</a> --%>
    </div>
</div>
<table style=" margin:auto;">
         <tr>
            <td>
               <ul id="pageing"
                  class="pagination pagination-sm justify-content-center">
                  <c:if test="${page.prev }">
                     <li class="page-item"><a class="page-link"
                        href="carList?page.finalEndPage">◀</a></li>
                     <li class="page-item"><a class="page-link"
                        href="carList?${page.getmakeURL(page.startPage-1) }" aria-label="Previous">
                           <span aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
                     </a></li>
                  </c:if>

                  <c:forEach begin="${page.startPage }" end="${page.endPage }"
                     var="PAGE">
                     <c:if test="${page.recordCriteria.reqPage == PAGE }">
                        <li class="page-item active"><a class="page-link" href="javascript:void(0)">${PAGE }</a></li>
                     </c:if>
                     <c:if test="${page.recordCriteria.reqPage != PAGE }">
                        <li class="page-item"><a class="page-link"
                           href="carList?${page.getmakeURL(PAGE) }">${PAGE }</a></li>
                     </c:if>
                  </c:forEach>

                  <c:if test="${page.next }">
                     <li class="page-item"><a class="page-link"
                        href="carList?${page.getmakeURL(page.endPage+1) }" aria-label="Next">
                           <span aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
                     </a></li>
                     <li class="page-item"><a class="page-link"
                        href="carList?${page.getmakeURL(page.finalEndPage) }">▶</a></li>
                  </c:if>
               </ul>
            </td>
          </tr>
      </table> 

<form:form action="/admin/updateCarOK/">
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
               <label for="exampleForm1">지역</label>
               <input type="text" id="exampleForm1" class="form-control" name="eoffice">
               <label for="exampleForm2">가격</label>
               <input type="text" id="exampleForm2" class="form-control" name="vprice">
               <label for="exampleForm3">주행거리</label>
               <input type="text" id="exampleForm3" class="form-control" name="vkm">
               <input type="hidden" id="exampleForm4" name="vnumber">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" id="deletebtn">폐차</button>
                <button type="submit" class="btn btn-primary">수정</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>
</form:form>


<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>