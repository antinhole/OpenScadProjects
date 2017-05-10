/*
TRIFORCE  -  Legend of Zelda 
Made in Anita
*/

$fn = 50; //I only added this here (@FrankkieNL)

translate([25*sin(60),0,0])
rotate([0,-90,0])

difference(){


	polyhedron ( points = [[0,0,50*sin(60)], [8,0,50*sin(60)], [8,-25,0], [0,-25,0], [0,25,0], [8,25,0], ], 
	triangles = [[0,3,2], [0,2,1], [3,0,4], [1,2,5], [0,5,4], [0,1,5],  [5,2,4], [4,2,3], ]);


	#
	translate([12,0,25*sin(60)])
	scale([2,0.4,0.4])
	rotate([0,180,0])
	polyhedron ( points = [[0,0,50*sin(60)], [8,0,50*sin(60)], [8,-25,0], [0,-25,0], [0,25,0], [8,25,0], ], 
	triangles = [[0,3,2], [0,2,1], [3,0,4], [1,2,5], [0,5,4], [0,1,5],  [5,2,4], [4,2,3], ]);



/*  +++ A hole for use as a key ring or pendant ++++ */


	#
	translate([4,15,35])
	rotate([90,0,0])
	cylinder (h=30, r=1.5);




}