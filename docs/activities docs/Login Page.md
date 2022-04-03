# Activity: *Login Page*
**Archivo:**  [*login_page.dart*](../../lib/pages/login_page.dart)
**Clase:**  *LoginPage*
**Widget:** *Stateful*
## Funcionalidad
Actividad que muestra un formulario de dos campos:
- **Correo**
- **Contraseña**

Y dos acciones posibles:
- **Ingresar**: Llama el método de *verificarFormulario*.*
- **No tengo cuenta:** Llama el método de *registrarse*.

Realiza el inicio de sesión para poder utilizar la aplicación.
## Métodos
- **verificarFormulario:** Realiza la llamada a una instancia de [Auth](../backend%20docs/Auth.md) para realizar el inicio de sesión con dos posibles escenarios:
	- ***Sí no hay errores:*** Se navega a la actividad principal ([Main Page](Main%20Page.md)).
	- ***Sí hay errores:*** Notifica que el correo o contraseña no son válidos mediante un mensaje de *Snackbar*.
-**registrarse:**  Navega a la actividad de registro de nuevo usuario ([Sign Up Page](Sign%20Up%20Page.md)).
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTA4NzAxNzE2OCwtMTI5NDUxMTk0LDIxOD
AxMTUxMywtMTYyNDI2MzUzNSw5NzcyODY0NiwtMTkwMzE4MTU3
OF19
-->