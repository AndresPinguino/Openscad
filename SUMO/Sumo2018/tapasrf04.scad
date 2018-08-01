union(){
difference(){
color("red")
cube([45, 20, 6.5], center = true);
translate([0, 6.5, 0])
cube([15, 7.5, 10], center = true);}


difference(){
color("green")
translate([0, 0, 4.25])
cube([71, 26, 2], center = true);

color("blue")
translate([30.5, 0, 0])
cylinder (h = 15, r = 1.625, center = true);

color("blue")
translate([-30.5, 0, 0])
cylinder (h = 15, r = 1.625, center = true);}
}