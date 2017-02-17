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
