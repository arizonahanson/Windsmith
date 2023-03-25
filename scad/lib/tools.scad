
include <geometry.scad>;
include <operators.scad>;
include <paint.scad>;

// a if defined, else b
function get(a, b) =
  is_undef(a) ? b : a;

// stack frustum and lift children
module stack(h, d, d1, d2, fn, sq=0, top=true) {
  paint() squirk(sq=sq)
    let(d1 = get(d1, d))
    let(d2 = get(d2, get(d, d1)))
    let(fn = fn ? fn : fragments(max(d1, d2)))
    let(h = h - (sq > EPSILON ? EPSILON : 0) + (top ? EPSILON : 0))
    cylinder(h=h, d1=(d1-sq), d2=(d2-sq), $fn=fn);
  lift(h)
    children();
}

// drill hole
module drill(b, h, d, w, a=0, s=0, sq=0) {
  let(w = get(w, d))
  roll(-90) pull(w/d)
    let(fn = fragments(w))
    let(radius = b/2 + h)
    let(apothem = apothem(radius, d))
    let(undercut = d + chord(apothem, 2*a))
    stack(h=apothem, d1=undercut, d2=d, fn=fn, sq=sq)
    let(sagitta = radius-apothem)
    let(shoulder = d + chord(sagitta, 2*s))
    stack(h=sagitta, d1=d, d2=shoulder, fn=fn, sq=sq);
  children();
}
