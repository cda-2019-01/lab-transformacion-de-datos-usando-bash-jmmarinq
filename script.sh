#Quitar las líneas blancas del archivoo
for ar in *.csv;do sed '/^.$/d' $ar > ${ar}.1;done
#Poner el numero de linea al inicio de la linea
for ar in *.csv.1;do sed = $ar | sed 'N;s/\n/\t/' > ${ar}.2;done
#Poner el nombre del archivo
for ar in *csv.1.2; do sed 's/^/'${ar}\,"/" $ar > ${ar}.3;done
#Quitar los tabuladores en línea
#for ar in *.csv.1.2.3; do sed 's/[[:space:]]\+/,/g' ${ar} > ${ar}.4;done
for ar in *csv.1.2.3 ;do sed -e 's/[\t]/,/g' -e 's/\([a-zA-Z]*\) \([a-zA-Z]*\)/\1,\2/' $ar > ${ar}.4;done
#Arreglar nombre del archivo en los datos
for ar in *csv.1.2.3.4; do sed -e 's/.csv.1.2/.csv/g' $ar > $ar.5;done
#Unir los archivos correspondiente
for ar in *.csv.1.2.3.4.5; do tail $ar >> fin;done
#Cambiar , en todo el archiuo por ;
sed 's/;/,/g' fin > fin2
awk -F',' '{ for (i=4; i<=NF;i++) print $1,$2,$3,$i}' OFS=',' fin2 > solucion.txt
sed  's/,  /,/g' solucion.txt > final
#Remover archivos intermedios
rm *.csv.*
rm fin
rm fin2
rm solucion.txt
