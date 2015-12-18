Return-Path: <t-kristo@ti.com>
From: Tero Kristo <t-kristo@ti.com>
To: <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <tony@atomide.com>, <mturquette@baylibre.com>, <sboyd@codeaurora.org>
CC: <linux-arm-kernel@lists.infradead.org>
Subject: [RFC 3/9] clk: ti: remove un-used definitions from public clk_hw_omap struct
Date: Fri, 18 Dec 2015 15:58:55 +0200
Message-ID: <1450447141-29936-4-git-send-email-t-kristo@ti.com>
In-Reply-To: <1450447141-29936-1-git-send-email-t-kristo@ti.com>
References: <1450447141-29936-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Clksel support has been deprecated a while back, so remove these from
the struct also.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 include/linux/clk/ti.h |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/linux/clk/ti.h b/include/linux/clk/ti.h
index 223be69..ec5613a 100644
--- a/include/linux/clk/ti.h
+++ b/include/linux/clk/ti.h
@@ -127,8 +127,6 @@ struct clk_hw_omap_ops {
  * @enable_bit: bitshift to write to enable/disable the clock (see @enable_reg)
  * @flags: see "struct clk.flags possibilities" above
  * @clksel_reg: for clksel clks, register va containing src/divisor select
- * @clksel_mask: bitmask in @clksel_reg for the src/divisor selector
- * @clksel: for clksel clks, pointer to struct clksel for this clock
  * @dpll_data: for DPLLs, pointer to struct dpll_data for this clock
  * @clkdm_name: clockdomain name that this clock is contained in
  * @clkdm: pointer to struct clockdomain, resolved from @clkdm_name at runtime
@@ -143,8 +141,6 @@ struct clk_hw_omap {
 	u8			enable_bit;
 	u8			flags;
 	void __iomem		*clksel_reg;
-	u32			clksel_mask;
-	const struct clksel	*clksel;
 	struct dpll_data	*dpll_data;
 	const char		*clkdm_name;
 	struct clockdomain	*clkdm;
-- 
1.7.9.5
