Return-Path: <>
From: "Andrew F. Davis" <afd@ti.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@codeaurora.org>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Andrew F.
 Davis" <afd@ti.com>
Subject: [PATCH] clk: Make of_clk_get_from_provider() available to modules
Date: Fri, 12 Feb 2016 12:50:16 -0600
Message-ID: <1455303016-8997-1-git-send-email-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Export symbol of_clk_get_from_provider so it can be used in
loadable kernel modules

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
We will be pushing stuff that needs this next cycle.

 drivers/clk/clk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index b4db67a..0a24736 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3061,6 +3061,7 @@ struct clk *of_clk_get_from_provider(struct of_phandle_args *clkspec)
 {
 	return __of_clk_get_from_provider(clkspec, NULL, __func__);
 }
+EXPORT_SYMBOL_GPL(of_clk_get_from_provider);
 
 int of_clk_get_parent_count(struct device_node *np)
 {
-- 
2.7.1
