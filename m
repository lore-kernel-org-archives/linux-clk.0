Return-Path: <michael@amarulasolutions.com>
Return-Path: <michael@amarulasolutions.com>
Date: Sun, 15 Nov 2015 11:19:44 +0100
From: Michael Trimarchi <michael@amarulasolutions.com>
To: shawnguo@kernel.org
Cc: kernel@pengutronix.de, mturquette@baylibre.com, sboyd@codeaurora.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: clk-imx6q: Let OSC to be routed to anaclk2/2b
Message-ID: <20151115101938.GA9808@panicking>
References: <1446991642-3088-1-git-send-email-michael@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1446991642-3088-1-git-send-email-michael@amarulasolutions.com>
List-ID: <linux-clk.vger.kernel.org>

Hi

On Sun, Nov 08, 2015 at 03:07:22PM +0100, Michael Trimarchi wrote:
> OSC can be used as USB hub source clock. An example we can route to
> CLK2_P imx6 pin
> 

Do I need to include an example in the commit message?

	usb_hub: usb-hub {
		compatible = "smsc,usb3503a";
		clocks = <&clks IMX6QDL_CLK_LVDS2_GATE>;
		clock-names = "refclk";
	};
};

&clks {
	assigned-clocks = <&clks IMX6QDL_CLK_LVDS2_SEL>;
	assigned-clock-parents = <&clks IMX6QDL_CLK_OSC>;
};

 osc                                      5            5    24000000          0 0  
    cko2_sel                              0            0    24000000          0 0  
       cko2_podf                          0            0    24000000          0 0  
          cko2                            0            0    24000000          0 0  
             cko                          0            0    24000000          0 0  
    lvds2_sel                             1            1    24000000          0 0  
       lvds2_gate                         1            1    24000000          0 0  

Best regards
Michael

> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
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
> -- 
> 2.6.3
> 

-- 
| Michael Nazzareno Trimarchi                     Amarula Solutions BV |
| COO  -  Founder                                      Cruquiuskade 47 |
| +31(0)851119172                                 Amsterdam 1018 AM NL |
|                  [`as] http://www.amarulasolutions.com               |
