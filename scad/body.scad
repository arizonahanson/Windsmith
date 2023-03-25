
use <lib/tools.scad>;
use <tenon.scad>;

TenonL = 26.0;
BodyLength=182.9145;
BodyHolePositions=[71.7459, 107.339, 137.3502];
BodyHoleDiameters=[8.9989,8.7106,6.4366];

module body(l=BodyLength, hs=BodyHolePositions, ds=BodyHoleDiameters) {
  if ($children > 0)
    lift(BodyLength)
      children();

  difference() {
    mortise()
    stack(h=l-TenonL, d=26.0)
    tenon(h2=4.3);

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
