Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, huangtao@rock-chips.com, jay.xu@rock-chips.com, elaine.zhang@rock-chips.com, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 3/5] clk: rockchip: add new pll-type for rk3399 and similar socs
Date: Wed, 09 Mar 2016 02:22:50 +0100
Message-ID: <3286748.Col0jAfKKX@phil>
In-Reply-To: <1456827275-8035-4-git-send-email-zhengxing@rock-chips.com>
References: <1456827275-8035-1-git-send-email-zhengxing@rock-chips.com> <1456827275-8035-4-git-send-email-zhengxing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Am Dienstag, 1. M=E4rz 2016, 18:14:33 schrieb Xing Zheng:
> The rk3399's pll and clock are similar with rk3036's, it different
> with base on the rk3066(rk3188, rk3288, rk3368 use it), there are
> different adjust foctors and control registers, so these should be
> independent and separate from the series of rk3066s.
>=20
> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>

[...]

> +static int rockchip_rk3399_pll_set_params(struct rockchip_clk_pll *p=
ll,
> +=09=09=09=09const struct rockchip_pll_rate_table *rate)
> +{
> +=09const struct clk_ops *pll_mux_ops =3D pll->pll_mux_ops;
> +=09struct clk_mux *pll_mux =3D &pll->pll_mux;
> +=09struct rockchip_pll_rate_table cur;
> +=09u32 pllcon;
> +=09int rate_change_remuxed =3D 0;
> +=09int cur_parent;
> +=09int ret;
> +
> +=09pr_debug("%s: rate settings for %lu fbdiv: %d, postdiv1: %d, refd=
iv: %d,
> postdiv2: %d, dsmpd: %d, frac: %d\n", +=09=09__func__, rate->rate,
> rate->fbdiv, rate->postdiv1, rate->refdiv, +=09=09rate->postdiv2,
> rate->dsmpd, rate->frac);
> +
> +=09rockchip_rk3399_pll_get_params(pll, &cur);
> +=09cur.rate =3D 0;
> +
> +=09cur_parent =3D pll_mux_ops->get_parent(&pll_mux->hw);
> +=09if (cur_parent =3D=3D PLL_MODE_NORM) {
> +=09=09pll_mux_ops->set_parent(&pll_mux->hw, PLL_MODE_SLOW);
> +=09=09rate_change_remuxed =3D 1;
> +=09}
> +
> +=09/* update pll values */
> +=09writel_relaxed(HIWORD_UPDATE(rate->fbdiv, RK3399_PLLCON0_FBDIV_MA=
SK,
> +=09=09=09=09=09  RK3399_PLLCON0_FBDIV_SHIFT),

indentation is strange ... I guess the plan was to move=20
RK3399_PLLCON0_FBDIV_SHIFT under RK3399_PLLCON0_FBDIV_MASK, currently i=
t's=20
having tabs + spaces but has no alignment whatsoever

> +=09=09       pll->reg_base + RK3399_PLLCON(0));
> +
> +=09writel_relaxed(HIWORD_UPDATE(rate->refdiv, RK3399_PLLCON1_REFDIV_=
MASK,
> +=09=09=09=09=09=09   RK3399_PLLCON1_REFDIV_SHIFT) |
> +=09=09       HIWORD_UPDATE(rate->postdiv1, RK3399_PLLCON1_POSTDIV1_M=
ASK,
> +=09=09=09=09=09     RK3399_PLLCON1_POSTDIV1_SHIFT) |

same for postdiv1

> +=09=09       HIWORD_UPDATE(rate->postdiv2, RK3399_PLLCON1_POSTDIV2_M=
ASK,
> +=09=09=09=09=09=09     RK3399_PLLCON1_POSTDIV2_SHIFT),
> +=09=09       pll->reg_base + RK3399_PLLCON(1));


rest looks nice


Heiko
