//Brackets
module bracket(){
union(){
difference(){
import("/home/andres/Openscad/Futbol/bracket_pololu_3pi.stl", convexity=3);
translate([0,-10,-15])
cube([20,20,30]);
}


translate([0,7.04,-9])
cube([1.5,1.905,18]);
}
}

union(){
translate([-1.5,0,0])
bracket();
translate([1.5,0,0])
mirror([1,0,0]) bracket();
}
