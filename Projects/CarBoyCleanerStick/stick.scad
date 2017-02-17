
/*
carboy cleaner stick 
a arch 
*/
//25.4



levels = 7; // number of levels for the recursion

len = 100; // length of the first segment
thickness = 5; // thickness of the first segment

// the identity matrix
identity = [ [ 1, 0, 0, 0 ], [ 0, 1, 0, 0 ], [ 0, 0, 1, 0 ], [ 0, 0, 0, 1 ] ];

// random generator, to generate always the same output for the example,
// this uses a seed for rands() and stores the array of random values in
// the random variable. To generate different output, remove the seed or
// replace the function rnd() to just call rands(s, e, 1)[0].
rcnt = 1000;
random = rands(0, 1, rcnt, 18);
function rnd(s, e, r) = random[r % rcnt] * (e - s) + s;

// generate 4x4 translation matrix
function mt(x, y) = [ [ 1, 0, 0, x ], [ 0, 1, 0, y ], [ 0, 0, 1, 0 ], [ 0, 0, 0, 1 ] ];

// generate 4x4 rotation matrix around Z axis
function mr(a) = [ [ cos(a), -sin(a), 0, 0 ], [ sin(a), cos(a), 0, 0 ], [ 0, 0, 1, 0 ], [ 0, 0, 0, 1 ] ];

module tree(length, thickness, count, m = identity, r = 1) {
    color([0, 1 - (0.8 / levels * count), 0])
        multmatrix(m)
    {
            square([thickness, length]);

    if (count > 0) {
        tree(.75 * length, 0.8 * thickness, count - 1, mt(0, length) * mr(90), 8 * r);
        tree(.75 * length, 0.8 * thickness, count - 1, mt(0, length) * mr(-90), 8 * r + 4);
    }
    echo (rnd(0.6, 0.8, r));
    }
}
module tree2(length, thickness, count, m = identity ) {
    color([0, 1 - (0.8 / levels * count), 0])
        multmatrix(m)
    {
            square([thickness, length],center = true);

    if (count > 0) {
        tree2(.70 * length, 0.8 * thickness, count - 1, mt(0, length/2) * mr(90) );
        tree2(.70 * length, 0.8 * thickness, count - 1, mt(0, length/2) * mr(-90));
    }
  
    }
}
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



linear_extrude(height=10, center=true, convexity=10, twist=0) {
   rotate([0, 0, 1],a=90) {
            Arch(254/2,10,0,90);
   }
    translate([50, 254/2-5, 0]) {
        square(size=[100, 10], center=true);
    }
}


