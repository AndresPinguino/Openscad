
module toro_cuadrado(){
rotate([90,0,0])
rotate_extrude(convexity = 10, $fn = 100)
translate([11.7, -3.3, 0])
square(6.6,6.6, $fn = 100);
}


module toro_circular(){
rotate([90,0,0])
rotate_extrude(convexity = 10, $fn = 100)
translate([18.5, 0, 0])
circle(r = 2.5, $fn = 100);
}

module rayo(){
translate([0, 0, 7])
cube([3,6.6,10], center=true);
}

module tresrayos(){
rayo();
rotate([0,120,0])
rayo();
rotate([0,240,0])
rayo();
}

pos_D=1;  //posicion del chavetero en forma de D
altura=10;
module hub(){
    difference(){
    rotate([90,0,0])
    translate([0,0,-3.3])
    cylinder(h=altura, r=5, center=false, $fn=100); //cilindro exterior
    rotate([90,0,0])
    translate([0,0,-3.3])
    cylinder(h=altura, r=1.525, center=false, $fn=100); //cilindro interior
    }
    rotate([90,0,0])
    translate([pos_D,-3,-3.3])
    cube([3,6,altura], center=false); //chavetero
}

%toro_circular(); 
union(){
    hub();
    tresrayos();
    difference() {
        toro_cuadrado();
        toro_circular(); 
    }
}