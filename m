Return-Path: <Julia.Lawall@lip6.fr>
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Santosh Shilimkar <ssantosh@kernel.org>
Cc: kernel-janitors@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 10/15] clk: keystone: improve function-level documentation
Date: Sat,  1 Oct 2016 21:46:27 +0200
Message-Id: <1475351192-27079-11-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1475351192-27079-1-git-send-email-Julia.Lawall@lip6.fr>
References: <1475351192-27079-1-git-send-email-Julia.Lawall@lip6.fr>
List-ID: <linux-clk.vger.kernel.org>

Adjust the documentation to use the actual function names.

Issue detected using Coccinelle (http://coccinelle.lip6.fr/)

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/clk/keystone/pll.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/keystone/pll.c b/drivers/clk/keystone/pll.c
index a26ba21..185f19c 100644
--- a/drivers/clk/keystone/pll.c
+++ b/drivers/clk/keystone/pll.c
@@ -154,7 +154,7 @@ static struct clk *clk_register_pll(struct device *dev,
 }
 
 /**
- * _of_clk_init - PLL initialisation via DT
+ * _of_pll_clk_init - PLL initialisation via DT
  * @node: device tree node for this clock
  * @pllctrl: If true, lower 6 bits of multiplier is in pllm register of
  *		pll controller, else it is in the control register0(bit 11-6)
@@ -235,7 +235,7 @@ static void __init of_keystone_pll_clk_init(struct device_node *node)
 					of_keystone_pll_clk_init);
 
 /**
- * of_keystone_pll_main_clk_init - Main PLL initialisation DT wrapper
+ * of_keystone_main_pll_clk_init - Main PLL initialisation DT wrapper
  * @node: device tree node for this clock
  */
 static void __init of_keystone_main_pll_clk_init(struct device_node *node)
