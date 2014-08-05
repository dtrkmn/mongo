<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.Mongo"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONArray"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.footer {
    background-color: #CCC;
    height: 30px;
    width: 900px;
    margin:270px;
   
}
.header {
    background-color: #CCC;
    height: 50px;
    width: 900px;
    font-family: Verdana, Geneva, sans-serif;
    font-size: 24px;
    color: #666666;
    text-decoration: none;
}
.img {
margin-top:-100px;
}

</style>
</head>
<body style="background-color:pink;">

<div class="header"><strong>&nbsp;About Book</strong></div>

<%
	Mongo mg = new Mongo("localhost", 27017);
	DB db = mg.getDB("ebook");
	DBCollection coll = db.getCollection("col1");
	DBCursor cur= coll.find();
	
	 while(cur.hasNext()) {
		 String jsonString = cur.next().toString();
		 
		   
		 JSONObject json = (JSONObject)new JSONParser().parse(jsonString);
		 out.println("title :" + json.get("title"))  ;
		  out.println("<BR>");
		 
		 out.println("creator :" + json.get("creator"));
		 out.println("<BR>");
		 out.println("content :" + json.get("content"));
		  out.println("<BR>"); 
		 out.println("publisher :" + json.get("publisher"));
		  out.println("<BR>"); 
		 out.println("date :" +json.get("date"));
		 out.println("<BR>"); 
		 out.println("isbn :" +json.get("isbn"));
		  out.println("<BR>"); 
		 out.println("language:" +json.get("language"));
	 }
	 
%>

<div class="img">
<img src="indir.jpg"  align="right" >
</div>
</body>
</html>
  
