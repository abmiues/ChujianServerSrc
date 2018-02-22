<%@ page language="java" import="java.util.*"
	pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String userid=(String)session.getAttribute("sellerid");
if(userid==null)
response.sendRedirect("login.jsp");

%>
