Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [PATCH 26/41] clk: efm32gg: Remove CLK_IS_ROOT
Date: Tue,  1 Mar 2016 11:00:11 -0800
Message-Id: <1456858826-28541-27-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now. Remove usage of the flag.

Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-efm32gg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-efm32gg.c b/drivers/clk/clk-efm32gg.c
index bac4553f04b8..22e4c659704e 100644
--- a/drivers/clk/clk-efm32gg.c
+++ b/drivers/clk/clk-efm32gg.c
@@ -36,7 +36,7 @@ static void __init efm32gg_cmu_init(struct device_node *np)
 	}
 
 	clk[clk_HFXO] = clk_register_fixed_rate(NULL, "HFXO", NULL,
-			CLK_IS_ROOT, 48000000);
+			0, 48000000);
 
 	clk[clk_HFPERCLKUSART0] = clk_register_gate(NULL, "HFPERCLK.USART0",
 			"HFXO", 0, base + CMU_HFPERCLKEN0, 0, 0, NULL);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
