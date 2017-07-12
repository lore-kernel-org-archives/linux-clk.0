Return-Path: <bjorn.andersson@linaro.org>
Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	linux-clk@vger.kernel.org (open list:CLK API),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] clk: Provide bulk prepare_enable disable_unprepare variants
Date: Wed, 12 Jul 2017 15:04:16 -0700
Message-Id: <20170712220416.31785-1-bjorn.andersson@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

This extends the existing set of bulk helpers with prepare_enable and
disable_unprepare variants.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 include/linux/clk.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/linux/clk.h b/include/linux/clk.h
index 91bd464f4c9b..12c96d94d1fa 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -657,6 +657,28 @@ static inline void clk_disable_unprepare(struct clk *clk)
 	clk_unprepare(clk);
 }
 
+static inline int clk_bulk_prepare_enable(int num_clks,
+					  struct clk_bulk_data *clks)
+{
+	int ret;
+
+	ret = clk_bulk_prepare(num_clks, clks);
+	if (ret)
+		return ret;
+	ret = clk_bulk_enable(num_clks, clks);
+	if (ret)
+		clk_bulk_unprepare(num_clks, clks);
+
+	return ret;
+}
+
+static inline void clk_bulk_disable_unprepare(int num_clks,
+					      struct clk_bulk_data *clks)
+{
+	clk_bulk_disable(num_clks, clks);
+	clk_bulk_unprepare(num_clks, clks);
+}
+
 #if defined(CONFIG_OF) && defined(CONFIG_COMMON_CLK)
 struct clk *of_clk_get(struct device_node *np, int index);
 struct clk *of_clk_get_by_name(struct device_node *np, const char *name);
-- 
2.12.0
