echo "Introduzca un número de teléfono:";
read numero;
echo "[milanuncios] https://www.milanuncios.com/anuncios/"$numero".htm?fromSearch=1";
lynx --dump "https://www.milanuncios.com/anuncios/"$numero".htm?fromSearch=1" | tr "\n" "," | tr "\]" "\n" | grep "Leer más" | cut -f1 -d",";
echo "[listaspam] https://www.listaspam.com/busca.php?Telefono="$numero;
lynx --nomargins --dump "https://www.listaspam.com/busca.php?Telefono=$numero" | grep "Por * " -A 1 | xargs | tr -d "-" | tr "\*" "\n";
echo "[teledigo] http://www.teledigo.com/"$numero;
lynx --dump "http://www.teledigo.com/"$numero | grep "Enviado por " -A 2 | xargs | tr "-" "\n" | grep "Enviado";
echo "[tellows]";
lynx --dump "https://www.tellows.es/num/"$numero > b.tmp;
cat b.tmp | grep " reportó ";
echo -n "Empresa: ";
cat b.tmp | grep "Nombre/empresa" | cut -f2 -d":" | xargs;
echo -n "Tipo: ";
cat b.tmp | grep "Tipos de llamada:" | cut -f2 -d":" | xargs;
rm b.tmp;
echo "[telefonospam]";
lynx --dump "https://www.telefonospam.es/"$numero | grep "Tipo de llamada" | grep -v "Escoger tipo";
echo "[quienhallamado]";

    lynx --dump "https://www.quienhallamado.es/"$numero | grep "Seriedad:";

