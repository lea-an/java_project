<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="main.css">
	<title>Kirjautuminen</title>
</head>
<body>
<div class="container" id="kirjaudu">
	 <h2>Kirjautumissivu</h2>
	 <!--kirjautumislomake (admin, nimda) -->
	<form action="TutkiKirjaudu" method="post" name="kirjauduLomake" id="kirjauduLomake">
	  <div class="form-group">
	    <label>Tunnus:</label> 
	    <input type="text"  class="form-control" name="uid" id="uid" value="">
	  </div>
	  <div class="form-group">
	    <label>Salasana:</label>
	    <input type="password" class="form-control" name="pwd" value="">
	  </div>
	  <button type="submit" class="btn btn-default">Kirjaudu</button>
	</form> 
	
<% //tutkitaan annettu salasana/tunnus pari
if(request.getParameter("login")!=null){
	if(request.getParameter("login").equals("0")){
		out.print("Antamasi tunnus/salasana ei kelpaa!");
	}	
}
%>
</div>
	<script> //lomakkeen validoinnit
		$(document).ready(function(){
			$("#uid").focus();	
			$("#kirjauduLomake").validate({						
				rules: {
					uid:  {
						required: true					
					},	
					pwd:  {
						required: true
					}		
				},
				messages: {
					uid: {
						required: "Pakollinen"					
					},
					pwd: {
						required: "Pakollinen"
					}
				},			
				submitHandler: function (form) {				
					document.forms["kirjauduLomake"].submit();
				}		
			});
		});
	</script>
</body>
</html>