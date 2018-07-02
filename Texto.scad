$fn=200;  //face number
mi_texto="Andrés";
mi_size=10;
tipo_letra="DejaVu Serif";
//tipo_letra="DejaVu Sans";
//tipo_letra="NimbusSans";
//tipo_letra="Standard Symbols PS";

linear_extrude(height=10)
text(text=(mi_texto), font=tipo_letra, size=mi_size);