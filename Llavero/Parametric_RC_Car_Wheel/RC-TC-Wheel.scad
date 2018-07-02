// Parametric 1/10th Scale Touring Car Wheel
// Version 1.1
// Jason S. Mantor 9/12/2013
// All Dimensions are in millimeters

module Hex_Prism(d,h) {
	difference() {
		cylinder (r=1*d,h=h,center=true);
		union() {
			for (i=[0:1:5]) {
				rotate([0,0,i*60]) translate([d,0,0]) cube([d,1.1*d,1.01*h], center=true);
			}
		}
	}
}

module TC_Wheel(wd,ww,hd,off) {


	module TC_Wheel_Tire_Groove() {
		olt = 2;	//Outer Lip Thickness
		ilt = 1;	//Inner Lip Thickness
		gap=4;	//Gap for the tire bead

		translate([0,0,-ww/2])
		union() {
			cylinder(r=wd/2+2,h=olt);
			translate([0,0,gap+olt]) cylinder(r=wd/2+1,h=ilt);
		}
	}

	module TC_Wheel_Center() {
		dht=4;  	//Drive Hex Thickeness
		wcd= 10;  	//Clearance Diameter for the Axle Nut Wrench
		nt=4;		//Axle Nut Thickness
		ad=4;		//Axle Diameter
		d=ww/2-off-ins;

		translate([0,0,(ww-d)/2-ins])
		difference() {
			cylinder(r=cd/2, h=d,center=true);
			cylinder(r=ad/2,h=d+1, center=true);
			translate([0,0,-d/2+dht/2-.01]) Hex_Prism(hd,dht);
			translate([0,0,d/2-nt/2+.1]) cylinder (r=wcd/2,h=nt,center=true);
		}
	}

	module TC_Wheel_Spokes(n) {
		ra=360/n;			//Radial Angle
		st=1;				//Spoke Thickness
		sw=3	;			//Spoke Width
		rh=6;				//Rib Height
		rt=1;				//Rib Thickness
		x=(wd-cd)/2;
		sa=atan(ins/x);		//Spoke Angle
		sl=sqrt(x*x+ins*ins)+ins; 	//Diagonal length of spoke

		translate([0,0,ww/2-ins])
		union() {
			for (i=[1:1:n]) {
				rotate([0,0,i*ra]) translate([(hd+sl)/2-ins+3,0,0]) rotate([0,-sa,0]) union() {
					translate([0,0,st/2])  cube([sl,sw,st],center=true);  //Spoke
					translate([0,0,(st-rh)/2]) cube([sl,rt,rh],center=true);  //Rib
				}
			}
		}
	}

	ins=3;	//Inset from the outside face of the rim
	cd=wd/2.5;	//Center Diameter
	rt=2;		//Rim Thickness

	union() {
		difference() {
			union() {
				cylinder(r=wd/2,h=ww,center=true);
				TC_Wheel_Tire_Groove();
				mirror([0,0,1]) TC_Wheel_Tire_Groove();
			}
			cylinder(r=(wd-rt)/2,h=ww+.1,center=true);
		}
		
		TC_Wheel_Center();
		intersection() {
			TC_Wheel_Spokes(10);
			cylinder(r=(wd-rt/2)/2,h=ww+.1,center=true);
		}
	}
}

$fs=.1;
$fa=3;
TC_Wheel(48,26,12,0);

