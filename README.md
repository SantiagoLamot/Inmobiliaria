Sitio Web para Inmobiliaria
Este proyecto consiste en el desarrollo de un sitio web para una inmobiliaria que permite gestionar propiedades, mostrar listados a clientes y subir imágenes de los inmuebles. Está desarrollado con Java, utilizando JSP/Servlets, MySQL como base de datos y tecnologías web modernas para la interfaz de usuario.

Características principales
Registro y gestión de propiedades (título, precio, ubicación, descripción, etc.).
Subida y almacenamiento de imágenes asociadas a cada propiedad.
Visualización de propiedades en una interfaz amigable para los usuarios.
Funcionalidades específicas para administradores, como la gestión de datos.
Integración con mapas para mostrar ubicaciones de los inmuebles.

Tecnologías utilizadas
Backend
Java (JSP/Servlets): Para la lógica del negocio y manejo de solicitudes HTTP.
MySQL: Base de datos relacional para almacenar propiedades, imágenes y otros datos.
DAO (Data Access Object): Patrón para manejar operaciones con la base de datos.

Frontend
HTML/CSS: Para la estructura y estilo de la página web.
Bootstrap: Para el diseño responsivo.
JavaScript: Para interactividad en el sitio.

Servidor
Apache Tomcat: Servidor de aplicaciones para desplegar el proyecto.

Estructura del proyecto
bash
/src
  ├── entidades/         # Clases modelo (Propiedad, Imagen, etc.)
  ├── negocio/           # Lógica de negocio y validaciones
  ├── servlet/           # Controladores para manejar solicitudes HTTP
  ├── dao/               # Operaciones de base de datos
/web
  ├── index.jsp          # Página principal
  ├── propiedades.jsp    # Listado de propiedades
  ├── detalle.jsp        # Detalle de cada propiedad
  ├── admin/             # Panel de administración
/uploads                 # Carpeta para almacenar imágenes subidas
Requisitos del sistema
Java 8+
Apache Tomcat 9+
MySQL 5.7+
Eclipse IDE o IntelliJ IDEA
Configuración e instalación
Clona este repositorio:


Autor
Desarrollado por Santiago Lamot.
Si tienes preguntas o sugerencias, no dudes en contactarme: santiagolamot25@hotmail.com