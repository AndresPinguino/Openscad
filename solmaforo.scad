// CUBO
cube([40,40,200]);
translate([20,20,200])
rotate([0,0,45])
color("cyan")
cylinder(30,30,10,$fn=4);




// CON CUPULA
translate([200,0,0])
cube([40,40,200]);
translate([220,20,200])
color("cyan")
sphere(r = 20,$fn=50);