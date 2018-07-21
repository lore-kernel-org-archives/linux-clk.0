Return-Path: <tdas@codeaurora.org>
From: Taniya Das <tdas@codeaurora.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	Amit Nischal <anischal@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	grahamr@qti.qualcomm.com,
	Taniya Das <tdas@codeaurora.org>
Subject: [RFC PATCH 2/4] clk: qcom: Initialize the power domain class for each clock
Date: Sat, 21 Jul 2018 23:45:00 +0530
Message-Id: <1532196902-28570-3-git-send-email-tdas@codeaurora.org>
In-Reply-To: <1532196902-28570-1-git-send-email-tdas@codeaurora.org>
References: <1532196902-28570-1-git-send-email-tdas@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The power domain class is being initialized for clocks which has
an associated power domains before registering the clocks with
the clock framework.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/clk-regmap.h |  5 +++++
 drivers/clk/qcom/common.c     | 17 +++++++----------
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/clk-regmap.h b/drivers/clk/qcom/clk-regmap.h
index 90d95cd..6265d91 100644
--- a/drivers/clk/qcom/clk-regmap.h
+++ b/drivers/clk/qcom/clk-regmap.h
@@ -17,22 +17,27 @@
 #include <linux/clk-provider.h>
 
 struct regmap;
+struct clk_powerdomain_class;
 
 /**
  * struct clk_regmap - regmap supporting clock
  * @hw:		handle between common and hardware-specific interfaces
  * @regmap:	regmap to use for regmap helpers and/or by providers
+ * @pd:		power domain scaling requirement class
  * @enable_reg: register when using regmap enable/disable ops
  * @enable_mask: mask when using regmap enable/disable ops
  * @enable_is_inverted: flag to indicate set enable_mask bits to disable
  *                      when using clock_enable_regmap and friends APIs.
+ * @rate_max:	maximum clock rate in Hz supported at each power domain.
  */
 struct clk_regmap {
 	struct clk_hw hw;
 	struct regmap *regmap;
+	struct clk_powerdomain_class *pd;
 	unsigned int enable_reg;
 	unsigned int enable_mask;
 	bool enable_is_inverted;
+	unsigned long *rate_max;
 };
 #define to_clk_regmap(_hw) container_of(_hw, struct clk_regmap, hw)
 
diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 39ce64c..b0684bf 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -1,14 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2013-2014, The Linux Foundation. All rights reserved.
- *
- * This software is licensed under the terms of the GNU General Public
- * License version 2, as published by the Free Software Foundation, and
- * may be copied, distributed, and modified under those terms.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
+ * Copyright (c) 2013-2014, 2018, The Linux Foundation. All rights reserved.
  */
 
 #include <linux/export.h>
@@ -20,6 +12,7 @@
 #include <linux/of.h>
 
 #include "common.h"
+#include "clk-pd.h"
 #include "clk-rcg.h"
 #include "clk-regmap.h"
 #include "reset.h"
@@ -263,6 +256,10 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 		if (!rclks[i])
 			continue;
 
+		ret = clk_power_domain_class_init(dev, rclks[i]->pd);
+		if (ret)
+			return ret;
+
 		ret = devm_clk_register_regmap(dev, rclks[i]);
 		if (ret)
 			return ret;
-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
