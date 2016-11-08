Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH] clk: Free struct clk allocated during clk_hw_register()
Date: Tue,  8 Nov 2016 13:53:50 +0530
Message-Id: <1478593430-23102-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

With clk_hw_register() API we hide the struct clk from the caller
and return an int error code instead, so the caller (clk provider)
is not expected to use hw->clk on return.
Free the memory, and mark hw->clk as NULL before returning.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/clk.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 0fb39fe..f81e4aa 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2628,7 +2628,15 @@ struct clk *clk_register(struct device *dev, struct clk_hw *hw)
  */
 int clk_hw_register(struct device *dev, struct clk_hw *hw)
 {
-	return PTR_ERR_OR_ZERO(clk_register(dev, hw));
+	struct clk *c;
+
+	c = clk_register(dev, hw);
+	if (IS_ERR(c))
+		return PTR_ERR(c);
+
+	__clk_free_clk(c);
+	hw->clk = NULL;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(clk_hw_register);
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
