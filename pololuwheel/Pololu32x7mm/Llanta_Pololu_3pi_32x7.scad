
module rueda(){
translate([-14.3, -3.3, -14.3])
import("/home/andres/Openscad/pololuwheel/Pololu32x7mm/Pololu-Wheel-32x7mm-rim.STL", convexity=3);
}
//rueda();

module toro_cuadrado(){
rotate([90,0,0])
rotate_extrude(convexity = 10, $fn = 100)
translate([11.7, -3.3, 0])
square(6.6,6.6, $fn = 100);
}

module toro_cuadrado2(){
rotate([90,0,0])
rotate_extrude(convexity = 10, $fn = 100)
translate([16, -2.25, 0])
square(4.5,4.5, $fn = 100);
}

module toro_circular(){
rotate([90,0,0])
rotate_extrude(convexity = 10, $fn = 100)
translate([18.5, 0, 0])
circle(r = 2.5, $fn = 100);
}

//%toro_cuadrado2();
%toro_circular(); 
union(){
    //rueda();
    difference() {
        toro_cuadrado();
        //toro_cuadrado2();
        toro_circular(); 
    }
}
