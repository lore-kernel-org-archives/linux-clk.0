Return-Path: <linus.walleij@linaro.org>
Return-Path: <linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] clk: versatile: mask VCO bits before writing
Date: Wed,  3 Feb 2016 14:47:08 +0100
Message-Id: <1454507228-14718-1-git-send-email-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

The Versatile syscon ICST driver OR:s the bits into place but
forgets to mask the previous value, making the code only work
if the register is zero or giving haphazard results. Mask the
19 bits used by the Versatile syscon interface register.

Regression caused and now fixed by yours truly.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org
Fixes: 179c8fb3c2a6 ("clk: versatile-icst: convert to use regmap")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/clk/versatile/clk-icst.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/versatile/clk-icst.c b/drivers/clk/versatile/clk-icst.c
index e62f8cb2c9b5..3bca438ecd19 100644
--- a/drivers/clk/versatile/clk-icst.c
+++ b/drivers/clk/versatile/clk-icst.c
@@ -78,6 +78,9 @@ static int vco_set(struct clk_icst *icst, struct icst_vco vco)
 	ret = regmap_read(icst->map, icst->vcoreg_off, &val);
 	if (ret)
 		return ret;
+
+	/* Mask the 18 bits used by the VCO */
+	val &= ~0x7ffff;
 	val |= vco.v | (vco.r << 9) | (vco.s << 16);
 
 	/* This magic unlocks the VCO so it can be controlled */
-- 
2.4.3
