include common;
size(.6*textwidth);

int num_diags = 4;
for (int i = 0; i < num_diags; ++i)
{
    for (int j = 0; j <= i; ++j)
    {
        label((j, -(i-j)), "$(" + (string)(i-j+1) + "," + (string)(j+1) + ")$");
    }
}
for (int i = 0; i < num_diags+1; ++i)
{
    // if (i == 0) {
    //     label((0, -num_diags), "$\vdots$");
    //     continue;
    // }
    // if (i == num_diags) {
    //     label((num_diags, 0), "$\hdots$");
    //     continue;
    // }
    // label((i, -num_diags + i), "$\ddots$");
    label((i, -num_diags + i), (i < num_diags/2) ? "$\vdots$" : "$\hdots$");
}

real mar = 0;
real mar2 = .4;
guide through (int pos) {
    bool ud = (pos % 2) == 0;
    return
    (ud ? (-mar, -pos-mar) : (pos+mar, mar))
    --
    (ud ? (pos+mar, mar) : (-mar, -pos-mar));
}

guide connection (int pos) {
    bool ud = (pos % 2) == 0;
    return
    (ud ? (pos+mar, mar) : (-mar, -pos-mar)){ud ? (1,1) : (-1,-1)}
    .. tension .75 ..
    {ud ? (-1,-1) : (1,1)}(ud ? (pos+1+mar, mar) : (-mar, -pos-1-mar));
}

guide full (int maxpos) {
    if (maxpos == 0) return (-mar2, -mar2) -- through(0);
    return full(maxpos-1) & connection(maxpos-1) & through(maxpos);
}

dot((-mar2, -mar2), orange);
draw(
    full(3),
    orange,
    // bar = BeginBar(),
    L = Label("start", position = BeginPoint, align = S)
);
