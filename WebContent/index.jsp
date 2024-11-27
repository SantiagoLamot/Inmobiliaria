<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inmobiliaria Paula Uzubiaga</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<body> <jsp:include page="menu.jsp" /> </body>
<div class="container mt-4">
    <h1 class="text-center">Bienvenido a Inmobiliaria Paula Uzubiaga</h1>
    <p class="text-center">Encuentra la propiedad de tus sueños con nosotros.</p>
	<c:forEach var="Propiedad" items="${Propiedades}">
    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <img src="${Propiedad.getURLimagenPrincipal()}" class="card-img-top" alt="Propiedad 1">
                <div class="card-body">
                    <h5 class="card-title">${Propiedad.getTitulo()}</h5>
                    <p class="card-text">${Propiedad.getResenia()}</p>
                    <a href="${pageContext.request.contextPath}/ServletPropiedadCompleta?id=${Propiedad.getId()}" class="btn btn-primary">Ver más</a>
                </div>
            </div>
        </div>
    </div>
	</c:forEach>
</div>
</body>
</html>