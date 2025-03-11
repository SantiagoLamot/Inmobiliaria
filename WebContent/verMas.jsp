<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="entidades.Propiedad" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>${Propiedad.getTitulo()} - Paula Uzubiaga Casas & Campos</title>
<link rel="stylesheet" href="css/styles.css">
<link rel="icon" href="${pageContext.request.contextPath}/logos/icono.png"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>
<header>
    <jsp:include page="menu.jsp" />
</header>
<div class="container mt-4">
    <div class="row mb-4 text-center">
        <div class="col-md-12">
            <h1>${Propiedad.getTitulo()}</h1>
            <p><c:out value="${Propiedad.getResenia()}" escapeXml="false" /></p>
        </div>
    </div>
    <!--  IMAGEN-->
    <div id="propertyCarousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <c:forEach var="imagen" items="${Propiedad.getImagenes()}" varStatus="status">
                <c:if test="${not empty imagen.getURLimagen()}">
                    <div class="carousel-item ${status.first ? 'active' : ''}">
                        <img src="${pageContext.request.contextPath}/${imagen.getURLimagen()}" class="d-block w-100" alt="Imagen de propiedad" data-toggle="modal" data-target="#imageModal" data-image="${pageContext.request.contextPath}/${imagen.getURLimagen()}">
                    </div>
                </c:if>
            </c:forEach>
        </div>
        <!--  BTN CAROUSEL-->
        <a class="carousel-control-prev" href="#propertyCarousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Anterior</span>
        </a>
        <a class="carousel-control-next" href="#propertyCarousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Siguiente</span>
        </a>
    </div>
    <!--  VER IMAGEN COMP-->
    <div class="modal fade" id="imageModal" tabindex="-1" role="dialog" aria-labelledby="imageModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Imagen completa</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body text-center">
                    <img id="modalImage" src="" alt="Imagen completa" class="img-fluid">
                </div>
            </div>
        </div>
    </div>
    
      <!--Localidad  -->
    <div class="row mb-4">
    	<div class="col-md-12">
       		<div class="d-inline-block">
            	<img src="${pageContext.request.contextPath}/logos/logoLocalidad.png" class="mb-0" style="display: inline-block; vertical-align: middle;">
            	<p class="mb-0 d-inline-block" style="vertical-align: middle; margin-left: 10px;">
                	<strong>${Propiedad.getLocalidad()}</strong>
            	</p>
        	</div>
    	</div>
	</div>
    
    <!--  Precio -->
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
	
	<!--  Descripcion-->
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
            <p class="text-center"><strong>Descripción:</strong></p>
            <p class="text-left"><%= descripcion %></p>
		</div>
	</div>
    <!--  API GOOGLEMPS-->
    <div class="row mb-4 text-center">
        <div class="col-md-12">
            <p><strong>Ubicación:</strong></p>
            <iframe src="${Propiedad.getURLmaps()}" width="75%" height="300" style="border:0;" allowfullscreen loading="lazy"></iframe>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp" />
<script>
$(document).ready(function() {
    $('#imageModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var imageSrc = button.data('image');
        var modalImage = $('#modalImage');
        modalImage.attr('src', imageSrc);
    });
});
</script>
</body>
</html>
