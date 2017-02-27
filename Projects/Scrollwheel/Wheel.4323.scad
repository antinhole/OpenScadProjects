
use  <\..\..\Libs\ComonFuntions.scad>

innerHoler=25/2;
pi = 3.1415926;

outerR=43/2; //52 is limit
fingerFaceThickness=3.2;
fingerdepth=.75;

fingerHight=2;

Hight=4;
innerR=outerR-fingerdepth;
numberOfFingers=floor((2*pi*outerR)/fingerFaceThickness/2);
$fn=numberOfFingers*4;


VOuterD=62.3;//guess need to mesure
VTopHight=10;//guess need to mesure

VTinnerLipHight=3;//guess

VBOuterLipThickness=6;//
vbHight=15;//guess

//Rod
RodR=3;

BaseD=70;
baseRimd=62.3;
BaseInnerd=32;
BaseHigh=27;
baserimHight=22;

module irReciverCutout()
{
ircInnerR= innerHoler+  3;
ircOuterR=innerR;
ircHight=1;
translate([0, 0, Hight/2-ircHight/2-fingerHight])
    {
        difference()
        {
            cylinder(r=ircOuterR, h=ircHight, center=true);
           cylinder(r=ircInnerR, h=ircHight, center=true); 
      }
    }
}

module WheelWithFingers() 
{
  //color([100,100,100,.40])
   //irReciverCutout();
difference()
{
    cylinder(r=outerR, h=Hight, center=true);
    translate([0, 0, Hight-fingerHight]) {
        cylinder(r=innerR, h=Hight, center=true);
        }

   translate([0, 0, -.5*Hight]) {
        cylinder(r=innerHoler, h=Hight*2, center=true);
        }
     
      
        

echo(str("numberOfFingers = ", numberOfFingers));

 spoke_ify(numberOfFingers){
        translate([outerR-fingerFaceThickness-1, 0,Hight/2-fingerHight/2]) 
            {
            cube([outerR,fingerFaceThickness,fingerHight], center=true);  
            }
    }
 irReciverCutout();
}

}
WheelWithFingers();
//VcrHeadTop();
