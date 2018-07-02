<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<% 
	request.setAttribute("name", "aaa");

	pageContext.forward("forward.jsp");
	
	RequestDispatcher rd = request.getRequestDispatcher("end.jsp");
	rd.forward(request, response);
%>

