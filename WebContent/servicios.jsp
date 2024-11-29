<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!--  PARA QUE ANDE EL FOREACH hay qie incluir dos bibliotecas en el webinf/lib-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="entidades.Servicio" %>    
    
    
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
    <div class="row mb-4">
		<div class="col-md-12 centrar">
			<h1 class="text-center">¡Nuestros servicios!</h1>
		</div>
	</div>
	<c:forEach items="${sessionScope.Servicios}" var="serv">
		<div class="row mb-4">
			<div class="col-md-12 centrar">
				<p class="text-center">-${serv.getServicio()}</p>
			</div>
		</div>
	</c:forEach> 
</div>               	
                	
</body>
</html>