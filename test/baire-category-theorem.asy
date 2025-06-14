include default;
size(23cm);
config.drawing.gaplength = 0.07;

real[][] r = {
    {1, .31},
    {1.1, .29},
    {1.1, .32}
};

void drawtangent (pair c1, real r1, pair c2, real r2, pen p) {
    pair dir = c2 - c1;
    real ang = degrees(asin(abs(r2 - r1)/length(dir)));
    draw((c1 + rotate(90 + ang) * (dir * r1 / length(dir))) -- (c2 - rotate(-90 + ang) * (dir * r2 / length(dir))), p = p);
    draw((c1 + rotate(-90 - ang) * (dir * r1 / length(dir))) -- (c2 - rotate(90 - ang) * (dir * r2 / length(dir))), p = p);
}

void drawrad (pair x, real r, real ang, real mar = 0, string label) {
    draw((x + mar * dir(ang)) -- (x + r * dir(ang)), arrow = Arrow(TeXHead), L = Label(label, position = MidPoint, align = Relative(E)));
}

pair x0 = (0,0);
path beps0 = circle(x0, r[0][0]);
dot(x0, L = Label("$x_0$", align = N+W));
fitpath(beps0, orange);
path u1 = shift(.7, .3) * rotate(140) * concavepaths[0];
fill(intersection(beps0, u1)[0], mediumgrey);
fitpath(subpath(u1, .8, length(u1)-2.6), L = Label("$U_1$", position = Relative(.9), align = Relative(W)));
drawrad(x0, r[0][0], 220, "$\varepsilon$");

pair x1i = (.55,-.2);
path beps1s = circle(x1i, r[0][1]);
fillfitpath(beps1s, drawpen = heavygreen, fillpen = white);
dot(x1i, L = Label("$x_1$", align = S));

pair x1o = (2.7, 0.2);
drawtangent(x1i, r[0][1], x1o, r[1][0], dashed+grey);
path beps1b = circle(x1o, r[1][0]);
fillfitpath(beps1b, drawpen = heavygreen, fillpen = white);
dot(x1o, L = Label("$x_1$", align = .3*N+1.4*E));
path u2 = shift(2.1, -.8) * rotate(40) * concavepaths[5];
// draw(u2);
// dot(point(u2,0));
fill(intersection(beps1b, u2)[0], mediumgrey);
fitpath(subpath(u2, 1.1, length(u2)-1.8), L = Label("$U_2$", position = Relative(.93), align = Relative(W)));
drawrad(x1o, r[1][0], 120, "$\varepsilon_1$");

pair x2i = (2.65,-.45);
path beps2s = circle(x2i, r[1][1]);
fillfitpath(beps2s, drawpen = heavygreen, fillpen = white);
dot(x2i, L = Label("$x_2$", align = S));

pair x2o = (5.5, -0.1);
drawtangent(x2i, r[1][1], x2o, r[2][0], dashed+grey);
path beps2b = circle(x2o, r[2][0]);
fillfitpath(beps2b, drawpen = heavygreen, fillpen = white);
dot(x2o, L = Label("$x_2$", align = S+.5*W));
path u3 = shift(5.9, 1) * rotate(40) * concavepaths[3];
// draw(u3);
// dot(point(u3,0));
fill(intersection(beps2b, u3)[0], mediumgrey);
fitpath(subpath(u3, 2.4, length(u2)-2.5), L = Label("$U_3$", position = Relative(.06), align = Relative(W)));
drawrad(x2o, r[2][0], -20, "$\varepsilon_2$");

pair x3i = (5.45,.58);
path beps3s = circle(x3i, r[2][1]);
fillfitpath(beps3s, drawpen = heavygreen, fillpen = white);
dot(x3i, L = Label("$x_3$", align = S));

export(xmargin = 0.5cm);
