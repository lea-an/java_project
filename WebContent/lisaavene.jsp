<%@include file="onkokirjauduttu.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="model.Vene"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="main.css">
<title>Veneen lisääminen</title>
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
      <li><a href="listaaveneet.jsp">Listaa kaikki</a></li>
      <li class="active"><a href="lisaavene.jsp">Lisää vene</a></li>
      <li><a href="haeveneet.jsp">Muuta/Poista</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a><span class="glyphicon glyphicon-user"></span><%out.print(" " + session.getAttribute("kayttaja"));%></a></li>
      <li><a href=index.jsp><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>
<div class="container">
  <h3>Lisää vene</h3>
  <p>Tällä sivulla pystyt lisäämään veneen tietokantaan</p> 
	<form  action="LisaaVene" method="post" name="lisaaLomake" id="lisaaLomake"> <!-- lomake veneen lisäämiseen -->
	<table id="pysty">
		<tr>
			<th align="right" class="pysty">Nimi:</th>
			<td><input type="text"name="nimi" id="nimi"></td>
		</tr>
		<tr>
			<th align="right" class="pysty">Merkkimalli:</th>
			<td><input type="text"name="merkkimalli" id="merkkimalli"></td>
		</tr>
		<tr>
			<th align="right" class="pysty">Pituus:</th>
			<td><input type="text"name="pituus" id="pituus"></td>
		</tr>
		<tr>
			<th align="right" class="pysty">Leveys:</th>
			<td><input type="text" name="leveys" id="leveys"></td>
		</tr>
		<tr>
			<th align="right" class="pysty">Hinta:</th>
			<td><input type="text" name="hinta" id="hinta"></td>
		</tr>
	</table> 
	<br>
	<button type="submit" class="btn btn-default">Lisää</button>
<% 
	if(request.getParameter("ilmo")!=null){ //tutkitaan onnistuiko lisäys
		if(request.getParameter("ilmo").equals("1")){
			out.print("Veneen lisääminen onnistui");	
		}else if(request.getParameter("ilmo").equals("0")){
			out.print("Veneen lisääminen ei onnistunut");	
		}
	}
%>
</form>
<br>
<button id="kaikki" class="btn btn-default">Kaikki veneet</button>
<script> 
	$(document).ready(function(){  //kursorin kohdistus, kaikki-painike, validoinnit
		$("#nimi").focus();
	    $("#kaikki").click(function(){	    	
	    	window.location.href = 'ListaaVeneet';
	    });
	    $("#lisaaLomake").validate({						
			rules: {
				nimi:  {
					required: true,
					minlength: 2,
					maxlength: 50
				},	
				merkkimalli:  {
					required: true,
					minlength: 2,
					maxlength: 50
				},
				pituus:  {
					required: true,
					number: true,
					minlength: 2,
					maxlength: 20
				},	
				leveys:  {
					required: true,
					number: true,
					minlength: 2,
					maxlength: 20
				},	
				hinta:  {
					required: true,
					number: true,
					minlength: 1,
					maxlength: 20
				}
			},
			messages: {
				nimi: {
					required: "Pakollinen",
					minlength: "Pituus ei riitä",
					maxlength: "Liian pitkä"
					
				},
				merkkimalli: {
					required: "Pakollinen",
					minlength: "Pituus ei riitä",
					maxlength: "Liian pitkä"
				},
				pituus: {
					required: "Pakollinen",
					number: "Anna numeerinen arvo",
					minlength: "Pituus ei riitä",
					maxlength: "Liian pitkä"
				},
				leveys: {
					required: "Pakollinen",
					number: "Anna numeerinen arvo",
					minlength: "Pituus ei riitä",
					maxlength: "Liian pitkä"
				},
				hinta: {
					required: "Pakollinen",
					number: "Anna numeerinen arvo",
					minlength: "Pituus ei riitä",
					maxlength: "Liian pitkä"
				}
			},			
			submitHandler: function (form) {				
				document.forms["lisaaLomake"].submit();
			}
	    });
	});
		</script>
	</div>
</body>
</html>