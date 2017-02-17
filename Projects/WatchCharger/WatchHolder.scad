
//this is a charge cradle for the Old-ish school g buddy watch lg-w100 (square one; at some point they made a round one maybe?) 
/*plan draw cube subtract rounded cube
this is short and simple; may keep it all in one file
*/

//consts
//WatchSize =[38,45,9];
OuterDims=[38,46,9];
RoundRad=3;
$fn=50;
PinOffset=[-1* (OuterDims[0]/2-RoundRad-1.5),7,0];
pinSize=.75;
PinTotalspaceing=9.5;
numberOfPins=5;

module pins(size=.75 ,Totalspaceing=9.5,numberOfPins=5,MaxHight=10) {
single_spaceing=Totalspaceing/(numberOfPins-1);

for (i=[0:numberOfPins-1]) {
    translate([ 0,single_spaceing*i, 0]) 
        cylinder(r=size, h=MaxHight, center=true);
}


}
   

module roundedBox(size=[30,30,30] ,Rounding=3) {
   
    Xoffset=size[0]/2-Rounding;
    Yoffset=size[1]/2-Rounding;
    Zoffset=size[2]/2-Rounding;
    hull(){
        translate([Xoffset, Yoffset, Zoffset]) 
            sphere(r=Rounding,center=true);
        translate([Xoffset, Yoffset,-1* Zoffset]) 
              sphere(r=Rounding,center=true);

        translate([Xoffset, -1 * Yoffset, Zoffset]) 
            sphere(r=Rounding,center=true);
        translate([Xoffset, -1* Yoffset,-1* Zoffset]) 
              sphere(r=Rounding,center=true);

        translate([-1*Xoffset, Yoffset, Zoffset]) 
            sphere(r=Rounding,center=true);
        translate([-1*Xoffset, Yoffset,-1* Zoffset]) 
              sphere(r=Rounding,center=true);

        translate([-1*Xoffset, -1 * Yoffset, Zoffset]) 
            sphere(r=Rounding,center=true);
        translate([-1*Xoffset, -1* Yoffset,-1* Zoffset]) 
              sphere(r=Rounding,center=true);


    }

}

 difference(){
    cube(OuterDims,center=true);
    
    translate([0, 0, OuterDims[2]/2]) {
        roundedBox([OuterDims[0]-1,OuterDims[1]-1,RoundRad],RoundRad);
    }
    
    translate(PinOffset)
        pins(pinSize,PinTotalspaceing,numberOfPins);
  // translate([-1 * (OuterDims[0]/2-RoundRad-1.5) +.75,7,0])
    //    pins(size=.75,Totalspaceing=7.6);
    
    //magnet glue spot
    translate([0,0,-1*OuterDims[2]/2])
         cylinder(r=5,h=3,center=true);
 }
 //!roundedBox(OuterDims);


