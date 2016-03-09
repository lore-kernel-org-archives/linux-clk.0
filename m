Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, huangtao@rock-chips.com, jay.xu@rock-chips.com, elaine.zhang@rock-chips.com, dianders@chromium.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/7] clk: rockchip: Add support for multiple clock providers
Date: Wed, 09 Mar 2016 23:25:42 +0100
Message-ID: <1978482.7WNnERYOPX@diego>
In-Reply-To: <1457491027-30936-5-git-send-email-zhengxing@rock-chips.com>
References: <1457491027-30936-1-git-send-email-zhengxing@rock-chips.com> <1457491027-30936-5-git-send-email-zhengxing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Hi Xing,

Am Mittwoch, 9. M=E4rz 2016, 10:37:04 schrieb Xing Zheng:
> There are need to support Multi-CRUs probability in future, but
> it is not supported on the current Rockchip Clock Framework.
>=20
> Therefore, this patch add support a provider as the parameter
> handler when we call the clock register functions for per CRU.
>=20
> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>

I've applied that in a clk branch for 4.7 [0] with some changes detaile=
d
below. If you can, please check that I didn't mess anything up :-)

I've sucessfully booted that on both a rk3036 and rk3288 as well.


Heiko

[0] https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip.g=
it/commit/?h=3Dv4.7-clk/next&id=3Dd509ddf2e57c99ae760d1a289b85f1e0d729f=
864


> ---
>=20
> Changes in v3: None
> Changes in v2: None
>=20
>  drivers/clk/rockchip/clk-pll.c    |   30 ++++----
>  drivers/clk/rockchip/clk-rk3036.c |   17 +++--
>  drivers/clk/rockchip/clk-rk3188.c |   48 ++++++++----
>  drivers/clk/rockchip/clk-rk3228.c |   17 +++--
>  drivers/clk/rockchip/clk-rk3288.c |   19 +++--
>  drivers/clk/rockchip/clk-rk3368.c |   21 ++++--
>  drivers/clk/rockchip/clk.c        |  148
> +++++++++++++++++++++++-------------- drivers/clk/rockchip/clk.h     =
   | =20
> 49 ++++++++----
>  8 files changed, 231 insertions(+), 118 deletions(-)

[...]

> diff --git a/drivers/clk/rockchip/clk-rk3188.c
> b/drivers/clk/rockchip/clk-rk3188.c index e832403..7c73c51 100644
> --- a/drivers/clk/rockchip/clk-rk3188.c
> @@ -759,57 +759,78 @@ static const char *const rk3188_critical_clocks=
[]
> __initconst =3D { "hclk_cpubus"
>  };
>=20
> -static void __init rk3188_common_clk_init(struct device_node *np)
> +static struct rockchip_clk_provider *__init rk3188_common_clk_init(s=
truct
> device_node *np) {
> +=09struct rockchip_clk_provider *ctx;
>  =09void __iomem *reg_base;
>=20
>  =09reg_base =3D of_iomap(np, 0);
>  =09if (!reg_base) {
>  =09=09pr_err("%s: could not map cru region\n", __func__);
> -=09=09return;
> +=09=09return ERR_PTR(-ENOMEM);
>  =09}
>=20
> -=09rockchip_clk_init(np, reg_base, CLK_NR_CLKS);
> +=09ctx =3D rockchip_clk_init(np, reg_base, CLK_NR_CLKS);
> +=09if (IS_ERR(ctx)) {
> +=09=09pr_err("%s: rockchip clk init failed\n", __func__);
> +=09=09return ERR_PTR(-ENOMEM);
> +=09}
>=20
> -=09rockchip_clk_register_branches(common_clk_branches,
> +=09rockchip_clk_register_branches(ctx, common_clk_branches,
>  =09=09=09=09  ARRAY_SIZE(common_clk_branches));
>=20
>  =09rockchip_register_softrst(np, 9, reg_base + RK2928_SOFTRST_CON(0)=
,
>  =09=09=09=09  ROCKCHIP_SOFTRST_HIWORD_MASK);
>=20
> -=09rockchip_register_restart_notifier(RK2928_GLB_SRST_FST, NULL);
> +=09rockchip_register_restart_notifier(ctx, RK2928_GLB_SRST_FST, NULL=
);
> +
> +=09return ctx;
>  }
>=20
>  static void __init rk3066a_clk_init(struct device_node *np)
>  {
> -=09rk3188_common_clk_init(np);
> -=09rockchip_clk_register_plls(rk3066_pll_clks,
> +=09struct rockchip_clk_provider *ctx;
> +
> +=09ctx =3D rk3188_common_clk_init(np);
> +=09if (IS_ERR(ctx)) {
> +=09=09pr_err("%s: common clk init failed\n", __func__);
> +=09=09return;
> +=09}

I've dropped the pr_err + parentheses, as rk3188_common_clk_init
will already output a suitable error.


> +
> +=09rockchip_clk_register_plls(ctx, rk3066_pll_clks,
>  =09=09=09=09   ARRAY_SIZE(rk3066_pll_clks),
>  =09=09=09=09   RK3066_GRF_SOC_STATUS);
> -=09rockchip_clk_register_branches(rk3066a_clk_branches,
> +=09rockchip_clk_register_branches(ctx, rk3066a_clk_branches,
>  =09=09=09=09  ARRAY_SIZE(rk3066a_clk_branches));
> -=09rockchip_clk_register_armclk(ARMCLK, "armclk",
> +=09rockchip_clk_register_armclk(ctx, ARMCLK, "armclk",
>  =09=09=09mux_armclk_p, ARRAY_SIZE(mux_armclk_p),
>  =09=09=09&rk3066_cpuclk_data, rk3066_cpuclk_rates,
>  =09=09=09ARRAY_SIZE(rk3066_cpuclk_rates));
>  =09rockchip_clk_protect_critical(rk3188_critical_clocks,
>  =09=09=09=09      ARRAY_SIZE(rk3188_critical_clocks));
> +=09rockchip_clk_of_add_provider(np, ctx);
>  }
>  CLK_OF_DECLARE(rk3066a_cru, "rockchip,rk3066a-cru", rk3066a_clk_init=
);
>=20
>  static void __init rk3188a_clk_init(struct device_node *np)
>  {
> +=09struct rockchip_clk_provider *ctx;
>  =09struct clk *clk1, *clk2;
>  =09unsigned long rate;
>  =09int ret;
>=20
> -=09rk3188_common_clk_init(np);
> -=09rockchip_clk_register_plls(rk3188_pll_clks,
> +=09ctx =3D rk3188_common_clk_init(np);
> +=09if (IS_ERR(ctx)) {
> +=09=09pr_err("%s: common clk init failed\n", __func__);
> +=09=09return;
> +=09}

same as above


> +
> +=09rockchip_clk_register_plls(ctx, rk3188_pll_clks,
>  =09=09=09=09   ARRAY_SIZE(rk3188_pll_clks),
>  =09=09=09=09   RK3188_GRF_SOC_STATUS);
> -=09rockchip_clk_register_branches(rk3188_clk_branches,
> +=09rockchip_clk_register_branches(ctx, rk3188_clk_branches,
>  =09=09=09=09  ARRAY_SIZE(rk3188_clk_branches));
> -=09rockchip_clk_register_armclk(ARMCLK, "armclk",
> +=09rockchip_clk_register_armclk(ctx, ARMCLK, "armclk",
>  =09=09=09=09  mux_armclk_p, ARRAY_SIZE(mux_armclk_p),
>  =09=09=09=09  &rk3188_cpuclk_data, rk3188_cpuclk_rates,
>  =09=09=09=09  ARRAY_SIZE(rk3188_cpuclk_rates));
> @@ -833,6 +854,7 @@ static void __init rk3188a_clk_init(struct device=
_node
> *np)
>=20
>  =09rockchip_clk_protect_critical(rk3188_critical_clocks,
>  =09=09=09=09      ARRAY_SIZE(rk3188_critical_clocks));
> +=09rockchip_clk_of_add_provider(np, ctx);
>  }
>  CLK_OF_DECLARE(rk3188a_cru, "rockchip,rk3188a-cru", rk3188a_clk_init=
);

[...]

> diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
> index ab50524..54e6b74 100644
> --- a/drivers/clk/rockchip/clk.c
> +++ b/drivers/clk/rockchip/clk.c
> @@ -312,66 +316,94 @@ static struct clk
> *rockchip_clk_register_factor_branch(const char *name, return clk;
>  }
>=20
> -static DEFINE_SPINLOCK(clk_lock);
> -static struct clk **clk_table;
> -static void __iomem *reg_base;
> -static struct clk_onecell_data clk_data;
> -static struct device_node *cru_node;
> -static struct regmap *grf;
> -
> -void __init rockchip_clk_init(struct device_node *np, void __iomem *=
base,
> -=09=09=09      unsigned long nr_clks)
> +struct rockchip_clk_provider *__init rockchip_clk_init(struct device=
_node

I've added a space between the asterisk and __init flag


> *np, +=09=09=09void __iomem *base, unsigned long nr_clks)
>  {
> -=09reg_base =3D base;
> -=09cru_node =3D np;
> -=09grf =3D ERR_PTR(-EPROBE_DEFER);
> +=09struct rockchip_clk_provider *ctx;
> +=09struct clk **clk_table;
> +=09int i;
> +
> +=09ctx =3D kzalloc(sizeof(struct rockchip_clk_provider), GFP_KERNEL)=
;
> +=09if (!ctx) {
> +=09=09pr_err("%s: Could not allocate clock provider context\n",
> +=09=09=09__func__);
> +=09=09return ERR_PTR(-ENOMEM);
> +=09}
>=20
>  =09clk_table =3D kcalloc(nr_clks, sizeof(struct clk *), GFP_KERNEL);=

> -=09if (!clk_table)
> -=09=09pr_err("%s: could not allocate clock lookup table\n", __func__=
);
> +=09if (!clk_table) {
> +=09=09pr_err("%s: Could not allocate clock lookup table\n",
> +=09=09=09__func__);
> +=09=09goto err_free;
> +=09}
> +
> +=09for (i =3D 0; i < nr_clks; ++i)
> +=09=09clk_table[i] =3D ERR_PTR(-ENOENT);
>=20
> -=09clk_data.clks =3D clk_table;
> -=09clk_data.clk_num =3D nr_clks;
> -=09of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
> +=09ctx->reg_base =3D base;
> +=09ctx->clk_data.clks =3D clk_table;
> +=09ctx->clk_data.clk_num =3D nr_clks;
> +=09ctx->cru_node =3D np;
> +=09ctx->grf =3D ERR_PTR(-EPROBE_DEFER);
> +=09spin_lock_init(&ctx->lock);
> +
> +=09return ctx;
> +
> +err_free:
> +=09kfree(ctx);
> +=09return ERR_PTR(-ENOMEM);
> +}
> +
> +void __init rockchip_clk_of_add_provider(struct device_node *np,
> +=09=09=09=09struct rockchip_clk_provider *ctx)
> +{
> +=09if (np) {
> +=09=09if (of_clk_add_provider(np, of_clk_src_onecell_get,
> +=09=09=09=09=09&ctx->clk_data))
> +=09=09=09panic("could not register clk provider\n");

I've changed that to a pr_err, again no need to panic on this, as letti=
ng
the kernel run may give the affected developer more hints what may be w=
rong.


> +=09}
>  }
>=20

> diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
> index 7aafe18..b7affb6 100644
> --- a/drivers/clk/rockchip/clk.h
> +++ b/drivers/clk/rockchip/clk.h
> @@ -127,6 +128,20 @@ enum rockchip_pll_type {
>  =09.nb =3D _nb,=09=09=09=09=09=09\
>  }
>=20
> +/**
> + * struct rockchip_clk_provider: information about clock provider
> + * @reg_base: virtual address for the register base.
> + * @clk_data: holds clock related data like clk* and number of clock=
s.
> + * @lock: maintains exclusion between callbacks for a given clock-pr=
ovider.

I've added the missing kerneldoc entries here


> + */
> +struct rockchip_clk_provider {
> +=09void __iomem *reg_base;
> +=09struct clk_onecell_data clk_data;
> +=09struct device_node *cru_node;
> +=09struct regmap *grf;
> +=09spinlock_t lock;
> +};
> +
>  struct rockchip_pll_rate_table {
>  =09unsigned long rate;
>  =09unsigned int nr;
