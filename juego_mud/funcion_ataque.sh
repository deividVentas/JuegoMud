function lucha {
  listado_completo=$(cat habitacion1.txt | grep NPCS)
  echo $listado_completo > enemigo_actual.txt
  echo $listado_completo
  read -p "A que enemigo deseas derrotar " $enemigo
  echo $enemigo  
  npcs=$(cat enemigo_actual.txt | grep let  $enemigo)
  
  echo $npcs 

  if [ ! -z "$npcs" ]; then
    echo "No hay enemigos que se llamen así"
  fi 
 

  echo $enemigo
}

lucha
