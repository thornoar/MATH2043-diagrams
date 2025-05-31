include default;
size(12cm);

real mar = 0.1;
real h = 0.7;

draw((-mar,0) -- (1+mar, 0), arrow = Arrow(SimpleHead));
draw((0,-mar) -- (0, h+mar), arrow = Arrow(SimpleHead));
draw((1,h) -- (1,0), dashed+grey);
draw((0,h) -- (1,h), dashed+grey);

void drawf (int n, string nlab, pen p, real pos) {
    real x = 1/2 + 1/n;
    draw((x,h) -- (x,0), dashed + grey);
    dot((x,0), L = Label("$\frac{1}{2} + \frac{1}{" + nlab + "}$", align = 1.5*S));
    draw((0,0) -- (1/2,0) -- (x,h) -- (1,h), p = p, L = Label("$f_{" + nlab + "}$", position = Relative(pos), align = Relative(W)));
}


dot((0,0), L = Label("0", align = 1.5*(S+W)));
dot((1,0), L = Label("1", align = 1.5*S));
dot((1/2,0), L = Label("$\frac{1}{2}$", align = 1.5*S));
dot((0,h), L = Label("1", align = 1.5*W));

drawf(7, "m", orange+linewidth(1), 0.7);
drawf(3, "n", heavygreen+linewidth(1), 0.8);

export(xmargin = .5cm);
