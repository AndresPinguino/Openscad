
import("/home/andres/Openscad/MinisumoEDU/Estructura/Rueda_stl.stl", convexity=3);
translate([5,0,0])

import("/home/andres/Openscad/MinisumoEDU/Estructura/Base_stl.stl", convexity=3);
translate([-145,0,0])

import("/home/andres/Openscad/MinisumoEDU/Estructura/Soporte_motor_stl.stl", convexity=3);
translate([65,0,0])

import("/home/andres/Openscad/VeloEDU/Estructura/base_velocistaEdu_fixed.stl", convexity=3);
translate([-55,0,0])

import("/home/andres/Openscad/VeloEDU/Estructura/brackets_velocistaEdu.stl", convexity=3);