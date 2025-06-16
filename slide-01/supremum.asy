include common;

config.drawing.drawnow = true;
usepackage("xcolor", "dvipsnames");

size(12cm);

real maxlen = 2;

draw((-.1,0) -- (0,0));

draw((0,0) -- (1,0), red);

dot(0, L = Label("0", align = S));
draw(neigharc(1, dir = -1), L = Label("1", position = MidPoint, align = S+.7*E));

dot((1,0), heavygreen);
draw((1,0)--(maxlen,0), linewidth(.7) + heavygreen);

// (
pair notpos = (.5, -.2);
string notlab = minipage("
{\color{red}{not}} upper\\
bounds of $[0,1)$
", width = 2.8cm);
frame f;
smooth not = smooth(
    contour = scale(.0068)*box(f, Label(notlab)),
    label = notlab,
    labeldir = (0,0),
    labelalign = (0,0)
).move(shift = notpos);
// ]

// (
pair indeedpos = (1.5, .2);
string indeedlab = minipage("
{\color{ForestGreen}{all}} upper\\
bounds of $[0,1)$
", width = 2.8cm);
frame f;
smooth indeed = smooth(
    contour = scale(.0068)*box(f, Label(indeedlab)),
    label = indeedlab,
    labeldir = (0,0),
    labelalign = (0,0)
).move(shift = indeedpos);
// ]

draw(not, indeed, dspec = dpar(fill = false, drawcontour = false));

void arr (smooth sm, pen p, real dest, real curve) {
    drawarrow(
        sm1 = sm,
        finish = (dest,0),
        beginmargin = 0,
        endmargin = .02,
        curve = curve,
        p = p
    );
}

arr(not, red, .05, -.25);
arr(not, red, .18, -.25);
arr(not, red, .33, -.25);
arr(not, red, .48, .05);
arr(not, red, .67, .15);
arr(not, red, .89, .33);

arr(indeed, heavygreen, 1, .2);
arr(indeed, heavygreen, 1.15, .2);
arr(indeed, heavygreen, 1.38, .05);
arr(indeed, heavygreen, 1.75, -.12);
arr(indeed, heavygreen, 1.95, -.18);
