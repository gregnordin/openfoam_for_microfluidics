
z_size = 0.01;
eps = 0.01;
cell_size = 0.005;

chan_length = 0.3;
chan_width = 0.1;

rotate(-45)
translate([-chan_length/2, -chan_width/2, 0]) 
    cube([chan_length, chan_width, z_size]);

// color("blue") translate([0, 0, 0.005]) sphere(r=0.01, $fn=100);
