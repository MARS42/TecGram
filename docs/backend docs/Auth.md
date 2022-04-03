# Backend: *Auth*
**Archivo:**  [*auth.dart*]()
**Clase:**  *auth*
**Widget:** *No*
## Funcionalidad
Clase que realiza las operaciones y se comunica con el servicio backend de la aplicación.
Haciendo el registro e inicio de sesión mediante peticiones *POST HTTP*.
## Métodos
- **login - *async***
Crea una petición *HTTP POST* al servicio backend proporcionando en el body un *JSON* con el correo electrónico y contraseña del usuario a ingresar.
Devuelve un arreglo con el *mensaje* de la petición y el *body* del resultado.
- **signUp - *async***
Crear una petición *HTTP POST* al servicio backend proporcionando en el body un *JSON* con los datos a registrar del usuario.
Devolviendo el resultado de la petición mediante un *diccionario*.
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTExNjU5MDIxOF19
-->