
use  <\..\..\Libs\ComonFuntions.scad>

innerHoler=30.56/2;
pi = 3.1415926;

  

outerR=42/2; //52 is limit
fingerFaceThickness=3.2;
fingerdepth=1;

fingerHight=1.5;

Hight=7;
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


module VcrHeadTop() {
//base of top
cylinder(d=VOuterD,h=VTopHight,center=true);
//innerLip
translate([0,0,VTinnerLipHight/-2 - VTopHight/2]){
    cylinder(r=innerHoler,h=VTinnerLipHight,center=true);
}
//Rod
cylinder(r=RodR,h=VTinnerLipHight,center=true);
}
module VcrHeadBottem() {
//base of Bottem
cylinder(d=VOuterD,h=vbHight,center=true);
}
module VcrHead() {
translate([0,0,0]){
VcrHeadTop();
}
translate([0,0,0]){

VcrHeadBottem();
}
}

module base() 
{

difference()
{
    cylinder(d=BaseD, h=BaseHight, center=true);
    translate([0, 0, 4]) {
        cylinder(d=BaseInnerd, h=BaseHight - baseLip, center=true);
        
        }
    translate([0, 0, 4]) {
        cylinder(d=BaseInnerd, h=BaseHight - baseLip, center=true);
        
        }

}


}


module WheelWithFingers() 
{


difference()
{
    cylinder(r=outerR, h=Hight, center=true);
    translate([0, 0, 4]) {
        cylinder(r=innerR, h=Hight, center=true);
        }

   translate([0, 0, -.5*Hight]) {
        cylinder(r=innerHoler, h=Hight*2, center=true);
        }
echo(str("numberOfFingers = ", numberOfFingers));

 spoke_ify(numberOfFingers){
        translate([outerR-fingerFaceThickness-1, 0,Hight/2-fingerHight]) 
            {
            cube([fingerFaceThickness*2,fingerFaceThickness,fingerHight]);  
            }
    }
}
}
WheelWithFingers();
//VcrHeadTop();
