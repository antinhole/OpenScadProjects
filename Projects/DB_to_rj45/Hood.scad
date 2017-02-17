



module keystoneHole() {
    intersection()
  //  union()
  {
       translate([12, -22, -10]) 
      rotate([0,0,1],a=180) {
            import("keystonebox_1_4.stl", convexity=5, center=true);

        } 
      
   cube([20,26 ,31], center = true);
   }
}



/*
import("DB9_Shell_V2.stl", convexity=3);
translate([0, 50, 0]) {
    rotate([0,0,1],a=180) {
       !keystoneHole();
    }
    

}
*/
 keystoneHole();
// import("keystonebox_1_3.stl", convexity=3, center=true);