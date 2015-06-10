Return-Path: <daniel.thompson@linaro.org>
Return-Path: <daniel.thompson@linaro.org>
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@linaro.org,
	linaro-kernel@lists.linaro.org
Subject: [PATCH] clk: fixed: Add comment to clk_fixed_set_rate
Date: Wed, 10 Jun 2015 21:04:54 +0100
Message-Id: <1433966694-23559-1-git-send-email-daniel.thompson@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Currently it is not made explicit why clk_fixed_set_rate() can ignore
its arguments and unconditionally return success. Add a comment
to explain this.

We also mark the clk_ops table const since it should never be
modified at runtime.

Suggested-by: Stephen Boyd <sboyd@codeaurora.org>
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---

Notes:
    Changes here emerged from Stephen Boyd's code review of (partiall)
    borrowed code.  This patch applies his review comments to the
    original code.

 drivers/clk/clk-fixed-factor.c | 8 +++++++-
 include/linux/clk-provider.h   | 2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index e186db2..fccabe4 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -55,10 +55,16 @@ static long clk_factor_round_rate(struct clk_hw *hw, unsigned long rate,
 static int clk_factor_set_rate(struct clk_hw *hw, unsigned long rate,
 				unsigned long parent_rate)
 {
+	/*
+	 * We must report success but we can do so unconditionally because
+	 * clk_factor_round_rate returns values that ensure this call is a
+	 * nop.
+	 */
+
 	return 0;
 }

-struct clk_ops clk_fixed_factor_ops = {
+const struct clk_ops clk_fixed_factor_ops = {
 	.round_rate = clk_factor_round_rate,
 	.set_rate = clk_factor_set_rate,
 	.recalc_rate = clk_factor_recalc_rate,
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 6d55c31..1af9579 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -459,7 +459,7 @@ struct clk_fixed_factor {
 	unsigned int	div;
 };

-extern struct clk_ops clk_fixed_factor_ops;
+extern const struct clk_ops clk_fixed_factor_ops;
 struct clk *clk_register_fixed_factor(struct device *dev, const char *name,
 		const char *parent_name, unsigned long flags,
 		unsigned int mult, unsigned int div);
--
2.4.2
