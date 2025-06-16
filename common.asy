defaultpen(0.5pt + fontsize(12pt));
usepackage("amsmath");
usepackage("amssymb");
// usepackage("tempora");

import smoothmanifold;
config.system.insertdollars = false;
config.paths.neighheight = .1;
config.paths.neighwidth = .02;
config.drawing.smoothfill = nullpen;
config.drawing.subsetfill = new pen[]{};
config.arrow.absmargins = true;
config.arrow.mar = 0.02;
config.arrow.currentarrow = DeferredArrow(SimpleHead, arc = false, angle = 10);
