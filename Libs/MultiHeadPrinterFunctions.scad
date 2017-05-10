

module GALogo()
{
 rotate([0,180,0])
//  translate([-12,0,4])
scale([.3,.3,.1])
  {
  surface(file = "C:\\Code\\PlayArea\\Git_OpenScad\\OpenScadProjects\\Projects\\GAeBadgeHolder\\GA_Egale_Logo.png",  convexity = 5,invert = true,center=true);
  }
}
module multiColor(state="all",Color1=[1,.5,.5],Color2=[.5,.5,1]){

    color(Color1)
        children(0);
        color(Color2)
            children(1);

}

module multiColorInLay(state="all",inPreview=true,Color1=[1,.5,.5],Color2=[.5,.5,1]){
      TraslateAmount=inPreview?.001:0;
    if (state=="all" || state =="inside" ){
       color(Color1)
    intersection(){
   
       children(0);
         children(1);

        }
    }

translate([TraslateAmount,TraslateAmount,TraslateAmount]) { // this makes it Visable in PrevieMoe
if (state=="all" || state =="outside" )
    {
    color(Color2)
    difference(){
            children(0);
            children(1);
            }
    }
    }
}

//!union(){

multiColorInLay(state="inside",Color1=[1,.5,.5],Color2=[.5,.5,1])
{
  cube([100,100,1],center=true);
 GALogo();
 // rotate ([30,0,0])cylinder(r=10, h=50, center=true);

}



/*
multiColorInLay(
   //  state="all",
   // state="inside",
        state="outside",
    Color1=[1,.5,.5],
    Color2=[.5,.5,1])
{
    Color1=[1,.5,.5];
    Color2=[.5,.5,1];
   color(Color1) cube([50,50,10],center=true);
  color(Color2) cylinder(r=10, h=20, center=true);


}
*/



