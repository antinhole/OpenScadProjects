use  <GearLib.scad>
include <Consts.scad>



//n1 = 8; //red gear number of teeth
n2 = 45; //green gear
//n3 = 5;  //blue gear
//n4 = 20; //orange gear
//n5 = 8;  //gray rack
mm_per_tooth = 9; //all meshing gears need the same mm_per_tooth (and the same pressure_angle)
thickness    = 6;
hole         = 5;
height       = 12;

d1 =pitch_radius(mm_per_tooth,n1);
d12=pitch_radius(mm_per_tooth,n1) + pitch_radius(mm_per_tooth,n2);
d13=pitch_radius(mm_per_tooth,n1) + pitch_radius(mm_per_tooth,n3);
d14=pitch_radius(mm_per_tooth,n1) + pitch_radius(mm_per_tooth,n4);
  // the mating caracelGear
module CarouselGear() {
  
	difference() {
cylinder(h=thickness,r=80, center=true, $fn=50);

translate([ 0,    0, 0]) 
        rotate([0,0, $t*360/n2]) 
                color([1.00,0.75,0.75]) 
                gear(mm_per_tooth,n2,thickness,0);
    }
 
  }

CarouselGear();