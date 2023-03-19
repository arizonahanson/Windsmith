
use <tools/tools.scad>;
use <tenon.scad>;

TenonL = 26;
BodyLength=182.924;
BodyHolePositions=[71.682, 107.331, 137.356];
BodyHoleDiameters=[8.979,8.705,6.444];

module body(l=BodyLength, hs=BodyHolePositions, ds=BodyHoleDiameters) {
  if ($children > 0)
    lift(BodyLength)
      children();
  difference() {
    mortise()
    stack(h=l-TenonL, d=26)
    tenon();
    stack(h=l+TenonL, d=19);
    toneholes(b=19.0, h=4.3, hs=[for (x=hs) x+TenonL], ds=ds);
  }
}

hold()
  body();
