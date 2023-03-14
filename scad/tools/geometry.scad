
// subtended angle for given radius and chord length
function angle(radius, chord) =
  2 * asin(chord/2/radius);

// apothem for given radius and chord length
function apothem(radius, chord) =
  sqrt(pow(radius, 2) - pow(chord/2, 2));

// chord length for given apothem and subtended angle
function chord(apothem, angle) =
  2 * tan(angle/2) * apothem;

// smallest facet (mm)
LIMIT = $preview ? 0.5 : 0.1;

// number of polygon facets for a given diameter
function facets(diameter) =
  let(angle = angle(diameter/2, LIMIT))
  max(3, floor(360/angle));

// TESTS
let(r=1, c=LIMIT) {
  echo(angle=angle(r,c));
  echo(apothem=apothem(r,c));
  echo(chord=chord(apothem(r,c), angle(r,c)));
  echo(facets=facets(2*r));
  echo(sagitta=r-apothem(r,c));
}
