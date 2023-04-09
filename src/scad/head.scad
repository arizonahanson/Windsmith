
use <tools/geometry.scad>;
use <tools/operators.scad>;
use <tools/shape.scad>;
use <tenon.scad>;

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
  stack(h=19.0, d1=17.4, d2=17.8, fn=fn) //36.4
  stack(h=10.0, d1=17.8, d2=17.9, fn=fn) //46.4
  stack(h=10.0, d1=17.9, d2=18.1, fn=fn) //56.4
  stack(h=10.0, d1=18.1, d2=18.2, fn=fn) //66.4
  stack(h=10.0, d1=18.2, d2=18.3, fn=fn) //76.4
  stack(h=10.0, d1=18.3, d2=18.5, fn=fn) //86.4
  stack(h=10.0, d1=18.5, d2=18.6, fn=fn) //96.4
  stack(h=10.0, d1=18.6, d2=18.7, fn=fn) //106.4
  stack(h=10.0, d1=18.7, d2=18.9, fn=fn) //116.4
  stack(h=10.0, d1=18.9, d2=19.0, fn=fn) //126.4
  stack(h=BoreL-126.4, d=19.0, fn=fn);   //(47) 173.4

module head() {
  difference() {
    stack(h=HeadL, d=26.0)
    tenon(h1=TenonL, b1=26.0, b2=19.0);

    lift(CorkL)
      bore();
  }
  lift(HeadL)
    children();
}

// TESTS
hold()
  head();
