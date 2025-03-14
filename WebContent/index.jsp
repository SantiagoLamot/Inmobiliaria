<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Ajusta el dise�o para m�viles, adaptando el ancho al dispositivo y garantizando un comportamiento responsive. -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="css/styles.css">
<!-- Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Paula Uzubiaga Casas & Campos</title>
<link rel="icon" href="${pageContext.request.contextPath}/logos/icono.png"/>
</head>
<jsp:include page="menu.jsp"/>
<body>
<c:import url="/ServletObtenerResumenPropiedades" />
<div class="container mt-4">
    <h1 class="text-center">�Bienvenido!</h1>
    <p class="text-center">Encuentra la propiedad de tus sue�os con nosotros.</p>
    <div class="row">
        <c:set var="contador" value="0" />
        <c:forEach var="Propiedad" items="${Propiedades}">
            <c:if test="${contador < 3}">
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
                    <div class="card-body text-center">
                        <h5 class="card-title">${Propiedad.getTitulo()}</h5>
                        <p>
    						<c:out value="${Propiedad.getResenia()}" escapeXml="false" />
						</p>
                        <a href="${pageContext.request.contextPath}/ServletPropiedadCompleta?id=${Propiedad.getId()}" class="btn btn-primary">Ver m�s</a>
                    </div>
                </div>
            </div>
            <c:set var="contador" value="${contador + 1}" />
   		 	</c:if>
        </c:forEach>
    </div>
   <div class="row" style="display: flex; justify-content: center; align-items: center; height: 100%;">
	    <div class="col-lg-4 col-md-6 col-sm-12 mb-4" style="display: flex; justify-content: center; align-items: center; height: 100%;">
	        <a href="${pageContext.request.contextPath}/ServletObtenerPropiedadesPaginadas?page=1" class="btn btn-primary" style="display: flex; justify-content: center; align-items: center;">Ver todas las propiedades</a>
	    </div>
	</div>
</div>
</body>
<jsp:include page="footer.jsp" />
</html>