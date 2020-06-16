# Oktubre Fest

[Ein Prosit!](https://www.youtube.com/watch?v=DNxE5NQXLM4)

En Münich-Alemania, todos los años se festeja la Oktubrefest. Para esta gran feria de comidas, entretenimientos y mucha cerveza nos piden construir un programa en objetos que modele el comportamiento de las personas en la fiesta. 

Al entrar en la fiesta se pueden encontrar enormes carpas cerveceras, en donde muchísima gente se reune a . . . bueno . . . tomar cerveza. Queremos controlar la entrada a estas carpas dependiendo de la disponibilidad de la carpa y los gustos del público.


## Marcas y jarras
Existen varias **marcas** de cerveza. Están las marcas de cerveza rubia (como la Corona), las marcas de cerveza negra (como la Guiness), y las marcas de cerveza roja (como la Hofbräu). De cada marca se sabe su contenido de lúpulo, o sea, cuántos gramos de lúpulo por litro llevan. También se conoce el país donde se fabrica.

La graduación de una cerveza es su porcentaje de alcohol en volumen. P.ej. una cerveza de 10 % de graduación, tendrá 0.1 litro de alcohol por litro de cerveza: 
* Cada marca de cerveza rubia tiene una graduación distinta. 
* Por otro lado, la graduación de una marca de cerveza negra se calcula como el mínimo entre la graduación reglamentaria y el doble de su contenido de lúpulo. La graduación reglamentaria es mundial, o sea que es única para todas las marcas de cerveza negra del mundo; puede cambiar con el tiempo. 
* La cerveza roja se fabrica con procedimientos similares a la de la cerveza negra, pero que concentran más el alcohol. Por lo tanto, la graduación de una marca de cerveza roja se calcula multiplicando el valor que correspondería a una cerveza negra con la misma configuración, por 1.25.

En la fiesta, la cerveza se vende en **jarras**. De cada jarra de cerveza sabemos su capacidad en litros y de qué marca es.

## Personas
De cada persona se sabe su peso, las jarras de cerveza que compró hasta el momento, si le gusta escuchar música tradicional o no, y su nivel de aguante, que es un número. Una persona está ebria si la cantidad de alcohol que ingirió multiplicado por su peso supera su aguante. 

Además, de cada persona interesará saber qué marcas de cerveza le gustan. Se sabe que a los belgas les gusta solamente la cerveza con más de 4 gramos de lúpulo por litro, a los checos les gustan las cervezas de más de 8 % de graduación (ver abajo qué es la graduación de la cerveza), a los alemanes les gustan todas.



## Requerimientos - primera parte
Se pide codificación completa y test para los siguientes requerimientos:


1. Saber el **contenido de alcohol** de una jarra de cerveza. Ej: una jarra de cerveza de medio litro de la marca _Hofbräu_ (suponiendo que tiene 8 % de graduación alcohólica) tiene 0.5 * 0.08 = 0.04 litros de alcohol.

1. Saber el **total de alcohol** que ingirió una persona (en base a las jarras de cerveza que compró).

1. Saber si una persona **está ebria** o no.

1. Saber si a una persona **le gusta**, o no, una determinada marca de cerveza.



## Carpas

Las **carpas cerveceras** tienen:
* un límite de gente admitida, 
* algunas tienen una banda para tocar música tradicional (esto debe indicarse para cada una),
* y por supuesto que todas venden jarras de cerveza. 

Cada carpa vende cerveza de únicamente una marca (que depende de cada carpa).



## Requerimientos - segunda parte

Se agregan estos requerimientos

5. Saber si una persona **quiere entrar** a una carpa. Para esto hay que mirar si la marca de cerveza que venda la carpa le gusta a la persona y si cumple su preferencia sobre que haya o no haya música (ojo con esto: si a la persona le gusta la música tradicional tiene que haber música en la carpa, y si no le gusta, entonces no puede haber música).  
Los alemanes, además, requieren que haya una cantidad par de personas en la carpa (antes de entrar ellos).

1. Saber si una carpa **deja ingresar** a una persona, o sea, si dejándola entrar no supera su límite de personas y la persona no está ebria.

1. Saber si una persona **puede entrar** a una carpa, es decir, si quiere entrar a la carpa y la carpa lo deja entrar.

1. Hacer que una persona efectivamente **entre** a una carpa. Si una persona quiere ingresar a una carpa y no puede por la falla de alguna condición resuelta en los puntos anteriores, generar un error. 

1. Hacer que una carpa **le sirva** una jarra de cerveza a una persona. Se debe indicar la capacidad de la jarra que se está vendiendo.  
Si la persona no está en la carpa, generar un error.  
**Nota**: es conveniente que el objeto que representa a la jarra vendida se cree en la acción de servir. La marca es la que vende la carpa, la capacidad se está indicando.

1. Saber cuantos **ebrios empedernidos** hay dentro de una carpa. Los ebrios empedernidos son los ebrios que todas las jarras que compraron, son de 1 litro ó más.

1. Saber si una persona **es patriota**, o sea, si todas las jarras de cerveza que compró son del país del que proviene. P.ej. un alemán es patriota si todas las jarras de cerveza que compró son alemanas.


## Requerimientos - avanzados

12. Saber si dos personas **son compatibles**. La condición es que considerando las marcas de compró cada uno, hay más coincidencias (o sea, marcas que compraron los dos), que diferencias (o sea, marcas que compró uno y el otro no).

1. Saber si una carpa **es homogénea**: la condición es que todas las personas que están son de la misma nacionalidad.

1. Saber, para una persona, en qué carpas le sirvieron cerveza. Para esto hay que agregar, en cada jarra, el dato de en qué carpa se sirvió.

1. Con el dato agregado en el punto anterior, obtener para una carpa los asistentes que a los que no se les ha servido cerveza en esa carpa (aunque posiblemente sí en otras).

1. Saber, para una persona, si **está entrando en el vicio**. La condición es que cada jarra que compró tiene la misma capacidad, o más, que la anterior.


## Bonus - precio de venta

Agregar la capacidad de obtener el **precio de venta** por litro de cerveza en una carpa. 
Para esto, se agrega al modelo un precio por litro para cada marca de cerveza.  

El precio de venta se obtiene aplicando, al precio que establece la marca que sirve la carpa, un porcentaje de recargo.
Hay tres formas distintas de calcular el recargo:
- recargo _fijo_ del 30%
- recargo por _cantidad_: si la cantidad de gente en la carpa es la mitad de su capacidad o más, entonces 40%, si no 25%.
- recargo por _ebriedad_: si el 75% de la gente que está en la carpa, o más, está ebria, entonces 50%, si no 20%.

Para cada carpa se establece una de estas formas de calcular el recargo, que puede cambiar en cualquier momento.

A partir de esto, agregar el precio en que se vendió cada jarra: resulta del precio de venta por litro en la carpa y de la capacidad de la jarra.

Con esto, agregar la posibilidad de obtener para una persona: el gasto total en cerveza, la jarra más cara que compró.


[comment]: <> (1. Agregar al modelo el **precio de costo** de una jarra de cerveza.   
Se calcula a partir del precio por litro que se establece para cada marca de cerveza; recordar que debe multiplicarse por la capacidad de la jarra.)




