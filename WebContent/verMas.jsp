<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Ajusta el diseño para móviles, adaptando el ancho al dispositivo y garantizando un comportamiento responsive. -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>${Propiedad.getTitulo()}</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<header>
    <jsp:include page="menu.jsp" />
</header>
<div class="container mt-4">
    <h1 class="text-center">${Propiedad.getTitulo()}</h1>
    <p class="text-center"><strong>Precio:</strong> ${Propiedad.getPrecio()}</p>
    <p class="text-center"><strong>Reseña:</strong> ${Propiedad.getResenia()}</p>
    <p class="text-center"><strong>Descripción:</strong> ${Propiedad.getDescripcion()}</p>
    <p class="text-center"><strong>Localidad:</strong> ${Propiedad.getLocalidad()}</p>
    
    <!-- Carrusel de imágenes -->
    <div id="propertyCarousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <c:forEach var="imagen" items="${Propiedad.getURLimagenes()}" varStatus="status">
                <div class="carousel-item ${status.first ? 'active' : ''}">
                    <img src="${imagen}" class="d-block w-100" alt="Imagen de propiedad">
                </div>
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
        <div class="col-12">
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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>