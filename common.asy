defaultpen(0.5pt + fontsize(10.5pt));
texpreamble("
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{charter}
\usepackage{microtype}
");

import smoothmanifold;
config.system.insertdollars = false;
config.paths.neighheight = .1;
config.paths.neighwidth = .02;
config.drawing.smoothfill = nullpen;
config.drawing.subsetfill = new pen[]{};
config.arrow.absmargins = true;
config.arrow.mar = 0.02;
config.arrow.currentarrow = DeferredArrow(SimpleHead, arc = false, angle = 10);

real textwidth = 5.3 inches;
