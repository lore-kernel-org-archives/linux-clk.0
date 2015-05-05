Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 5 May 2015 10:25:44 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Lee Jones <lee.jones@linaro.org>,
	Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/5] clk: sunxi: support the cpus (cpu special) clock
 on the Allwinner A80
Message-ID: <20150505082544.GF3274@lukather>
References: <1430410206-4410-1-git-send-email-wens@csie.org>
 <1430410206-4410-3-git-send-email-wens@csie.org>
 <20150504125146.GA3274@lukather>
 <CAGb2v64brwadGPdpdQ9ebOPwZQse2W6m8t8wV6JX=y4Hpw0puQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z0eOaCaDLjvTGF2l"
In-Reply-To: <CAGb2v64brwadGPdpdQ9ebOPwZQse2W6m8t8wV6JX=y4Hpw0puQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--z0eOaCaDLjvTGF2l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 04, 2015 at 11:22:33PM +0800, Chen-Yu Tsai wrote:
> Hi,
>=20
> On Mon, May 4, 2015 at 8:51 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Hi,
> >
> > On Fri, May 01, 2015 at 12:10:03AM +0800, Chen-Yu Tsai wrote:
> >> The "cpus" clock is the clock for the embedded processor in the A80.
> >> It is also part of the PRCM clock tree.
> >>
> >> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> >> ---
> >>  Documentation/devicetree/bindings/clock/sunxi.txt |   1 +
> >>  drivers/clk/sunxi/Makefile                        |   2 +-
> >>  drivers/clk/sunxi/clk-sun9i-cpus.c                | 243 +++++++++++++=
+++++++++
> >>  3 files changed, 245 insertions(+), 1 deletion(-)
> >>  create mode 100644 drivers/clk/sunxi/clk-sun9i-cpus.c
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Docum=
entation/devicetree/bindings/clock/sunxi.txt
> >> index 2015b2beb957..c52735b0b924 100644
> >> --- a/Documentation/devicetree/bindings/clock/sunxi.txt
> >> +++ b/Documentation/devicetree/bindings/clock/sunxi.txt
> >> @@ -27,6 +27,7 @@ Required properties:
> >>       "allwinner,sun5i-a10s-ahb-gates-clk" - for the AHB gates on A10s
> >>       "allwinner,sun7i-a20-ahb-gates-clk" - for the AHB gates on A20
> >>       "allwinner,sun6i-a31-ar100-clk" - for the AR100 on A31
> >> +     "allwinner,sun9i-a80-cpus-clk" - for the CPUS on A80
> >>       "allwinner,sun6i-a31-ahb1-clk" - for the AHB1 clock on A31
> >>       "allwinner,sun6i-a31-ahb1-gates-clk" - for the AHB1 gates on A31
> >>       "allwinner,sun8i-a23-ahb1-gates-clk" - for the AHB1 gates on A23
> >> diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
> >> index 058f273d6154..f0f33131b048 100644
> >> --- a/drivers/clk/sunxi/Makefile
> >> +++ b/drivers/clk/sunxi/Makefile
> >> @@ -13,4 +13,4 @@ obj-y +=3D clk-usb.o
> >>
> >>  obj-$(CONFIG_MFD_SUN6I_PRCM) +=3D \
> >>       clk-sun6i-ar100.o clk-sun6i-apb0.o clk-sun6i-apb0-gates.o \
> >> -     clk-sun8i-apb0.o
> >> +     clk-sun8i-apb0.o clk-sun9i-cpus.o
> >
> > I'm really not sure about that option selection.
> >
> > If you only select the A31, you will get drivers that won't be
> > relevant at all here.
> >
> > How about something like
> >
> > ifeq ($(CONFIG_MFD_SUN6I_PRCM), y)
> > obj-$(CONFIG_MACH_SUN6I) =3D ....
> > obj-$(CONFIG_MACH_SUN8I) =3D ....
> > obj-$(CONFIG_MACH_SUN9I) =3D ....
> > endif
> >
> > ?
>=20
> I suppose that works, though sun9i shares apb0 (apbs) clock with
> sun8i.

I'd expect that if you set the files to build multiple time,
everything would just work, so that we could have apbs built both in
the list for sun8i and sun9i.

> >> diff --git a/drivers/clk/sunxi/clk-sun9i-cpus.c b/drivers/clk/sunxi/cl=
k-sun9i-cpus.c
> >> new file mode 100644
> >> index 000000000000..1ec61ccf8cbf
> >> --- /dev/null
> >> +++ b/drivers/clk/sunxi/clk-sun9i-cpus.c
> >> @@ -0,0 +1,243 @@
> >> +/*
> >> + * Copyright (C) 2015 Chen-Yu Tsai
> >> + *
> >> + * Chen-Yu Tsai <wens@csie.org>
> >> + *
> >> + * Allwinner A80 CPUS clock driver
> >> + *
> >> + */
> >> +
> >> +#include <linux/clk-provider.h>
> >> +#include <linux/module.h>
> >> +#include <linux/of.h>
> >> +#include <linux/platform_device.h>
> >> +
> >> +static DEFINE_SPINLOCK(sun9i_a80_cpus_lock);
> >> +
> >> +/**
> >> + * sun9i_a80_cpus_clk_setup() - Setup function for a80 cpus composite=
 clk
> >> + */
> >> +
> >> +#define SUN9I_CPUS_MAX_PARENTS               4
> >> +#define SUN9I_CPUS_MUX_PARENT_PLL4   3
> >> +#define SUN9I_CPUS_MUX_SHIFT         16
> >> +/* un-shifted mask is what mux_clk expects */
> >> +#define SUN9I_CPUS_MUX_MASK          0x3
> >> +#define SUN9I_CPUS_MUX_GET_PARENT(reg)       ((reg >> SUN9I_CPUS_MUX_=
SHIFT) & \
> >> +                                      SUN9I_CPUS_MUX_MASK)
> >> +
> >> +#define SUN9I_CPUS_DIV_SHIFT         4
> >> +#define SUN9I_CPUS_DIV_MASK          (0x3 << SUN9I_CPUS_DIV_SHIFT)
> >> +#define SUN9I_CPUS_DIV_GET(reg)              ((reg & SUN9I_CPUS_DIV_M=
ASK) >> \
> >> +                                             SUN9I_CPUS_DIV_SHIFT)
> >> +#define SUN9I_CPUS_DIV_SET(reg, div) ((reg & ~SUN9I_CPUS_DIV_MASK) | \
> >> +                                             (div << SUN9I_CPUS_DIV_S=
HIFT))
> >> +#define SUN9I_CPUS_PLL4_DIV_SHIFT    8
> >> +#define SUN9I_CPUS_PLL4_DIV_MASK     (0x1f << SUN9I_CPUS_PLL4_DIV_SHI=
FT)
> >
> > You have some masks that are shifted, some that are not.
> >
> > I don't really have a preference, but being consistent would be great.
> >
> > (and you can use GENMASK to generate your masks).
>=20
> Yeah. I think we've been through this once with the sun6i-ahb1 clock.
> Though, see below.

Maybe we did :)

> >> +     struct sun9i_a80_cpus_clk *cpus =3D to_sun9i_a80_cpus_clk(hw);
> >> +     unsigned long rate;
> >> +     u32 reg;
> >> +
> >> +     /* Fetch the register value */
> >> +     reg =3D readl(cpus->reg);
> >> +
> >> +     /* apply pre-divider first if parent is pll4 */
> >> +     if (SUN9I_CPUS_MUX_GET_PARENT(reg) =3D=3D SUN9I_CPUS_MUX_PARENT_=
PLL4)
> >> +             parent_rate /=3D SUN9I_CPUS_PLL4_DIV_GET(reg) + 1;
> >> +
> >> +     /* clk divider */
> >> +     rate =3D parent_rate / (SUN9I_CPUS_DIV_GET(reg) + 1);
> >> +
> >> +     return rate;
> >> +}
> >> +
> >> +static long sun9i_a80_cpus_clk_round(unsigned long rate, u8 *divp, u8=
 *pre_divp,
> >> +                              u8 parent, unsigned long parent_rate)
> >> +{
> >> +     u8 div, pre_div =3D 1;
> >> +
> >> +     /*
> >> +      * clock can only divide, so we will never be able to achieve
> >> +      * frequencies higher than the parent frequency
> >> +      */
> >> +     if (parent_rate && rate > parent_rate)
> >> +             rate =3D parent_rate;
> >> +
> >> +     div =3D DIV_ROUND_UP(parent_rate, rate);
> >> +
> >> +     /* calculate pre-divider if parent is pll4 */
> >> +     if (parent =3D=3D SUN9I_CPUS_MUX_PARENT_PLL4 && div > 4) {
> >> +             /* pre-divider is 1 ~ 32 */
> >> +             if (div < 32) {
> >> +                     pre_div =3D div;
> >> +                     div =3D 1;
> >> +             } else if (div < 64) {
> >> +                     pre_div =3D DIV_ROUND_UP(div, 2);
> >> +                     div =3D 2;
> >> +             } else if (div < 96) {
> >> +                     pre_div =3D DIV_ROUND_UP(div, 3);
> >> +                     div =3D 3;
> >> +             } else {
> >> +                     pre_div =3D DIV_ROUND_UP(div, 4);
> >> +                     div =3D 4;
> >> +             }
> >> +     }
> >> +
> >> +     /* we were asked to pass back divider values */
> >> +     if (divp) {
> >> +             *divp =3D div - 1;
> >> +             *pre_divp =3D pre_div - 1;
> >> +     }
> >> +
> >> +     return parent_rate / pre_div / div;
> >> +}
> >> +
> >> +static long sun9i_a80_cpus_clk_determine_rate(struct clk_hw *hw,
> >> +                                           unsigned long rate,
> >> +                                           unsigned long min_rate,
> >> +                                           unsigned long max_rate,
> >> +                                           unsigned long *best_parent=
_rate,
> >> +                                           struct clk_hw **best_paren=
t_clk)
> >> +{
> >> +     struct clk *clk =3D hw->clk, *parent, *best_parent =3D NULL;
> >> +     int i, num_parents;
> >> +     unsigned long parent_rate, best =3D 0, child_rate, best_child_ra=
te =3D 0;
> >> +
> >> +     /* find the parent that can help provide the fastest rate <=3D r=
ate */
> >> +     num_parents =3D __clk_get_num_parents(clk);
> >> +     for (i =3D 0; i < num_parents; i++) {
> >> +             parent =3D clk_get_parent_by_index(clk, i);
> >> +             if (!parent)
> >> +                     continue;
> >> +             if (__clk_get_flags(clk) & CLK_SET_RATE_PARENT)
> >> +                     parent_rate =3D __clk_round_rate(parent, rate);
> >> +             else
> >> +                     parent_rate =3D __clk_get_rate(parent);
> >> +
> >> +             child_rate =3D sun9i_a80_cpus_clk_round(rate, NULL, NULL=
, i,
> >> +                                               parent_rate);
> >> +
> >> +             if (child_rate <=3D rate && child_rate > best_child_rate=
) {
> >> +                     best_parent =3D parent;
> >> +                     best =3D parent_rate;
> >> +                     best_child_rate =3D child_rate;
> >> +             }
> >> +     }
> >> +
> >> +     if (best_parent)
> >> +             *best_parent_clk =3D __clk_get_hw(best_parent);
> >> +     *best_parent_rate =3D best;
> >> +
> >> +     return best_child_rate;
> >> +}
> >> +
> >> +static int sun9i_a80_cpus_clk_set_rate(struct clk_hw *hw, unsigned lo=
ng rate,
> >> +                                unsigned long parent_rate)
> >> +{
> >> +     struct sun9i_a80_cpus_clk *cpus =3D to_sun9i_a80_cpus_clk(hw);
> >> +     unsigned long flags;
> >> +     u8 div, pre_div, parent;
> >> +     u32 reg;
> >> +
> >> +     spin_lock_irqsave(&sun9i_a80_cpus_lock, flags);
> >> +
> >> +     reg =3D readl(cpus->reg);
> >> +
> >> +     /* need to know which parent is used to apply pre-divider */
> >> +     parent =3D SUN9I_CPUS_MUX_GET_PARENT(reg);
> >> +     sun9i_a80_cpus_clk_round(rate, &div, &pre_div, parent, parent_ra=
te);
> >> +
> >> +     reg =3D SUN9I_CPUS_DIV_SET(reg, div);
> >> +     reg =3D SUN9I_CPUS_PLL4_DIV_SET(reg, pre_div);
> >> +     writel(reg, cpus->reg);
> >> +
> >> +     spin_unlock_irqrestore(&sun9i_a80_cpus_lock, flags);
> >> +
> >> +     return 0;
> >> +}
> >> +
> >> +static const struct clk_ops sun9i_a80_cpus_clk_ops =3D {
> >> +     .determine_rate =3D sun9i_a80_cpus_clk_determine_rate,
> >> +     .recalc_rate    =3D sun9i_a80_cpus_clk_recalc_rate,
> >> +     .set_rate       =3D sun9i_a80_cpus_clk_set_rate,
> >> +};
> >
> > It all looks like you could use the factors clock for this.
> >
> > The only thing that you seem to be using a custom clock for is the pre
> > divider on one of the parent, but that's something that could be
> > reused for other clocks (like the A10 pll6, or the A20 MBUS).
>=20
> We can add a custom recalc_rate() callback for factors clock,
> and also pass the parent index to the get_factors() callback.
> That would get rid of a lot of boilerplate.
>=20
> What do you think?

I was more thinking about adding an additional callback that would
take the parent index as an argument, and would return for that parent
the multiplier or divider to apply.

That would be quite easy to support, and would support both fixed
divider like the one found on the A20 MBUS, or the A20 AHB clock, and
dynamic factors like this one, while have most code in the core.

> It kind of extends factors clk beyond what it was designed for. If
> you agree, I'd also want to (ab)use it for other A80 clocks which
> have multiple dividers but don't fit the current factors clock
> formula.

I think we're far beyond the point where factors clock are actually to
handle clocks with factors ;)

We've stretched that notion to handle multiple cases, up to the point
where it's basically an additional layer on top of the clock framework
itself.

I'd be quite okay to extend it, but so far the assumption has always
been that the formula was based on

parent * n >> p / (k * m)

If that formula was to change, I'm pretty sure that this would require
a lot of changes, both in the factors code itself, plus to all the
users.

I'm not against it, but if it's just for a few clocks, I don't think
it's worth it. Maybe we can just have a similar layer for that other
formula.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--z0eOaCaDLjvTGF2l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVSH6IAAoJEBx+YmzsjxAghpwQAMGxBRZAkxFuiINcSFRewOmL
LkPXyhN4mYOf09AAzHMcGITj+DKIfNRCr+pjna4Udxr5W9JwwbC8064HGpZaVfgZ
gA8wjnhvDeq6TWHtG1EuOp7XK163Bxhi+fV0xCEmZHNLyYnO2nZ0XG7YTFkG3wPs
yzaOFKL/YWeQbisCgw5zJTctn7NUtKecQs2fDYk2f+lIFVk3VyS/QSSldqj7m+OB
kPNNjILO418d4pN5iTvtcPak6B9BVavGGhCpmJgga7NZKJ8tZ0BrXNJrEcxuYU9g
5l6Ks+sPOHtIZ0QyJIWZL3/bdnQZ1xIqe84z+lg1cCTjjBCI9EkAH8+tZTl9aClq
yJ9Jb0PaUuOUc2tPhlyQx+KtBDNFWybs268zFqJY8Aw4QirLdHJeKsDKaQfIlk2R
MdWPKdcxMktlyoTkj/cDR/WmCkG4jyRdM+2qQU7FqVB+xPXa/ouS0lS15e2KPklS
0WtkPsP2MLBHD4n01JgU21IdCKvq8ImmjcmhgkI5lnV4xBL52cvY4M0LIpXySvHD
DVjZ4DNjh+jLGZ1yxJBFqfpGhLxKf12zLIxbbmSsSiWsWBS+tIWd2YPntp7wpnHF
IKLLRwndopzW+CwjUDIBLp0fPn7g6VBl/P0iA7vP/nDoCvgPc9c/50a3ZsQppwBy
hxce7geIxbvvmCfC2qMf
=6Etq
-----END PGP SIGNATURE-----

--z0eOaCaDLjvTGF2l--
