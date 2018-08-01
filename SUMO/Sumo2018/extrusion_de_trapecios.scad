//-- Parametros del trapecio
B = 2; //-- Base larga
b = 1; //-- Base corta
h = 1; //-- Altura

module diente(){
//-- Rotar prisma para apoyarlo en plano xy
rotate([0, 0, 90])

//-- Extrusion lineal del trapecio
linear_extrude(height = 80, center = true)

//-- Trapecio
polygon(points = [
                  [-B/2, -h/2],
                  [-b/2, h/2],
                  [b/2, h/2],
                  [B/2, -h/2]
                 ]);
                 
}

 polar_array(radius=40,cantidad=100){
        diente();
        }
        
//modulo para hacer arreglos polares de un objeto 
module polar_array(radius, cantidad){
    for (i=[0:360/cantidad:360]){
            rotate([0,0,i])
            translate([radius,0,0])
            children();      
    }
}