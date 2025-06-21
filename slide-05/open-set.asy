include common;
config.paths.neighheight = .15;
config.paths.neighwidth = .06;
size(.8*textwidth);
real xmax = 7;
draw((.5,0) -- (xmax, 0));
real[] s = {1, 3.5, 4, 4.3, 4.6, 5.4};
for (int i = 0; i < s.length-1; i += 2)
{
    drawneigh(s[i], s[i+1], heavygreen);
}
label((1,0), "$S$", align = 1.4*(W+N), p = heavygreen);

config.paths.neighheight = .10;
config.paths.neighwidth = .04;

real x1 = 1.5;
usepackage("graphicx");
drawneigh(x1-.3, x1+.3, blue);
dot((x1,0), blue, L = Label(minipage("
$x_1$\\[-1.1mm]
\rotatebox[origin=c]{-90}{$\in$}\\[-.5mm]
$S$
", width = .3cm), align = 2*S));

real x2 = 3.435;
dot((x2,0), blue);
real bxm = .2, bym = .065;
real f = 7;
pair sh = (-.1, -.8);
draw(box((x2-bxm, -bym), (x2+bxm, bym)));
draw(((x2,0) + sh + f * (s[1]-x2, 0)) -- ((x2,0) + sh + f*(bxm,0)));
draw(((x2,0) + sh - f * (bxm,0)) -- ((x2,0) + sh + f * (s[1]-x2, 0)), heavygreen);
draw(box((x2,0)+sh - f*(bxm, bym), (x2,0)+sh + f*(bxm, bym)));
draw(((x2,0)-(bxm,bym)) -- ((x2,0)+sh + f*(-bxm,bym)), dashed);
draw(((x2,0)+(bxm,-bym)) -- ((x2,0)+sh + f*(bxm,bym)), dashed);
dot((x2,0)+sh, blue, L = Label(
"$x_2 \in S$", align = 2.5*S
));
draw(shift((0,sh.y))*neigharc(x2 + sh.x + f * (s[1]-x2), h = .15, w = -.06), heavygreen);
drawneigh(x2+sh.x-.3, x2+sh.x+.3, h = sh.y, blue);

real x3 = s[5];
dot((x3,0), red);
bxm = .1;
f = 7;
sh = (.5, -.8);
draw(box((x3-bxm, -bym), (x3+bxm, bym)));
draw(((x3,0) + sh) -- ((x3,0) + sh + f*(bxm,0)));
draw(((x3,0) + sh - f * (bxm,0)) -- ((x3,0) + sh + f * (s[5]-x3, 0)), heavygreen);
draw(box((x3,0)+sh - f*(bxm, bym), (x3,0)+sh + f*(bxm, bym)));
draw(((x3,0)-(bxm,bym)) -- ((x3,0)+sh + f*(-bxm,bym)), dashed);
draw(((x3,0)+(bxm,-bym)) -- ((x3,0)+sh + f*(bxm,bym)), dashed);
draw(shift((0,sh.y))*neigharc(x3 + sh.x, h = .15, w = -.06), heavygreen);
dot((x3,0)+sh, red, L = Label(
"$x_3 \not\in S$", align = 2.5*S
));
real eps = .4;
drawneigh(x3+sh.x-eps, x3+sh.x+eps, h = sh.y, red);
real h = .03;
for (real x = x3+sh.x; x < x3 + sh.x + eps; x += 0.03) {
    draw((x, sh.y - h) -- (x, sh.y + h), red);
}
