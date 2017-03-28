Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: xf@rock-chips.com, mturquette@baylibre.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org, huangtao@rock-chips.com, xxx@rock-chips.com, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/4] clk: rockchip: rk3228: make noc and some special clk as critical_clocks
Date: Tue, 28 Mar 2017 22:08:13 +0200
Message-ID: <3534897.Tc49fhGY27@phil>
In-Reply-To: <1490695614-3220-3-git-send-email-zhangqing@rock-chips.com>
References: <1490695614-3220-1-git-send-email-zhangqing@rock-chips.com> <1490695614-3220-3-git-send-email-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Hi Elaine,

Am Dienstag, 28. M=E4rz 2017, 18:06:52 CEST schrieb Elaine Zhang:
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>

I really do expect a commit message explaining why the specific clocks
are needed to be critical.

The noc and arbiter clocks I somewhat understand, but I'll need
explanation on clocks like hclk_otg_pmu,  hclk_otg_pmu _etc_ [all these
non-noc / non-arbi clocks] on why there is no driver to handle them.

Also please group noc / arbi clocks together.


This applies to all patches in this series.

Thanks
Heiko


> ---
>  drivers/clk/rockchip/clk-rk3228.c | 30 +++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/rockchip/clk-rk3228.c b/drivers/clk/rockchip/clk=
=2Drk3228.c
> index db6e5a9e6de6..4d3203f887e2 100644
> --- a/drivers/clk/rockchip/clk-rk3228.c
> +++ b/drivers/clk/rockchip/clk-rk3228.c
> @@ -445,7 +445,7 @@ enum rk3228_plls {
>  			RK2928_CLKGATE_CON(2), 12, GFLAGS,
>  			&rk3228_spdif_fracmux),
> =20
> -	GATE(0, "jtag", "ext_jtag", 0,
> +	GATE(0, "jtag", "ext_jtag", CLK_IGNORE_UNUSED,
>  			RK2928_CLKGATE_CON(1), 3, GFLAGS),
> =20
>  	GATE(0, "sclk_otgphy0", "xin24m", 0,
> @@ -644,9 +644,37 @@ enum rk3228_plls {
> =20
>  static const char *const rk3228_critical_clocks[] __initconst =3D {
>  	"aclk_cpu",
> +	"pclk_cpu",
> +	"hclk_cpu",
>  	"aclk_peri",
>  	"hclk_peri",
>  	"pclk_peri",
> +	"aclk_rga_noc",
> +	"aclk_iep_noc",
> +	"aclk_vop_noc",
> +	"aclk_hdcp_noc",
> +	"hclk_vio_ahb_arbi",
> +	"hclk_vio_noc",
> +	"hclk_vop_noc",
> +	"hclk_host0_arb",
> +	"hclk_host1_arb",
> +	"hclk_host2_arb",
> +	"hclk_otg_pmu",
> +	"aclk_gpu_noc",
> +	"sclk_initmem_mbist",
> +	"aclk_initmem",
> +	"hclk_rom",
> +	"pclk_ddrupctl",
> +	"pclk_ddrmon",
> +	"pclk_msch_noc",
> +	"pclk_stimer",
> +	"pclk_ddrphy",
> +	"pclk_acodecphy",
> +	"pclk_phy_noc",
> +	"aclk_vpu_noc",
> +	"aclk_rkvdec_noc",
> +	"hclk_vpu_noc",
> +	"hclk_rkvdec_noc",
>  };
> =20
>  static void __init rk3228_clk_init(struct device_node *np)
>=20
