
include <geometry.scad>;
include <operators.scad>;

// a if defined, else b
function get(a, b) =
  is_undef(a) ? b : a;

// stack frustum and lift children
module stack(h, d, d1, d2, fn, sq=0, top=true)
  if ($children > 0) {
    stack(h=h, d=d, d1=d1, d2=d2, fn=fn, sq=sq, top=top);
    lift(h) children();
  } else
    squirk(sq=sq)
    let(d1 = get(d1, d))
    let(d2 = get(d2, get(d, d1)))
    let(fn = fn ? fn : fragments(max(d1, d2)))
    let(h = h - (sq > EPSILON ? EPSILON : 0) + (top ? EPSILON : 0))
    cylinder(h=h, d1=(d1-sq), d2=(d2-sq), $fn=fn);

// drill hole
module drill(b, h, d, w, a=0, s=0, sq=0)
  if ($children > 0) {
    drill(b=b, h=h, d=d, w=w, a=a, s=s, sq=sq);
    children();
  } else
    roll(-90)
    let(w = get(w, d))
    pull(w/d)
    let(fn = fragments(w))
    let(radius = b/2 + h)
    let(apothem = apothem(radius, d))
    let(undercut = d + chord(apothem, 2*a))
    stack(h=apothem, d1=undercut, d2=d, fn=fn, sq=sq)
    let(sagitta = radius-apothem)
    let(shoulder = d + chord(sagitta, 2*s))
    stack(h=sagitta, d1=d, d2=shoulder, fn=fn, sq=sq);
