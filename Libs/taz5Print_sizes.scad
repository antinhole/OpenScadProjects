 
 // from googoleing around
 // Print Area: 298mm x 275mm x 250mm (11.7in x 10.8in x 9.8in). 

 module Print_Bed() {
     // 
     cube(size=[298, 275, 1], center=true);
 }

 
 module Print_vol() {
     // 
     cube(size=[298, 275, 250], center=true);
 }

 //Print_Bed();
 //Print_vol();