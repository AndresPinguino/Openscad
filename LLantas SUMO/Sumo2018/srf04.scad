// Tapa roja menos los agujeros circulares
union(){
difference(){
color("red")
translate([13, 0, 0])
cube([47, 22, 2], center = true);
color("blue")
cylinder (h = 20, r = 8.25, center = true);
translate([26, 0, 0])
color("blue")
cylinder (h = 20, r = 8.25, center = true);}

// Perimetro superior
translate([13, 12, 7])
cube([47, 2, 16], center = true);

// Perimetro inferior con
// Hueco rectangular para el conector

difference(){
translate([13, -12, 7])
cube([47, 2, 16], center = true);
color("blue")
translate([13, -12, 11.1])
cube([15, 4, 8], center = true);}

// Perimetro izquierdo
color("magenta")
translate([-16.5, 0, 7])
cube([12, 26, 16], center = true);

color("cyan")
translate([-17.5, 0, -6])
cube([10, 26, 10], center = true);

// Perimetro derecha
color("magenta")
translate([42.5, 0, 7])
cube([12, 26, 16], center = true);

color("cyan")
translate([43.5, 0, -6])
cube([10, 26, 10], center = true);

// Separadores interiores
color("green")
translate([-8.5, 9, 3])
cube([4, 4, 4], center = true);

color("green")
translate([34.5, 9, 3])
cube([4, 4, 4], center = true);

color("green")
translate([-8.5, -9, 3])
cube([4, 4, 4], center = true);

color("green")
translate([34.5, -9, 3])
cube([4, 4, 4], center = true);
}

