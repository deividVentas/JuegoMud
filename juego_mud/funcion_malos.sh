function malo {
 numero=1

 while : 
   do
     Titulo=$(cat habitacion$numero.txt | grep Titulo|cut -f2 -d=) 
     Salida=$(cat habitacion$numero.txt | grep Salidas|cut -f2 -d=)
     NPCS=$(cat habitacion$numero.txt | grep NPCS | cut -f2 -d=)
     echo $Titulo
     echo $Salida
     echo $NPCS
     echo $Enemigos

     echo habitacion$numero


 
    

    read -p "Elige una salida... " EleccionSalida


     case  $EleccionSalida in 
       1)
          let  numero=numero-4
          echo "has elegido la salida norte habitacion$numero "
       ;;
       2)
          let numero=numero+4
          echo "Has elegido la opcion sur habitacion$numero "
       ;;
       3)
          let numero=numero+1
          echo "Has escogido la opcion este habitacion$numero"
       ;;
       4) 
          let numero=numero-1
          echo "has escogido la salida oeste habitacion$numero"
       ;;
   
     esac 
 done
}

malo
