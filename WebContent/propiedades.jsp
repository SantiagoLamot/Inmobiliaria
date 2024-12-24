<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Ajusta el diseño para móviles, adaptando el ancho al dispositivo y garantizando un comportamiento responsive. -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Propiedades</title>
<link rel="stylesheet" href="css/styles.css">
<link rel="icon" href="${pageContext.request.contextPath}/logos/icono.png"/>
</head>
<body>
<jsp:include page="menu.jsp"/>
<div class="container mt-4">
    <h1 class="text-center">¡Nuestras propiedades!</h1>
    <div class="row">
        <c:forEach var="Propiedad" items="${propiedadesPaginadas}">
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
                        <p class="card-text">${Propiedad.getResenia()}</p>
                        <a href="${pageContext.request.contextPath}/ServletPropiedadCompleta?id=${Propiedad.getId()}" class="btn btn-primary">Ver más</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
        <!-- paginacion -->
        <div class="row" style="display: flex; justify-content: center; align-items: center; height: 100%;">
	    	<div class="col-lg-4 col-md-6 col-sm-12 mb-4" style="display: flex; justify-content: center; align-items: center; height: 100%;">
		        <nav>
			    <ul class="pagination justify-content-center">
			        <c:if test="${currentPage > 1}">
			            <li class="page-item">
			                <a class="a btn btn-pagination" href="${pageContext.request.contextPath}/ServletObtenerPropiedadesPaginadas?page=${currentPage - 1}">&laquo; Anterior</a>
			            </li>
			        </c:if>
			        <c:forEach begin="1" end="${totalPages}" var="i">
			            <li class="page-item ${i == currentPage ? 'active' : ''}">
			                <a class="a btn btn-pagination" href="${pageContext.request.contextPath}/ServletObtenerPropiedadesPaginadas?page=${i}">${i}</a>
			            </li>
			        </c:forEach>
			        <c:if test="${currentPage < totalPages}">
			            <li class="page-item">
			                <a class="a btn btn-pagination" href="${pageContext.request.contextPath}/ServletObtenerPropiedadesPaginadas?page=${currentPage + 1}">Siguiente &raquo;</a>
			            </li>
			        </c:if>
			    </ul>
				</nav>
	    	</div>
		</div>
        
        
</div>
<jsp:include page="footer.jsp" />
</body>
</html>