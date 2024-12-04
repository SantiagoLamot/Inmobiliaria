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
        <h1 class="text-center mb-4">Iniciar Sesion</h1>
        <form action="${pageContext.request.contextPath}/ServletInicioSesionAdmin" method="post">
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group mb-3">
                        <label>Usuario</label>
                        <input type="text" name="txtUsuario" required class="form-control" >
                    </div>
                    
                    <div class="form-group mb-3">
                        <label>Contraseña</label>
                        <input type="password" name="txtContrasenia" required class="form-control">
                    </div>
                    <div class="row mt-4">
	                	<div class="col-md-12 text-center">
	                   		<button type="submit" name="btnIniciarSesion" class="btn btn-primary">Iniciar sesion</button>
	                		<p>${Mensaje}</p>
	                	</div>
            		</div>
            	</div>
            </div>
        </form>
	</div>
</body>
</html>