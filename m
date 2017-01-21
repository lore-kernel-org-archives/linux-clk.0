Return-Path: <sboyd@codeaurora.org>
Date: Fri, 20 Jan 2017 16:16:48 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org,
	Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	linux-arm-kernel@lists.infradead.org,
	Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org, Ziji Hu <huziji@marvell.com>,
	Jimmy Xu <zmxu@marvell.com>, Jisheng Zhang <jszhang@marvell.com>,
	Nadav Haklai <nadavh@marvell.com>, Ryan Gao <ygao@marvell.com>,
	Doug Jones <dougj@marvell.com>, Victor Gu <xigu@marvell.com>,
	"Wei(SOCP) Liu" <liuw@marvell.com>,
	Wilson Ding <dingwei@marvell.com>,
	Yehuda Yitschak <yehuday@marvell.com>,
	Marcin Wojtas <mw@semihalf.com>, Hanna Hawa <hannah@marvell.com>,
	Kostya Porotchkin <kostap@marvell.com>,
	Russell King <rmk+kernel@armlinux.org.uk>
Subject: Re: [PATCH v5 01/12] clk: apn806: Add eMMC clock to system
 controller driver
Message-ID: <20170121001648.GJ20800@codeaurora.org>
References: <cover.8527229dae6c124f24c5e637430c2cdc86f80392.1484154449.git-series.gregory.clement@free-electrons.com>
 <e84d52dfbd9f7d2a14a5ec9d53918119fdc90404.1484154449.git-series.gregory.clement@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <e84d52dfbd9f7d2a14a5ec9d53918119fdc90404.1484154449.git-series.gregory.clement@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 01/11, Gregory CLEMENT wrote:
> From: Konstantin Porotchkin <kostap@marvell.com>
> 
> Add fixed clock of 400MHz to system controller driver.  This clock is
> used as SD/eMMC clock source.
> 
> Signed-off-by: Konstantin Porotchkin <kostap@marvell.com>
> Reviewed-by: Omri Itach <omrii@marvell.com>
> Reviewed-by: Hanna Hawa <hannah@marvell.com>
> [fixed up conflicts, added error handling --rmk]
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

> diff --git a/drivers/clk/mvebu/ap806-system-controller.c b/drivers/clk/mvebu/ap806-system-controller.c
> index 8181b919f062..0a785076b0c6 100644
> --- a/drivers/clk/mvebu/ap806-system-controller.c
> +++ b/drivers/clk/mvebu/ap806-system-controller.c
> @@ -117,6 +117,17 @@ static int ap806_syscon_clk_probe(struct platform_device *pdev)
>  		goto fail3;
>  	}
>  
> +	/* eMMC Clock is fixed clock divided by 3 */
> +	of_property_read_string_index(np, "clock-output-names",
> +				      4, &name);

This could check for failure and not register the clk if the name
isn't there? Then dts can be backwards compatible.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
