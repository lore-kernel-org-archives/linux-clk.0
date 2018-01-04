Return-Path: <jernej.skrabec@siol.net>
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Archit Taneja <architt@codeaurora.org>, a.hajda@samsung.com, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Jose.Abreu@synopsys.com, Neil Armstrong <narmstrong@baylibre.com>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [PATCH 01/11] clk: sunxi-ng: Don't set k if width is 0 for nkmp plls
Date: Thu, 04 Jan 2018 20:28:16 +0100
Message-ID: <3625461.aU9oqMdpo3@jernej-laptop>
In-Reply-To: <CAGb2v67B23yUdACijKxosfFG_os5WndiBKX02DGA4PFUkxDx9g@mail.gmail.com>
References: <20171230210203.24115-1-jernej.skrabec@siol.net> <20171230210203.24115-2-jernej.skrabec@siol.net> <CAGb2v67B23yUdACijKxosfFG_os5WndiBKX02DGA4PFUkxDx9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi,

Dne =C4=8Detrtek, 04. januar 2018 ob 15:45:18 CET je Chen-Yu Tsai napisal(a=
):
> On Sun, Dec 31, 2017 at 5:01 AM, Jernej Skrabec <jernej.skrabec@siol.net>=
=20
wrote:
> > For example, A83T have nmp plls which are modelled as nkmp plls. Since k
> > is not specified, it has offset 0, shift 0 and lowest value 1. This
> > means that LSB bit is always set to 1, which may change clock rate.
> >=20
> > Fix that by applying k factor only if k width is greater than 0.
> >=20
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > ---
> >=20
> >  drivers/clk/sunxi-ng/ccu_nkmp.c | 21 +++++++++++++--------
> >  1 file changed, 13 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/drivers/clk/sunxi-ng/ccu_nkmp.c
> > b/drivers/clk/sunxi-ng/ccu_nkmp.c index e58c95787f94..709f528af2b3 1006=
44
> > --- a/drivers/clk/sunxi-ng/ccu_nkmp.c
> > +++ b/drivers/clk/sunxi-ng/ccu_nkmp.c
> > @@ -81,7 +81,7 @@ static unsigned long ccu_nkmp_recalc_rate(struct clk_=
hw
> > *hw,>=20
> >                                         unsigned long parent_rate)
> > =20
> >  {
> > =20
> >         struct ccu_nkmp *nkmp =3D hw_to_ccu_nkmp(hw);
> >=20
> > -       unsigned long n, m, k, p;
> > +       unsigned long n, m, k =3D 1, p;
> >=20
> >         u32 reg;
> >        =20
> >         reg =3D readl(nkmp->common.base + nkmp->common.reg);
> >=20
> > @@ -92,11 +92,13 @@ static unsigned long ccu_nkmp_recalc_rate(struct
> > clk_hw *hw,>=20
> >         if (!n)
> >        =20
> >                 n++;
> >=20
> > -       k =3D reg >> nkmp->k.shift;
> > -       k &=3D (1 << nkmp->k.width) - 1;
> > -       k +=3D nkmp->k.offset;
> > -       if (!k)
> > -               k++;
> > +       if (nkmp->k.width) {
> > +               k =3D reg >> nkmp->k.shift;
> > +               k &=3D (1 << nkmp->k.width) - 1;
> > +               k +=3D nkmp->k.offset;
> > +               if (!k)
> > +                       k++;
> > +       }
>=20
> The conditional shouldn't be necessary. With nkmp->k.width =3D 0,
> you'd simply get k & 0, which is 0, which then gets bumped up to 1,
> unless k.offset > 1, which would be a bug.
>=20
> >         m =3D reg >> nkmp->m.shift;
> >         m &=3D (1 << nkmp->m.width) - 1;
> >=20
> > @@ -153,12 +155,15 @@ static int ccu_nkmp_set_rate(struct clk_hw *hw,
> > unsigned long rate,>=20
> >         reg =3D readl(nkmp->common.base + nkmp->common.reg);
> >         reg &=3D ~GENMASK(nkmp->n.width + nkmp->n.shift - 1, nkmp->n.sh=
ift);
> >=20
> > -       reg &=3D ~GENMASK(nkmp->k.width + nkmp->k.shift - 1, nkmp->k.sh=
ift);
> > +       if (nkmp->k.width)
> > +               reg &=3D ~GENMASK(nkmp->k.width + nkmp->k.shift - 1,
> > +                               nkmp->k.shift);
> >=20
> >         reg &=3D ~GENMASK(nkmp->m.width + nkmp->m.shift - 1, nkmp->m.sh=
ift);
> >         reg &=3D ~GENMASK(nkmp->p.width + nkmp->p.shift - 1, nkmp->p.sh=
ift);
> >        =20
> >         reg |=3D (_nkmp.n - nkmp->n.offset) << nkmp->n.shift;
> >=20
> > -       reg |=3D (_nkmp.k - nkmp->k.offset) << nkmp->k.shift;
> > +       if (nkmp->k.width)
> > +               reg |=3D (_nkmp.k - nkmp->k.offset) << nkmp->k.shift;
>=20
> I think a better way would be
>=20
>         reg |=3D ((_nkmp.k - nkmp->k.offset) << nkmp->k.shift) &
>                GENMASK(nkmp->k.width + nkmp->k.shift - 1, nkmp->k.shift);
>=20
> And do this for all the factors, not just k. This pattern is what
> regmap_update_bits does, which seems much safer. I wonder what
> GENMASK() with a negative value would do though...

You're right, GENMASK(-1, 0) equals 0 (calculated by hand, not tested). Thi=
s=20
seems much more elegant solution.=20

Semi-related question: All nmp PLLs have much wider N range than real nkmp=
=20
PLLs. This causes integer overflow when using nkmp formula from datasheet.=
=20
Usually, N is 1-256 for nmp PLLs, which means that for very high N factors,=
 it=20
overflows. This also causes issue that M factor is never higher than 1.

I was wondering, if patch would be acceptable which would change this formu=
la:

RATE =3D (24MHz * N * K) / (M * P)

to this:

RATE ((24MHz / M) * N * K) / P

I checked all M factors and are all in 1-4 or 1-2 range, which means it=20
wouldn't have any impact for real nkmp PLLs when parent is 24 MHz clock whi=
ch=20
is probably always.

What do you think?

I discovered that when I tried to set A83T PLL_VIDEO to 346.5 MHz which is=
=20
possible only when above formula is changed.

Best regards,
Jernej

>=20
> ChenYu
>=20
> >         reg |=3D (_nkmp.m - nkmp->m.offset) << nkmp->m.shift;
> >         reg |=3D ilog2(_nkmp.p) << nkmp->p.shift;
> >=20
> > --
> > 2.15.1
