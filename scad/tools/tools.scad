
include <geometry.scad>;
include <operators.scad>;

// union overlap (mm)
EPSILON = 1e-3;
// smallest facet (mm)
LIMIT = $preview ? 0.5 : 0.2;

// a if defined, else b
function get(a, b) =
  is_undef(a) ? b : a;

// number of facets for a given diameter
function facets(diameter) =
  let(angle = angle(diameter/2, LIMIT))
  max(3, floor(360/angle));

// stack cylinder and lift children
module stack(h, d, d1, d2, fn, epsilon=true)
  if ($children > 0) {
    stack(h=h, d=d, d1=d1, d2=d2, fn=fn, epsilon=epsilon);
    lift(h) children();
  } else
    let(h = h + (epsilon ? EPSILON : 0))
    let(d1 = get(d1, d))
    let(d2 = get(d2, get(d, d1)))
    let(fn = fn ? fn : facets(max(d1, d2)))
    cylinder(h=h, d1=d1, d2=d2, $fn=fn);

// drill hole
module drill(b, h, d, w, a=0, s=0)
  if ($children > 0) {
    drill(b=b, h=h, d=d, w=w, a=a, s=s);
    children();
  } else
    roll(-90)
    let(w = get(w, d))
    grow(w/d)
    let(fn = facets(w))
    let(radius = b/2 + h)
    let(apothem = apothem(radius, angle(radius, d)))
    let(undercut = d + chord(apothem, 2*a))
    stack(h=apothem, d1=undercut, d2=d, fn=fn)
    let(sagitta = radius-apothem)
    let(shoulder = d + chord(sagitta, 2*s))
    stack(h=sagitta, d1=d, d2=shoulder, fn=fn);
