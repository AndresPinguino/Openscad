// http://www.iearobotics.com/wiki/index.php?title=Dise%C3%B1o_de_piezas_con_OpenScad_II#C.C3.B3digo_4

//-- Organizador de canicas paramétrico

//-- Número de canicas
N = 2;

//-- Diametro de las canicas
dc = 30;

//-- Tamaño de cada cuadro
d = dc + 10;

//-- Tamaño total de la cuadrícula
size = (N-1) * d;

//-- Tamaño de la caja donde están las canicas
size_box = N * d;
h_box = dc / 2 + 4;

module pieza(){
cylinder (r1=dc/2, r2=dc/2, h=dc, center=true, $fn=500);
//sphere(r = dc/2, $fn=20);
}


difference() {
  //-- Caja de las canicas
  translate([0, 0, -h_box / 2])
  cube([size_box, size_box, h_box], center = true);

  //-- Canicas
  translate([-size / 2, -size / 2, 0]) //-- Centrar canicas
  for (ix = [0:N-1])
    for (iy = [0:N-1])
      //-- Posicionar la canica en punto (ix, iy)
      translate([ix * d, iy * d, 0])
          pieza();
}