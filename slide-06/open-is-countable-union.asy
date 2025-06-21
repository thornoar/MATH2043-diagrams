include common;
config.paths.neighheight = .12;
config.paths.neighwidth = .03;
size(.6*textwidth);

real xmax = 5;

draw((.8,0) -- (xmax,0));

real h = .15;

drawneigh(1,2.6, heavygreen);
label((1.8,h), "$I_x$", p = heavygreen);
dot(1.3, heavygreen, L = Label("$x$", align = 1.5*S));
dot(2.0, orange, L = Label("$q_x \in \mathbb{Q}$", align = S));

drawneigh(3.0,4.7, blue);
label((3.85,h), "$I_y$", p = blue);
dot(4.4, blue, L = Label("$y$", align = 1.5*S));
dot(3.6, orange, L = Label("$q_y \in \mathbb{Q}$", align = S));
