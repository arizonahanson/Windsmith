
use <lib/tools.scad>;
use <head.scad>;
use <body.scad>;
use <foot.scad>;

// part to render
PART="preview"; //[head, body, foot, preview]

BodyLength=182.9145;
BodyHolePositions=[71.7459, 107.339, 137.3502];
BodyHoleDiameters=[8.9989,8.7106,6.4366];
FootLength=183.801;
FootHolePositions=[19.5644,42.4093,72.4093];
FootHoleDiameters=[8.9047,9.9572,5.5037];

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
