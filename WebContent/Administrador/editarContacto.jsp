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
<%-- <jsp:include page="menu.jsp" /> --%>
<div class="container mt-4">
    <form action="${pageContext.request.contextPath}/ServletEditarContactos" method="post">
			<div class="row mb-4">
				<div class="col-md-12 centrar">
					<h1>Edicion redes sociales</h1>
				</div>
			</div>
			<!-- facebook -->
			<div class="row mb-4">
				<div class="col-md-1 centrar">
					<img alt="Logo agregar imagen" src="<%=request.getContextPath()%>/logos/logoFacebook.png">
				</div>
				<div class="col-md-11 centrar">
					<input type="text" name = "txtFacebook" value="${contacto.getUrlfacebook()}">
				</div>
			</div>
			<!-- insta -->
			<div class="row mb-4">
				<div class="col-md-1 centrar">
				<img alt="Logo agregar imagen" src="<%=request.getContextPath()%>/logos/logoInstagram.png">
				</div>
				<div class="col-md-11 centrar">
					<input type="text" name = "txtInsta" value="${contacto.getUrlInstagram()}" >
				</div>
			</div>
			<!--  what-->
			<div class="row mb-4">
				<div class="col-md-1 centrar">
					<img alt="Logo agregar imagen" src="<%=request.getContextPath()%>/logos/logoWhatsapp.png">
				</div>
				<div class="col-md-11 centrar">
					<input type="text" name = "txtWhats" value="${contacto.getUrlWhatsapp()}">
				</div>
			</div>
			
			<!--  Google Maps-->
			<div class="row mb-4">
				<div class="col-md-1 centrar">
					<img alt="Logo agregar imagen" src="<%=request.getContextPath()%>/logos/logoMaps.png">
				</div>
				<div class="col-md-11 centrar">
					<input type="text" name = "txtMaps" value="${contacto.getUrlMaps()}">
				</div>
			</div>
			<!--  Direccion-->
			<div class="row mb-4">
				<div class="col-md-1 centrar">
					<img alt="Logo agregar imagen" src="<%=request.getContextPath()%>/logos/logoDireccion.png">
				</div>
				<div class="col-md-11 centrar">
					<input type="text" name = "txtDireccion" value="${contacto.getDireccion()}">
				</div>
			</div>
				
			<div class="row mb-4">
				<div class="col-md-12 centrar">
					<input type="submit" name="btnGuardar" value="Guardar">
				</div>
			</div>
		</form>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>