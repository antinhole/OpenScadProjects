OverAllLenght=140;//80 +22+22 +4+4 152 + space
OverAllWidth=160;//100 +22+22 +4+4 152 + space
BaseHight=6;
Base=[OverAllLenght,OverAllWidth,BaseHight];
MotorHouseing=[22,18,65];
wheelDistance=4;

   difference(){
cube(Base, center=true);
translate( [Base[0]/2-MotorHouseing[0]/2-wheelDistance,
            Base[1]/2-MotorHouseing[1]/2-wheelDistance, 0]) {
   cube(MotorHouseing, center=true); 
}

translate( [-1*(Base[0]/2-MotorHouseing[0]/2-wheelDistance),
               (Base[1]/2-MotorHouseing[1]/2-wheelDistance), 0]) {
   cube(MotorHouseing, center=true); 
}
translate( [   (Base[0]/2-MotorHouseing[0]/2-wheelDistance),
            -1*(Base[1]/2-MotorHouseing[1]/2-wheelDistance), 0]) {
   cube(MotorHouseing, center=true); 
}
translate( [-1*(Base[0]/2-MotorHouseing[0]/2-wheelDistance),
            -1*(Base[1]/2-MotorHouseing[1]/2-wheelDistance), 0]) {
   cube(MotorHouseing, center=true); 
}

   }