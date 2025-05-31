include default;
size(15cm);
config.paths.neighheight = .07;
config.paths.neighwidth = .03;

real x = 1.23, s = 2.3, h = 0, dh = 0.45;
real mar = .0;
real h2 = 0.12;
real h3 = 0.02;
real r = 0.9, dr = 1.05;

real a = 0, b = 2.5;

void drawneigh (real r = r, string rlab, real rat, string ratlab) {
    dot((x,h));
    // draw((x-r, h) -- (x+r, h), blue);
    label((x,h), "$x$", align = 1.5*S);
    draw(shift((0,h)) * neigharc(x = x - r));
    draw(shift((0,h)) * neigharc(x = x + r, dir = -1));
    draw((x, h + h2) -- (x - r, h + h2), bar = Bars(), L = Label(rlab, position = MidPoint, align = N));
    dot((rat,h), p = orange, L = Label(ratlab, align = S));
}

void drawzoom (real x1, real x2, string rlab, real s = s, real rat, string ratlab) {
    h -= dh;
    r /= dr;
    real x1p = x - s*abs(x - x1);
    real x2p = x + s*abs(x - x2);
    if (x1p > a) draw((a,h) -- (x1p,h), dashed+grey);
    draw((x1p,h) -- (x2p,h), currentpen);
    if (x2p < b) draw((x2p,h) -- (b,h), dashed+grey);
    draw(arcsubpath((x1, h+dh) -- (x1p, h), mar, -mar), grey);
    draw(arcsubpath((x2, h+dh) -- (x2p, h), mar, -mar), grey);
    draw((x1, h+dh+h3) -- (x1, h+dh-h3), grey);
    draw((x2, h+dh+h3) -- (x2, h+dh-h3), grey);
    draw((x1p, h+h3) -- (x1p, h-h3), grey);
    draw((x2p, h+h3) -- (x2p, h-h3), grey);
    drawneigh(r, rlab, rat, ratlab);
}

draw((a,0)--(b,0));
drawneigh("$1$", rat = x-.33, ratlab = "$r_1 \in \mathbb{Q}$");

drawzoom(x-1/2, x+1/2, s = 2, rlab = "$\frac{1}{2}$", rat = x+.65, ratlab = "$r_2 \in \mathbb{Q}$");
drawzoom(x-1/3, x+1/3, s = 3, rlab = "$\frac{1}{3}$", rat = x-.4, ratlab = "$r_3 \in \mathbb{Q}$");

h -= 1*dh;
label((x, h+0.5*dh), "$\vdots$", p = fontsize(20pt));

r /= (dr^12);

drawzoom(x-1/40, x+1/40, s = 40, rlab = "$\frac{1}{n}$", rat = x+.25, ratlab = "$r_n \in \mathbb{Q}$");

export(xmargin = 0.5cm);
