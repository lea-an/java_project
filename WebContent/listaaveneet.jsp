<%@include file="onkokirjauduttu.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.ArrayList"%>
     <%@ page import="model.Vene"%>
      <%! @SuppressWarnings("unchecked") %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="main.css">
	<title>Listaa veneet</title>
</head>
<body>
<!-- Sivun navigointi -->
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand">VENEET</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="haeveneet.jsp">Hae veneitä</a></li>
      <li class="active"><a href="listaaveneet.jsp">Listaa kaikki</a></li>
      <li><a href="lisaavene.jsp">Lisää vene</a></li>
      <li><a href="haeveneet.jsp">Muuta/Poista</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
       <li><a><span class="glyphicon glyphicon-user"></span><%out.print(" " + session.getAttribute("kayttaja"));%></a></li>
       <li><a href=index.jsp><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
     </ul>
  </div>
</nav>
<div class="container">
	  <h3>Kaikki veneet</h3>
	  	<p>Saat kaikki veneet näkyviin painamalla 'Listaa veneet' painiketta</p>
	<form action="ListaaVeneet" method=post>
	<button class="btn btn-default">Listaa veneet</button>
	</form>
	<br><br>
	<!-- taulukko alkaa -->
	<table id="vaaka">
	<tr>
		<th>Nimi</th>
		<th>Merkkimalli</th>
		<th>Pituus</th>
		<th>Leveys</th>
		<th>Hinta</th>
	</tr>
<% //haetaan veneiden tiedot
	if(request.getAttribute("veneet")!=null){	
		ArrayList<Vene> veneet = (ArrayList<Vene>)request.getAttribute("veneet");
		for(int i=0; i<veneet.size();i++){
		out.print("<tr>");	
		out.print("<td>" + veneet.get(i).getNimi() + "</td>");
		out.print("<td>" + veneet.get(i).getMerkkimalli() + "</td>");
		out.print("<td>" + veneet.get(i).getPituus() + "</td>");
		out.print("<td>" + veneet.get(i).getLeveys() + "</td>");
		out.print("<td>" + veneet.get(i).getHinta() + "</td>");
		out.print("</tr>");
		}
	}
%>
	</table>
	<!-- taulukko päättyy-->
</div>
</body>
</html>