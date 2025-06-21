include common;
config.paths.neighheight = .05;
config.paths.neighwidth = .02;
size(textwidth);

path closed (
    real x,
    int dir = 1,
    real h = config.paths.neighheight,
    real w = config.paths.neighwidth
) {
    return (x + dir*w, h) -- (x, h) -- (x, -h) -- (x + dir*w, -h);
}

real barh = config.paths.neighheight;
real step = .01;

picture buntai (real w, string l1, string l2, bool first) {
    picture p;
    draw(p, (0,0)--(w,0));
    real st = first ? 0 : w/2;
    real fn = first ? w/2 : w;
    draw(p, (st,0) -- ((st,0) + (step,step)), heavygreen);
    for (real x = st + step; x < fn - step/2; x += step)
    {
        draw(p, ((x,0) - (step,step)) -- ((x,0) + (step,step)), heavygreen);
    }
    draw(p, ((fn,0) - (step,step)) -- (fn,0), heavygreen);
    draw(p, closed(0));
    draw(p, closed(w, dir = -1));
    dot(p, (0,0), L = Label(l1, align = W));
    dot(p, (w,0), L = Label(l2, align = E));
    draw(p, (w/2, barh)--(w/2, -barh));

    return p;
}

real mar = .15;

add(buntai(1, "$0$", "$1$", true));
draw((1+mar, 0) -- (1.5 - mar, 0), orange, arrow = ArcArrow(SimpleHead));
add(shift(1.5)*buntai(.5, "$0$", "$\frac{1}{2}$", false));
draw((2+mar, 0) -- (2.5 - mar, 0), orange, arrow = ArcArrow(SimpleHead));
add(shift(2.5)*buntai(.25, "$\frac{1}{4}$", "$\frac{1}{2}$", false));

string lab = minipage("
cannot be covered by
finitely many $U_\alpha$'s
", width = 3.5cm);
frame f;
smooth sm = smooth(
    contour = scale(.0078)*box(f, Label(lab)),
    label = lab,
    labeldir = (0,0),
    labelalign = (0,0)
).move(shift = (2.75/2, .3));

config.help.enable = false;
draw(sm, dpar(fill = false, drawcontour = false));
real ah = .03;
drawarrow(
    sm1 = sm,
    finish = (.25, ah),
    points = new pair[]{(.8,.3), (.4, .2)},
    curve = .12,
    endmargin = 0
);
drawarrow(
    sm1 = sm,
    finish = (2-.125, ah),
    points = new pair[]{(1.4, .16), (1.8, .16)},
    curve = -.14,
    endmargin = 0
);
drawarrow(
    sm1 = sm,
    finish = (2.75-.0625, ah),
    points = new pair[]{(2.1, .35), (2.6,.2)},
    curve = -.16,
    endmargin = 0
);

picture p;

draw(p, (0,0) -- (2,0));
drawneigh(p, 0.5, 1.5, orange);
real h = .2;
draw(p, (0.5,h)--(0.5,0), orange+dashed);
draw(p, (1,h)--(1,h/2), orange+dashed);
draw(p, (0.5, h)--(1,h), bar = Bars(), orange, L = Label("$\varepsilon$", position = MidPoint, align = 1.5*N));
draw(
    p,
    connect(new pair[]{(1.4,.22), (1.29, .22), (1.1,.17), (1,.02)}),
    arrow = Arrow(SimpleHead, angle = 10),
    L = Label("$\bigcap\limits_{k = 1}^{\infty} [a_k, b_k]$", position = BeginPoint, align = E)
);
real ak = .7;
real bk = 1.2;

draw(p, (ak,0)--(bk,0), heavygreen+.7);
draw(p, closed(ak), heavygreen);
draw(p, closed(bk, dir = -1), heavygreen);
dot(p, ak, heavygreen, L = Label("$a_k$", align = W+S));
dot(p, bk, heavygreen, L = Label("$b_k$", align = E+S));

config.paths.neighheight = .07;
draw(p, neigharc(0.2));
draw(p, neigharc(1.8, dir = -1), L = Label("$U_\alpha$", position = MidPoint, align = 1.5*S+E));
dot(p, (1,0), L = Label("$x$", align = 1.5*S));

add(shift((0.375,-.5))*p);
