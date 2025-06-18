include common;
size(.7*textwidth);

real x = 1.23, s = 2.3, h = 0, dh = 0.45;
real mar = .0;
real h2 = 0.12;
real h3 = 0.02;
real r = 1, dr = 1.05;

real a = 0, b = 2.5;

void drawneigh (real r, string rlab, real rat, string ratlab) {
    draw((0,h)--(s,h));
    dot((x,h));
    // draw((x-r, h) -- (x+r, h), blue);
    label((x,h), "$x$", align = 1.5*S);
    draw(shift((0,h)) * neigharc(x = x - r));
    draw(shift((0,h)) * neigharc(x = x + r, dir = -1));
    draw((x, h + h2) -- (x - r, h + h2), bar = Bars(), L = Label(rlab, position = MidPoint, align = N));
    dot((rat,h), p = orange);
    if (ratlab != "") label((rat,h), ratlab, align = S, p = orange);
    h -= dh;
}

drawneigh(1, "$1$", 1.8, "$r_1 \in \mathbb{Q}$");
drawneigh(1/2, "$1/2$", .95, "$r_2 \in \mathbb{Q}$");
h -= .1*dh;
label((x, h+0.5*dh), "$\vdots$", p = fontsize(10pt));
h -= .3*dh;
drawneigh(1/6, "$1/n$", 1.3, "");
h += dh;
draw(
    curvedpath((1.6, h+.2), (1.3, h+.01), curve = .2),
    arrow = Arrow(SimpleHead),
    p = orange,
    L = Label("$r_n \in \mathbb{Q}$", position = BeginPoint, align = E)
);
