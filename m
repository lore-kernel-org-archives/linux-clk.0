Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, huangtao@rock-chips.com, jay.xu@rock-chips.com, elaine.zhang@rock-chips.com, dianders@chromium.org
Subject: Re: [PATCH v3 5/7] clk: rockchip: add new pll-type for rk3399 and similar socs
Date: Wed, 09 Mar 2016 13:29:09 +0100
Message-ID: <2688473.EyteJL2oqe@diego>
In-Reply-To: <1457491378-31077-1-git-send-email-zhengxing@rock-chips.com>
References: <1457491027-30936-1-git-send-email-zhengxing@rock-chips.com> <1457491378-31077-1-git-send-email-zhengxing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Hi Xing,

Am Mittwoch, 9. M=E4rz 2016, 10:42:58 schrieb Xing Zheng:
> The rk3399's pll and clock are similar with rk3036's, it different
> with base on the rk3066(rk3188, rk3288, rk3368 use it), there are
> different adjust foctors and control registers, so these should be
> independent and separate from the series of rk3066s.
>=20
> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
> ---
>=20
> Changes in v3: None
> Changes in v2: None
>=20
>  drivers/clk/rockchip/clk-pll.c |  279
> +++++++++++++++++++++++++++++++++++++++- drivers/clk/rockchip/clk.h  =
   | =20
>  3 +-
>  2 files changed, 280 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/cl=
k-pll.c
> index 27be66a..62d2f0e 100644
> --- a/drivers/clk/rockchip/clk-pll.c
> +++ b/drivers/clk/rockchip/clk-pll.c
> @@ -593,6 +593,275 @@ static const struct clk_ops
> rockchip_rk3066_pll_clk_ops =3D { .init =3D rockchip_rk3066_pll_init,=

>  };
>=20
> +/**
> + * PLL used in RK3399
> + */
> +
> +#define RK3399_PLLCON(i)=09=09=09(i * 0x4)
> +#define RK3399_PLLCON0_FBDIV_MASK=09=090xfff
> +#define RK3399_PLLCON0_FBDIV_SHIFT=09=090
> +#define RK3399_PLLCON1_REFDIV_MASK=09=090x3f
> +#define RK3399_PLLCON1_REFDIV_SHIFT=09=090
> +#define RK3399_PLLCON1_POSTDIV1_MASK=09=090x7
> +#define RK3399_PLLCON1_POSTDIV1_SHIFT=09=098
> +#define RK3399_PLLCON1_POSTDIV2_MASK=09=090x7
> +#define RK3399_PLLCON1_POSTDIV2_SHIFT=09=0912
> +#define RK3399_PLLCON2_FRAC_MASK=09=090xffffff
> +#define RK3399_PLLCON2_FRAC_SHIFT=09=090
please move RK3399_PLLCON2_LOCK_STATUS here

> +#define RK3399_PLLCON3_DSMPD_MASK=09=090x1
> +#define RK3399_PLLCON3_DSMPD_SHIFT=09=0912

DSMPD_SHIFT should be 3, right?

> +
> +#define RK3399_PLLCON2_LOCK_STATUS=09=09(31 << 0)

that is wrong, you want (1 << 31), or even better BIT(31) here


> +#define RK3399_PLLCON3_PWRDOWN=09=09=09(1 << 0)

dito, BIT(0) please

[...]

> +static int rockchip_rk3399_pll_set_rate(struct clk_hw *hw, unsigned =
long
> drate, +=09=09=09=09=09unsigned long prate)
> +{
> +=09struct rockchip_clk_pll *pll =3D to_rockchip_clk_pll(hw);
> +=09const struct rockchip_pll_rate_table *rate;
> +=09unsigned long old_rate =3D rockchip_rk3399_pll_recalc_rate(hw, pr=
ate);
> +=09struct regmap *grf =3D rockchip_clk_get_grf(pll->ctx);
> +
> +=09if (IS_ERR(grf)) {
> +=09=09pr_debug("%s: grf regmap not available, aborting rate change\n=
",
> +=09=09=09 __func__);
> +=09=09return PTR_ERR(grf);
> +=09}

the pll lock-status moved to the pll registers it seems, so you don't n=
eed to=20
get the GRF here at all, as we don't need it for the lock status.


Heiko
