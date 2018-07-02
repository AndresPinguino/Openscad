use <Spiff.scad>;

//for the daring: comment this line out!
linear_extrude(height=10) polygon([[-2,-2],[125,-2],[125,7],[0,7],[-3,0]]);

rotate([90,0,0]) linear_extrude(height=4) write("0123456789ABCDEFGH");
translate([123,0,0]) rotate([90,0,90]) linear_extrude(height=4) write("I");
translate([121,5,0]) rotate([90,0,180]) linear_extrude(height=4) write("JKLMNOPQRSTUVWXY");
translate([2,6,0]) rotate([90,0,245]) linear_extrude(height=4) write("Z");