Return-Path: <wens@wens.csie.org>
From: Chen-Yu Tsai <wens@csie.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: [PATCH 04/11] mmc: sunxi: Keep default timing phase settings for new timing mode
Date: Fri, 14 Jul 2017 14:42:55 +0800
Message-Id: <20170714064302.20383-5-wens@csie.org>
In-Reply-To: <20170714064302.20383-1-wens@csie.org>
References: <20170714064302.20383-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

The register for the "new timing mode" also has bit fields for setting
output and sample timing phases. According to comments in Allwinner's
BSP kernel, the default values are good enough.

Keep the default values already in the hardware when setting new timing
mode, instead of overwriting the whole register.

Fixes: 9a37e53e451e ("mmc: sunxi: Enable the new timings for the A64 MMC
		      controllers")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/mmc/host/sunxi-mmc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
index d6fa2214aaae..0fb4e4c119e1 100644
--- a/drivers/mmc/host/sunxi-mmc.c
+++ b/drivers/mmc/host/sunxi-mmc.c
@@ -793,8 +793,12 @@ static int sunxi_mmc_clk_set_rate(struct sunxi_mmc_host *host,
 	}
 	mmc_writel(host, REG_CLKCR, rval);
 
-	if (host->cfg->needs_new_timings)
-		mmc_writel(host, REG_SD_NTSR, SDXC_2X_TIMING_MODE);
+	if (host->cfg->needs_new_timings) {
+		/* Don't touch the delay bits */
+		rval = mmc_readl(host, REG_SD_NTSR);
+		rval |= SDXC_2X_TIMING_MODE;
+		mmc_writel(host, REG_SD_NTSR, rval);
+	}
 
 	ret = sunxi_mmc_clk_set_phase(host, ios, rate);
 	if (ret)
-- 
2.13.2
