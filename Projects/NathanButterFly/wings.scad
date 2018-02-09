




module wing(length=30) {
    // body...
    rotate([0, 90, 0]) {
        hull(){
        cylinder(r=2, h=length, center=true);
        translate([1.8, 20, 0]) {
            cylinder(r=.2, h=length, center=true);
            }
        }
    }
} 

//wing();
function Fib(f) =   f < 2  ? 1 :  Fib(f-1) + Fib(f-2);;
function FibSeq(Len) =  [for (a = [1 : Len])  Fib(a)];

module bentwing(Length=30, bend=20)
{
segment_number=6;
baseSize=4;
sweptness=4;
angle= FibSeq(segment_number+1);
    for (i=[1:segment_number-1]) {
        j=i+1;
        echo(angle[i],angle[j]);
         echo(angle[i]/angle[j]);
        hull()
            {
                translate([sweptness*i,angle[i],0])
                sphere(r= baseSize/angle[i]);
                translate([sweptness*j,angle[j],0])
                sphere(r=baseSize/angle[j],center=true);
                
            }
        }

    
    
 }


bentwing();