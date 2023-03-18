
// union overlap (mm)
EPSILON = 1e-3;

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
module pull(ratio=1)
  scale([1, ratio, 1])
  children();

// minkowski sum with cube of given side length
module squirk(sq=0, convexity=2)
  if (sq>=EPSILON) minkowski(convexity=convexity) {
    translate([-sq/2, -sq/2, 0])
      cube([sq, sq, EPSILON]);
    children();
  } else
    children();
