// CILINDROS

difference(){
translate([20,20,30])
rotate([0,90,0])
color("red")
cylinder(r=4,h=12,$fn=100);

translate([20,20,30])
rotate([0,90,0])
color("blue")
cylinder(r=1.5,h=13,$fn=100);
}

// CUBO
color("blue")
cube([15,15,15]);


// ESFERA
translate([10,-20,0])
color("cyan")
sphere(r = 10,$fn=50);


// CONO
translate([50,20,0])
rotate([0,0,0])
color("green")
cylinder(r1=12,r2=0,h=20,$fn=100);
