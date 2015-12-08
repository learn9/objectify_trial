<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="com.googlecode.objectify.*" %>
<%@ page import="objectify_simple.*" %>

<%
ObjectifyService.ofy().save().entity(new Car("123123", "red")).now();
Car c = ObjectifyService.ofy().load().type(Car.class).id("123123").now();
%>

success, no error.
<%=c%>

<%
ObjectifyService.ofy().delete().entity(c);
%>