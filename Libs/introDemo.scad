//step 1 cube
//translate ([1,5,1]){
$fn=50;
val_a=10;
val_b=7;
val_c=val_a/2;



stamp_thickness=.1;
//cube ([5,5,stamp_thickness],center=true);


//stamp_thickness=5;
//cube ([5,5,stamp_thickness],center=true);

stamp_thickness=5;
//basic shapes
!union(){
translate ([0,2,0]) cylinder(h=1,r=1,center=true);
translate ([3,0,0]) cube ([1,1,1],center=true);
translate ([0,0,2]) sphere(r=1);
}
//union WE HAVE USED this before 
//!
union(){
cube ([5,5,.1],center=true);
cylinder(h=1,r=2,center=true);
}
//intersection is where two or more objet meet
//!
intersection(){
cube ([5,5,.1],center=true);
cylinder(h=1,r=2,center=true,$fn=50);
}


//translate moves things in x,y,z 
//!
translate ([0,2,.5]){cylinder(h=1,r=2,center=true,$fn=50);}


//second example
//1
union()
{
    cube ([5,5,.1],center=true);
    translate ([1,1,0]){
      cylinder(h=1,r=2,center=true,$fn=50);
    }
}
//rotate you guessed it!
//!
rotate (a=45, v=[1,0,0]){cylinder(h=1,r=2,center=true,$fn=50);}
//thing to note: the V= is a vector or pole around witch the rotation will occure the lenght of the vector is not relavent
//!
rotate (a=45, v=[0,10,0]){cube ([5,5,.1]);}
//!
rotate (a=45, v=[0,0,1]){cube ([5,5,.1],center=true);}
//!
rotate (a=$t*360, v=[0,1,1]){cube ([5,5,5],center=true);}

//!
scale([0.5,1,2]) sphere(1);
//!
intersection(){
    cube ([5,5,.1],center=true);
    translate ([1,0,0]){
      cylinder(h=1,r=2,center=true,$fn=50);
    }
}

//something minus another
//!
difference(){
    cube ([5,5,.1],center=true);
    translate ([1,0,0]){
      cylinder(h=1,r=2,center=true,$fn=50);
    }
}

//order matters
//!union(){
difference(){

    translate ([1,0,0]){
      cylinder(h=1,r=2,center=true,$fn=50);
    }
       cube ([5,5,.1],center=true);
}

//can add before subracting 
//!
difference(){
 
  union(){  translate ([1,0,0]){
      cylinder(h=1,r=2,center=true,$fn=50);
         }
       cube ([5,5,.1],center=true);
}
      cylinder(h=1.1,r=2,center=true,$fn=50);
}

//can have defualt prameters
module thing_a_mabob(i=1,k=5)
{
 difference(){
 
  union(){  translate ([1,0,0]){
      cylinder(h=i,r=2,center=true,$fn=50);
         }
       cube ([k,k,.1],center=true);
}
      cylinder(h=1+0.1,r=2,center=true,$fn=50);
}   
    
}

//!
thing_a_mabob();

//!
thing_a_mabob(i=2,k=10);
//some more complex functions are avaablie for poin by point Drawing  
//!
difference() {
    polyhedron(
        points=[[0,0,0],//0
            [2,0,0],//1
            [2,1,0],//2
            [0,1,0],//3
            [0,0,2],//4
            [0,1,2]],//5 [5,4,1,2]
        faces=[[0,1,2,3],[2,1,4,5],[5,4,0,3],[4,1,0],[5,3,2]]);
    cube([1,1.1,1]);
};

module random_objects()
{
translate ([0,2,0]) cylinder(h=1,r=1,center=true);
translate ([3,0,0]) cube ([1,1,1],center=true);
translate ([0,0,2]) sphere(r=1);
}

//!
union(){
translate([10,0,0]) random_objects();
}
//!
hull() {
 random_objects();
 }

//!
union(){
surface(file = "surface.dat", center = true, convexity = 5);
%translate([0,0,5])cube([10,10,10], center =true);
}
//!
!scale([.1,.1,.01]){

surface(file = "GAIG_Annuity_Logo.png", center = true, convexity = 5,invert = true);
}

scale([.1,.1,.01]){
    surface(file = "GA_Egale_Logo.png",  convexity = 5,invert = true);
    }
///////////////////////////////////////////////////////////////////////////////////////////// extra shit /////////////////////////////////////////////////////// 
scale([.1,.1,.005]){
    surface(file = "chad2.png",  convexity = 9 ,center =true);
    }
//warring does a lot of processing
difference(){
//union(){
    cylinder(r=15, h=1, center=true);
translate ([0,0,.5]){
    rotate( v=[0,1,0],a=180)
    scale([.1,.1,.005]){
    surface(file = "chad2.png",  convexity = 9 ,center =true);
    }
}

}


