Elect&IoT

Make and Design For Carlos Humberto Fonseca S and Yair Alonso Duran Rozo
-----------------------------------------------------------
El siguiente repositorio contiene librerias y archivos ejecutables respectivos para la comunicacion y manipulacion de datos.

Software aplicados

1. Arduino
2. MatLab
3. Simulink
4. KotLin

Instrucciones de simulacion y aplicacion:

1- Instale las librerias alojadas en este repositorio en la siguiente direccion: 

La instalacion consta de copiar y pegar las carpetas de las respectivas librerias en las siguientes direcciones

D:\Users\NombreDeUsuario\Documents\Arduino\libraries and
C:\Program Files (x86)\Arduino\libraries

2- Abra el Ide de arduino y prosiga en abrir el archivo RpmModificadoWifi.ino
automaticamente se abriran el resto de archivos que componen el codigo

3- cargue el codigo en la tarjeta de microcontrolador. Este codigo fue testeado en la tarjeta NodemcuEsp8266

4- Prueba Rapida: 
   Luego de cargar el codigo abra el puerto serial, verifique que la velocidad de transmision de datos se 
   encuentre en 9600BD, y el tipo de ingreso de datos este en Ambos NL&CR
   luego en el apartado de ingreso de datos, escriba R; Al presionar R obtendra los datos alojados en la    base de datos de Firebase, verifique que los datos obtenidos son los mismos escritos en la aplicacion.

4.1- Cierre el puerto Serial o la ventana de puerto serial.

5- Abra Matlab y Simulink con los archivos de simulacion respectivos

6. Pulse en el boton de simular, seleccione el puerto COM al que esta conectado la tarjeta microcontrolador
   proceda a seleccionar la velocidad de transmision en 9600BD
 
7- Pulse en el boton de conectar y aguarde 5 segundos mientras inicializa la tarjeta.

8- pulse en el boton obtener datos, de esta forma se enviaran los datos ingresados desde la app hacia el simulink graficando el valor de RPM y enviando el valor resultante de la simulacion a la aplicacion.

9- compruebe los datos recividos en la APP.

10- cierra el puerto COM con el boton desconectar y al querer realizar una nueva prueba realiza los pasos a partir del punto 7.


## License

The MIT License (MIT)

Copyright (c) 2020 (Elect&IoT) Since 2020

Por la presente se otorga permiso, sin cargo, a cualquier persona que genere una copia de
este software y los archivos de documentación asociados (el "Software"), para tratar
el Software sin restricciones, incluidos, entre otros, los derechos de
usar, copiar, modificar, fusionar, publicar, distribuir, sublicenciar y / o vender copias de
el Software, y para permitir que las personas a las que se proporciona el Software lo hagan,
sujeto a las siguientes condiciones:

El aviso de copyright anterior y este aviso de permiso se incluirán en todos
copias o partes sustanciales del Software.

EL SOFTWARE SE PROPORCIONA "TAL CUAL", SIN GARANTÍA DE NINGÚN TIPO, EXPRESA O
IMPLÍCITAS, INCLUYENDO PERO NO LIMITADO A LAS GARANTÍAS DE COMERCIABILIDAD, APTITUD
PARA UN PROPÓSITO PARTICULAR Y NO INFRACCIÓN. EN NINGÚN CASO LOS AUTORES O
LOS TITULARES DE LOS DERECHOS DE AUTOR SERÁN RESPONSABLES DE CUALQUIER RECLAMO, DAÑOS U OTRA RESPONSABILIDAD, YA SEA EN UNA ACCIÓN DE CONTRATO, AGRAVIO O DE OTRO MODO, QUE SURJA DE, FUERA O EN
CONEXIÓN CON EL SOFTWARE O EL USO U OTROS NEGOCIOS DEL SOFTWARE.


