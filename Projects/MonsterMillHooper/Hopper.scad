

/*
Mill its self is 
7 + inch total lenght 177.8mm so 178mm
3.5 inch with 88.9mm
3.5 inch hight 88.9mm
sides .5 inch thick  12.7mm
holes are centered acrost the end and inset 3/4 inch 19.05mm
1/4 inch holes(guess) 6.35mm
TODO: Like to get rid of rodate and standareize xyz and name xyz at top like X= len y=with Z= hight etc 
*/
//Mill Dims
    MillX= 180;//7 + inch total lenght 177.8mm so 178mm
    MillZ=88.9; //3.5inch
    MillY=88.9; //3.5inch
    MillSideXThickness=12.7;//.5 inch 
    RollerX=152.4;// 6 inch
    RollerRad=20;// total guess
    MillHoleInset=12.7;
    MillHoleDepth=31.75;

// hooper Dims
    boltsLenth=152.4;  //6 inch
    boltswidth=76.2; //3 inch guess
    totalLenth=180; // guess
    totalWidth=100; // guess

    baseThickness=12.5;// as needed

    BoltHoleLenth=baseThickness+3;
    BoltHoleRad=3.175;
    BoltOffSetL=(totalLenth-boltsLenth)/2;
    BoltOffSetW=(totalWidth-boltswidth)/2;
    slotRad=5;
    slotL=100;
    hopperThickness=5;

module Base_old() {
    // bolts to the mill 
    // may hold plexy sides 
    // shoud hold funnel
 
    translate([totalWidth/-2, totalLenth/-2, baseThickness/-2])
        difference(){
        cube ([totalWidth,totalLenth,baseThickness] );
        translate([0, 0, -.5])      
            ScrewHoles();
        translate([totalWidth/2,(totalLenth-slotL)/2 , -.5])    
            BaseSlot();
        }
}
module Base() {
    // bolts to the mill 
    // may hold plexy sides 
    // shoud hold funnel
        difference(){
        cube ([totalWidth,totalLenth,baseThickness],center=true );
        translate([0, 0, -.5])      
            ScrewHoles();
        translate([totalWidth/2,(totalLenth-slotL)/2 , -.5])    
            BaseSlot();
        }
}

module ScrewHoles() {
    // bolts to the mill 
    // may hold plexy sides 
    // shoud hold funnel
 
  translate([BoltOffSetW,BoltOffSetL,0])   cylinder(r=BoltHoleRad, h=BoltHoleLenth);
  translate([BoltOffSetW+boltswidth,BoltOffSetL+boltsLenth,0])  cylinder(r=BoltHoleRad, h=BoltHoleLenth);
 translate([BoltOffSetW+boltswidth,BoltOffSetL,0])   cylinder(r=BoltHoleRad, h=BoltHoleLenth);
  translate([BoltOffSetW,BoltOffSetL+boltsLenth,0])  cylinder(r=BoltHoleRad, h=BoltHoleLenth);
}
module BaseSlot() {

    hull(){
    cylinder(r=slotRad, h=BoltHoleLenth);
    translate([0,slotL,0])  cylinder(r=BoltHoleRad, h=BoltHoleLenth);
    }    
     
 }

module hopper(args) {
    // rotate([0,45,0 ]) {
        hyop= sqrt(pow(slotL+hopperThickness,2) *2);
        echo(str("hyop = ", hyop));
        translate([0,0,hyop/2])
       difference(){
          rotate([0,45,0 ])  cube ([slotL+hopperThickness,slotL+hopperThickness,slotL+hopperThickness],center=true );
           rotate([0,45,0 ])  cube ([slotL,slotL,slotL] ,center=true);
           //cut top off
           translate([0,0,slotL/2])       cube ([slotL*2,slotL*1.5,slotL] ,center=true);
         
             }
        
 }

module MillSide() {
      difference(){
            cube([MillSideXThickness,MillY,MillZ],center=true);
         translate([0, MillY/2-MillHoleInset,MillZ/2])
             cylinder(r=BoltHoleRad, h=MillHoleDepth, center=true);
          translate([0, MillY/-2+MillHoleInset,MillZ/2])
             cylinder(r=BoltHoleRad, h=MillHoleDepth, center=true);
      }
 }

module Mill() {
    rollerZOffset=18;
    rollerGap=1.651;//0.065" from web site
    rolleryOffset=RollerRad+rollerGap/2;
    
   translate([(MillX-MillSideXThickness*2)/-2,0,0 ]) MillSide();
      translate([(MillX-MillSideXThickness*2)/2,0,0 ]) MillSide();
    //rollers
    translate([0, 0,-rollerZOffset]) 
     rotate([0, 90, 0])      
     cylinder(r=RollerRad, h=RollerX, center=true);
      translate([0,rolleryOffset,rollerZOffset]) 
     rotate([0, 90, 0])      
     cylinder(r=RollerRad, h=RollerX, center=true);
     translate([0,-rolleryOffset,rollerZOffset]) 
     rotate([0, 90, 0])      
     cylinder(r=RollerRad, h=RollerX, center=true);
} 
Mill();

translate([0,0,MillZ/2+10])

 rotate([0,0,90])
{
    Base_old();
//this trans nees some work.
 //translate([totalWidth/2,(totalLenth/2) , -.5]) 
          hopper();
}
