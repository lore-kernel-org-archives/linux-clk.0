Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Stephen Boyd <stephen.boyd@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [PATCH] clk: efm32gg: Pass correct type to hw provider registration
Date: Wed, 16 Nov 2016 11:09:32 -0800
Message-Id: <20161116190932.21767-1-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Dan Carpenter reports that we're passing a pointer to a pointer
here when we should just be passing a pointer. Pass the right
pointer so that the of_clk_hw_onecell_get() sees the appropriate
data pointer on its end.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Stephen Boyd <stephen.boyd@linaro.org>
Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Fixes: 9337631f52a8 ("clk: efm32gg: Migrate to clk_hw based OF and registration APIs")
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-efm32gg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-efm32gg.c b/drivers/clk/clk-efm32gg.c
index 8802a2dd56ac..f674778fb3ac 100644
--- a/drivers/clk/clk-efm32gg.c
+++ b/drivers/clk/clk-efm32gg.c
@@ -82,6 +82,6 @@ static void __init efm32gg_cmu_init(struct device_node *np)
 	hws[clk_HFPERCLKDAC0] = clk_hw_register_gate(NULL, "HFPERCLK.DAC0",
 			"HFXO", 0, base + CMU_HFPERCLKEN0, 17, 0, NULL);
 
-	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data);
+	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data);
 }
 CLK_OF_DECLARE(efm32ggcmu, "efm32gg,cmu", efm32gg_cmu_init);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
