<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function() {
		$(".page_btn").click(function() {
			$.ajax({
				url : "fetchBoard",
				data : {
					page : $(this).attr("id"),

				},
				success : function(table) {
					$("#result").html(table)
				}
			})
		});
	});
</script>
<div class="page_btnWrap">
	<%
		int pages = (int) request.getAttribute("pages");
	for (int p = 1; p <= pages; p++) {
	%>
	<button id=<%=p%> class="page_btn"><%=p%></button>
	<%
		}
	%>
</div>