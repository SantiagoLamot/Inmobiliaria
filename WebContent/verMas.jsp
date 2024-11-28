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
<header >
	<body> <jsp:include page="menu.jsp" /> </body>
</header>


<div class="container mt-4">
    <h1 class="text-center">${Propiedad.getTitulo()}</h1>
    <p class="text-center"><strong>Precio:</strong> ${Propiedad.getPrecio()}</p>
    <p class="text-center"><strong>Reseña:</strong> ${Propiedad.getResenia()}</p>
    <p class="text-center"><strong>Descripción:</strong> ${Propiedad.getDescripcion()}</p>
    <p class="text-center"><strong>Localidad:</strong> ${Propiedad.getLocalidad()}</p>
    <c:forEach var="imagen" items="${Propiedad.getURLimagenes()}">
	    <img src="${imagen}" class="card-img-top" alt="${imagen}">
	</c:forEach>
    <p class="text-center"><strong>Ubicacion:</strong></p>
    <div class="row mt-4">
        <div class="col-12">
            <iframe
                src="${Propiedad.getURLmaps()}"
                width="100%"
                height="500"
                style="border:0;"
                allowfullscreen=""
                loading="lazy"
                referrerpolicy="no-referrer-when-downgrade">
            </iframe>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>