
use <lib/tools.scad>;
use <lib/components.scad>;

CorkL=8.6;
HoleL=17.4;
TuneL=156.0;
TenonL=26.0;
BoreL=HoleL+TuneL; //173.4
OffsetL=CorkL+HoleL; //26.0 (TenonL)
HeadL=OffsetL+TuneL-TenonL; //156.0 (TuneL)

module bore()
  let(fn = fragments(19.0))
  stack(h=HoleL, d1=17.0, d2=17.4, fn=fn) //17.4
  // squoval embouchure with angled wall and shoulder
  drill(b=17.4, h=4.3, d=10.4, w=12.2, a=7, s=45, sq=1.0)
  stack(h=26.5, d1=17.4, d2=17.8, fn=fn) //43.9
  stack(h=10.0, d1=17.8, d2=17.9, fn=fn) //53.9
  stack(h=10.0, d1=17.9, d2=18.1, fn=fn) //63.9
  stack(h=10.0, d1=18.1, d2=18.3, fn=fn) //73.9
  stack(h=10.0, d1=18.3, d2=18.4, fn=fn) //83.9
  stack(h=10.0, d1=18.4, d2=18.6, fn=fn) //93.9
  stack(h=10.0, d1=18.6, d2=18.8, fn=fn) //103.9
  stack(h=10.0, d1=18.8, d2=18.8, fn=fn) //113.9
  stack(h=10.0, d1=18.8, d2=19.0, fn=fn) //123.9
  stack(h=BoreL-123.9, d=19.0, fn=fn);   //173.4

module head() {
  if ($children > 0)
    lift(HeadL) children();
  difference() {
    stack(h=HeadL, d=26.0)
    tenon(h=TenonL, b1=26.0, b2=19.0);
    lift(CorkL)
      bore();
  }
}

// TESTS
hold()
  head();
