use <\..\..\Libs\taz5Print_sizes.scad>


module bottleHoles(outsideR,insideR,Hight,number_of_bottles,Bottle_r)
{
      for (i=[0:number_of_bottles])
      {
        rotate([0,0,i*360/number_of_bottles])
          {
              translate([outsideR,0,0])
            {
      cylinder(h=Hight,r=Bottle_r,center=true);
              }
          
           }
        }
    }
 
module base(outsideR,insideR,Hight,number_of_bottles,Bottle_r)
{
  difference(){
      cylinder(h=Hight,r=outsideR,center=true);
      cylinder(h=Hight+1,r=insideR,center=true);
bottleHoles(outsideR,insideR,Hight,number_of_bottles,Bottle_r);
      }
    }


number_of_bottles=6;
Bottle_r=74;
Buffer=5;
outsideR=150;
insideR=outsideR-Bottle_r-Buffer;
    rotate(v=[0,0,1],a=33)
base(outsideR,insideR,15,number_of_bottles,Bottle_r);
 //  bottleHoles(outsideR,insideR,5,number_of_bottles,Bottle_r);
color("Blue",0.3) {
 Print_vol();   
}
