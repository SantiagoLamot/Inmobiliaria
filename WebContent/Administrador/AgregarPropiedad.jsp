<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Ajusta el diseño para móviles, adaptando el ancho al dispositivo y garantizando un comportamiento responsive. -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Agregar propiedad</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            color: #333;
        }
        .centrar {
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="number"], textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        textarea {
            height: 150px;
        }
        input[type="file"] {
            margin-top: 10px;
        }
        .card {
            display: flex;
            flex-direction: column;
            min-height: 100%;
        }
        .card-body {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
    </style>
</head>
<body>
    <jsp:include page="menu.jsp" />
    <div class="container mt-4">
        <h1 class="text-center mb-4">Agregar Propiedad</h1>
        
        <form action="${pageContext.request.contextPath}/ServletGuardarPropiedad" method="post" enctype="multipart/form-data">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group mb-3">
                        <label for="txtTitulo">Título</label>
                        <input type="text" name="txtTitulo" id="txtTitulo" required class="form-control">
                    </div>
                    
                    <div class="form-group mb-3">
                        <label for="txtLocalidad">Localidad</label>
                        <input type="text" name="txtLocalidad" id="txtLocalidad" required class="form-control">
                    </div>
                    
                    <div class="form-group mb-3">
                        <label for="txtPrecio">Precio</label>
                        <input type="number" step="0.01" name="txtPrecio" id="txtPrecio" class="form-control">
                    </div>
                    
                    <div class="form-group mb-3">
                        <label for="txtResenia">Reseña</label>
                        <textarea name="txtResenia" id="txtResenia" rows="5" required class="form-control"></textarea>
                    </div>
                    
                    <div class="form-group mb-3">
                        <label for="txtDescripcion">Descripción</label>
                        <textarea name="txtDescripcion" id="txtDescripcion" rows="10" required class="form-control"></textarea>
                    </div>
                    
                    <div class="form-group mb-3">
                        <label for="textUrlMaps">URL Google Maps</label>
                        <input type="url" name="textUrlMaps" id="textUrlMaps" required class="form-control">
                    </div>
                </div>
                
                <div class="col-md-6">
                    <div class="form-group mb-3">
                        <label for="fImagen">Imágenes (selecciona varias)</label>
                        <input type="file" name="fImagen" id="fImagen" multiple required class="form-control-file">
                    </div>
                </div>
            </div>
            
            <div class="row mt-4">
                <div class="col-md-12 text-center">
                    <button type="submit" name="btnGuardar" class="btn btn-primary">Guardar</button>
                </div>
            </div>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>