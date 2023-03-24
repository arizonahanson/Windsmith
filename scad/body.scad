
use <lib/tools.scad>;
use <tenon.scad>;

TenonL = 26.0;
BodyLength=182.924;
BodyHolePositions=[71.682, 107.331, 137.356];
BodyHoleDiameters=[8.979,8.705,6.444];

module body(l=BodyLength, hs=BodyHolePositions, ds=BodyHoleDiameters) {
  if ($children > 0)
    lift(BodyLength)
      children();
  difference() {
    mortise()
    stack(h=l-TenonL, d=26.0)
    tenon();

    lift(TenonL) {
      stack(h=l, d=19.0);
      for (i = [0:1:len(hs)-1])
        lift(hs[i])
          drill(b=19.0, h=4.3, d=ds[i]);
    }
  }
}

hold()
  body();
