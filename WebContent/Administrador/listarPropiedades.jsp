<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Ajusta el dise�o para m�viles, adaptando el ancho al dispositivo y garantizando un comportamiento responsive. -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Agregar propiedad</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="menu.jsp" />
    <div class="container mt-4">
    <h1 class="text-center" >Editar propiedades</h1>
	    <div class="row">
	        <c:forEach var="Propiedad" items="${Propiedades}">
	            <div class="col-lg-4 col-md-6 col-sm-12 mb-4">
	                <div class="card h-100">
	                    <c:choose>
	                    <c:when test="${not empty Propiedad.getURLimagenPrincipal()}">
	                        <img src="${pageContext.request.contextPath}/${Propiedad.getURLimagenPrincipal()}" class="card-img-top" alt="${Propiedad.getTitulo()}" width="300" height="300">
	                    </c:when>
	                    <c:otherwise>
	                        <img src="https://st.depositphotos.com/2934765/53192/v/380/depositphotos_531920820-stock-illustration-photo-available-vector-icon-default.jpg" class="card-img-top" alt="Imagen no disponible" width="300" height="300">
	                    </c:otherwise>
	               		 </c:choose>
	                    <div class="card-body">
	                        <h5 class="card-title">${Propiedad.getTitulo()}</h5>
	                        <p class="card-text">${Propiedad.getResenia()}</p>
	                        <a href="${pageContext.request.contextPath}/ServletPropiedadCompleta?id=${Propiedad.getId()}&source=admin" class="btn btn-primary">Editar</a>
	                    </div>
	                </div>
	            </div>
	        </c:forEach>
	    </div>
	</div>
</body>
</html>