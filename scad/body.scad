
use <tools/tools.scad>;
use <tenon.scad>;

TenonL = 26;
BodyL = 183;

module body(l=BodyL, hs=[], ds=[]) {
  if ($children > 0)
    lift(BodyL)
      children();
  difference() {
    mortise()
    stack(h=l-TenonL, d=26)
    tenon();
    stack(h=l+TenonL, d=19);
    toneholes(b=19.0, h=4.3, hs=[for (x=hs) x+TenonL], ds=ds);
  }
}

module toneholes(b=19.0, h=4.3, hs=[], ds=[])
  for (i = [0:1:len(hs)-1])
    lift(hs[i])
      drill(b=b, h=h, d=ds[i]);

if ($preview)
  turn() roll() lift(-TenonL)
    body(hs=[71.7, 107.3, 137.4], ds=[9, 8.7, 6.4]);
else
  body();
