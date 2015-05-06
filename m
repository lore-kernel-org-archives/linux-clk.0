Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Jyri Sarha <jsarha@ti.com>
Subject: [PATCH 01/19] clk: gpio-gate: Don't export __init functions
Date: Wed,  6 May 2015 00:39:38 -0700
Message-Id: <1430897996-11597-2-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
References: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This function is marked as __init, so exposing it to modules
doesn't make any sense and it isn't used by modules anyway.

drivers/clk/clk-gpio-gate.c:192:13: warning: symbol 'of_gpio_gate_clk_setup' was not declared. Should it be static?

Cc: Jyri Sarha <jsarha@ti.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-gpio-gate.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/clk-gpio-gate.c b/drivers/clk/clk-gpio-gate.c
index a71cabedda93..f564e624fb93 100644
--- a/drivers/clk/clk-gpio-gate.c
+++ b/drivers/clk/clk-gpio-gate.c
@@ -189,7 +189,7 @@ static struct clk *of_clk_gpio_gate_delayed_register_get(
 /**
  * of_gpio_gate_clk_setup() - Setup function for gpio controlled clock
  */
-void __init of_gpio_gate_clk_setup(struct device_node *node)
+static void __init of_gpio_gate_clk_setup(struct device_node *node)
 {
 	struct clk_gpio_gate_delayed_register_data *data;
 
@@ -203,6 +203,5 @@ void __init of_gpio_gate_clk_setup(struct device_node *node)
 
 	of_clk_add_provider(node, of_clk_gpio_gate_delayed_register_get, data);
 }
-EXPORT_SYMBOL_GPL(of_gpio_gate_clk_setup);
 CLK_OF_DECLARE(gpio_gate_clk, "gpio-gate-clock", of_gpio_gate_clk_setup);
 #endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
