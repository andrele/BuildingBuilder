height = 1000;
width = 1000;
depth = 500;
gutter = .2;
floorHeight = 10;
windowColumns = 10;
windowSize = width*(1-gutter)/windowColumns;
tHeight = height*($t+1);

// Determine how many floors fit
floors = floor(tHeight / ((windowSize)+(gutter*width/(windowColumns+1))));

translate([-width/2,-depth/2,0]){
//	difference(){
		cube([width,depth,tHeight]);
	
		// Create floors
		for(j = [0:floors-1]) {

			translate([0,0,j*(windowSize)+((j +1)*(gutter*width/(windowColumns+1)))]){
				// Create row of windows along width
				for(i = [0:windowColumns-1]) {
					translate([i*(windowSize)+((i+1)*(gutter*width/(windowColumns+1))),-1,(gutter*width/windowColumns)]){
						cube([windowSize,15,windowSize]);
					}
				}
				translate([0,depth-13,0]){
					for(i = [0:windowColumns-1]) {
						translate([i*(windowSize)+((i+1)*(gutter*width/(windowColumns+1))),-1,(gutter*width/windowColumns)]){
							cube([windowSize,15,windowSize]);
						}
					}
			
				// Create row of windows long depth
				rotate([0,0,90]){
					translate([-depth+((depth*(1-gutter)/windowColumns)/2)-15,0,0]){
						for(i = [0:windowColumns-1]) {
							translate([i*(depth*(1-gutter)/windowColumns)+((i+1)*(gutter*depth/(windowColumns+1))),-1,(gutter*width/windowColumns)]){
								cube([depth*(1-gutter)/windowColumns,15,windowSize]);
							}
						}
						}
					}
				}
			}
		}
//	}
}

