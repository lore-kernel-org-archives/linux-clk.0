Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: basic-types: Remove useless allocation failure printks
Date: Thu, 14 May 2015 17:10:12 -0700
Message-Id: <1431648612-32262-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Printing an error on kmalloc() failures is unnecessary. Remove
the print and use *ptr in sizeof() for future-proof code.

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-composite.c          | 4 +---
 drivers/clk/clk-divider.c            | 6 ++----
 drivers/clk/clk-fixed-factor.c       | 4 +---
 drivers/clk/clk-fixed-rate.c         | 6 ++----
 drivers/clk/clk-fractional-divider.c | 4 +---
 drivers/clk/clk-gate.c               | 6 ++----
 6 files changed, 9 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
index 077f4c7148f1..616f5aef3c26 100644
--- a/drivers/clk/clk-composite.c
+++ b/drivers/clk/clk-composite.c
@@ -200,10 +200,8 @@ struct clk *clk_register_composite(struct device *dev, const char *name,
 	struct clk_ops *clk_composite_ops;
 
 	composite = kzalloc(sizeof(*composite), GFP_KERNEL);
-	if (!composite) {
-		pr_err("%s: could not allocate composite clk\n", __func__);
+	if (!composite)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	init.name = name;
 	init.flags = flags | CLK_IS_BASIC;
diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index 25006a8bb8e6..706b5783c360 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -430,11 +430,9 @@ static struct clk *_register_divider(struct device *dev, const char *name,
 	}
 
 	/* allocate the divider */
-	div = kzalloc(sizeof(struct clk_divider), GFP_KERNEL);
-	if (!div) {
-		pr_err("%s: could not allocate divider clk\n", __func__);
+	div = kzalloc(sizeof(*div), GFP_KERNEL);
+	if (!div)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	init.name = name;
 	init.ops = &clk_divider_ops;
diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index d9e3f671c2ea..e186db263d5e 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -74,10 +74,8 @@ struct clk *clk_register_fixed_factor(struct device *dev, const char *name,
 	struct clk *clk;
 
 	fix = kmalloc(sizeof(*fix), GFP_KERNEL);
-	if (!fix) {
-		pr_err("%s: could not allocate fixed factor clk\n", __func__);
+	if (!fix)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	/* struct clk_fixed_factor assignments */
 	fix->mult = mult;
diff --git a/drivers/clk/clk-fixed-rate.c b/drivers/clk/clk-fixed-rate.c
index 0fc56ab6e844..f85ec8d1711f 100644
--- a/drivers/clk/clk-fixed-rate.c
+++ b/drivers/clk/clk-fixed-rate.c
@@ -65,11 +65,9 @@ struct clk *clk_register_fixed_rate_with_accuracy(struct device *dev,
 	struct clk_init_data init;
 
 	/* allocate fixed-rate clock */
-	fixed = kzalloc(sizeof(struct clk_fixed_rate), GFP_KERNEL);
-	if (!fixed) {
-		pr_err("%s: could not allocate fixed clk\n", __func__);
+	fixed = kzalloc(sizeof(*fixed), GFP_KERNEL);
+	if (!fixed)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	init.name = name;
 	init.ops = &clk_fixed_rate_ops;
diff --git a/drivers/clk/clk-fractional-divider.c b/drivers/clk/clk-fractional-divider.c
index 6aa72d9d79ba..140eb5844dc4 100644
--- a/drivers/clk/clk-fractional-divider.c
+++ b/drivers/clk/clk-fractional-divider.c
@@ -109,10 +109,8 @@ struct clk *clk_register_fractional_divider(struct device *dev,
 	struct clk *clk;
 
 	fd = kzalloc(sizeof(*fd), GFP_KERNEL);
-	if (!fd) {
-		dev_err(dev, "could not allocate fractional divider clk\n");
+	if (!fd)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	init.name = name;
 	init.ops = &clk_fractional_divider_ops;
diff --git a/drivers/clk/clk-gate.c b/drivers/clk/clk-gate.c
index 3f0e4200cb5d..551dd0672794 100644
--- a/drivers/clk/clk-gate.c
+++ b/drivers/clk/clk-gate.c
@@ -135,11 +135,9 @@ struct clk *clk_register_gate(struct device *dev, const char *name,
 	}
 
 	/* allocate the gate */
-	gate = kzalloc(sizeof(struct clk_gate), GFP_KERNEL);
-	if (!gate) {
-		pr_err("%s: could not allocate gated clk\n", __func__);
+	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
+	if (!gate)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	init.name = name;
 	init.ops = &clk_gate_ops;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
