# Activity: *Sign Up Page*
**Archivo:**  [*signup_page.dart*  ](../../lib/pages/singup_page.dart)
**Clase:**  *SigUpPage*  
**Widget:**  *Stateful* 
## Funcionalidad
Actividad que realiza el registro de un nuevo usuario en la aplicación.
Consiste en una serie de campos:
- **Selección del modo de registro:** Estudiante, profesor y departamento.
- **Datos personales:** Campos de nombre(s), apellidos, *si es alumno **semestre**, sí es profesor o departamento **se omite***.
- **Datos de acceso:** Dos campos para ingresar el correo institucional y la contraseña para la aplicación.
- **Selección de carrera o departamento:** Si es ***estudiante*** se elige carrera, si es ***profesor o departamento*** se elige departamento.

La funcionalidad de registro se hace por medio del botón ***Registrarse.*** que ejecuta el método ***verificarFormulario***
## Métodos
- **cambiarRol**
Cambia la variable que almacena el rol a registrar, además de actualizar el widget.
- **cambiarCarreraDepto**
Asigna el valor tomado por la selección de carrera o departamento.
- **verificarFormulario**
Verifica el formulario realizando una evaluación de los campos si es que están vacíos, luego se realiza la llamada en una instancia de [Auth](../backend%20docs/Auth.md) para hacer el registro del usuario en el *backend* teniendo los siguientes escenarios:
	- **Sí falla el registro:** Se notifica el error mediante un *Snackbar*.
	- **Sí no hay errores:** Se notifica el registro exitoso y navega a la actividad de iniciar sesión ([Login Page]()).
<!--stackedit_data:
eyJoaXN0b3J5IjpbMjE0MDM1MjgyMSwtNTgxNjUxMjAxLC0yMT
Y2MDU3OTAsLTE2OTIyNTk5MTddfQ==
-->