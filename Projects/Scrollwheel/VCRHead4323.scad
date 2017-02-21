vcrHeadOuterD=62;

//HeadTop

module HeadTop() {
    // the spiny bit
    ReadHeadouterHight=13;
    ReadHeadInnerHight=15;
    ReadHeadInnerD=30;
    //inerr lip is down 4 and thckness of 2 ma not be relavent
    cylinder(d=vcrHeadOuterD, h=ReadHeadouterHight, center=true);
    translate([0,0,(ReadHeadInnerHight-ReadHeadouterHight)/2 ]) 
     {
       cylinder(d=ReadHeadInnerD, h=ReadHeadInnerHight, center=true);
     }

     InnerFlangeHight=4.5;
 translate([0,0,(ReadHeadouterHight)/-2 +InnerFlangeHight/-2  ]) 
    cylinder(d=30.5,h=InnerFlangeHight, center=true);
   //Shaft
    translate([0,0, 51/-2 +10  ]) 

    cylinder(d=6,h=51, center=true);
}
module HeadBottem() {
    // body...
    outerHight=14;
    otherlipThickness=2.3;
    Depth=10.5;
difference()
{
    cylinder(d=vcrHeadOuterD, h=outerHight, center=true);
    translate([0, 0, outerHight-Depth]) {
    cylinder(d=vcrHeadOuterD-otherlipThickness, h=Depth, center=true);
        
    }
}
//center shaft holding bit
ShaftD=18.5; //maybe bigger in some areas
ShaftHight=18;
    translate([0, 0, ShaftHight/2-(outerHight-Depth)+1]) 
        cylinder(d=ShaftD, h=ShaftHight, center=true);   
}
translate([0,0,7])
color([20/255, 0/255, 200/255,.3]) {
  HeadTop();  
}
translate([0,0,-7])

color([200/255, 0/255, 200/255,.3]) {
  HeadBottem();  
}
