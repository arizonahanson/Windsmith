
include <operators.scad>;
use <tools.scad>;

// mortise inner bore - 0.925-0.927"
InnerD = 25.2;
// piston outer diameter - 0.923-0.922"
PistonD = 24.9;
// gland outer diameter - 0.815-0.813"
GlandD = 22.2;
// o-ring minor diameter - 0.067-0.073"
RingL = 1.78;

// connector printed at start of part (not head)
module mortise(h1=26, h2=8.6, b1=26.0, b2=19.0)
  if ($children > 0) {
    mortise(h1=h1, h2=h2, b1=b1, b2=b2);
    lift(h1)
      children();
  } else
    difference() {
      let(fn = fragments(b1))
      let(outer1 = InnerD + 3.2)
      let(outer2 = outer1 + 2)
      stack(h=h2, d1=outer1, d2=outer2, fn=fn)
      let(cap = (outer1-b1)/2)
      stack(h=h1-h2-cap, d1=outer2, d2=outer1, fn=fn)
      stack(h=cap, d1=outer1, d2=b1, fn=fn);
      lift(-EPSILON)
        let(fn = fragments(b2))
        let(step = (InnerD-b2)/2)
        stack(h=h1-step, d=InnerD, fn=fn)
        stack(h=step+2*EPSILON, d1=InnerD, d2=b2, fn=fn);
    }

// connector printed at end of part (not foot)
module tenon(h=26, b1=26.0, b2=19.0)
  let(fn = fragments(b2))
  let(first = 8.6)
  stack(h=first, d=PistonD, fn=fn)
  stack(h=RingL, d=GlandD, fn=fn)
  let(step = (PistonD-GlandD)/2)
  stack(h=step, d1=GlandD, d2=PistonD, fn=fn)
  let(cap = (PistonD-b2)/2)
  let(second = h-first-2*step-2*RingL-cap)
  stack(h=second, d=PistonD, fn=fn)
  stack(h=RingL, d=GlandD, fn=fn)
  stack(h=step, d1=GlandD, d2=PistonD, fn=fn)
  stack(h=cap, d1=PistonD, d2=b2, fn=fn, top=false);

// place a set of toneholes
module toneholes(b=19.0, h=4.3, hs=[], ds=[])
  for (i = [0:1:len(hs)-1])
    lift(hs[i])
      drill(b=b, h=h, d=ds[i]);

// TESTS
difference() {
  union() {
    tenon();
    mortise(h2=17.4);
  }
  lift(-EPSILON)
    stack(h=26+EPSILON, d=19);
}
