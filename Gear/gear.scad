difference(){
linear_extrude(height = 5, center=true)
  import("/home/andres/Openscad/Gear/gear.dxf");
  
cylinder(r=1,h=10, center=true, $fn=100);}
