use </home/andres/Openscad/Llavero/Parametric_RC_Car_Wheel/RC-TC-Wheel.scad>

use</home/andres/Openscad/LogoPoli3D/LogoPoli3D.scad>

//-- Parametros del triangulo
B = 60; //-- Base
h = 12; //-- Altura
ancho = 50; //-- Extrusión del prisma
largo = 20; //--Largo del cubo
escala=0.25; //--Escala del logo

//--Logo
translate([-largo/2,0,h/2])
rotate([0,0,90])
scale([escala,escala,escala]){
    logo();
    base();
}

module rueda(){
//-- Ruedas
color("red")
rotate([90, 0, 0])
translate([-10,0,20])
difference(){
    cylinder(r=h-3, h=h-2, $fn=100, center=true);
    cylinder(r=h-6, h=h, $fn=100, center=true);
}

mirror([0,1,0])
color("red")
rotate([90, 0, 0])
translate([-10,0,20])
difference(){
    cylinder(r=h-3, h=h-2, $fn=100, center=true);
    cylinder(r=h-6, h=h, $fn=100, center=true);
}
}

module llanta(){
//-- Rueda RC Car
$fs=.1;
$fa=3;
color("lime")
rotate([90, 0, 0])
translate([-10,0,20])
TC_Wheel(h-2,h,1,0);

mirror([0,1,0])
color("lime")
rotate([90, 0, 0])
translate([-10,0,20])
TC_Wheel(h-2,h,1,0);   
}

rueda();
llanta();

union(){
    difference(){
        prisma();
        //--Restamos los textos
        //-- Textos rectos
        angulo=atan(h/B);
        rotate([angulo+10, 0, 90])
        translate([-h*1.5,-h,h*0.2])
        texto("Robótica",5,6);

        rotate([angulo+10, 0, 90])
        translate([-h*1.1,-h*2,h*0.3])
        texto("Poli702",5,5);
        //-- Restamos los sensores
        sensores();
        }
        
//-- Unimos con un Cubo  
//-- Cubo
translate([-10,0,0])
cube([largo,ancho/2,h], center=true);      
}


//-- Creando modulos

//-- Cuña 
module prisma(base=B,altura=h, ancho=50){
//-- Rotar prisma para apoyarlo en plano xy
rotate([90, 0, 0])

//-- Extrusion lineal del triangulo
linear_extrude(height = ancho, center = true)

//-- Trapecio
polygon(points = [
                  [0, -h/2],
                  [0, h/2],
                  [B/2, -h/2]
                 ]);
} 

//-- Sensores de distancia
module sensores(){
//-- Sensores
rotate([0, 90, 0])
translate([3,ancho*0.42,20])
cylinder(r=1, h=12, $fn=100, center=true);
rotate([0, 90, 0])
translate([3,ancho*0.35,20])
cylinder(r=1, h=12, $fn=100, center=true);

mirror([0,1,0]){
rotate([0, 90, 0])
translate([3,ancho*0.42,20])
cylinder(r=1, h=12, $fn=100, center=true);
rotate([0, 90, 0])
translate([3,ancho*0.35,20])
cylinder(r=1, h=12, $fn=100, center=true);
}
}

//-- Textos rectos
module texto(mi_texto="Andrés",altura=5,mi_size=10,tipo_letra="DejaVu Serif"){

//tipo_letra="DejaVu Serif";
//tipo_letra="DejaVu Sans";
//tipo_letra="NimbusSans";
//tipo_letra="Standard Symbols PS";
$fn=200;  //face number
linear_extrude(height=altura)
text(text=(mi_texto), font=tipo_letra, size=mi_size);   
}