//https://github.com/elmom/MCAD

use <MCAD/involute_gears.scad>

//gear();

//bevel_gear_pair();

use <MCAD/motors.scad>

//stepper_motor_mount(17);


use <MCAD/nuts_and_bolts.scad>

//nutHole(10);
//boltHole(20);

use <MCAD/boxes.scad>

$fn=100;
roundedBox([20, 30, 40], 5, false);

translate([40,0,0])
roundedBox([20, 30, 40], 5, true);



