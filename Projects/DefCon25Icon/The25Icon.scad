


translate([0, 0, -7]) 
difference(){
rotate([0, 0, 45]) {
    cube([10,10,10],center=true);
}
translate([0, 0, -2.5]) {
    cube([25,7,2],center=true);
}
translate([0, 6, 2.5]) {
    cube([25,7,2],center=true);
}
translate([0, -6, 2.5]) {
    cube([25,7,2],center=true);
}

}
translate([0, 0, 7]) TheCDBox();

module TheCDBox(){
    //rotate([0, 0, 45])
    difference(){
    cube([10,10,10],center=true);
    TheD();

    }
}

module TheDBox(){ 

intersection(){
    difference(){
        rotate([0, 0, 45]) {
            cube([10,10,10],center=true);
        }
        rotate([180, 90, 180]) 
        translate([0, 5, 0]) {
        TheD();
        }
        rotate([0, 90, 180]) 
        translate([0, 5, 0]) {
       TheD();
        }
       // cube 
    }
///out side of the d 
union(){
 rotate([0, 90, 0]) {
       translate([0, -6, 0])   cylinder(r=6.5, h=25, center=true);
 }
rotate([0, 90, 0]) {
       translate([0, 6, 0])   cylinder(r=6.5, h=25, center=true);
 }
}

}
}
module TheD(){ 
    
    difference(){
    cylinder(r=3, h=25, center=true);
     translate([0, 1.5, 0]) cube([6,3,25.1],center=true);
    }
}

