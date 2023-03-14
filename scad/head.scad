
use <tools/tools.scad>;

CorkL=8.6;
HeadL=156;

module bore()
  let(fn = facets(19))
  drive(h=17.4, d1=17, d2=17.4, fn=fn)
  // embouchure
  drill(b=17.4, h=4.3, d=10.4, w=12.2, a=7, s=45)
  drive(h=26.5, d1=17.4, d2=17.8, fn=fn)
  drive(h=10, d1=17.8, d2=17.9, fn=fn)
  drive(h=10, d1=17.9, d2=18.1, fn=fn)
  drive(h=10, d1=18.1, d2=18.3, fn=fn)
  drive(h=10, d1=18.3, d2=18.4, fn=fn)
  drive(h=10, d1=18.4, d2=18.6, fn=fn)
  drive(h=10, d1=18.6, d2=18.8, fn=fn)
  drive(h=10, d1=18.8, d2=18.8, fn=fn)
  drive(h=10, d1=18.8, d2=19.0, fn=fn)
  place(h=27.8, d=19.0, epsilon=true, fn=fn);

module head()
  difference() {
    place(h=HeadL, d=26);
    // tenon();
    lift(CorkL) bore();
  };

// TESTS
head();
