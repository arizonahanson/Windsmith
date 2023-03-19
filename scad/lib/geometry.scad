
// smallest fragment (mm)
LIMIT = $preview ? 0.3 : 0.15;

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
function inradius(circumradius, angle) =
  circumradius * cos(angle/2);

// circumradius for given inradius and subtended angle
function circumradius(inradius, angle) =
  inradius / cos(angle/2);

// even number of fragments for a given diameter
function fragments(diameter) =
  let(angle = angle(diameter/2, LIMIT))
  max(4, floor(180/angle)*2);

// TESTS
let(r=1, s=LIMIT, n=fragments(2*r), a=360/n) {
  echo(r=r, s=s);
  echo(fragments=n);
  echo(angle=a);
  echo(inradius=inradius(r,a));
  echo(chord=chord(inradius(r,a), a));
  echo(circumradius=circumradius(apothem(r,chord(inradius(r,a),a)), a));
  echo(sagitta=r-apothem(r,s));
}
