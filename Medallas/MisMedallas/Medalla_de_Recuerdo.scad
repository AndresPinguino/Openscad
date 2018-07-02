use<Write.scad>

tipo_letra="orbitron.dxf";
altura = 4;
radio = 32;
puesto = 1;

module medalla(){
//tipo_letra="Letters.dxf";
//tipo_letra="knewave.dxf";
//tipo_letra="BlackRose.dxf";

color([0,1,1]) 
writecircle(text="LIGA DE ROBOTICA", where=[0,0,altura/2+0.5], h=5,radius=radio-8, font = tipo_letra, space=1.3);

color([0,1,1]) 
writecircle(text="2017", where=[0,0,altura/2+0.5], h=5,radius=-(radio-8), font = tipo_letra, space=1.3);
    


difference() {
    color("green")
	cylinder (h = altura, r=radio-13, center = false, $fn=200);
	translate([0,5,0])
    color("red")
    write(puesto,t=altura+5,h=radio,font = "BlackRose.dxf", center=true);
    //Numero del puesto 1,2 ó 3
    color([0,1,1]) 
    writecircle(text="Recuerdo", where=[0,0,altura/2+1.6], h=4,radius=(radio-17), font = tipo_letra, space=1.3);
    writecircle(text="poli-702", where=[0,0,altura/2+1.6], h=4,radius=-(radio-17), font = tipo_letra, space=1.3);
    write("EXPO-POLI",t=altura+4,h=5,font = tipo_letra, center=true);
}


difference() {
	cylinder (h = altura/2, r=radio, center = false, $fn=200);
	translate([0,5,0])
    color("red")
    write(puesto,t=altura+5,h=radio,font = "BlackRose.dxf", center=true);
    //Numero del puesto 1,2 ó 3
}



difference() {
    pasacinta();
	cylinder (h = altura, r=radio, center = false, $fn=200);
}

difference() {
	cylinder (h = altura, r=radio, center = false, $fn=200);
    cylinder (h = altura, r=radio-2, center = false, $fn=200);
}

}

module pasacinta(){
$fn=200;
color("red")
minkowski()
{
  translate([0, radio, 1.5])
  cube([30,10,3],center=true);
  cylinder(r=2,h=1);
}
}

union(){
difference() {
	medalla();
    translate([0, radio+2, 1.5])
    cube([26,3,10],center=true);
}
}