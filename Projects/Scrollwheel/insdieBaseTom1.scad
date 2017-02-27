
use  <\..\..\Libs\ComonFuntions.scad>

PlateHight=1.75;
baseD=53.0;
baseHoleD=22;
holeD=1;
$fn=70;
HoleSpaceing=2.54;

bracketspaceing=8.5;
bracketholesD=1.0;


module holes(args) {
    // body...
    //three holes

translate([-HoleSpaceing, 0, 0]) {    
cylinder(d=holeD, h=PlateHight, center=true);
translate([HoleSpaceing, 0, 0]) {
    cylinder(d=holeD, h=PlateHight, center=true);
    translate([HoleSpaceing, 0, 0]) {
        cylinder(d=holeD, h=PlateHight, center=true);
        }
}

//two holes
translate([HoleSpaceing/2, 5, 0]) {
    cylinder(d=holeD, h=PlateHight, center=true);
    translate([HoleSpaceing, 0, 0]) {
    cylinder(d=holeD, h=PlateHight, center=true);
    }
    }
}
bracketspaceing=8.5;
bracketholesD=1.5;
//two mounting bracket holes
translate([-1*bracketspaceing/2,-2,  0]) {
    cylinder(d=bracketholesD, h=PlateHight, center=true);

}
translate([1*bracketspaceing/2,-2,  0]) {
    cylinder(d=bracketholesD, h=PlateHight, center=true);

}
//two Mid mounting bracket holes
translate([-1*bracketspaceing/2,2.5,  0]) {
    cylinder(d=bracketholesD, h=PlateHight, center=true);

}
translate([1*bracketspaceing/2,2.5,  0]) {
    cylinder(d=bracketholesD, h=PlateHight, center=true);

}
//top bracket 
translate([0,7.5,  0]) {
    cylinder(d=bracketholesD, h=PlateHight, center=true);

}


}

module base()
{
    difference()
{
cylinder(d=baseD  , h=PlateHight, center=true);
cylinder(d=baseHoleD, h=PlateHight, center=true);


spoke_ify(7)
{
translate([0,baseD/2-bracketspaceing,0])
{
holes();
} 
}

}
}

 base();