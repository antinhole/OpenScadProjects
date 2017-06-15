use   <\..\..\Libs\GearLib.scad>
use   <\..\..\Libs\ComonFuntions.scad>

/*
used to snap on to a carboy mouth or rim to rotate carboy

three gears and a bracket to hold the two lower gears 
one on Carboy
one on with a Drive Gear
one Ideler
and a bracket maybe

      C
     I D
    BBBBB
*/
thickness=14;
mm_per_tooth=5;
pressure_angle=28;
AngleFactor=1.5;
bearing_outside =22.2;//22.21
bearing_outside_lip =19.7;

difference(){
		haringBoneGear(
				mm_per_tooth    = mm_per_tooth,    //this is the "circular pitch", the circumference of the pitch circle divided by the number of teeth
			number_of_teeth = 60,   //total number of teeth around the entire perimeter
			thickness       = thickness,    //thickness of gear in mm
			hole_diameter   = 52,    //2.25" =57.15mm standard 6.5 carboy  diameter of the hole in the center, in mm
		//	twist           = 10,    //teeth rotate this many degrees from bottom of gear to top.  360 makes the gear a screw with each thread going around once
			teeth_to_hide   = 0,    //number of teeth to delete to make this only a fraction of a circle
			pressure_angle  = pressure_angle,   //Controls how straight or bulged the tooth sides are. In degrees.
			clearance       = 0.0,  //gap between top of a tooth on one gear and bottom of valley on a meshing gear (in millimeters)
			backlash        = 0.0,   //gap between two meshing teeth, in the direction along the circumference of the pitch circle
		AngleFactor=AngleFactor
		);
		//////////////////////////////////
		spoke_ify(25){
		translate([25, 15, 0])
		cube(size=[20, 3, thickness+1], center=true);

		}
}

translate([68, 0, 0]) 
haringBoneGear(
    	mm_per_tooth    = mm_per_tooth,    //this is the "circular pitch", the circumference of the pitch circle divided by the number of teeth
	number_of_teeth = 21,   //total number of teeth around the entire perimeter
	thickness       = thickness,    //thickness of gear in mm
	hole_diameter   = bearing_outside,    //diameter of the hole in the center, in mm
//	twist           = 10,    //teeth rotate this many degrees from bottom of gear to top.  360 makes the gear a screw with each thread going around once
	teeth_to_hide   = 0,    //number of teeth to delete to make this only a fraction of a circle
	pressure_angle  = pressure_angle,   //Controls how straight or bulged the tooth sides are. In degrees.
	clearance       = 0.0,  //gap between top of a tooth on one gear and bottom of valley on a meshing gear (in millimeters)
	backlash        = 0.0,   //gap between two meshing teeth, in the direction along the circumference of the pitch circle
AngleFactor=AngleFactor

);
 translate([0,65, 0])
haringBoneGear(
    	mm_per_tooth    =mm_per_tooth,    //this is the "circular pitch", the circumference of the pitch circle divided by the number of teeth
	number_of_teeth = 20,   //total number of teeth around the entire perimeter
	thickness       = thickness,    //thickness of gear in mm
	hole_diameter   = bearing_outside,    //diameter of the hole in the center, in mm
//	twist           = 10,    //teeth rotate this many degrees from bottom of gear to top.  360 makes the gear a screw with each thread going around once
	teeth_to_hide   = 0,    //number of teeth to delete to make this only a fraction of a circle
	pressure_angle  = pressure_angle,   //Controls how straight or bulged the tooth sides are. In degrees.
	clearance       = 0.0,  //gap between top of a tooth on one gear and bottom of valley on a meshing gear (in millimeters)
	backlash        = 0.0,   //gap between two meshing teeth, in the direction along the circumference of the pitch circle
AngleFactor=AngleFactor
);


