
// translate along z-axis
module lift(length=0)
  translate([0, 0, length])
  children();

// rotate clockwise around z-axis
module twist(angle=90)
  rotate([0, 0, -angle])
  children();

// rotate clockwise around x-axis
module turn(angle=90)
  rotate([-angle, 0, 0])
  children();

// scale along y-axis
module stretch(ratio=1)
  scale([1, ratio, 1])
  children();
