
include <lib/globals.scad>;
use <lib/operators.scad>;
use <lib/tools.scad>;
use <tenon.scad>;

TenonL = 26.0;
FootLength=183.801;
FootHolePositions=[19.564, 42.409, 72.409];
FootHoleDiameters=[8.905, 9.957, 5.504];

module foot(l=FootLength, hs=FootHolePositions, ds=FootHoleDiameters)
  difference() {
    mortise(h2=17.4)
    stack(h=l, d=26.0, top=false);

    lift(TenonL) {
      lift(-EPSILON) stack(h=l+2*EPSILON, d=19.0);
      for (i = [0:1:len(hs)-1])
        lift(hs[i])
          drill(b=19.0, h=4.3, d=ds[i]);
    }
  }

hold()
  foot();
