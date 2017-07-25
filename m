Return-Path: <pdeschrijver@nvidia.com>
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Alex Frid <afrid@nvidia.com>
Subject: [PATCH] clk: Don't write error code into divider register
Date: Tue, 25 Jul 2017 13:18:40 +0300
Message-ID: <1500977920-5533-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: pdeschrijver@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

From: Alex Frid <afrid@nvidia.com>

Add a check for error returned by divider value calculation to avoid
writing error code into hw register.

Signed-off-by: Alex Frid <afrid@nvidia.com>
Reviewed-by: Peter De Schrijver <pdeschrijver@nvidia.com>
Reviewed-by: Jon Mayo <jmayo@nvidia.com>
---
 drivers/clk/clk-divider.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index 9bb472c..4ed516c 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -385,12 +385,14 @@ static int clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 				unsigned long parent_rate)
 {
 	struct clk_divider *divider = to_clk_divider(hw);
-	unsigned int value;
+	int value;
 	unsigned long flags = 0;
 	u32 val;
 
 	value = divider_get_val(rate, parent_rate, divider->table,
 				divider->width, divider->flags);
+	if (value < 0)
+		return value;
 
 	if (divider->lock)
 		spin_lock_irqsave(divider->lock, flags);
@@ -403,7 +405,7 @@ static int clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 		val = clk_readl(divider->reg);
 		val &= ~(div_mask(divider->width) << divider->shift);
 	}
-	val |= value << divider->shift;
+	val |= (u32)value << divider->shift;
 	clk_writel(val, divider->reg);
 
 	if (divider->lock)
-- 
1.9.1
