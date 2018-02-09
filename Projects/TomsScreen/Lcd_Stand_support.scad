/*XDist=20;
YDist=12;
module BaseCube() {
    // body...
    
    difference(){
      translate([0, -2, 0])  cube([XDist,34,16],center=true);
        translate([0, 4, 0]) {
        translate([0, 6, 0])     rotate([0,90,0])cylinder(r=3, h=XDist+1, center=true);
        translate([0, -6, 0])     rotate([0,0,90])cylinder(r=3, h=XDist+1, center=true);
    }
     translate([0, -17, 0])   cube([6,7,17],center=true);
    }
}


translate([0, 0, -8]) 
BaseCube();*/
///translate([0, 12, 0]) 
//rotate([0,90,0])BaseCube();

XDist=20;
YDist=12;
module BaseCube() {
    // body...
    
    difference(){
      translate([0, -2, 0])  cube([XDist,34,16],center=true);
        translate([0, 4, 0]) {
        translate([0, 6, 0])     rotate([0,90,0])cylinder(r=3, h=XDist+1, center=true);
        translate([0, -6, 0])     rotate([0,0,90])cylinder(r=3, h=XDist+1, center=true);
    }
     translate([0, -17, 0])   cube([6,7,17],center=true);
    }
}


translate([0, 0, -8]) 
BaseCube();
///translate([0, 12, 0]) 
//rotate([0,90,0])BaseCube();