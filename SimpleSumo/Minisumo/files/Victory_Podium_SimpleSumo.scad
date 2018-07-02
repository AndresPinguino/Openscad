
 
/////////////////////////////////////////////////
/* [General] */
/////////////////////////////////////////////////

border = 106; //mm top square area
baseWidth = border; 
baseDepth = border;
baseHeight = 25*1;
flare = 6*1; //angle of the podium
corner = 3*1; //roundness of the corners

fontSize = 6; 
fontType = "Source Sans Pro:style=Bold";
fontDepth = 1.0*.7+.7;

/////////////////////////////////////////////////
/* Hidden */
/////////////////////////////////////////////////
           
// Write three short lines of text for the front side of the base           
front1 = "SimpleSumo CHAMPION";
front2 = "Battle Arena Challenge";
front3 = " ";

// Write three short lines of text for the left side of the base   
left1 = "SimpleSumo CHAMPION";
left2 = "Line Follower Challenge";
left3 = " ";//"YOUR TEXT HERE";

// Write three short lines of text for the right side of the base   
right1 = "SimpleSumo CHAMPION";
right2 = " ";
right3 = " ";//"YOUR TEXT HERE";

// Write three short lines of text for the back side of the base   
 back1 = "SimpleSumo CHAMPION";
 back2 = "Clean Sweep Challenge";
 back3 = "  ";

/////////////////////////////////////////////////
/* renders! */
/////////////////////////////////////////////////

difference(){
    union(){
difference(){
    
    union(){
        base();
        labels("front",front1,front2,front3);
        labels("left",left1,left2,left3);
        labels("right",right1,right2,right3);
        labels("back",back1,back2,back3);
        };
        cube([108,108,15],center =true);
};
        cube([90,90,15],center =true);
};
        translate([0,0,-16.5])cube([200,200,30],center =true);
};

/////////////////////////////////////////////////////////////////
// MODULE text
/////////////////////////////////////////////////////////////////

module labels(place,line1,line2,line3){
    angle = (place == "front") ? 0   :
            (place == "right") ? 90  : 
            (place == "back")  ? 180 : 
            (place == "left")  ? 270 : 0; 
    trans = (place == "front") ? -baseDepth/2 - flare - corner : 
            (place == "right") ? -baseWidth/2 - flare - corner : 
            (place == "back")  ? -baseDepth/2 - flare - corner : 
            (place == "left")  ? -baseWidth/2 - flare - corner : 0;
    rotate(angle,[0,0,1])
    translate([0,trans+1,(baseHeight-fontSize*2)/10])
    rotate(-(90-atan(baseHeight/flare)),[1,0,0])
    translate([0,0,fontSize/2+1])
    rotate(90,[1,0,0])
    color("white")
    linear_extrude(height=fontDepth)
    union(){
        translate([1,2*(-fontSize+11.5),0]) 
            text(line1,font=fontType,size=fontSize,halign="center",valign="center");
        translate([0,(-fontSize+7.5),0]) 
            text(line2,font=fontType,size=fontSize,halign="center",valign="center");
        translate([0,0,0]) 
            text(line3,font=fontType,size=fontSize,halign="center",valign="center");
    }
}
    
/////////////////////////////////////////////////////////////////
// MODULE base
/////////////////////////////////////////////////////////////////

module base(){
    res = 30;
    xtrans = baseWidth/2;
    ytrans = baseDepth/2;
    ztrans = baseHeight;
    difference(){
        hull(){
            translate([xtrans,ytrans,ztrans]) sphere(corner,$fn=res);
            translate([-xtrans,ytrans,ztrans]) sphere(corner,$fn=res);
            translate([xtrans,-ytrans,ztrans]) sphere(corner,$fn=res);
            translate([-xtrans,-ytrans,ztrans]) sphere(corner,$fn=res);
            translate([xtrans+flare,ytrans+flare,0]) sphere(corner,$fn=res);
            translate([-(xtrans+flare),ytrans+flare,0]) sphere(corner,$fn=res);
            translate([xtrans+flare,-(ytrans+flare),0]) sphere(corner,$fn=res);
            translate([-(xtrans+flare),-(ytrans+flare),0]) sphere(corner,$fn=res);
        }
        hull(){
            translate([xtrans-corner,ytrans-corner,ztrans+corner]) 
                sphere(corner/2,$fn=res);
            translate([-(xtrans-corner),ytrans-corner,ztrans+corner]) 
                sphere(corner/2,$fn=res);
            translate([xtrans-corner,-(ytrans-corner),ztrans+corner]) 
                sphere(corner/2,$fn=res);
            translate([-(xtrans-corner),-(ytrans-corner),ztrans+corner]) 
                sphere(corner/2,$fn=res);
        }}      
        
}
