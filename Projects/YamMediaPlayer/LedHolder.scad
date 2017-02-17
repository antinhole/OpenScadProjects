/*
7mm board to top

*/
baseW=32;
baseH=45;/// tested at 41 more space added for top and bottem
NumberOfBoards=6;
screenW=32;
screenH=32;
switchspace=25;
module topBezel() {
difference(){
cube(size=[baseW*NumberOfBoards+baseH-screenH,baseH , 7], center=true);
cube(size=[screenW*NumberOfBoards,screenH , 7], center=true);
}
}

module Cone() {
    cylinder(r1=1,r2=0.7, h=5, center=true);
    translate([0, 0, -1]) {
    cylinder(r=2, h=3, center=true);

    }
}

module sideholes(w=28)
{
     cylinder(r=w, h=10, center=true);
}

//one module
module Led_module_Holder() {
w=28;//hole width
h=37;//hole hight

difference(){
union(){
cube(size=[baseW, baseH, 3], center=true);
translate([w/2,  h/2, 4]) Cone();
translate([w/2,  h/-2, 4]) Cone();
translate([w/-2, h/2, 4]) Cone();
translate([w/-2, h/-2, 4]) Cone();
}
translate([w/2, 0 , 1.5]) sideholes(w/2-4);
translate([0,  h/-2, 1.5]) sideholes(w/2-4);
translate([0, h/2, 1.5]) sideholes(w/2-4);
translate([w/-2, 0, 1.5]) sideholes(w/2-4);
 


}

}
nonswitchspaceVoid=12;
module Led_module_HolderArray() {
    //top of box
translate([switchspace/2-nonswitchspaceVoid/2, baseH/2+2.5 , 0])
    cube(size=[baseW*6+switchspace+nonswitchspaceVoid, 5, 30], center=true);
//bottem of box
translate([switchspace/2-nonswitchspaceVoid/2, baseH/-2-2.5 , 0])
    cube(size=[baseW*6+switchspace+nonswitchspaceVoid, 5, 30], center=true);
// was here: put end caps on 


translate([baseW*-.5, 0 , 0])
{
Led_module_Holder();
 
 translate([baseW*1, 0 , 0])Led_module_Holder();
 translate([baseW*-1, 0 , 0])Led_module_Holder();
 translate([baseW*-2, 0 , 0])Led_module_Holder();
 translate([baseW*2, 0 , 0])Led_module_Holder();
 translate([baseW*3, 0 , 0])Led_module_Holder();
}
}


Led_module_HolderArray();


/*translate([0, 0 , 10])
difference(){


 translate([baseW*.5, 0 , 8])topBezel();
    
 Led_module_Holder();
 translate([baseW*1, 0 , 0])Led_module_Holder();
 translate([baseW*-1, 0 , 0])Led_module_Holder();
 translate([baseW*-2, 0 , 0])Led_module_Holder();
 translate([baseW*2, 0 , 0])Led_module_Holder();
 translate([baseW*3, 0 , 0])Led_module_Holder();
}
*/