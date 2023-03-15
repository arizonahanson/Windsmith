
use <tools/tools.scad>;

CorkL=8.6;
HoleL=17.4;
BoreL=156;
TenonL=26;

module bore()
  let(fn = facets(19))
  stack(h=17.4, d1=17, d2=17.4, fn=fn)   //17.4
  drill(b=17.4, h=4.3, d=10.4, w=12.2, a=7, s=45)
  stack(h=26.5, d1=17.4, d2=17.8, fn=fn) //43.9
  stack(h=10, d1=17.8, d2=17.9, fn=fn)   //53.9
  stack(h=10, d1=17.9, d2=18.1, fn=fn)   //63.9
  stack(h=10, d1=18.1, d2=18.3, fn=fn)   //73.9
  stack(h=10, d1=18.3, d2=18.4, fn=fn)   //83.9
  stack(h=10, d1=18.4, d2=18.6, fn=fn)   //93.9
  stack(h=10, d1=18.6, d2=18.8, fn=fn)   //103.9
  stack(h=10, d1=18.8, d2=18.8, fn=fn)   //113.9
  stack(h=10, d1=18.8, d2=19.0, fn=fn)   //123.9
  stack(h=49.5, d=19.0, fn=fn);          //173.4

module head()
  difference() {
    color("burlywood")
      stack(h=CorkL+HoleL+BoreL-TenonL, d=26, epsilon=false);
    color("wheat")
      lift(CorkL)
      bore();
  };

// TESTS
if($preview)
  turn()
  roll()
  lift(-CorkL-HoleL)
  head();
else
  head();
