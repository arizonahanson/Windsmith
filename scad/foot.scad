
use <lib/tools.scad>;
use <tenon.scad>;

TenonL = 26;
FootLength=183.801;
FootHolePositions=[19.5644,42.4093,72.4093];
FootHoleDiameters=[8.9047,9.9572,5.5037];

module foot(l=FootLength, hs=FootHolePositions, ds=FootHoleDiameters)
  difference() {
    mortise(h2=17.4)
    stack(h=l, d=26, top=false);

    lift(TenonL) {
      stack(h=l, d=19.0);
      for (i = [0:1:len(hs)-1])
        lift(hs[i])
          drill(b=19.0, h=4.3, d=ds[i]);
    }
  }

hold()
  foot();
