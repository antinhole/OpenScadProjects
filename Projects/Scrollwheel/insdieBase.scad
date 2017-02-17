
PlateHight=2.5/2;
baseD=53.0;
baseHoleD=21;
holeD=1;
$fn=70;
HoleSpaceing=2.54;//Try:1
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

//tow holes
translate([HoleSpaceing/2, 5, 0]) {
    cylinder(d=holeD, h=PlateHight, center=true);
    translate([HoleSpaceing, 0, 0]) {
    cylinder(d=holeD, h=PlateHight, center=true);
    }
    }
}
}

module base()
{
    difference()
{
cylinder(d=baseD, h=PlateHight, center=true);
cylinder(d1=baseHoleD,d2=baseHoleD+2, h=PlateHight, center=true);

translate([0,baseD/2-8.5,0])
{
holes();
}    


}
}

 base();