<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<header >
	<body> <jsp:include page="menu.jsp" /> </body>
</header>


<div class="container mt-4">
    <h1>${Propiedad.getTitulo()}</h1>
    <p><strong>Precio:</strong> ${Propiedad.getPrecio()}</p>
    <p><strong>Reseña:</strong> ${Propiedad.getResenia()}</p>
    <p><strong>Descripción:</strong> ${Propiedad.getDescripcion()}</p>
    <p><strong>Localidad:</strong> ${Propiedad.getLocalidad()} %></p>
    <c:forEach var="imagen" items="${Propiedad.getURLimagenes()}">
	    <img src="${imagen}" class="card-img-top" alt="${imagen}">
	</c:forEach>
    
    
    <a href="index.jsp" class="btn btn-secondary">Volver a Propiedades</a>
</div>


</body>
</html>