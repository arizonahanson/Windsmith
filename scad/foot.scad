
use <lib/tools.scad>;
use <lib/components.scad>;

TenonL = 26;
FootLength=183.764;
FootHolePositions=[19.567,42.338,72.338];
FootHoleDiameters=[8.932,9.947,5.505];

module foot(l=FootLength, hs=FootHolePositions, ds=FootHoleDiameters)
  difference() {
    mortise(h2=17.4)
    stack(h=l, d=26, top=false);
    stack(h=l+TenonL, d=19);
    toneholes(b=19.0, h=4.3, hs=[for (x=hs) x+TenonL], ds=ds);
  }

hold()
  foot();
