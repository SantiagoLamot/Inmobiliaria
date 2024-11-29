<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
            <h1 class="text-center">Edicion servicios</h1>
        </div>
    </div>
    <div class="table-responsive">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Servicio</th>
                    <th>Estado</th>
                    <th>Edicion</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="objeto" items="${Servicios}">
                    <tr>
                        <td>${objeto.getServicio()}</td>
                        <td>${objeto.isEstado() ? "Activo" : "Inactivo"}</td>
                        <td>
                            <!-- Formulario para modificar -->
                            <form action="${pageContext.request.contextPath}/ServletEditarServicios" method="post" class="form-inline">
                                <input type="hidden" name="idServicio" value="${objeto.getId()}">
                                <div class="form-group mb-2">
                                    <input type="text" class="form-control" name="txtServicio" id="${objeto.getId()}" value="${objeto.getServicio()}">
                                </div>
                                <div class="form-group mx-sm-3 mb-2">
                                    <select class="form-control" name="SelectEstado">
                                        <option value="true" ${objeto.isEstado() ? "selected" : ""}>Activo</option>
                                        <option value="false" ${!objeto.isEstado() ? "selected" : ""}>Inactivo</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary mb-2">Actualizar</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>