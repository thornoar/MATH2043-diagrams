include common;
config.paths.neighheight = .21;
config.paths.neighwidth = .06;
size(.6*textwidth);

draw((0,0) -- (6,0));
dot((3,0), L = Label("$\sup \{x_n\}$", align = 1.7*S));
draw(neigharc(1), orange);
draw(neigharc(5, dir = -1), orange);

real barh = .05;
real h = .4;
draw(
    (3,h)--(5,h),
    L = Label("$\varepsilon$", position = MidPoint, align = N),
    bar = Bars(5),
    p = orange
);

dot((1.45,0), heavygreen, L = Label("$x_N$", align = 1.5*N+.5*W));
dot((2.0,0), heavygreen, L = Label("$x_{N+1}$", align = 1.5*N+.2*W));
dot((2.5,0), heavygreen, L = Label("$\hdots$", align = 1.5*N+0*E));
dot((2.64, 0), heavygreen);
dot((2.76, 0), heavygreen);
dot((2.91, 0), heavygreen);
