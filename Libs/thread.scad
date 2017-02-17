

module Base2d(Rad=2,TreadDepth=1)
{
circle(r=Rad);
 translate([TreadDepth, 0, 0])circle(r=Rad+TreadDepth);

}


module thread_rod(h=12,r1=9.7,r2=10.35,tpmm=1) {


linear_extrude(height =h , center = true, convexity = 10, twist = -360*tpmm*h,scale=1.0){

//!rotate(v=[1,0,0],a=90)
        Base2d(r1,r2-r1);
        }
}

thread_rod(r1=4.7,r2=5.7,h=10,tpmm=1.1);


