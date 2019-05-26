<%@include file="onkokirjauduttu.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.util.ArrayList"%>
     <%@ page import="model.Vene"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="main.css">
	<title>Veneen poistaminen</title>
</head>
<% 
	Vene vene = null;  //poistettavan veneen tietojen välitys
	if(request.getAttribute("vene")!=null){	
		vene = (Vene)request.getAttribute("vene");
	}
%>
<body>
<!-- Sivun navigointi -->
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand">VENEET</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="haeveneet.jsp">Hae veneitä</a></li>
      <li><a href="listaaveneet.jsp">Listaa kaikki</a></li>
      <li><a href="lisaavene.jsp">Lisää vene</a></li>
      <li class="active"><a href="haeveneet.jsp">Muuta/Poista</a></li>
    </ul>
        <ul class="nav navbar-nav navbar-right">
          <li><a><span class="glyphicon glyphicon-user"></span><%out.print(" " + session.getAttribute("kayttaja"));%></a></li>
          <li><a href=index.jsp><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
          </ul>
  </div>
</nav>
<div class="container">
	  <h3>Poista vene</h3>
	  	<p>Tällä sivulla pystyt poistamaan veneen tietokannasta</p>
<form action="PoistaVene" method="post" name="muutaLomake" id="muutaLomake">  
	<!-- taulukko alkaa -->
	<table id="vaaka">
		<tr>
			<th>Nimi</th>
			<th>Merkkimalli</th>
			<th>Pituus</th>
			<th>Leveys</th>
			<th>Hinta</th>
		</tr>
	<% 
		out.print("<td>" + vene.getNimi() + "</td>");  //tietojen hakeminen
		out.print("<td>" + vene.getMerkkimalli() + "</td>");
		out.print("<td>" + vene.getPituus() + "</td>");
		out.print("<td>" + vene.getLeveys() + "</td>");
		out.print("<td>" + vene.getHinta() + "</td>");
	%> 
	</table>
	<!-- taulukko päättyy-->
	<input type="hidden" name="tunnus" value="<%=request.getParameter("poista_tunnus")%>">
	<br>
	<button type="submit" class="btn btn-default">Vahvista poisto</button>
</form>
	<br>
	<button id="peruuta" class="btn btn-default">Peruuta</button>
<script> 
	$(document).ready(function(){  //kursorin kohdistus, peruuta-painike
		$("#peruuta").click(function(){
		   window.location.href = 'haeveneet.jsp';
		});
	});
	</script>
</div>
</body>
</html>