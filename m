Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Jyri Sarha <jsarha@ti.com>
Subject: [PATCH] clk: provider: Remove of_gpio_{gate,mux}_clk_setup() prototypes
Date: Sat,  6 Feb 2016 23:42:06 -0800
Message-Id: <1454830926-10434-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

These functions either never existed or were only used in
OF_CLK_DECLARE() macros. Remove the dead prototypes.

Cc: Jyri Sarha <jsarha@ti.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 include/linux/clk-provider.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 9c3a18c1a984..fce7f027f8a7 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -626,8 +626,6 @@ struct clk *clk_register_gpio_gate(struct device *dev, const char *name,
 		const char *parent_name, unsigned gpio, bool active_low,
 		unsigned long flags);
 
-void of_gpio_clk_gate_setup(struct device_node *node);
-
 /**
  * struct clk_gpio_mux - gpio controlled clock multiplexer
  *
@@ -643,8 +641,6 @@ struct clk *clk_register_gpio_mux(struct device *dev, const char *name,
 		const char * const *parent_names, u8 num_parents, unsigned gpio,
 		bool active_low, unsigned long flags);
 
-void of_gpio_mux_clk_setup(struct device_node *node);
-
 /**
  * clk_register - allocate a new clock, register it and return an opaque cookie
  * @dev: device that is registering this clock
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
