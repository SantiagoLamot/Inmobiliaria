<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="entidades.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Ajusta el diseño para móviles, adaptando el ancho al dispositivo y garantizando un comportamiento responsive. -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Editar Propiedad</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="menu.jsp" />
    <div class="container mt-4">
        <form action="${pageContext.request.contextPath}/ServletEliminarPropiedad?idP=${Propiedad.getId()}" method="post">
       		<h1 class="text-center mb-4">Editar Propiedad</h1>
       		<div class="row mt-4">
                <div class="col-md-12 text-center">
                    <button type="submit" name="btnEliminarPropiedad" class="btn btn-danger btn-sm">Eliminar Propiedad</button>
                </div>
            </div>
        </form>
        <form action="${pageContext.request.contextPath}/ServletActualizarPropiedad?idP=${Propiedad.getId()}" method="post" enctype="multipart/form-data">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group mb-3">
	             		<input type="hidden" name="idPropiedad" value="${Propiedad.getId()}">
                        <label for="txtTitulo">Título</label>
                        <input type="text" name="txtTitulo" id="txtTitulo" value="${Propiedad.getTitulo()}" required class="form-control" >
                    </div>
                    
                    <div class="form-group mb-3">
                        <label for="txtLocalidad">Localidad</label>
                        <input type="text" name="txtLocalidad" id="txtLocalidad" value="${Propiedad.getLocalidad()}" required class="form-control">
                    </div>
                    
                    <div class="form-group mb-3">
                        <label for="txtPrecio">Precio</label>
                        <input type="number" step="0.01" name="txtPrecio" id="txtPrecio" value="${Propiedad.getPrecio()}" class="form-control">
                    </div>
                    
                    <div class="form-group mb-3">
                        <label for="txtResenia">Reseña</label>
                        <textarea name="txtResenia" id="txtResenia" rows="5" required class="form-control">${Propiedad.getResenia()}</textarea>
                    </div>
                    
                    <div class="form-group mb-3">
                        <label for="txtDescripcion">Descripción</label>
                        <textarea name="txtDescripcion" id="txtDescripcion" rows="10" required class="form-control">${Propiedad.getDescripcion()}</textarea>
                    </div>
                    
                    <div class="form-group mb-3">
                        <label for="textUrlMaps">URL Google Maps</label>
                        <input type="url" name="textUrlMaps" id="textUrlMaps" value="${Propiedad.getURLmaps()}" required class="form-control">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group mb-3">
                        <label for="fImagen">Imágenes (selecciona varias)</label>
                        <input type="file" name="fImagen" id="fImagen" multiple class="form-control-file">
                    </div>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-md-12 text-center">
                    <button type="submit" name="btnGuardar" class="btn btn-primary">Guardar</button>
                </div>
            </div>
        </form>
        
      <div id="propertyCarousel" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
        <c:forEach var="imagen" items="${Propiedad.getImagenes()}" varStatus="status">
            <c:if test="${not empty imagen.getURLimagen()}">
                <div class="carousel-item ${status.first ? 'active' : ''}">
                    <!-- Imagen -->
                    <img src="${pageContext.request.contextPath}/${imagen.getURLimagen()}" class="d-block w-100" alt="Imagen de propiedad">

                    <div class="carousel-caption d-flex justify-content-center">
                        <form action="${pageContext.request.contextPath}/ServletEliminarImagenSetPrincipal" method="get" class="mr-2">
                            <input type="hidden" name="idImagen" value="${imagen.getIdImagen()}">
                            <input type="hidden" name="UrlImagen" value="${imagen.getURLimagen()}">
                            <input type="hidden" name="idPropiedad" value="${Propiedad.getId()}">
                            <button type="submit" name="btnEliminar" class="btn btn-danger btn-sm">Eliminar</button>
                            <button type="submit" name="btnSetPrincipal" class="btn btn-primary btn-sm">Elegir como principal</button>
                        </form>
                    </div>
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
    </div>
</body>
</html>