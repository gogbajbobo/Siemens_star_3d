$fn = 72;

// 1 unit = 10µm
size = 1000;
number_of_cones = 12;
cone_angle = 360 / (2 * number_of_cones);
cone_height = size / 2;
cone_radius = sin(cone_angle/2) * cone_height;


module cones_disk() {
    
for(angle = [0 : 2*cone_angle : 360-2*cone_angle])
    rotate([angle, 0, 0])
        cylinder(h = cone_height, r1 = 0, r2 = cone_radius, center = false);

}

module two_crossed_cones_disk() {
    
    rotate([0, 90, 0]) {
        union() {
            cones_disk();
            rotate([0, 0, 90])
                cones_disk();
        }
    }
    
}

difference() {

    cube(size = size/1.4, center = true);
    two_crossed_cones_disk();

}
