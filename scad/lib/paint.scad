

module paint()
  let(hue = (($parent_modules + 16) % 24) / 24)
  color(hsvToRGB(hue, 0.4, 0.75, 1))
  children();

function hsvToChroma(h, s, v, a) = s * v;

function hsvToHdash(h, s, v, a) = h * 360 / 60;

function hsvToX(h, s, v, a) = hsvToChroma(h, s, v, a) * (1.0 - abs((hsvToHdash(h, s, v, a) % 2.0) - 1.0));

function hsvToMin(h, s, v, a) = v - hsvToChroma(h, s, v, a);

function hsvToPreRGB(h, s, v, a) = 	hsvToHdash(h, s, v, a) < 1.0 ? [hsvToChroma(h, s, v, a), hsvToX(h, s, v, a), 0, a] :
  hsvToHdash(h, s, v, a) < 2.0 ? [hsvToX(h, s, v, a), hsvToChroma(h, s, v, a), 0, a] :
  hsvToHdash(h, s, v, a) < 3.0 ? [0, hsvToChroma(h, s, v, a), hsvToX(h, s, v, a), a] :
  hsvToHdash(h, s, v, a) < 4.0 ? [0, hsvToX(h, s, v, a), hsvToChroma(h, s, v, a), a] :
  hsvToHdash(h, s, v, a) < 5.0 ? [hsvToX(h, s, v, a), 0, hsvToChroma(h, s, v, a), a] :
  [hsvToChroma(h, s, v, a), 0, hsvToX(h, s, v, a), a];

function hsvToRGB(h = 1, s = 1, v = 1, a = 1) =	[
  hsvToPreRGB(h, s, v, a)[0] + hsvToMin(h, s, v, a),
  hsvToPreRGB(h, s, v, a)[1] + hsvToMin(h, s, v, a),
  hsvToPreRGB(h, s, v, a)[2] + hsvToMin(h, s, v, a),
  a
];
