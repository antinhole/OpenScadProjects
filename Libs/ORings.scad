/*
This if for very basic o-Rings
*/

module EmptyCone(D1,D2,hight,thickness) {


difference(){
    cylinder(d1=D1,d2=D2, h=hight, center=true);
    cylinder(d1=D1-thickness,d2=D2-thickness, h=hight, center=true);
    
}


}

module Fillet(size=3)
{//http://stackoverflow.com/questions/41787171/3d-fillet-in-openscad

//minkowski()
//{
    intersection(){
        children([0]);
        children([1]);
    }
    sphere(r=size);
  
//}
//  children();
}
module RingByDiameter(D1,D2,h) {
    // body...
difference(){
    cylinder(d=D1, h=h, center=true);
    cylinder(d=D2, h=h, center=true);
    
}

}
$fn=20;
//ex: small ring for 
RingByDiameter(10.6,9.6,.5);
EmptyCone(10.1,12.0,3,.5);
Fillet()
{
    a=10;
    offset=3;
   translate([0, 0,-1*a])
        sphere(r=a,center=true);

        translate([0, 0, a*.5-offset]) {
        sphere(r=a*.5,center=true);   
      
    }
}


  a=10;
    offset=3;


module Fillet2(Factor=1.5)
{
//http://stackoverflow.com/questions/41787171/3d-fillet-in-openscad
step=45;
x=step;
//for(x = [0 : step :90-step]){
    sinx= sin(x)*Factor+1;
    cosx = cos(x)*Factor+1;
    sinx2= sin(x+step)*Factor+1;
    cosx2 = cos(x+step)*Factor+1;
    echo("sinx",sinx);
  //  hull(){
  //   color([1/sinx,1/sinx,1/sinx])   

  
 minkowski(){

  difference(){
            intersection(){
            scale([Factor,Factor,Factor]) 
            children([0]);
            scale([Factor,Factor,Factor])  
            children([1]);
            }
           children();
        }
  
      //translate([Factor/2, Factor/2,Factor/2 ]) 
      sphere(Factor/2);
 }
  /*     difference(){
            intersection(){
            scale([sinx2,sinx2,sinx2]) children([0]);
            scale([cosx2,cosx2,cosx2])  children([1]);
            }
            children();
        }
    }*/


   color([.5,.5,.5,.3]) children();
}

/*
module Fillet(size=2)
{//http://stackoverflow.com/questions/41787171/3d-fillet-in-openscad

//minkowski()
//{ 
   
    hull(){
    intersection(){
      translate ([0,0,size])   children([0]);
        children([1]);
    
    }
     intersection(){
        children([0]);
     translate ([0,0,-1*size])       children([1]);
    }
}
   color([.01,.01,0.01,.1]) children();
}



  
// sphere(r=1,center=true);

*/
!Fillet2(){
 translate([0, 0,-1*a])
        sphere(r=a,center=true);

        translate([0, 0, a*.5-offset]) 
        {
           // sphere(r=a*.5,center=true);  
          cube([a*.5,a*.5,a],center=true);
           }
        
    }

