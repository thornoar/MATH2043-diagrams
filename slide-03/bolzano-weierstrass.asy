include common;
size(textwidth);
dotfactor = 5;

picture p, q;
real l = 5, h = 2;
real xmar = .2;
int maxnum = 20;

void drawcoords (picture pic) {
    draw(
        pic,
        (-xmar, 0) -- (l, 0),
        arrow = ArcArrow(SimpleHead),
        L = Label("$n$", position = EndPoint, align = E)
    );
    draw(
        pic,
        (0, 0) -- (0, h),
        arrow = ArcArrow(SimpleHead),
        L = Label("$x_n$", position = EndPoint, align = N)
    );
}

pair prevpos = (0,0);
bool fst = true;
int ncount = 1;
void point (picture pic, int n, real y, pen p = currentpen, bool peak = false, bool label = peak, bool connect = true) {
    pair curpos = (n/maxnum*l, y*h);
    if (connect && prevpos != (0,0))
    {
        draw(pic, prevpos -- curpos);
    }
    fitpath(pic, (path)curpos, p = p + linewidth(dotfactor*linewidth(p)));
    if (label)
    {
        label(pic, Label("peak"), curpos, align = N, p + fontsize(6pt));
        if (fst)
        {
            draw(
                pic, curpos -- (curpos.x, 0), dashed+grey,
                L = Label("$n_" + (string)ncount + "$", position = EndPoint, align = 1.5*S, p = currentpen)
            );
            dot(pic, (curpos.x, 0));
            ncount += 1;
        }
    }
    if (peak)
    {
        draw(pic, curpos -- (l, y*h), p+dashed);
    }
    prevpos = curpos;
}

// Case 1: infinite peaks
drawcoords(p);
point(p, 1, .3);
point(p, 2, .7);
point(p, 3, .5);
point(p, 4, .9, orange, true);
point(p, 5, .3);
point(p, 6, .6);
point(p, 7, .71, orange, true);
point(p, 8, .1);
point(p, 9, .1);
point(p, 10, .4);
point(p, 11, .2);
point(p, 12, .53, orange, true);
point(p, 13, .33);
point(p, 14, .46, orange, true, false);
point(p, 15, .31);
point(p, 16, .19);
point(p, 17, .39, orange, true, false);
point(p, 18, .11);
point(p, 19, .32, orange, true, false);
draw(p, prevpos -- (l, .2*h));
real arx = .3;
draw(p, (l+arx, .9*h) -- (l+arx, .32*h), orange, arrow = ArcArrow(SimpleHead));

// Case 2: finitely many peaks
fst = false;
drawcoords(q);
prevpos = (0,0);
point(q, 1, .7);
point(q, 2, .95, orange, true);
point(q, 3, .3);
point(q, 4, .8, orange, true);
draw(q, prevpos -- (prevpos = (5/maxnum*l, .5*h)));
label(q, L = Label("$\hdots$"), position = (prevpos = (6/maxnum*l, .5*h)));
prevpos = (7/maxnum*l, .5*h);
point(q, 8, .2, heavygreen, true, false, true);
label(q, position = prevpos, L = Label(minipage("
not\\[-1mm]
peak
", width = .5cm)), p = heavygreen+fontsize(6pt), align = W);
draw(
    q,
    (prevpos.x, 0) -- (prevpos.x, h),
    heavygreen
);
dot(
    q, (prevpos.x, 0),
    L = Label("$N$", align = 1.5*S, p = fontsize(10.5pt))
);
point(q, 11, .33, heavygreen, true, false, false);
label(q, position = prevpos, L = Label(minipage("
not\\[-1mm]
peak
", width = .5cm)), p = heavygreen+fontsize(6pt), align = W);
point(q, 16, .47, heavygreen, true, false, false);
label(q, position = prevpos, L = Label(minipage("
not\\[-1mm]
peak
", width = .5cm)), p = heavygreen+fontsize(6pt), align = W);
point(q, 19, .6, heavygreen, true, false, false);
label(q, position = prevpos, L = Label(minipage("
not\\[-1mm]
peak
", width = .5cm)), p = heavygreen+fontsize(6pt), align = W);
draw(q, (l+arx, .2*h) -- (l+arx, .6*h), heavygreen, arrow = ArcArrow(SimpleHead));


real sh = 3;
add(shift((-sh,0)) * p);
add(shift((sh,0)) * q);
real H = 2.5;
label((-sh,0), "(1)", align = S);
label((sh,0), "(2)", align = S);
