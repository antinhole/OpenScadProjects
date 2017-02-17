include <Consts.scad>

/*
base holds all the things in alinment 
so it holds:
    1.carousel 
        a.gears 
        b. motor
    2.filling assabimly 
        a. tub holder
        b. pump   

*/

module base() {
    cube([baseRad*2,baseRad*2,BaseHight],center= true);
    
}



base();
