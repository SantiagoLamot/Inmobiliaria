<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<form action="${pageContext.request.contextPath}/ServletGuardarPropiedad" method="post" enctype="multipart/form-data">	
			<div class="row mb-4">
				<div class="col-md-12 centrar">
					<h1>Agregar Propiedad</h1>
				</div>
			</div>
			
			<div class="row mb-4">
				<div class="col-md-3 centrar">
					<h3>Titulo</h3>
				</div>
				<div class="col-md-9 centrar">
					<input type="text" name="txtTitulo">
				</div>
			</div>
			
			<div class="row mb-4">
				<div class="col-md-3 centrar">
					<h3>Localidad</h3>
				</div>
				<div class="col-md-9 centrar">
					<input type="text" name="txtLocalidad">
				</div>
			</div>
					
			<div class="row mb-4">
				<div class="col-md-3 centrar">
					<h3>Precio</h3>
				</div>
				<div class="col-md-9 centrar">
					<input type="text" name="txtPrecio">
				</div>
			</div>
				
			<div class="row mb-4">
				<div class="col-md-3 centrar">
					<h3>Reseña</h3>
				</div>
				<div class="col-md-9 centrar">
					<textarea name="txtResenia"></textarea>
				</div>
			</div>
			
			
			<div class="row mb-4">
				<div class="col-md-3 centrar">
					<h3>Descripcion</h3>
				</div>
				<div class="col-md-9 centrar">
					<textarea name="txtDescripcion" rows="20"></textarea>
				</div>
			</div>
			
			<div class="row mb-4">
				<div class="col-md-3 centrar">
					<h3>URL Google Maps</h3>
				</div>
				<div class="col-md-9 centrar">
					<input name="textUrlMaps" rows="20">
				</div>
			</div>
						
			<div class="row mb-4">
				<div class="col-md-3 centrar">
					<h3>Imagen</h3>
				</div>
				<div class="col-md-9 centrar">
					<input type="file" multiple name="fImagen">
				</div>
			</div>
		
			<div class="row mb-4">
				<div class="col-md-12 centrar">
					<input type="submit" name="btnGuardar" value="Guardar">
				</div>
			</div>
      </form>
   </div>
</body>
</html>