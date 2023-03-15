
// translate along z-axis
module lift(length=0)
  translate([0, 0, length])
  children();

// rotate clockwise around z-axis
module turn(angle=90)
  rotate([0, 0, -angle])
  children();

// rotate clockwise around x-axis
module roll(angle=90)
  rotate([-angle, 0, 0])
  children();

// scale along y-axis
module grow(ratio=1)
  scale([1, ratio, 1])
  children();
