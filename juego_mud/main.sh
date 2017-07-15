#!/bin/bash

function cargando_habitacion {
 Titulo=$(cat habitacion$habitacion.txt|grep Titulo|cut -f2 -d=) 
 Salidas=$(cat habitacion$habitacion.txt|grep Salidas|cut -f2 -d=) 
 NPCS=$(cat habitacion$habitacion.txt|grep NPCS|cut -f2 -d=) 
 juego
}


function nuevo_juego {
  read -p "Introduzca su nombre de usuario " Usuario
  Usuario_Fuerza=$RANDOM 
  echo "Cargando el juego espere un momento...$Usuario"
  echo "Cargando elementos de habitacion.."
  echo "$Usuario tiene una fuerza de $Usuario_Fuerza"
  cargando_habitacion
  
}

function juego {
 while :
  do
    echo "$Titulo"
    echo "Tienes salidas $Salidas"
    if [ -z $NPCS ]; then
      echo "No tienes ningún enemigo"
    else
      echo "Tienes enemigos y son $NPCS"
      read -p "Quieres luchar?S/N " Lucha

      if [ $Lucha = "S" ] || [ $Lucha = "s" ]; then
        echo "Empieza la lucha, y solo puede quedar uno en pie"
      else
        echo "Cobarde cobardica, capitan de las gallinas "
      fi
    fi
    read -p "Elige tu salida... " EleccionSalida

    case $EleccionSalida in
      1)
        let habitacion=habitacion-4
        echo  "cargando habitacion norte numero de habitacion $habitacion"
        cargando_habitacion
      ;;

      2)
        let habitacion=habitacion+4
        echo "Cargando habitacion Sur numero de habitacion $habitacion"
        cargando_habitacion
      ;;
      3)
        let habitacion=habitacion+1
        echo "Cargando habitacion Este, numero de habitacion $habitacion"
        cargando_habitacion
      ;;
      4)
        let habitacion=habitacion-1
        echo "Cargando habitacion Oeste, numero de habitacion $habitacion"
        cargando_habitacion
      ;;
      
    esac
 done
}

function explicacion_juego {
  echo -e "\e[1;33;44 Este juego está en fase alpha y con mucho por hacer pero la idea principal es: \e[0m"
  echo -e "\e[1;33;44 Un juego de tipo MUD donde te adentas en lugar inospito donde tienes que estar muy atento a los pequeños detalles, vas a tener que inspeccionar todas las estancias y limpiarla de enemigos, tendŕas que ser inteligente para saber cuando te vas a batir al enemigo, ya que los hay que te pueden matar, tendras que coger fuerza para poder batirte a ellos \e[0m"
}

function controles {
  echo "Para jugar este juego solo debes saber las equivalencias de coordenadas, como guardar, y como atacar "
  echo " "
  echo -e "\e[1;44;33m La equivalencia de coordenadas son las siguientes...\e[0m"
  echo "1 es Norte, si vemos x es que no tiene puerta por esa direccion"
  echo "2 es Sur, si vemos una x es que no tiene puerta por esa direccion"
  echo "3 es Este, si vemos una x es que no tiene puerta por esa direccion"
  echo "4 es Oeste, si vemos una x es que no tiene puerta por esa direccion"
  echo " "
  echo -e "\e[1;44;33m GUARDAR \e[0m"
  echo "Ahora para guardar partida, lo debemos hacer solo en las habitaciones permitidas, nos avisaran en la descripcion de la habitacion y sera con la tecla g"
  echo " "
  echo -e "\e[1;44;33m ATACAR \e[0m"
  echo "Para atacar sera tambien solo si hay enemigos, y aunque se avisara la tecla sera la letra s cuando te lo pregunten "
  
  

}

function menu {
  echo "Menu de juego"
  echo "1) Crear un nuevo juego"
  echo "2) Cargar partida"
  echo "3) Explicacion del juego"
  echo "4) Controles"
  echo "5) Salir"
  read -p "Introduzca su opcion... " OpcionJuego


  case $OpcionJuego in
    1) 
      nuevo_juego
    ;;
    2)
      echo "Has elegido la opcion 2 Cargar partida"
    ;;
    3)
      echo "Has elegido la opcion 3 Explicacion del juego... "
      explicacion_juego
    ;;
    4)
      echo "Abriendo panel controles... "
      controles
    ;;
    5)
      echo "Saliendo el programa..."
    ;;
    *) 
      echo "Ese codigo no lo contempla" ;;
  esac
}

habitacion=1

menu 



