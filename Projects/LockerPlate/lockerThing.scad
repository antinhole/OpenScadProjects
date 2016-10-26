/*
in our hacker space at work we got some used lockers from a defunct bowling ally.. some were missing the  


 https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/The_OpenSCAD_Language#scale_2
 This is a breakdown of what you can do with the independent elements in the matrix (for the first three rows):
 [Scale X],[Scale X sheared along Y],[Scale X sheared along Z], [Translate X]
 [Scale Y sheared along X],[Scale Y],[Scale Y sheared along Z], [Translate Y]
 [Scale Z sheared along X],[Scale Z sheared along Y],[Scale Z], [Translate Z]
 the fourth row is used in 3D environments to define a view of the object. it is not used in OpenSCAD and should be [0,0,0,1]
               */

    


module roundedCornersOnlyBase(xdim ,ydim ,zdim,rdim){
    rdim2=rdim*2;
    hull(){
        
        translate([rdim,rdim,0])cylinder (h=zdim,r=rdim,$fn=30 );
        translate([xdim-rdim,rdim,0])cylinder (h=zdim,r=rdim,$fn=30);
        translate([rdim2,ydim-rdim2,0])cylinder (h=zdim,r=rdim2,$fn=30);
        translate([xdim-rdim2,ydim-rdim2,0])cylinder (h=zdim,r=rdim2,$fn=30 );
    }
}

module roundedBase(xdim ,ydim ,zdim,rdim){
    rdim2=rdim*4;
    hull(){
        translate([rdim,rdim,0])sphere(r=rdim,$fn=30);
            
        translate([xdim-rdim,rdim,0])
        //resize(newsize=[rdim*3,rdim*3,rdim]) 
        sphere(r=rdim,$fn=30);; 
            
        
        translate([rdim2/2,ydim-rdim2/2,0])
            resize(newsize=[rdim2,rdim2,rdim*2])  sphere(r=1,$fn=30);
        //sphere(r=rdim,$fn=30);
        translate([xdim-rdim2/2,ydim-rdim2/2,0]) // how does it effect this
             resize(newsize=[rdim2,rdim2,rdim*2])  sphere(r=1,$fn=30);
        //sphere(r=rdim,$fn=30);
    }
}


module roundedTopOnlyBase(xdim ,ydim ,zdim,rdim)
{
    union()
    {
    translate([0,0,zdim-rdim]) roundedBase(xdim,ydim,zdim,rdim);
     roundedCornersOnlyBase(xdim,ydim,zdim-rdim,rdim);
    }
 }

module BaseAngledIn(xdim ,ydim ,zdim,rdim,AngleIn)
 {
     Mpos = [ [ 1, AngleIn,0, 0 ],
       [ 0, 1, 0, 0 ],   // [ 0, 1, 0.7, 0 ], // The "0.7" is the skew value; pushed along the y axis
       [ 0, 0, 1, 0 ],
       [ 0, 0, 0, 1 ] ] ;
 Mneg = [ [ 1, -1*AngleIn,0, 0 ],
       [ 0, 1, 0, 0 ],   // [ 0, 1, 0.7, 0 ], // The "0.7" is the skew value; pushed along the y axis
       [ 0, 0, 1, 0 ],
       [ 0, 0, 0, 1 ] ] ;
     
     intersection(){
             multmatrix(Mpos) { 
                roundedTopOnlyBase(xdim,ydim,zdim,rdim);
             }
                  multmatrix(Mneg) { 
                roundedTopOnlyBase(xdim,ydim,zdim,rdim);
             }
         }
}
    
     
module NumberViewinngHole(TotalHight=10,OffSetX=115,OffSetY=22,HoleX1=16,HoleY1=32,shear=2)
{
    /*
    [Scale X],[Scale X sheared along Y],[Scale X sheared along Z], [Translate X]
 [Scale Y sheared along X],[Scale Y],[Scale Y sheared along Z], [Translate Y]
 [Scale Z sheared along X],[Scale Z sheared along Y],[Scale Z], [Translate Z]

    */
    MPosPos = [ [ 1, 0,shear, 0 ],
       [ 0, 1, shear, 0 ], 
       [ 0, 0, 1, 0 ],
       [ 0, 0, 0, 1 ] ] ;
    MPosNeg = [ [ 1, 0,shear, 0 ],
       [ 0, 1,-1* shear, 0 ], 
       [ 0, 0, 1, 0 ],
       [ 0, 0, 0, 1 ] ] ;
    MNegPos = [ [ 1, 0,-1*shear, 0 ],
       [ 0, 1, shear, 0 ], 
       [ 0, 0, 1, 0 ],
       [ 0, 0, 0, 1 ] ] ;
    MNegNeg = [ [ 1, 0,-1*shear, 0 ],
       [ 0, 1, -1*shear, 0 ], 
       [ 0, 0, 1, 0 ],
       [ 0, 0, 0, 1 ] ] ;
     
    translate([OffSetX,OffSetY,0])
    {
        union(){
           translate([0,0,-1]){
                   cube([HoleX1,HoleY1,TotalHight+2], center=false);
              };
        hull(){
               
                multmatrix(MPosPos)  cube([HoleX1,HoleY1,TotalHight], center=false);
                multmatrix(MPosNeg)  cube([HoleX1,HoleY1,TotalHight], center=false);
                multmatrix(MNegPos)  cube([HoleX1,HoleY1,TotalHight], center=false);
                multmatrix(MNegNeg)  cube([HoleX1,HoleY1,TotalHight], center=false);
               
                };
            }
    }
}//end module


module KeyHole(TotalHight=10,OffSetX=76,OffSetY=37,HoleR1=12,HoleR2=18,HoleR3=8.5)
{
    translate([OffSetX,OffSetY,0]){
    union(){
    translate([0,0,1]){
    cylinder(h=TotalHight-1,r1=HoleR1,r2=HoleR2, center=false,$fn=90);}
    translate([0,0,-1]) cylinder(h=TotalHight,r=HoleR3 ,center=false);
        }
    }
}//end module

module screwMount(Hight=5,OffSetX=43,OffSetY=29,Holex1=10,HoleY1=20)
{
    translate([OffSetX,OffSetY,-1*Hight]){
   // union(){
        cube([Holex1,HoleY1,Hight], center=false);
     //   }
    }
}//end module

module GAtext(Hight=10,OffSetX=43,OffSetY=10)
{
   translate([OffSetX,OffSetY,Hight+.3]){   
        rotate(a=90,v=[0,0,1]){
            text("Great American",size=5);
            }
    }
}//end module

module DeadSpacce()
{
 translate([10,5,0]){
        cube([5,35,5] ,center =false);
     }
    }


TotalHight=10;
TotalWidth=70;
TotalLenght=150;
sheareiNfOR= 8/TotalWidth; // MM IN FROM STRAT EDGE
thickness=5;
//roundedCornersOnlyBase(TotalLenght,TotalWidth,TotalHight,3);
//roundedBase(TotalLenght,TotalWidth,TotalHight,3);
//roundedTopOnlyBase(TotalLenght,TotalWidth,TotalHight,3);


//!KeyHole();
//!NumberViewinngHole();
//!screwMount();

//intersection(){
  //  cube([TotalLenght+1,TotalWidth+1,3],center=false);
//!resize(newsize=[10,10,5]) sphere(r=1,$fn=30); 
difference(){
    union(){
        
            difference(){

            BaseAngledIn(TotalLenght,TotalWidth,TotalHight,3,sheareiNfOR);
                 
                NumberViewinngHole(TotalHight,22,22,16,32,.9);
                KeyHole();

            }
    screwMount(Hight=5,OffSetX=43,OffSetY=29,Holex1=10,HoleY1=20);
    screwMount(Hight=5,OffSetX=97,OffSetY=29,Holex1=10,HoleY1=20);
      //GAtext();   text is for display only will not print in stl file :(
           // c:\HackItBubble.png
    //};

    };
    DeadSpacce();
}