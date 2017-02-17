/*
This s a cclip or spring clip or snap ring


'''
*/


function polar(r,theta)   = r*[sin(theta), cos(theta)]; 


module ArchClipingPloy(Rad, thickness,StartAngle,endAngle) 
{echo(StartAngle,endAngle);
    pointA=[0,0];
    
       pointS=polar(Rad*2,StartAngle);
        pointE=polar(Rad*2,endAngle);
        pointOut=polar(Rad*2,(endAngle+StartAngle)/2);
    pointOutS=polar(Rad*2,(StartAngle+(endAngle+StartAngle)/2)/2);
     pointOutE=polar(Rad*2,(endAngle+(endAngle+StartAngle)/2)/2);
   // echo(pointA,pointS,pointE,pointOut,(endAngle+StartAngle)/2,(StartAngle+(endAngle+StartAngle)/2)/2,(endAngle+(endAngle+StartAngle)/2)/2);
    polygon([pointA,pointS,,pointOutS,pointOut,pointOutE,pointE],paths=[[0,1,2,3,4,5]]);
    }
module Arch(Rad, thickness,StartAngle,endAngle) {
   echo("Arch", Rad, thickness,StartAngle,endAngle);
    intersection()
    {
        difference ()
        {        
          circle(Rad ,center = true);
         circle(Rad-thickness,center = true);
           
       }
        ArchClipingPloy(Rad, thickness,StartAngle,endAngle) ;
       
    }
    
       }
       


module cclip(
ta=270,//total angle

id=12.7,//inner diamater
w=6.36,//width
useHandle=false,
NubAngle=25,//NubAngle

Ring_thickness=0.889 /// most standard things online use .035" =.889mm
    )
{
 nubW=w/2;//nub width
ico=ta/3;//innerCutOut
linear_extrude(height = Ring_thickness,  convexity = 100, twist = 0){
if(useHandle)
    rotate([0, 0, 1], a=ta/-2 ) 
        translate([0,id+w , 0]) 
            circle(id ,center = true);

    difference(){
        //++++++++++++++++++++//
        Arch(id,w,0,ta);
        //---------------------
        Arch(id-w+nubW,nubW,NubAngle,ico);
        Arch(id-w+nubW,nubW,ico*2,ta-NubAngle);
    }
}
}
//works Ferifyed 
cclip(ta=270,id=12.7,w=6.36,useHandle=false,NubAngle=25,Ring_thickness=.889);

/* Make two for each
 cclip(ta=245,id=12.7,w=6.36,useHandle=false,NubAngle=25,Ring_thickness=.889);
color("Yellow",1){
 rotate([0,0,1],a=180 )
  cclip(ta=245,id=12.7,w=6.36,useHandle=false,NubAngle=25,Ring_thickness=.889);
}
// */
//sphere(r=5,$fn=50);

//'''