$fs=0.01;
difference() {
  difference() {
    difference() {
      difference() {
        rotate([90.0,0.0,0.0]) import("iphone_se_case_v1.stl");
        translate([-26.5,-61.5,0.0]) 
          intersection() {
            translate([-100.0,-200.0,0.0]) cube([200.0, 400.0, 100.0]);
            minkowski() {
              cube([53.0, 123.0, 3.0]);
              cylinder(r1=5.395, h=6.5, r2=0.0);
            }
          }
      }
      translate([-23.0,60.0,0.0]) 
        minkowski() {  sphere(2.0); cube([46.0, 40.0, 10.0]);}
    }
    translate([-70.0,-40.5,0.0]) 
      minkowski() {  sphere(2.0); cube([40.0, 11.0, 10.0]);}
  }
  translate([20.0,-52.0,0.0]) 
    minkowski() {  sphere(2.0); cube([40.0, 34.0, 10.0]);}
}