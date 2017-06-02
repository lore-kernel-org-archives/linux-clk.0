Return-Path: <sboyd@codeaurora.org>
Date: Fri, 2 Jun 2017 15:39:55 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
	broonie@kernel.org, yibin.gong@nxp.com, rjw@rjwysocki.net,
	viresh.kumar@linaro.org, mturquette@baylibre.com,
	shawnguo@kernel.org, fabio.estevam@nxp.com, anson.huang@nxp.com,
	ping.bai@nxp.com, leonard.crestez@nxp.com, octavian.purdila@nxp.com,
	linux@armlinux.org.uk, geert@linux-m68k.org, f.fainelli@gmail.com,
	dongas86@gmail.com, Russell King <linux@arm.linux.org.uk>
Subject: Re: [PATCH V3 2/3] clk: add managed version of clk_bulk_get
Message-ID: <20170602223955.GW20170@codeaurora.org>
References: <1495201746-31841-1-git-send-email-aisheng.dong@nxp.com>
 <1495201746-31841-3-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1495201746-31841-3-git-send-email-aisheng.dong@nxp.com>
List-ID: <linux-clk.vger.kernel.org>

On 05/19, Dong Aisheng wrote:
> This patch introduces the managed version of clk_bulk_get.
> 
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Russell King <linux@arm.linux.org.uk>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Anson Huang <anson.huang@nxp.com>
> Cc: Robin Gong <yibin.gong@nxp.com>
> Cc: Bai Ping <ping.bai@nxp.com>
> Cc: Leonard Crestez <leonard.crestez@nxp.com>
> Cc: Octavian Purdila <octavian.purdila@nxp.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---

Applied to clk-bulk-get and merged into clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
