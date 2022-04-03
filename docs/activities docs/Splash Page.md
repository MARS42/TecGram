# Activity: *Splash Page*

**Archivo:** [*splash_page.dart*](../../lib/pages/splash_page.dart)

**Clase:** *SplashPage*

**Widget**: *Stateful*

## Funcionalidad
Actividad que realiza una verificación de sesión local almacenada en el dispositivo con dos posibles resultados:
- **Sí hay una sesión almacenada:** Navega a la actividad principal ([Main Page](Main%20Page.md)).
- **Sí no hay una sesión almacenada:** Navega a la actividad de iniciar sesión ([Login Page](Login%20Page.md)).

Mientas realiza la verificación muestra un widget que representa carga *CupertinoActivityIndicator*.
## Métodos
- **CheckSession - *async***
Realiza el proceso de verificación de la sesión mediante una instancia de la clase [Session](../backend%20docs/Session.md) arrojando los dos posibles escenarios mencionados.
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTM3MjI2Njc5LC00NTEwODcwNTksLTU1OT
EzMDg0MCwxNjc4NzkxODFdfQ==
-->