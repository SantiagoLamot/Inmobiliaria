<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- para que anden los foreach y agregar librerias a webinf -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="entidades.Contacto" %>
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
    <div class="row mb-4">
		<div class="col-md-12 centrar">
			<h1 class="text-center">¡Contactate con nosotros!</h1>
		</div>
	</div>
	<div class="row mb-4">
		<div class="col-md-12 centrar">
			<h3 class="text-center">Nuestros medios de contactos</h1>
		</div>
	</div>
	<div class="row mb-4">
		<div class="col-md-12 centrar text-center">
	<!-- whatsapp -->
	<c:if test="${contacto.getUrlWhatsapp() != '' && contacto.getUrlWhatsapp() != null}">
		<a  href="${contacto.getUrlWhatsapp()}" target="_blank"  class="text-center">
			<img src="<%=request.getContextPath()%>/logos/logoWhatsapp.png" alt="Facebook">
		</a>
	</c:if>
	
	<!-- facebook -->
	<c:if test="${contacto.getUrlfacebook() != '' && contacto.getUrlfacebook() != null}">
				<a href="${contacto.getUrlfacebook()}" target="_blank">
			    	<img src="<%=request.getContextPath()%>/logos/logoFacebook.png" alt="Facebook">
			    </a>
	</c:if>
	
	<!-- instagram -->
	<c:if test="${contacto.getUrlInstagram() != '' && contacto.getUrlInstagram() != null}">
				<a href="${contacto.getUrlInstagram()}" target="_blank">
			    	<img src="<%=request.getContextPath()%>/logos/logoInstagram.png" alt="Facebook">
			    </a>
	</c:if>
			</div>
	</div>
	
	<!-- Google Maps -->
	<div class="row mb-4">
		<div class="col-md-12 centrar">
			<h3 class="text-center">Pasa por nuestra Oficina</h3>
			<p class="text-center">${contacto.getDireccion()}</p>
		</div>
	</div>
	<div class="row mt-4">
        <div class="col-12 d-flex justify-content-center">
            <iframe
                src="${contacto.getUrlMaps()}"
                width="75%"
                height="250"
                style="border:0;"
                allowfullscreen=""
                loading="lazy"
                referrerpolicy="no-referrer-when-downgrade">
            </iframe>
        </div>
    </div>
			                
</div>
</body>
</html>