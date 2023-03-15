
// subtended angle for given radius and chord length
function angle(radius, chord) =
  2 * asin(chord/2/radius);

// chord length for given apothem and subtended angle
function chord(apothem, angle) =
  2 * tan(angle/2) * apothem;

// apothem for given radius and subtended angle
function apothem(radius, angle) =
  radius * cos(angle/2);

// radius for given apothem and subtended angle
function radius(apothem, angle) =
  apothem / cos(angle/2);

// TESTS
let(r=5, s=0.2, n=floor(360/angle(r,s)), a=360/n) {
  echo(r=r, s=s, n=n);
  echo(angle=a);
  echo(apothem=apothem(r,a));
  echo(chord=chord(apothem(r,a), a));
  echo(radius=radius(apothem(r,a), a));
  echo(sagitta=r-apothem(r,a));
}
