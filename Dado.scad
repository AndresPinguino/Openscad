difference(){
//Cuerpo del dado
    intersection(){
        cube(20,center=true);
        sphere(15,$fn=100);}
//Cara del 1
    translate([11,0,0])
    sphere(2,$fn=20);
//Cara del 2
    translate([4,4,11])
    sphere(2,$fn=20);
    translate([-4,-4,11])
    sphere(2,$fn=20);
//Cara del 3
    translate([5,11,5])
    sphere(2,$fn=20);
    translate([0,11,0])
    sphere(2,$fn=20);
    translate([-5,11,-5])
    sphere(2,$fn=20);
//Cara del 4
    translate([5,-11,5])
    sphere(2,$fn=20);
    translate([-5,-11,5])
    sphere(2,$fn=20);
    translate([5,-11,-5])
    sphere(2,$fn=20);
    translate([-5,-11,-5])
    sphere(2,$fn=20);
//Cara del 5
    translate([5,5,-11])
    sphere(2,$fn=20);
    translate([5,-5,-11])
    sphere(2,$fn=20);
    translate([-5,5,-11])
    sphere(2,$fn=20);
    translate([-5,-5,-11])
    sphere(2,$fn=20);
    translate([0,0,-11])
    sphere(2,$fn=20);
//Cara del 6
    translate([-11,5,5])
    sphere(2,$fn=20);
    translate([-11,-5,5])
    sphere(2,$fn=20);
    translate([-11,5,-5])
    sphere(2,$fn=20);
    translate([-11,-5,-5])
    sphere(2,$fn=20);
    translate([-11,5,0])
    sphere(2,$fn=20);
    translate([-11,-5,0])
    sphere(2,$fn=20);
}