<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="entidades.Propiedad" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Ajusta el diseño para móviles, adaptando el ancho al dispositivo y garantizando un comportamiento responsive. -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>${Propiedad.getTitulo()}</title>
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<header>
    <jsp:include page="menu.jsp" />
</header>
<div class="container mt-4">
    <div class="row mb-4">
		<div class="col-md-12 centrar text-center">
    		<h1 class="text-center">${Propiedad.getTitulo()}</h1>
		    <p>
    			<c:out value="${Propiedad.getResenia()}" escapeXml="false" />
			</p>
		</div>
	</div>
	
    <div class="row mb-4">
		<div class="col-md-12 centrar text-center">
		    <c:if test="${Propiedad.getPrecio() != '' && Propiedad.getPrecio() != null}">
			    <p class="text-center"><strong>Precio:</strong>${Propiedad.getPrecio()} </p>
			</c:if>
			<c:if test="${Propiedad.getPrecio() == '' || Propiedad.getPrecio() == null}">
				<p class="text-center"><strong>Consulta el precio </strong></p>
				<a href="${UrlWhatsapp}" target="_blank"  class="text-center">
					<img src="<%=request.getContextPath()%>/logos/logoWhatsapp.png" alt="Whatsapp">
				</a>
			</c:if>
		</div>
	</div>	
	<div class="row mb-4">
		<div class="col-md-12 centrar text-center">
		    <%
		    Propiedad propiedad = (Propiedad) session.getAttribute("Propiedad");
		    String descripcion = "<br>";
		    if (propiedad != null) {
		        descripcion += propiedad.getDescripcion();
		        if (descripcion != null) {
		            descripcion = descripcion.replace("\n", "<br>");
		        }
		    }
            %>
            <p class="text-center"><strong>Descripción:</strong> <%= descripcion %></p>
		</div>
	</div>	
    <div class="row mb-4">
		<div class="col-md-12 centrar text-center">
		    <p class="text-center"><strong>Localidad:</strong> ${Propiedad.getLocalidad()}</p>
		</div>
	</div>	
    <!-- Carrusel de imágenes -->
    <div id="propertyCarousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <c:forEach var="imagen" items="${Propiedad.getImagenes()}" varStatus="status">
                <c:if test="${not empty imagen.getURLimagen()}">
                	<div class="carousel-item ${status.first ? 'active' : ''}">
                   		<img src="${pageContext.request.contextPath}/${imagen.getURLimagen()}" class="d-block w-100" alt="Imagen de propiedad">
              		</div>
              	</c:if>
            </c:forEach>
        </div>
        <!-- Controles del carrusel -->
        <a class="carousel-control-prev" href="#propertyCarousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Anterior</span>
        </a>
        <a class="carousel-control-next" href="#propertyCarousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Siguiente</span>
        </a>
    </div>

    <p class="text-center"><strong>Ubicacion:</strong></p>
    <div class="row mt-4">
        <div class="col-12 d-flex justify-content-center">
            <iframe
                src="${Propiedad.getURLmaps()}"
                width="75%"
                height="300"
                style="border:0;"
                allowfullscreen=""
                loading="lazy"
                referrerpolicy="no-referrer-when-downgrade">
            </iframe>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>