
// smallest fragment (mm)
LIMIT = $preview ? 0.45 : 0.15;

// subtended angle for given radius and chord length
function angle(radius, chord) =
  2 * asin(chord/2/radius);

// chord length for given apothem and subtended angle
function chord(apothem, angle) =
  2 * tan(angle/2) * apothem;

// apothem for given radius and chord length
function apothem(radius, chord) =
  sqrt(radius^2 - (chord/2)^2);

// inradius for given radius and subtended angle
function inradius(radius, angle) =
  radius * cos(angle/2);

// circumradius for given apothem and subtended angle
function circumradius(apothem, angle) =
  apothem / cos(angle/2);

// even number of fragments for a given diameter
function fragments(diameter) =
  let(angle = angle(diameter/2, LIMIT))
  max(4, floor(180/angle)*2);

// TESTS
let (
  radius=5.0,
  fn=fragments(2*radius),
  inradius=inradius(radius, 360/fn),
  chord=chord(inradius, 360/fn),
  apothem=apothem(radius, chord),
  angle=angle(radius, chord),
  circumradius=circumradius(apothem, angle),
  sagitta=radius-apothem
) echo(
  radius=radius,
  fn=fn,
  inradius=inradius,
  chord=chord,
  apothem=apothem,
  angle=angle,
  circumradius=circumradius,
  sagitta=sagitta
);
