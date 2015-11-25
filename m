Return-Path: <shawnguo@kernel.org>
Date: Wed, 25 Nov 2015 13:21:22 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Michael Trimarchi <michael@amarulasolutions.com>
Cc: kernel@pengutronix.de, mturquette@baylibre.com, sboyd@codeaurora.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] clk: imx: clk-imx6q: Let OSC to be routed to
 anaclk2/2b
Message-ID: <20151125052122.GA22914@tiger>
References: <1446991642-3088-1-git-send-email-michael@amarulasolutions.com>
 <20151115101938.GA9808@panicking>
 <20151115103800.GB9808@panicking>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20151115103800.GB9808@panicking>
List-ID: <linux-clk.vger.kernel.org>

On Sun, Nov 15, 2015 at 11:38:04AM +0100, Michael Trimarchi wrote:
> OSC can be used as USB hub source clock. An example we can route to
> CLK2_P imx6 pin.
> 
> This show a usage example:
> 
> [...]
> 	usb_hub: usb-hub {
> 		compatible = "smsc,usb3503a";
> 		clocks = <&clks IMX6QDL_CLK_LVDS2_GATE>;
> 		clock-names = "refclk";
> 	};
> };
> 
> [...]
> &clks {
>         assigned-clocks = <&clks IMX6QDL_CLK_LVDS2_SEL>;
>         assigned-clock-parents = <&clks IMX6QDL_CLK_OSC>;
> };
> 
> /sys/kernel/debug/clk/clk_summary
> 
> osc                                 5            5    24000000          0 0
> [...]
>     lvds2_sel                       1            1    24000000          0 0
>        lvds2_gate                   1            1    24000000          0 0
> [...]
> 
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>

Applied, thanks.
