radius = 6.5;
padding = 2;
radiusWithPadding = 8.44 * 2 + padding;

boxWidth = 120;
boxHeight = 228.6;
boxDepth = 38;

boxWallThickness = 4;
thicknessOf2BoxWalls = 2 * boxWallThickness;

boxInnerWidth = boxWidth - thicknessOf2BoxWalls;
boxInnerHeight = boxHeight - thicknessOf2BoxWalls;
boxInnerDepth = boxDepth - 5.44;

boxLedgeThickness = boxWallThickness;
thicknessOf2BoxLedges = 2 * boxLedgeThickness;

innerBoxWidth = boxInnerWidth;
innerBoxHeight = boxInnerHeight;
innerBoxDepth = boxInnerDepth;

innerBoxInnerWidth = innerBoxWidth - thicknessOf2BoxLedges;
innerBoxInnerHeight = innerBoxHeight - thicknessOf2BoxLedges;
innerBoxInnerDepth = innerBoxDepth - thicknessOf2BoxLedges + (boxDepth / 2 + 2);

boltRadius = 2;
boltHolderThickness = 8;
boltUndersideCountersinkDepth = 5;
boltUndersideCountersinkRadius = 5;

leftCornerX = innerBoxInnerWidth / 2 - boxLedgeThickness + 1.5;
rightCornerX = -1 * leftCornerX;
yOffset = (innerBoxInnerHeight - boltHolderThickness) / 2;
oppositeYOffset = -1 * yOffset;

boltPlungeDepth = boxInnerDepth + boxWallThickness + 2;

powerJackRadius = 6;
powerJackNutRadius = 8;
powerJackMaxWallThickness = 2;

totalWallThickness = boxWallThickness + boxLedgeThickness;
countersinkDepthNeededForPowerJack = totalWallThickness - powerJackMaxWallThickness;

lidDepth = boxDepth - innerBoxDepth - 2;

$fn = 50;
//// Box, print
color("red") {
   translate([0, 20, -radiusWithPadding + 2]) {
        difference() {
            translate([0, -34, 00]) 
                //translate([0, -34, 17]) {
                    cube([innerBoxWidth, innerBoxHeight - 68, lidDepth], center = true);
               
            
            
            union() {
                translate([-radiusWithPadding, -50, 0]) {        
                    for(vector = 
                    [
                        [0, 0, 0],
                        [radiusWithPadding, -1 * radiusWithPadding, 0],
                        [radiusWithPadding, 0, 0],
                        [radiusWithPadding, radiusWithPadding, 0],
                        [2 * radiusWithPadding, 0, 0],
                        [0, -2 * radiusWithPadding, 0],
                        [radiusWithPadding, -2 * radiusWithPadding, 0],
                        [2 * radiusWithPadding, -2 * radiusWithPadding, 0]
                    ]) {
                        translate(vector) {
                            color("grey") {
                                cylinder(lidDepth + 1, radius, radius, center = true);
                            } 
                        }
                     }
      
                    translate([0, radiusWithPadding, 0]) {
                        color("grey") {
                            cylinder(lidDepth + 1, radius, radius, center = true);            
                        }
                    }
                }
               translate([leftCornerX, oppositeYOffset, 0]){
                        cylinder(boltPlungeDepth, boltRadius, boltRadius, center = true);
                        
                    }
                    
                    translate([rightCornerX, oppositeYOffset, 0]){
                        cylinder(boltPlungeDepth, boltRadius, boltRadius, center = true);
                        
                        
                    }
                    
                    translate([leftCornerX, yOffset, 0]){
                        cylinder(boltPlungeDepth, boltRadius, boltRadius, center = true);
                        
                        
                    }
                    
                    translate([rightCornerX, yOffset, 0]){
                        cylinder(boltPlungeDepth, boltRadius, boltRadius, center = true);
                                            
                    }
                
                }
        }
        
        difference() {
            difference() {
                union() {
                    difference() {
                        cube([boxWidth, boxHeight, boxDepth], center = true);
                        
                        translate([0, 0, boxWallThickness]){
                            cube([boxInnerWidth, boxInnerHeight, boxInnerDepth], center = true);
                        }
                    }
                    
                    difference() {
                        cube([innerBoxWidth, innerBoxHeight, innerBoxDepth], center = true);
                        
                        translate([0, 0, boxLedgeThickness]){
                            cube([innerBoxInnerWidth, innerBoxInnerHeight, innerBoxInnerDepth], center = true);
                        }
                    }              
                                                    
                    translate([leftCornerX, oppositeYOffset, 0]){
                        cube([boltHolderThickness, boltHolderThickness, boxInnerDepth], center = true);
                    }
                    
                    translate([rightCornerX, oppositeYOffset, 0]){
                        cube([boltHolderThickness, boltHolderThickness, boxInnerDepth], center = true);
                    }
                    
                    translate([leftCornerX, yOffset, 0]){
                        cube([boltHolderThickness, boltHolderThickness, boxInnerDepth], center = true);
                    }
                    
                    translate([rightCornerX, yOffset, 0]){
                        cube([boltHolderThickness, boltHolderThickness, boxInnerDepth], center = true);
                    }                
                }            
                
                union() {                               
                    translate([leftCornerX, oppositeYOffset, 0]){
                        cylinder(boltPlungeDepth, boltRadius, boltRadius, center = true);
                        
                        translate([0, 0, -17]){
                            cylinder(boltUndersideCountersinkDepth, boltUndersideCountersinkRadius, boltUndersideCountersinkRadius, center = true);
                        }
                    }
                    
                    translate([rightCornerX, oppositeYOffset, 0]){
                        cylinder(boltPlungeDepth, boltRadius, boltRadius, center = true);
                        
                        
                        translate([0, 0, -17]){
                            cylinder(boltUndersideCountersinkDepth, boltUndersideCountersinkRadius, boltUndersideCountersinkRadius, center = true);
                        }
                    }
                    
                    translate([leftCornerX, yOffset, 0]){
                        cylinder(boltPlungeDepth, boltRadius, boltRadius, center = true);
                        
                        
                        translate([0, 0, -17]){
                            cylinder(boltUndersideCountersinkDepth, boltUndersideCountersinkRadius, boltUndersideCountersinkRadius, center = true);
                        }
                    }
                    
                    translate([rightCornerX, yOffset, 0]){
                        cylinder(boltPlungeDepth, boltRadius, boltRadius, center = true);
                                            
                        translate([0, 0, -17]){
                            cylinder(boltUndersideCountersinkDepth, boltUndersideCountersinkRadius, boltUndersideCountersinkRadius, center = true);
                        }
                    }
                    
                    translate([leftCornerX + 10, yOffset - 40, 3.5]) {
                        cube([17, 35, 19], center = true);
                    }
                }
            }
            
            rotate([90, -180, 90]) {
                translate([80, -1 * boxDepth / 10, boxWidth / 2 - 7]) {
                    union() {
                        cylinder(countersinkDepthNeededForPowerJack, powerJackNutRadius, powerJackNutRadius, center = true);
                        
                        translate([0, 0, 3]) {
                            cylinder(totalWallThickness + 1, powerJackRadius, powerJackRadius, center = true);
                        }
                    }
                }
            }          
        }
    }
 
    
    //// Text
    rotate([-90, -180, 90]) {
        translate([-90, -1 * boxDepth + 28, boxWidth / 2]) {
            linear_extrude(height = 1, scale = 1.0) {
                text("Yam Media Player", size = 9);
                
                translate([0, -8, 0]) {
                    text("Designed and Built by Timothy M. Stepanski", size = 5);
                }
                
                translate([0, -16, 0]) {
                    text("Cincinnati OH, 2016", size = 5);
                }
            }        
        }
    }   
}

module translateAndCreatHalfSphere(radius, translateVector, colorToPaint) {
    translate(translateVector) {
        color(colorToPaint) {
            halfSphere(radius);
        }
    }
}

module halfSphere(radius) {
    cubeLength = radius * 2;
    
    difference() {
        sphere(r = radius);
    
        translate([0, 0, -1 * radius]) {
            cube([cubeLength, cubeLength, cubeLength], center = true);
        }
    }
}