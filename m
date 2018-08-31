Return-Path: <horms@verge.net.au>
Date: Fri, 31 Aug 2018 15:41:27 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Takeshi Kihara <takeshi.kihara.df@renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: r8a77990: Add missing I2C7 clock
Message-ID: <20180831134126.dbk5uyjswvbm77ux@verge.net.au>
References: <20180830152813.20883-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180830152813.20883-1-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Aug 30, 2018 at 05:28:13PM +0200, Geert Uytterhoeven wrote:
> When trying to use I2C7 on R-Car E3:
> 
>     renesas-cpg-mssr e6150000.clock-controller: Cannot get module clock 1003: -2
>     i2c-rcar e6690000.i2c: failed to add to PM domain always-on: -2
>     i2c-rcar: probe of e6690000.i2c failed with error -2
> 
> Unlike other R-Car Gen3 SoCs, R-Car E3 has more than 7 I2C bus
> interfaces.  Add the forgotten module clock for the 8th instance to fix
> this.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
