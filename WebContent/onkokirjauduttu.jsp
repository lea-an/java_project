<%
if(session.getAttribute("kayttaja")==null){	
	response.sendRedirect("index.jsp");
	return;
}
%>