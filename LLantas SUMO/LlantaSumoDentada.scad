// Dimensiones de los chaveteros
ancho_x=15;     // Mucho mayor a la diferencia de los radio interno y externo
largo_y=8;
alto_z=30;

// Dimensiones de la llanta
radio_externo_llanta=20;
radio_interno_llanta=radio_externo_llanta-4;
alto_llanta=alto_z;

// Dimension del eje del motor
diametro_eje=6;

// Prisionero
diametro_prisionero=3.25;
prisionero_z=-7;

// Tuerca
tuerca_x=5;
tuerca_y=3;
pos_tuerca=(radio_interno_llanta-diametro_eje/2)/2+diametro_eje/2;

module rueda(){
union(){

difference(){
// Llanta interna
cylinder(h=alto_llanta, r=radio_interno_llanta,$fn=100,center=true);

// Hueco interior   
cylinder(h=alto_llanta/2, r=radio_interno_llanta-3,$fn=100,center=false);

// Agujero del eje
cylinder(h=alto_llanta, r=diametro_eje/2,$fn=100,center=true);
    

// Agujero de la tuerca
translate([0,-pos_tuerca,0])
cube([tuerca_x,tuerca_y,alto_z], center=true);

// Agujero del prisionero
translate([0,0,prisionero_z])
rotate([90,0,0])
cylinder(h=radio_externo_llanta, r=diametro_prisionero/2,$fn=100,center=false);

}



difference(){

// Llanta externa
cylinder(h=alto_llanta, r=radio_externo_llanta,$fn=100,center=true);

// Hueco interior   
cylinder(h=alto_llanta/2, r=radio_interno_llanta-3,$fn=100,center=false);

// Agujero del eje
cylinder(h=alto_llanta, r=diametro_eje/2,$fn=100,center=true);

   
// Hueco de los chaveteros
for ( i = [0 : 60 : 300] )
{
translate([radio_externo_llanta*cos(i),radio_externo_llanta*sin(i),0])
rotate(i)
cube([ancho_x,largo_y,alto_z], center=true);
}

// Agujero de la tuerca
translate([0,-pos_tuerca,0])
cube([tuerca_x,tuerca_y,alto_z], center=true);    

// Agujero del prisionero
translate([0,0,prisionero_z])
rotate([90,0,0])
cylinder(h=radio_externo_llanta, r=diametro_prisionero/2,$fn=100,center=false);
}

}
}

rueda();