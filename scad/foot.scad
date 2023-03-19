

use <tools/tools.scad>;
use <tenon.scad>;

TenonL = 26;
FootL = 156;

module foot(l=FootL)
  difference() {
    mortise(h1=17.4)
    stack(h=l, d=26, top=false);
    stack(h=l+TenonL, d=19);
  }

if ($preview)
  turn() roll() lift(-TenonL)
    foot();
else
  foot();
