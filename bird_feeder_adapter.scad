$fn = 40;

module bowl(radius, thickness=10) {
    difference() {
        translate([0, 0, -20]) sphere(radius);
        translate([0, 0, -20]) sphere(radius - thickness);
        translate([0,0,-radius]) cube(radius*2, center=true);
    }
}

module washer(ext_radius, in_radius, height) {
    difference() {
        cylinder(h=height, r=ext_radius);
        cylinder(h=height, r=in_radius);
    }
}

module main_part() {
    union() {
        translate([0,0,2]) bowl(radius=50, thickness=4);
        washer(ext_radius=98, in_radius=50-4-5, height=4);
    }
}

module pierced_main_part() {
    difference() {
        main_part();
        translate([0,0,0]) cylinder(h=75, r=1.5);
        translate([20,0,0]) cylinder(h=75, r=1.5);
        translate([-20,0,0]) cylinder(h=75, r=1.5);
        translate([0,20,0]) cylinder(h=75, r=1.5);
        translate([0,-20,0]) cylinder(h=75, r=1.5);
    }
}

pierced_main_part() ;
