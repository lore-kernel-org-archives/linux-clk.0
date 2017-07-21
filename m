Return-Path: <s.nawrocki@samsung.com>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, cw00.choi@samsung.com,
	krzk@kernel.org, linux-samsung-soc@vger.kernel.org,
	b.zolnierkie@samsung.com, linux-kernel@vger.kernel.org, Sylwester Nawrocki
	<s.nawrocki@samsung.com>
Subject: [PATCH 2/3] clk: samsung: Add CLK_SET_RATE_PARENT to some AUDSS CLK
 CON clocks
Date: Fri, 21 Jul 2017 18:36:43 +0200
Message-id: <1500655004-29816-2-git-send-email-s.nawrocki@samsung.com>
In-reply-to: <1500655004-29816-1-git-send-email-s.nawrocki@samsung.com>
References: <1500655004-29816-1-git-send-email-s.nawrocki@samsung.com>
	<CGME20170721163751epcas1p2fd6ba68507923b767c043b38249535e8@epcas1p2.samsung.com>
List-ID: <linux-clk.vger.kernel.org>

This allows clk rate propagation up to the clock tree so EPLL
can be reprogrammed indirectly when setting rate of the Audio
Subsystem clocks.
The advantage is that sound machine driver can operate only
on the leaf clocks rather than explicitly re-configuring
the root clock (EPLL).

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/clk/samsung/clk-exynos-audss.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos-audss.c b/drivers/clk/samsung/clk-exynos-audss.c
index 1fab56f..b117783 100644
--- a/drivers/clk/samsung/clk-exynos-audss.c
+++ b/drivers/clk/samsung/clk-exynos-audss.c
@@ -180,7 +180,7 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
 	}
 	clk_table[EXYNOS_MOUT_AUDSS] = clk_hw_register_mux(NULL, "mout_audss",
 				mout_audss_p, ARRAY_SIZE(mout_audss_p),
-				CLK_SET_RATE_NO_REPARENT,
+				CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
 				reg_base + ASS_CLK_SRC, 0, 1, 0, &lock);
 
 	cdclk = devm_clk_get(&pdev->dev, "cdclk");
@@ -195,11 +195,11 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
 				reg_base + ASS_CLK_SRC, 2, 2, 0, &lock);
 
 	clk_table[EXYNOS_DOUT_SRP] = clk_hw_register_divider(NULL, "dout_srp",
-				"mout_audss", 0, reg_base + ASS_CLK_DIV, 0, 4,
-				0, &lock);
+				"mout_audss", CLK_SET_RATE_PARENT,
+				reg_base + ASS_CLK_DIV, 0, 4, 0, &lock);
 
 	clk_table[EXYNOS_DOUT_AUD_BUS] = clk_hw_register_divider(NULL,
-				"dout_aud_bus", "dout_srp", 0,
+				"dout_aud_bus", "dout_srp", CLK_SET_RATE_PARENT,
 				reg_base + ASS_CLK_DIV, 4, 4, 0, &lock);
 
 	clk_table[EXYNOS_DOUT_I2S] = clk_hw_register_divider(NULL, "dout_i2s",
-- 
1.9.1
