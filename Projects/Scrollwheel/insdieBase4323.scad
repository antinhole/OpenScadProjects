
use  <\..\..\Libs\ComonFuntions.scad>

PlateHight=1.75;
baseD=53.0;
baseHoleD=21;
holeD=1;
//$fn=50;
HoleSpaceing=2.54;//Try:1

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
cylinder(d1=baseHoleD,d2=baseHoleD-3, h=PlateHight, center=true);


//spoke_ify(3)
//{
translate([0,baseD/2-bracketspaceing,0]) cube ([9,20,3],center=true);
//{
//holes();
//} 
//}



}
}

 base();