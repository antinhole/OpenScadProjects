


///hold the old mouse board
// hold the wheel up and level
baseR=40;
vcrheadR=30.5;
vcrHight=25;


difference()
{
//scale([3,2,1]) 
sphere(r=baseR/3);
translate([0, 0,baseR/-2]) {
    cube([baseR*2,baseR*2,baseR],center= true);
}
translate([0, 0,vcrHight]) {
cylinder(r=vcrheadR, h=vcrHight, center=true);
}
}   

