<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Contacto - Paula Uzubiaga Casas & Campos</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="icon" href="${pageContext.request.contextPath}/logos/icono.png"/>
</head>
<body>
    <jsp:include page="menu.jsp"/>
    
    <div class="container mt-4 body-contactos">
        <div class="text-center">
            <h1>¡Contáctate con nosotros!</h1>
            <h3 class="mt-3">Nuestros medios de contacto</h3>
        </div>
        
        <div class="text-center mt-4">
            <!-- WhatsApp -->
            <c:if test="${not empty contacto.getUrlWhatsapp()}">
                <a href="${contacto.getUrlWhatsapp()}" target="_blank">
                    <img src="<%=request.getContextPath()%>/logos/logoWhatsapp.png" alt="WhatsApp">
                </a>
            </c:if>
            <!-- Facebook -->
            <c:if test="${not empty contacto.getUrlfacebook()}">
                <a href="${contacto.getUrlfacebook()}" target="_blank">
                    <img src="<%=request.getContextPath()%>/logos/logoFacebook.png" alt="Facebook">
                </a>
            </c:if>
            <!-- Instagram -->
            <c:if test="${not empty contacto.getUrlInstagram()}">
                <a href="${contacto.getUrlInstagram()}" target="_blank">
                    <img src="<%=request.getContextPath()%>/logos/logoInstagram.png" alt="Instagram">
                </a>
            </c:if>
        </div>
        
        <div class="text-center mt-5">
            <h3>Pasa por nuestra Oficina</h3>
            <p>${contacto.getDireccion()}</p>
        </div>
        
        <div class="d-flex justify-content-center mt-4">
            <iframe src="${contacto.getUrlMaps()}" width="75%" height="250" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
        </div>
    </div>
    
    <jsp:include page="footer.jsp"/>
</body>
</html>