<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Ajusta el diseño para móviles, adaptando el ancho al dispositivo y garantizando un comportamiento responsive. -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Inmobiliaria Paula Uzubiaga</title>

</head>
<body>
<jsp:include page="menu.jsp" />
<div class="container mt-4">
    <form action="${pageContext.request.contextPath}/ServletEditarContactos" method="post">
			<div class="row mb-4">
				<div class="col-md-12 centrar">
					<h1 class="text-center">Edicion redes sociales</h1>
				</div>
			</div>
			<!-- facebook -->
			<div class="row mb-4">
				<div class="col-md-1 centrar">
					<img alt="Logo agregar imagen" src="<%=request.getContextPath()%>/logos/logoFacebook.png">
				</div>
				<div class="col-md-11 centrar">
					<input type="text" class="form-control" name = "txtFacebook" value="${contacto.getUrlfacebook()}">
				</div>
			</div>
			<!-- insta -->
			<div class="row mb-4">
				<div class="col-md-1 centrar">
				<img alt="Logo agregar imagen" src="<%=request.getContextPath()%>/logos/logoInstagram.png">
				</div>
				<div class="col-md-11 centrar">
					<input type="text" class="form-control" name = "txtInsta" value="${contacto.getUrlInstagram()}" >
				</div>
			</div>
			<!--  what-->
			<div class="row mb-4">
				<div class="col-md-1 centrar">
					<img alt="Logo agregar imagen" src="<%=request.getContextPath()%>/logos/logoWhatsapp.png">
				</div>
				<div class="col-md-11 centrar">
					<input type="text" class="form-control" name = "txtWhats" value="${contacto.getUrlWhatsapp()}">
				</div>
			</div>
			
			<!--  Google Maps-->
			<div class="row mb-4">
				<div class="col-md-1 centrar">
					<img alt="Logo agregar imagen" src="<%=request.getContextPath()%>/logos/logoMaps.png">
				</div>
				<div class="col-md-11 centrar">
					<input type="text" class="form-control" name = "txtMaps" value="${contacto.getUrlMaps()}">
				</div>
			</div>
			<!--  Direccion-->
			<div class="row mb-4">
				<div class="col-md-1 centrar">
					<img alt="Logo agregar imagen" src="<%=request.getContextPath()%>/logos/logoDireccion.png">
				</div>
				<div class="col-md-11 centrar">
					<input type="text" class="form-control" name = "txtDireccion" value="${contacto.getDireccion()}">
				</div>
			</div>
				
			<div class="row mt-4">
                <div class="col-md-12 text-center">
                    <button type="submit" name="btnGuardar" class="btn btn-primary">Guardar</button>
                </div>
            </div>
		</form>
</div>
</body>
</html>