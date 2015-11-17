Return-Path: <l.stach@pengutronix.de>
Message-ID: <1447753028.3144.49.camel@pengutronix.de>
Subject: Re: [PATCH] clk: imx: clk-imx6q: Let OSC to be routed to anaclk2/2b
From: Lucas Stach <l.stach@pengutronix.de>
To: Michael Trimarchi <michael@amarulasolutions.com>
Cc: shawnguo@kernel.org, mturquette@baylibre.com, sboyd@codeaurora.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 linux-clk@vger.kernel.org
Date: Tue, 17 Nov 2015 10:37:08 +0100
In-Reply-To: <1446991642-3088-1-git-send-email-michael@amarulasolutions.com>
References: <1446991642-3088-1-git-send-email-michael@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Am Sonntag, den 08.11.2015, 15:07 +0100 schrieb Michael Trimarchi:
> OSC can be used as USB hub source clock. An example we can route to
> CLK2_P imx6 pin
> 
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>

I don't think the more verbose commit message of V2 adds any more value,
so I'm explicitly looking at V1. Change looks in line with the TRM, so:

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> ---
>  drivers/clk/imx/clk-imx6q.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
> index b2c1c04..8fe0015 100644
> --- a/drivers/clk/imx/clk-imx6q.c
> +++ b/drivers/clk/imx/clk-imx6q.c
> @@ -70,7 +70,8 @@ static const char *cko_sels[] = { "cko1", "cko2", };
>  static const char *lvds_sels[] = {
>  	"dummy", "dummy", "dummy", "dummy", "dummy", "dummy",
>  	"pll4_audio", "pll5_video", "pll8_mlb", "enet_ref",
> -	"pcie_ref_125m", "sata_ref_100m",
> +	"pcie_ref_125m", "sata_ref_100m",  "usbphy1", "usbphy2",
> +	"dummy", "dummy", "dummy", "dummy", "osc",
>  };
>  static const char *pll_bypass_src_sels[] = { "osc", "lvds1_in", "lvds2_in", "dummy", };
>  static const char *pll1_bypass_sels[] = { "pll1", "pll1_bypass_src", };

-- 
Pengutronix e.K.             | Lucas Stach                 |
Industrial Linux Solutions   | http://www.pengutronix.de/  |
