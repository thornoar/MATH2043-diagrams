include common;
config.paths.neighheight = .15;
config.paths.neighwidth = .04;
size(.7*textwidth);

real mar = .15;
real xmax = 6;

draw((2,0) -- (xmax,0));
dot(
    (3,0)
    // , L = Label("$L$", align = 1.5*S)
);
draw(
    (3,-.4) -- (3,-.05),
    // (1.9,-.4){E} .. (2.1,-.43) .. (2.8, -.48) .. {N}(3,-.1),
    // curvedpath((1.5,-1), (3,0), curve = .15),
    L = Label("$L = \limsup x_n$", position = BeginPoint, align = .7*S)
    ,arrow = Arrow(SimpleHead)
);
real orbeg = 3.5;
path or;
draw(
    (or = neigharc(orbeg))
    ,p = orange
    ,L = Label("$L + \varepsilon$", position = MidPoint, align = 4*S)
);
path orline = (orbeg, -mar) -- (xmax, -mar);
draw(
    subpath(orline, intersect(orline,or)[0], length(orline))
    ,p = orange
    ,L = Label("finitely many $x_n$'s", position = MidPoint, align = 1.5*S)
);
dot(3.7, orange);
dot(3.9, orange);
dot(4.9, orange);
dot(5.2, orange);
dot(5.7, orange);

real grbeg = 2.5;
path gr;
draw(
    (gr = neigharc(grbeg))
    ,p = heavygreen
    ,L = Label("$L - \varepsilon$", position = MidPoint, align = 4*S)
);
path grline = (grbeg, mar) -- (xmax, mar);
draw(
    subpath(grline, intersect(grline,gr)[0], length(grline))
    ,p = heavygreen
    ,L = Label("infinitely many $x_n$'s", position = MidPoint, align = 1.5*N)
);
dot(2.54, heavygreen);
dot(2.58, heavygreen);
dot(2.8, heavygreen);
dot(2.85, heavygreen);
dot(2.94, heavygreen);
dot(3.04, heavygreen);
dot(3.1, heavygreen);
dot(3.13, heavygreen);
dot(3.2, heavygreen);
dot(3.23, heavygreen);
dot(3.41, heavygreen);
