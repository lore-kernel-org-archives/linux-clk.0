Return-Path: <shawnguo@kernel.org>
Date: Sun, 17 Jun 2018 15:24:09 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Cc: Colin Didier <colin.dider@devialet.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Colin Didier <colin.didier@devialet.com>,
	=?iso-8859-1?Q?Cl=E9ment?= Peron <clement.peron@devialet.com>
Subject: Re: [PATCH 2/5] ARM: clk-imx6q: add EPIT clock support
Message-ID: <20180617072408.GP16091@dragon>
References: <20180528173412.10000-1-peron.clem@gmail.com>
 <20180528173412.10000-3-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <20180528173412.10000-3-peron.clem@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On Mon, May 28, 2018 at 07:34:09PM +0200, Clément Péron wrote:
> From: Colin Didier <colin.didier@devialet.com>
> 
> Add EPIT clock support to the i.MX6Q clocking infrastructure.
> 
> Signed-off-by: Colin Didier <colin.didier@devialet.com>
> Signed-off-by: Clément Peron <clement.peron@devialet.com>

This is a clock patch and should be prefixed with 'clk: imx6q: ...'
rather than 'ARM: ...'  Otherwise,

Acked-by: Shawn Guo <shawnguo@kernel.org>

> ---
>  drivers/clk/imx/clk-imx6q.c               | 2 ++
>  include/dt-bindings/clock/imx6qdl-clock.h | 4 +++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
> index 8d518ad5dc13..b9ea7037e193 100644
> --- a/drivers/clk/imx/clk-imx6q.c
> +++ b/drivers/clk/imx/clk-imx6q.c
> @@ -753,6 +753,8 @@ static void __init imx6q_clocks_init(struct device_node *ccm_node)
>  	else
>  		clk[IMX6Q_CLK_ECSPI5] = imx_clk_gate2("ecspi5",        "ecspi_root",        base + 0x6c, 8);
>  	clk[IMX6QDL_CLK_ENET]         = imx_clk_gate2("enet",          "ipg",               base + 0x6c, 10);
> +	clk[IMX6QDL_CLK_EPIT1]        = imx_clk_gate2("epit1",         "ipg",               base + 0x6c, 12);
> +	clk[IMX6QDL_CLK_EPIT2]        = imx_clk_gate2("epit2",         "ipg",               base + 0x6c, 14);
>  	clk[IMX6QDL_CLK_ESAI_EXTAL]   = imx_clk_gate2_shared("esai_extal",   "esai_podf",   base + 0x6c, 16, &share_count_esai);
>  	clk[IMX6QDL_CLK_ESAI_IPG]     = imx_clk_gate2_shared("esai_ipg",   "ahb",           base + 0x6c, 16, &share_count_esai);
>  	clk[IMX6QDL_CLK_ESAI_MEM]     = imx_clk_gate2_shared("esai_mem", "ahb",             base + 0x6c, 16, &share_count_esai);
> diff --git a/include/dt-bindings/clock/imx6qdl-clock.h b/include/dt-bindings/clock/imx6qdl-clock.h
> index da59fd9cdb5e..7ad171b8f3bf 100644
> --- a/include/dt-bindings/clock/imx6qdl-clock.h
> +++ b/include/dt-bindings/clock/imx6qdl-clock.h
> @@ -271,6 +271,8 @@
>  #define IMX6QDL_CLK_PRE_AXI			258
>  #define IMX6QDL_CLK_MLB_SEL			259
>  #define IMX6QDL_CLK_MLB_PODF			260
> -#define IMX6QDL_CLK_END				261
> +#define IMX6QDL_CLK_EPIT1			261
> +#define IMX6QDL_CLK_EPIT2			262
> +#define IMX6QDL_CLK_END				263
>  
>  #endif /* __DT_BINDINGS_CLOCK_IMX6QDL_H */
> -- 
> 2.17.0
> 
