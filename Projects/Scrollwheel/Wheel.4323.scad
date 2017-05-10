
use  <\..\..\Libs\ComonFuntions.scad>

innerHoler=25/2;
pi = 3.1415926;

outerR=43/2; //52 is limit
fingerFaceThickness=3.2;
fingerdepth=.75;

fingerHight=2;

TotalHight =4.1;
innerfingerR=outerR-fingerdepth;
numberOfFingers=floor((2*pi*outerR)/fingerFaceThickness/2);
//opttional
$fn=numberOfFingers;


module irReciverCutout()
{
ircInnerfingerR= innerHoler+  3;
ircOuterR=innerfingerR;
ircHight=1;
translate([0, 0, TotalHight/2-ircHight/2-fingerHight])
    {
        difference()
        {
            cylinder(r=ircOuterR, h=ircHight, center=true);
           cylinder(r=ircInnerfingerR, h=ircHight, center=true); 
      }
    }
}

module WheelWithFingers() 
{
 // color([100,100,100,.40])
  // irReciverCutout();
difference()
{
    //base cylinder that all will be subbracted from
    cylinder(r=outerR, h=TotalHight, center=true);
    //cylander to inside of finger
    translate([0, 0, TotalHight-fingerHight]) {
        cylinder(r=innerfingerR, h=TotalHight, center=true);
        }

   translate([0, 0, -.5*TotalHight]) {
        cylinder(r=innerHoler, h=TotalHight*2, center=true);
        }
     
      
        

echo(str("numberOfFingers = ", numberOfFingers));

 spoke_ify(numberOfFingers){
        translate([outerR-fingerFaceThickness-1, 0,TotalHight/2-fingerHight/2]) 
            {
            cube([outerR,fingerFaceThickness,fingerHight], center=true);  
            }
    }
 irReciverCutout();
}

}
WheelWithFingers();
//VcrHeadTop();
