//Características de la rueda
diametro_rueda=45;
altura=30;
chavetas=10;

//Cilindro interior
radio_interno_llanta=diametro_rueda/2-6;

//Dimension del eje del motor
diametro_eje=6;

//Prisionero
diametro_prisionero=4.76; // 3/16" cabeza allen
pos_prisionero=9;

//Tuerca
tuerca_x=10;
tuerca_y=4.6;
pos_tuerca=(radio_interno_llanta-diametro_eje/2)/2+diametro_eje/2;


module rueda(diametro_rueda=45,altura=30,chavetas=10,diametro_eje=6){

union(){
    difference(){
        //rueda
        cylinder(r=diametro_rueda/2, h=altura, $fn=200, center=true);

        //taladro del eje
        cylinder(r=diametro_eje/2, h=altura+10, $fn=200, center=true);

        //cilindros perimetrales 
        polar_array(radius=diametro_rueda/2-1.5,cantidad=chavetas){
        cylinder(r=2, h=altura+10, $fn=200, center=true);
        }

        //cilindro interior
        translate([0,0,-4])
        cylinder(r=radio_interno_llanta, h=altura, $fn=200, center=false);

        //tuerca
        translate([0,-pos_tuerca,0])
        cube([tuerca_x,tuerca_y,altura+10], center=true);

        //prisionero
        rotate([90,0,0])
        translate([0,-pos_prisionero,0])
        cylinder(r=diametro_prisionero/2, h=altura+10, $fn=200, center=false);

        }
    // Aro central    
    difference(){
        //Aro
        cylinder(r=diametro_rueda/2, h=4, $fn=200, center=true);
        //cilindro interior
        translate([0,0,-4])
        cylinder(r=radio_interno_llanta, h=altura, $fn=200, center=false);
        }
}
}


//modulo para hacer arreglos polares de un objeto 
module polar_array(radius=30, cantidad=30, angulo=360){
    for (i=[0:angulo/cantidad:angulo]){
            rotate([0,0,i])
            translate([radius,0,0])
            children();      
    }
}


//Moldes

module tapa(){
translate([0,0,-20]){
{
difference(){
//rueda
cylinder(r=diametro_rueda/2+10, h=5, $fn=200, center=false);

//taladro del eje
cylinder(r=diametro_eje/2, h=altura+10, $fn=200, center=true);
}}

translate([0,0,-5])
{
    difference(){
//rueda
cylinder(r=diametro_rueda/2+15, h=5, $fn=200, center=false);
//taladro del eje
cylinder(r=diametro_eje/2, h=altura+10, $fn=200, center=true);
    }
}
}
}


module contratapa(){
translate([0,0,15])
mirror([0,0,1]){ 
{
difference(){
//rueda
cylinder(r=radio_interno_llanta-0.2, h=5, $fn=200, center=false);

//taladro del eje
cylinder(r=diametro_eje/2, h=altura+10, $fn=200, center=true);
}}

translate([0,0,-5])
{
    difference(){
//rueda
cylinder(r=diametro_rueda/2+10, h=5, $fn=200, center=false);
//taladro del eje
cylinder(r=diametro_eje/2, h=altura+10, $fn=200, center=true);
    }
}
}
}


module molde(){
//Molde
difference(){
//cilindro exterior
cylinder(r=diametro_rueda/2+15, h=altura+10, $fn=200, center=true);

//cilindro interior
cylinder(r=diametro_rueda/2+10.1, h=altura+50, $fn=200, center=true);
}}


module bridas(){
difference(){    
        translate([diametro_rueda/2+24,0,0])
        cube(size = [20,10,altura+10], center = true);
        //taladro agujeros
        rotate([90,0,0]){
        translate([diametro_rueda/2+27,0,0])
        cylinder(r=diametro_prisionero/2, h=altura, $fn=200, center=true);}}

difference(){
        translate([-(diametro_rueda/2+24),0,0])
        cube(size = [20,10,altura+10], center = true);
        //taladro agujeros
        rotate([90,0,0]){
        translate([-(diametro_rueda/2+27),0,0])
        cylinder(r=diametro_prisionero/2, h=altura, $fn=200, center=true);}}
}

module omega(){
difference(){
union(){
molde();
bridas();
grip(); // para dibujo liso ó dentado
}
translate([0,diametro_rueda/2+15-0.5*(diametro_rueda/2+15),0])
cube(size = [150,diametro_rueda/2+15,altura+10], center = true);
}
translate([diametro_rueda/2+52-0.5*(diametro_rueda/2+52),-6,0])
cunia(); // refuerzo de la brida de unión
translate([-(diametro_rueda/2+52-0.5*(diametro_rueda/2+52)),-6,0]){
mirror([1,0,0]) cunia();}

}
module diente(B=4, b=2, h=2, tall=altura-0.5){
//-- Parametros del trapecio
//B = Base larga
//b = Base corta
//h = Altura
    
//-- Rotar prisma para apoyarlo en plano xy
rotate([0, 0, 90])

//-- Extrusion lineal del trapecio
linear_extrude(height = tall, center = true)

//-- Trapecio
polygon(points = [
                  [-B/2, -h/2],
                  [-b/2, h/2],
                  [b/2, h/2],
                  [B/2, -h/2]
                 ]);
                 
}
module grip(){
rotate([0, 0, 180])
polar_array(radius=diametro_rueda/2+10.1,cantidad=20,angulo=180){
        diente();
        }
}
module cunia(){
rotate([0, 0, 135])
diente(0,12,6, altura+10);
}
//Ejemplo de uso valores por defecto
//rueda(45,30,10,6);

//Principal
rueda();
omega(); //en este modulo podemos elejir con ó sin grip
tapa();
contratapa();










