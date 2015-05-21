Return-Path: <shawn.guo@linaro.org>
Return-Path: <shawn.guo@linaro.org>
Date: Thu, 21 May 2015 09:18:25 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Cc: Sascha Hauer <kernel@pengutronix.de>,
	Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] ARM: clk-imx6q: refine sata's parent
Message-ID: <20150521011824.GI24844@dragon>
References: <1432132237-31004-1-git-send-email-sebastien.szymanski@armadeus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <1432132237-31004-1-git-send-email-sebastien.szymanski@armadeus.com>
List-ID: <linux-clk.vger.kernel.org>

On Wed, May 20, 2015 at 04:30:37PM +0200, Sébastien Szymanski wrote:
> According to IMX6D/Q RM, table 18-3, sata clock's parent is ahb, not ipg.
> 
> This patch is based on branch:
> git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git imx/soc

Dropped these two lines, and applied patch.

Shawn

> 
> Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
> ---
>  drivers/clk/imx/clk-imx6q.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
> index 128f887..d046f8e 100644
> --- a/drivers/clk/imx/clk-imx6q.c
> +++ b/drivers/clk/imx/clk-imx6q.c
> @@ -450,7 +450,7 @@ static void __init imx6q_clocks_init(struct device_node *ccm_node)
>  	clk[IMX6QDL_CLK_GPMI_IO]      = imx_clk_gate2("gpmi_io",       "enfc",              base + 0x78, 28);
>  	clk[IMX6QDL_CLK_GPMI_APB]     = imx_clk_gate2("gpmi_apb",      "usdhc3",            base + 0x78, 30);
>  	clk[IMX6QDL_CLK_ROM]          = imx_clk_gate2("rom",           "ahb",               base + 0x7c, 0);
> -	clk[IMX6QDL_CLK_SATA]         = imx_clk_gate2("sata",          "ipg",               base + 0x7c, 4);
> +	clk[IMX6QDL_CLK_SATA]         = imx_clk_gate2("sata",          "ahb",               base + 0x7c, 4);
>  	clk[IMX6QDL_CLK_SDMA]         = imx_clk_gate2("sdma",          "ahb",               base + 0x7c, 6);
>  	clk[IMX6QDL_CLK_SPBA]         = imx_clk_gate2("spba",          "ipg",               base + 0x7c, 12);
>  	clk[IMX6QDL_CLK_SPDIF]        = imx_clk_gate2("spdif",         "spdif_podf",        base + 0x7c, 14);
> -- 
> 2.0.5
> 
