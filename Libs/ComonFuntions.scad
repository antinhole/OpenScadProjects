/*
just plan old comon things I have found my self wanting to do.
*/

module Invert() {
for (i=[0:$children]) {
    


    difference(){
            hull(){children(i);}
            children(i);
        }
    }
}
module Invert_Example1()
{

//a shape with a hole
Invert() {
        difference(){
             union(){
                cube(size=[10, 10, 10], center=true);
                 translate([0, 2, 7]) {
                 sphere(r=5);
                 }
             }
             
                 translate([2, 0, 0]) {
           cylinder(r=3, h=51, center=true);
            }
        }
}

}
/*
keeps all the holes in the first child this assumes the fisrt child is relitively simple
*/
module keepHoles_union() {

    difference(){
        children();
        //the parts to delete
       Invert() {
           
            //hull(){children(0);}
            children(0);
        }
   }
}



module keepHoles_union_Example1()
{
    
    keepHoles_union()
    {
        //a cube with a hole
        difference(){
             cube(size=[10, 10, 10], center=true);
                 translate([5, 0, 0]) {
           cylinder(r=3, h=11, center=true);
            }
        }
        /// this is he second child
        cube(size=[20, 20, 3], center=true);

    }

}


module keepHoles_union_Example2()
{
    
    keepHoles_union()
    {
        //a shape with a hole
        difference(){
             union(){
                cube(size=[10, 10, 10], center=true);
                 translate([0, 2, 7]) {
                 sphere(r=5);
                 }
             }
             
                 translate([2, 0, 0]) {
           cylinder(r=3, h=51, center=true);
            }
        }
        /// this is he second child
        cube(size=[20, 20, 3], center=true);

    }

}

module keepHoles_union_Example3()
{
    
    keepHoles_union()
    {
        //a shape with a hole
        difference(){
          
                cube(size=[10, 10, 10], center=true);
                translate([2, 0, 0]) {
           cylinder(r=3, h=51, center=true);
            }
        }
        /// this is he second child
        cube(size=[20, 20, 3], center=true);
        translate([0, 2, 7]) {
        sphere(r=5);
        }
    }

}



//keepHoles_union_Example1();
keepHoles_union_Example2();
   translate([30, 0, 0]) Invert_Example1();
   

   translate([-30, 0, 0]) keepHoles_union_Example3();


   

module spoke_ify(number_of_spokes=5)
{
    angle= 360/number_of_spokes;
    for(s=[0:number_of_spokes])
      rotate (s*angle,[0,0,1]){ children();} 
    }


/*
    /\   /\          ┬   ┬	 ┬
   |  | |  |         │   │	 │
    \ | | /          │   │	 │
     || ||           │   │	 ┴ Ball_Hight ┬
     ||_||           │   ┴Slot_hight	  │
_____|   |_____      ┴ Post_hight		  ┴ PCB_Hight  
|             |						  
									   
|---PCB_PAD---| <- PCB_PAD   
   |---B----| <-Ball_size no BIGGER THAN PCB HOLD SIZE  
     |-H-|  <-Pcb_Hole   
      |S|   <- SLOT_SIZE

Ball_Hight + PCB_Hight   =  Post_Hight
Post_hight  => Slot_Hight > Ball_Hight 
ball_hight = Ball_width +  slotsize before slot size is added

thoughts: simple is where Ball_Hight= PCB_Hight

Pcb_Hole=2.5;
Ball_size=Pcb_Hole*.80;

SLOT_SIZE=Pcb_Hole*.25;
PCB_PAD=6.2;   // pi 3
PCB_Hight=1.6



*/

module PCBSnapPost(R1=2.5,r2=3,high=7,slothight=5,slotwith=1.5,pcbthickness=1.3)
{
    Pcb_Hole    =2.5;
    PCB_PAD     =6.2;   // pi 3
    PCB_Hight   =1.6;

    Ball_size   =Pcb_Hole*.85;
    SLOT_SIZE   =Pcb_Hole*.25;
    Post_Hight  =PCB_Hight+Ball_size;
    difference(){
        union(){
            translate([0,0,Post_Hight/2])  cylinder(d=Pcb_Hole,h=Post_Hight,center=true);
            translate([0,0,Post_Hight/2+Ball_size]) 
            { // two balls offset so the splt ball will have the same diam as the hole whne compressed 
                translate([SLOT_SIZE/2,0,0])  sphere(d=Ball_size,center=true);
                translate([SLOT_SIZE/-2,0,0]) sphere(d=Ball_size,center=true);
            }
        }
        translate([0,0,Post_Hight/2+Ball_size]) cube([SLOT_SIZE,Ball_size*1.5, Post_Hight],center=true);
    }
    translate([0,0,Post_Hight/-2]) cylinder(d=PCB_PAD,h=Post_Hight,center=true);
}

$fn=15;
PCBSnapPost();

