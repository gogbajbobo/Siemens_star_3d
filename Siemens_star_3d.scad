$fn = 72;

// 1 unit = 10µm
size = 1000;
number_of_cones = 18;
cone_angle = 360 / (2 * number_of_cones);
cone_height = size / 2;
cone_radius = sin(cone_angle/2) * cone_height;


module cones_disk() {
    
for(angle = [0 : 2*cone_angle : 360-2*cone_angle])
    rotate([angle, 0, 0])
        cylinder(h = cone_height, r1 = 0, r2 = cone_radius, center = false);

}

difference() {

    translate([0, 0, -size/6])
        cylinder(h = size/3, d = size);
    
    rotate([0, 90, 0])
        cones_disk();

}