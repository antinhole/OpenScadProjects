
/*
notes nothing is centers automaicly in this schetc

*/



module OuterBase(lenght=120,width=120, Hight=50,rundedConnersR=4) {
    // body...\
    /* 4 cylinders 
    2   3

    1   4
   O
    */
    offSetL=lenght-rundedConnersR*2;
    offSetW=width-rundedConnersR*2;
    translate([rundedConnersR,rundedConnersR , 0])
    hull(){
        //1
        cylinder(r=rundedConnersR, h=Hight);
        //2
        translate([0,offSetL , 0])  cylinder(r=rundedConnersR, h=Hight); 
        //3
        translate([offSetW, offSetL, 0]) cylinder(r=rundedConnersR, h=Hight); 
        //4
        translate([offSetW, 0, 0])     cylinder(r=rundedConnersR, h=Hight); 
    }

    
}

module HollowBase(lenght=120,width=120, Hight=50,rundedConnersR=4,thickness=2)
{
    difference() {
    OuterBase(lenght,width, Hight,rundedConnersR);
    translate([thickness,thickness, thickness])
    OuterBase(lenght-thickness*2,width-thickness*2, Hight,rundedConnersR-thickness);
    }
}
//posts traslate[x,y] [R1,z1,R2,z2] 
function DefinePost(xOffset,yOffset,rad1=6,rad2=2.70,z1=4,z2=5) = [xOffset,yOffset,rad1,rad2,z1,z2];


module DrawPost(post=[10,10,3,2,4,5])
{
echo(str("post = ",post ));
    translate([post[0],post[1],0])
    {
        cylinder(r=post[2],h=post[4] );
        cylinder(r=post[3],h=post[5]);
    }
}
module BoxWithPosts(Dim=[120,120,50],rundedConnersR=4,thickness=2,posts=[[10,10,5,2,10,20]])
{
    echo(str("posts = ",posts ));
    HollowBase(lenght=Dim[0],width=Dim[1], Hight=Dim[2],rundedConnersR=4,thickness=2);
   translate([thickness,thickness, thickness]){//this needs to be passed in?? maybe posts off set
        for (post=posts) {
            DrawPost(post);
        }
   }
}


MyPosts=[
    DefinePost(xOffset=3.5,yOffset=3.5),
   DefinePost(xOffset=3.5,yOffset=49),
     DefinePost(xOffset=58,yOffset=49),
    DefinePost(xOffset =58,yOffset=3.5)
    ];
  echo(str("MyPosts = ",MyPosts ));
//OuterBase();
 //HollowBase(lenght=120,width=120, Hight=50,rundedConnersR=4,thickness=2);
 BoxWithPosts(Dim=[120,120,30],rundedConnersR=4,thickness=2,posts=MyPosts);

module eTri(size=3) {
	polygon(points=[[0,0],[size,0],[size*cos(60),size*sin(60)]]);
	
}
module Trifoce(size=3) {

eTri(size);
translate([size,0,0]) eTri(size);
translate([size/2,size*sin(60),0]) eTri(size);
}
!Trifoce();

module 