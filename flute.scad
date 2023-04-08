
use <scad/lib/operators.scad>;
use <scad/head.scad>;
use <scad/body.scad>;
use <scad/foot.scad>;

// part to render
PART="preview"; //[head, body, foot, preview]

BodyLength=182.915;
BodyHolePositions=[71.746, 107.339, 137.350];
BodyHoleDiameters=[8.999, 8.711, 6.437];
FootLength=183.801;
FootHolePositions=[19.564, 42.409, 72.409];
FootHoleDiameters=[8.905, 9.957, 5.504];

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
