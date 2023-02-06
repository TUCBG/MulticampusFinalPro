<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println("logout.jsp00");
	session.invalidate(); /* 세션 끊기 */
	response.sendRedirect("../main/animal_main.jsp");
%>