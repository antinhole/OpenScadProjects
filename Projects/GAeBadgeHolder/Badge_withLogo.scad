


module GALogo()
{
//  rotate([0,180,0])
//  translate([-12,0,4])
scale([.3,.3,.1])
  {
  surface(file = "GA_Egale_Logo.png",  convexity = 5,invert = true);
  }
}

module multiColor(state="all",Color1=[1,.5,.5],Color2=[.5,.5,1])
{
    if (state=="all" || state =="inside" ){
color(Color1)
intersection(){
    children(0);
union(){
         children(1);
    }
}
    }
if (state=="all" || state =="outside" )
{
color(Color2)
difference(){
    children(0);
union(){
         children(1);
    }
}
}

}
part="all";
$fn=50;
multiColor(state=part,Color1=[1,.5,.5],Color2=[.5,.5,1])
{
  import("C:\\Code\\PlayArea\\Git_OpenScad\\OpenScadProjects\\Projects\\GAeBadgeHolder\\BadgeSimple2.stl", convexity=3);
  GALogo();
//cube([50,50,10]);

}