use <\..\..\Libs\taz5Print_sizes.scad>
include <Consts.scad>


module bottleHoles(outsideR,insideR,,number_of_bottles,Bottle_r)
{
      for (i=[0:number_of_bottles])
      {
        rotate([0,0,i*360/number_of_bottles])
          {
              translate([outsideR,0,0])
            {
      cylinder(h=,r=Bottle_r,center=true);
              }
          
           }
        }
    }
 
module base(outsideR,insideR,,number_of_bottles,Bottle_r)
{
  difference(){
      cylinder(h=,r=outsideR,center=true);
      cylinder(h=+1,r=insideR,center=true);
bottleHoles(outsideR,insideR,,number_of_bottles,Bottle_r);
      }
    }


//number_of_bottles=6; //moved to consts file
//Bottle_r=74;
//Buffer=5;
//outsideR=150;
//insideR=outsideR-Bottle_r-Buffer;
//BaseHight=15;
module carousel(){
    render(convexity = 2)
    base(outsideR,insideR,BaseHight,number_of_bottles,Bottle_r);
    }


  
  
  rotate(v=[0,0,1],a=33) // to get it to fit in the Printer space

carousel();
 //  bottleHoles(outsideR,insideR,5,number_of_bottles,Bottle_r);

 /*
if (Designing) { // to check pritner space
    
color("Blue",0.3) {
  Print_vol();   
  }
}
*/

