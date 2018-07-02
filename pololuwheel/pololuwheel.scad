union(){
intersection() {
import("/home/andres/Openscad/pololuwheel/Poleel80x10mm.stl", convexity=3);
translate([0,38.25,38.25])
rotate([0,90,0])
cylinder(r=4,h=20,$fn=100);
}

difference(){
translate([-10,38.25,38.25])
rotate([0,90,0])
cylinder(r=4,h=12,$fn=100);

translate([-10,38.25,38.25])
rotate([0,90,0])
cylinder(r=1.5,h=13,$fn=100);
}
}