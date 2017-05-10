GearHousing=[22,18,36];
axle=[5.5,37];
axle_bottemOffset=8.5 - axle[0]/2;
motor=[22,18,29.5];
module Holes() {
 rotate([90,90,0]) 
    cylinder(d=3,h=GearHousing[1],center=true);

}
module GearHousing() {

   difference(){
 cube(GearHousing
, center=true);

translate([GearHousing[0]/2-2,0,GearHousing[2]/2-5])
    Holes();
translate([-1* GearHousing[0]/2+2,0,GearHousing[2]/2-5])
    Holes();

   }
 translate([0, 0,-1*(GearHousing[2]/2-axle_bottemOffset-axle[0]/2 )]) 
 rotate([90,90,0]) {
Axle();
 }

} 
module Axle(args) {
    intersection()
    {
        cube([3.5,axle[0],axle[1]],center=true);
  
  cylinder(d=axle[0], h=axle[1], center=true,$fn=20);    
    }   
}

module Motor() {
    intersection()
    {
        cube(motor,center=true);
        cylinder(d=motor[0],h=motor[2] ,center=true);
            
    }
} 

module Stack(ObjcetVector1,ObjcetVector2) {
    
translate([0, 0,-1*ObjcetVector1[2]/2])
    children(0);

translate([0, 0,  ObjcetVector2[2]/2]) 
    children(1);

}
Stack(GearHousing,motor)
{
GearHousing();

Motor();
}

//translate([0, 0,(GearHousing[2]/2+ motor[2]/2)]) 
  //      Motor(); 
