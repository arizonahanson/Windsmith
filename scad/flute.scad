
use <tools/tools.scad>;
use <head.scad>;
use <body.scad>;
use <foot.scad>;

// part to render
PART="preview"; //[head, body, foot, preview]

BodyLength=182.924;
BodyHolePositions=[71.682, 107.331, 137.356];
BodyHoleDiameters=[8.979,8.705,6.444];
FootLength=183.764;
FootHolePositions=[19.567,42.338,72.338];
FootHoleDiameters=[8.932,9.947,5.505];

// preview or place individual part
if (PART=="head")
  hold()
    head();
else if (PART=="body")
  hold()
    body(l=BodyLength, hs=BodyHolePositions, ds=BodyHoleDiameters);
else if (PART=="foot")
  hold()
    foot(l=FootLength, hs=FootHolePositions, ds=FootHoleDiameters);
else if ($preview)
  // assembled preview
  hold()
    head()
    body(l=BodyLength, hs=BodyHolePositions, ds=BodyHoleDiameters)
    foot(l=FootLength, hs=FootHolePositions, ds=FootHoleDiameters);
else
  assert(PART!="preview", "Must supply PART (head | body | foot)");
