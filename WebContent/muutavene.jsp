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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="main.css">
	<title>Veneen tietojen muuttaminen</title>
</head>
<% 
	Vene vene = null;  //muutettavan veneen tietojen välitys
	if(request.getAttribute("vene")!=null){	
		vene = (Vene)request.getAttribute("vene");
	}else{
		response.sendRedirect("haeaveneet.jsp");
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
 <h3>Muuta veneen tietoja</h3>
	<p>Tällä sivulla pystyt muuttamaan veneen tietoja</p>
<form action="MuutaVene" method="post" name="muutaLomake" id="muutaLomake"> <!-- lomake veneen muuttamiseen -->
	<table id="pysty">
		<tr>
		<th align="right" style="width:33%" class="pysty">Nimi:</th>
		<td><input type="text" name="nimi" id="nimi" value="<%=vene.getNimi()%>"></td>
		</tr>
		<tr>
		<th align="right" class="pysty">Merkkimalli:</th>
		<td><input type="text" name="merkkimalli" id="merkkimalli"  value="<%=vene.getMerkkimalli()%>"></td>
		</tr>
		<tr>
		<th align="right" class="pysty">Pituus:</th>
		<td><input type="text" name="pituus" id="pituus"  value="<%=vene.getPituus()%>"></td>
		</tr>
		<tr>
		<th align="right" class="pysty">Leveys:</th>
		<td><input type="text" name="leveys" id="leveys" value="<%=vene.getLeveys()%>"></td>
		</tr>
		<tr>
		<th align="right" class="pysty">Hinta:</th>
		<td><input type="text" name="hinta" id="hinta" value="<%=vene.getHinta()%>"></td>
		</tr>
	</table>
	<br>
	<button type="submit" class="btn btn-default">Vahvista muutos</button>
	<input type="hidden" name="tunnus" value="<%=request.getParameter("tunnus")%>">
</form>
	<br>
	<button id="peruuta" class="btn btn-default">Peruuta</button>
<script> 
		$(document).ready(function(){   //kursorin kohdistus, peruuta-painike, validoinnit
			$("#nimi").focus();
		    $("#peruuta").click(function(){
		    	window.location.href = 'haeveneet.jsp';
		    });
		    $("#muutaLomake").validate({						
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
					document.forms["muutaLomake"].submit();
				}		
			});
		});
	</script>
</div>
</body>
</html>