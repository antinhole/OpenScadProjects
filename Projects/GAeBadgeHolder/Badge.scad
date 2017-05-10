
use  <\..\..\Libs\MultiHeadPrinterFunctions.scad>

module GA_Egale_Logo()
{
 rotate([0,180,0])
//  translate([-12,0,4])
scale([.3,.3,.1])
  {
  surface(file = "C:\\Code\\PlayArea\\Git_OpenScad\\OpenScadProjects\\Projects\\GAeBadgeHolder\\GA_Egale_Logo.png",  convexity = 5,invert = true,center=true);
  }
}

module slotforlanyardthingamagiggy() {
    // body...
    Laynardims=[12,20,1];

    difference(){
        minkowski() {
    cube([Laynardims[0]-1.5,Laynardims[1]-1.5,Laynardims[2]],center=true);
      translate([0,0,0])  cylinder(r=1.5, h=1, center=true);
      //  translate([0,,0])  cylinder(r=1.5, h=1, center=true);
            
        }
        
    hull(){
      translate([0,-6,0])  cylinder(r=1.5, h=10, center=true);
        translate([0,6,0])  cylinder(r=1.5, h=10, center=true);
    }
    }
}
module TriHoleforlanyardthingamagiggy() {
  s=25;
     difference(){
    hull(){
      translate([-1*s,-6,0])  cylinder(r=4, h=2, center=true);
        translate([0,6,0])  cylinder(r=4, h=2, center=true);
      translate([s,-6,0])  cylinder(r=4, h=2, center=true);

    }
   hull(){
      translate([-1*s/2,-3,0])  cylinder(r=1.5, h=2, center=true);
        translate([0,3,0])  cylinder(r=1.5, h=2, center=true);
      translate([s/2,-3,0])  cylinder(r=1.5, h=2, center=true);

    }
    }


}
BatteryWidth = 26.5;
BatteryDepth = 17.5;
BatteryHeight = 48.5;
BatteryHolderThickness= 2;
module BatteryHolder_old()
{
  difference(){
 //outerCube
  cube([BatteryWidth+BatteryHolderThickness,BatteryDepth+BatteryHolderThickness,BatteryHeight],center=true);
 //inner cube
  cube([BatteryWidth,BatteryDepth,BatteryHeight+BatteryHolderThickness],center=true);
  }
  //Clipything
  translate([BatteryWidth/2-0.5,0,BatteryHeight/2])
      cube([2, 3, BatteryHolderThickness], center=true);
  translate([BatteryWidth/2-0.2,0,-1*BatteryHeight/2])
      cube([2, 3, BatteryHolderThickness], center=true);
  
}
module BatteryHolder()
{
    difference(){
  cube([40,34,3],center=true);
  translate([0,9,0])
    cylinder(r=2.2, h=10, center=true);
  translate([-14,-13,0])
    cylinder(r=2.2, h=10, center=true);
  translate([14,-13,0])
    cylinder(r=2.2, h=10, center=true);
    }
}


/*translate([-43, 0, -1.05]) {
    slotforlanyardthingamagiggy();
}
*/

$fn=50;
multiColorInLay(state="inside",Color1=[1,.5,.5],Color2=[.5,.5,1])
{
  union(){
    import("C:\\Code\\PlayArea\\Git_OpenScad\\OpenScadProjects\\Projects\\GAeBadgeHolder\\Arduino_uno_R3_clip_Base.stl", convexity=3);
    //translate([-100,-26 ,-90])
    //rotate([0, 0, 0]) 
    //rotate([90, 90, 0]) {
      //import("C:\\Code\\PlayArea\\Git_OpenScad\\OpenScadProjects\\Projects\\GAeBadgeHolder\\9vClip_plain.stl", convexity=7);

    //}
    translate([-6,32 , -1.05]) {
      
    TriHoleforlanyardthingamagiggy();
    }

    translate([-6,-43,-.6])  //rotate([0,90,0])
    BatteryHolder();
  }
translate([-4,0,-8])
scale([.5,.5,1])
 GA_Egale_Logo(); 

}