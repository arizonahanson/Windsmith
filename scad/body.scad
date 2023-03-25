
include <lib/tools.scad>;
use <tenon.scad>;

TenonL = 26.0;
BodyLength=182.915;
BodyHolePositions=[71.746, 107.339, 137.350];
BodyHoleDiameters=[8.999, 8.711, 6.437];

module body(l=BodyLength, hs=BodyHolePositions, ds=BodyHoleDiameters) {
  if ($children > 0)
    lift(BodyLength)
      children();

  difference() {
    mortise()
    stack(h=l-TenonL, d=26.0)
    tenon(h2=4.3);

    lift(TenonL) {
      lift(-EPSILON) stack(h=l+2*EPSILON, d=19.0);
      for (i = [0:1:len(hs)-1])
        lift(hs[i])
          drill(b=19.0, h=4.3, d=ds[i]);
    }
  }
}

hold()
  body();
