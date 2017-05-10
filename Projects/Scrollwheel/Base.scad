


///hold the old mouse board
// hold the wheel up and level
based=75;
vcrheadR=30.5;
vcrHight=25;
BoardW=40;
boardLenght=80;
boardHight=3;
module module_name(args) {
    // body...
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
}

module shell(thickness)
{
difference(){
    children();
    scale([thickness,thickness,thickness])
        {
            children();
        }
    }
}


 difference(){
     shell(.95)
{
hull(){
sphere(d=based);
translate([0,boardLenght/2+10,0]) sphere(d=BoardW);

}}
translate([0,0,-100]) cube([200,200,200],center=true);
}
translate([0,10,0])  cube([BoardW,boardLenght,boardHight],center=true);