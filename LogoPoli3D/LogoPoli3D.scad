//--Declaración de variables
layer1=3;   //Cabeza y Cuerpo
layer2=5;  //Libro
radio=4; // radio de la cabeza
leg1=11;
radio_base=leg1+radio*2;
tolerancia=0.01; // poner en cero para imprimir, sirve para previsualizar los colores

//--Principal
logo();
base();


//--Modulos
module logo(){

union(){
//--Cabeza
color("blue"){
    difference(){
        translate([0,leg1+radio,0])
        cylinder(r=radio, h=layer1+tolerancia, $fn=100, center=false);
        translate([0,leg1-radio/2,0])    
        cube([radio*2,radio*3,layer1+5]);
    }
}

color("white"){
    difference(){
        translate([0,leg1+radio,0])
        cylinder(r=radio, h=layer1, $fn=100, center=false);
        translate([-radio*2,leg1-radio/2,0])    
        cube([radio*2,radio*3,layer1+5]);
    }
}


//--Cuerpo
color("white"){
    linear_extrude(height=layer1){
        polygon(points=[[0,-leg1],[0,leg1],[leg1,0]]);
    }
}

mirror([[1,0,0]]){
    color("blue"){
        linear_extrude(height=layer1){
            polygon(points=[[0,-leg1],[0,leg1],[leg1,0]]);
        }
    }
}


//--Libro
color("white"){
    linear_extrude(height=layer2){
        rotate([0,0,90])
        translate([-leg1,0,0])
        polygon(points=[[0,0],[7,0],[10,3],[3,3]]);
    }
}
mirror([[1,0,0]]){
    color("blue"){
        linear_extrude(height=layer2){
            rotate([0,0,90])
            translate([-leg1,0,0])
            polygon(points=[[0,0],[7,0],[10,3],[3,3]]);
        }
    }
}


//--Piernas
color("blue"){
    linear_extrude(height=layer1){
        polygon(points=[[0,-leg1],[0,-radio_base-1],[-leg1,-radio_base],[-leg1/4,-leg1*2/3]]);
    }
}

mirror([[1,0,0]]){
color("white"){
    linear_extrude(height=layer1){
        polygon(points=[[0,-leg1],[0,-radio_base-1],[-leg1,-radio_base],[-leg1/4,-leg1*2/3]]);
    }
}
}
}
}


module base(){
    color("red"){
    difference(){
        cylinder(r=radio_base*1.3, h=layer2-tolerancia, $fn=100, center=false);
        cylinder(r=radio_base, h=20, $fn=100, center=true);
        }
    cylinder(r=radio_base*1.3, h=layer1/2, $fn=100, center=false);
    }
}