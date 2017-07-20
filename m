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
Subject: [PATCH v2 03/10] clk: sunxi-ng: a83t: Support new timing mode for mmc2 clock
Date: Thu, 20 Jul 2017 11:44:45 +0800
Message-Id: <20170720034452.15920-4-wens@csie.org>
In-Reply-To: <20170720034452.15920-1-wens@csie.org>
References: <20170720034452.15920-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

The MMC2 clock supports a new timing mode. When the new mode is active,
the output clock rate is halved.

This patch sets the feature flag for the new timing mode, and adds
a pre-divider based on the mode bit.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu-sun8i-a83t.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c b/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
index 947f9f6e05d2..c5656e4f2a38 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
@@ -418,14 +418,13 @@ static SUNXI_CCU_PHASE(mmc1_sample_clk, "mmc1-sample", "mmc1",
 static SUNXI_CCU_PHASE(mmc1_output_clk, "mmc1-output", "mmc1",
 		       0x08c, 8, 3, 0);
 
-/* TODO Support MMC2 clock's new timing mode. */
-static SUNXI_CCU_MP_WITH_MUX_GATE(mmc2_clk, "mmc2", mod0_default_parents,
-				  0x090,
-				  0, 4,		/* M */
-				  16, 2,	/* P */
-				  24, 2,	/* mux */
-				  BIT(31),	/* gate */
-				  0);
+static SUNXI_CCU_MP_MMC_WITH_MUX_GATE(mmc2_clk, "mmc2", mod0_default_parents,
+				      0x090,
+				      0, 4,	/* M */
+				      16, 2,	/* P */
+				      24, 2,	/* mux */
+				      BIT(31),	/* gate */
+				      CLK_GET_RATE_NOCACHE);
 
 static SUNXI_CCU_PHASE(mmc2_sample_clk, "mmc2-sample", "mmc2",
 		       0x090, 20, 3, 0);
-- 
2.13.2
