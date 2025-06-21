defaultpen(0.5pt + fontsize(10.5pt));
texpreamble("
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{charter}
\usepackage{microtype}
\usepackage[T1]{fontenc}
\usepackage{avant}
");

import smoothmanifold;
config.system.insertdollars = false;
config.paths.neighheight = .07;
config.paths.neighwidth = .03;
config.drawing.smoothfill = nullpen;
config.drawing.subsetfill = new pen[]{};
config.arrow.absmargins = true;
config.arrow.mar = 0.02;
config.arrow.currentarrow = DeferredArrow(SimpleHead, arc = false, angle = 10);

real textwidth = 5.3 inches;

void drawneigh (picture pic = currentpicture, real l, real r, real h = 0, pen p) {
    draw(pic, (l, h) -- (r, h), p);
    draw(pic, shift((0,h))*neigharc(l), p);
    draw(pic, shift((0,h))*neigharc(r, dir = -1), p);
}
