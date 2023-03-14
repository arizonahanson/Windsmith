
include <geometry.scad>;
include <operators.scad>;

// union overlap (mm)
EPSILON = 1e-3;

// a if defined, else b
function get(a, b) =
  is_undef(a) ? b : a;

// place cylinder
module place(h, d, d1, d2, fn, epsilon=false)
  let(h = h + (epsilon ? EPSILON : 0))
  let(d1 = get(d1, d))
  let(d2 = get(d2, get(d, d1)))
  let(fn = fn ? fn : facets(max(d1, d2)))
  cylinder(h=h, d1=d1, d2=d2, $fn=fn);

// vertically chained placement
module drive(h, d, d1, d2, fn, epsilon=true) {
  place(h=h, d=d, d1=d1, d2=d2, fn=fn, epsilon=epsilon);
  lift(h) children();
};

// punch hole
module punch(b, h, d, w, a=0, s=0)
  turn(-90)
    let(w = get(w, d))
    stretch(w/d)
      let(fn = facets(w))
      let(radius = b/2 + h)
      let(apothem = apothem(radius, d))
      let(undercut = d + chord(apothem, 2*a))
      drive(h=apothem, d1=undercut, d2=d, fn=fn)
      let(sagitta = radius-apothem)
      let(shoulder = d + chord(sagitta, 2*s))
      place(h=sagitta, d1=d, d2=shoulder, fn=fn, epsilon=true);

// vertically chained punching
module drill(b, h, d, w, a=0, s=0) {
  punch(b=b, h=h, d=d, w=w, a=a, s=s);
  children();
};
