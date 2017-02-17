include <Consts.scad>
use <carousel.scad>
use <Base.scad>
use <CarouselGear.scad>
color("red")carousel();
color("green")CarouselGear();
translate([0, 0, -1 * BaseHight]) {
  color("blue") base();
}

