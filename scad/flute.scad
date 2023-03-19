
use <tools/tools.scad>;
use <head.scad>;
use <body.scad>;
use <foot.scad>;

if ($preview)
  turn() roll() {
    lift(-26)
      head()
      body()
      foot();
  } else
    head();
