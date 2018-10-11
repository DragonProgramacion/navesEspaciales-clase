# Naves espaciales

Debemos armar un modelo de naves espaciales.


## Modelo básico
En el modelo de nave a desarrollar, debemos tener en cuenta dos indicadores:
- la _velocidad_, expresada en kms/seg.
- la _dirección_ respecto del Sol, que es un número entre -10 y 10. -10 indica que se está alejando del Sol, 0 que lo va rodeando manteniéndose siempre a la misma distancia, 10 que se está acercando.

Los objetos que representan naves deben entender estos mensajes:
- `acelerar(cuanto)` y `desacelerar(cuanto)`, cambian la velocidad. Tener en cuenta que la velocidad de ninguna nave puede ser mayor a 100000 kms/seg, ni tampoco puede ser negativa. Usar `min` y `max` para controlar esto.
- `irHaciaElSol()`, `escaparDelSol()`, `ponerseParaleloAlSol()`, cambian la dirección a 10, -10, y 0 respectivamente.
- `acercarseUnPocoAlSol()` y `alejarseUnPocoDelSol()`, aumenta / disminuye la dirección en 1, respetando el rango de -10 a 10.

 
## Distintos tipos de nave
El modelo se pone más específico: debemos considerar distintos tipos de nave. Para empezar, estos:
1. **Naves-baliza**  
Son naves cuya principal responsabilidad es mostrar una baliza de un determinado color. Para representar los colores vamos a usar Strings, p.ej. `"verde"`, `"rojo"` o `"azul"`.  
Deben entender el mensaje `cambiarColorDeBaliza(colorNuevo)`.
1. **Naves de pasajeros**  
Llevan una cantidad de pasajeros que se indica para cada nave. Hay que registrar cuántas raciones de comida, y cuántas de bebida, se cargan en la nave. Para eso agregar métodos que permitan cargar y descargar una cantidad de raciones de comida, y lo mismo de bebida. 
1. **Naves de combate**  
Entienden estos mensajes:
	- `ponerseVisible()`, `ponerseInvisible()`, `estaInvisible()`: puede estar visiblo o invisible.
	- `desplegarMisiles()`, `replegarMisiles()`, `misilesDesplegados()`: los misiles pueden, o no, estar desplegados.
	- `emitirMensaje(mensaje)`, `mensajesEmitidos()`, `primerMensajeEmitido()`, `ultimoMensajeEmitido()`, `esEscueta()`, `emitioMensaje(mensaje)`.  
	 Las naves de combate tienen la capacidad de emitir mensajes, cada mensaje se representa como un String, p.ej. "Llegando a Saturno". Una nave de combate es _escueta_ si no emitió ningún mensaje de más de 30 caracteres.
	 
Todas las naves tienen que ser capaces de entender el mensaje `prepararViaje()`. Lo que hace cada nave cuando le indican que debe preparar un viaje depende de qué tipo de nave sea:
- las _naves-baliza_ cambian el color de la baliza a verde, y se ponen paralelas al Sol.
- las _naves de pasajeros_ cargan 4 raciones de comida, y 6 de bebida, para cada pasajero que llevan. Además, se acercan un poco al Sol.
- las _naves de combate_ se ponen visibles, repliegan sus misiles, aceleran 15000 kms/seg, y emiten el mensaje "Saliendo en misión".


## Combustible
Agregar al modelo el _combustible_ de cada nave, medido en litros. Se tiene que poder cargar y descargar combustible.  
Para **todas** las naves, agregar como acción adicional en la preparación de un viaje, cargar 30000 litros, y acelerar 5000 kms/seg (para las naves de combate, se acelera 5000 y luego otros 15000, total 20000).


## Reacción ante amenazas
Agregar a todas las naves la capacidad de responder al mensaje `recibirAmenaza()`.  
_Cualquier_ nave, al recibir una amenaza, debe hacer dos cosas: primero _escapar_, y después _avisar_. 
Por otro lado, lo que hace cada nave para escapar y para avisar, depende del tipo de nave según lo que se indica a continuación.
- **Naves-baliza**  
_Escapar_ es ir hacia el Sol, _avisar_ es cambiar el color de baliza a rojo.
- **Naves de pasajeros**  
_Escapar_ es duplicar su velocidad, _avisar_ es darle a cada pasajero una ración de comida y dos de bebida (lo único que afecta a este modelo es que se reduce la cantidad de raciones en la nave).
- **Naves de combate**  
_Escapar_ es ejecutar dos veces la acción de acercarse un poco al Sol. _Avisar_ es emitir el mensaje "Amenaza recibida".


## Más variantes de nave
Agregar al modelo estas dos variantes adicionales de nave
1. **Nave hospital**  
Es una variante de la nave de pasajeros. Debe registrar si tiene o no preparados los quirófanos.  
Cuando recibe una amenaza, después de escapar y avisar, debe preparar los quirófanos.
1. **Nave de combate sigilosa**  
Es una variante de la nave de combate. Para escapar, además de lo que hace cualquier nave de combate, despliega misiles y se pone invisible.  


## Tranquilidad
Agregar a cualquier nave, la capacidad de preguntarle si _está tranquila_.
Hay dos condiciones comunes a todas las naves: tener, al menos, 4000 litros de combustible; y que la velocidad no supere los 12000 kms/seg.
Para algunos tipos de nave se establecen condiciones _adicionales_, o sea, que se **agregan** a las comunes para todas las naves.
- Naves-baliza: el color de la baliza debe ser distinto de rojo.
- Naves de combate: los misiles no deben estar desplegados.
- Naves de combate sigilosas: además de lo anterior, deben estar visibles.
- Naves hospital: los quirófanos no deben estar preparados.
