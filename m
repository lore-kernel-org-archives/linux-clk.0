Return-Path: <xuejiancheng@hisilicon.com>
From: Jiancheng Xue <xuejiancheng@hisilicon.com>
To: <mturquette@baylibre.com>, <sboyd@codeaurora.org>,
        <p.zabel@pengutronix.de>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <yanhaifeng@hisilicon.com>, <haojian.zhuang@linaro.org>,
        <zhangfei.gao@linaro.org>, <xuwei5@hisilicon.com>,
        <yanghongwei@hisilicon.com>,
        Jiancheng Xue <xuejiancheng@hisilicon.com>
Subject: [PATCH v2 3/5] clk: hisilicon: add error processing for hisi_clk_register_* functions
Date: Fri, 13 May 2016 10:05:53 +0800
Message-ID: <1463105155-20385-4-git-send-email-xuejiancheng@hisilicon.com>
In-Reply-To: <1463105155-20385-1-git-send-email-xuejiancheng@hisilicon.com>
References: <1463105155-20385-1-git-send-email-xuejiancheng@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Add error processing for hisi_clk_register_* functions.

Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
---
 drivers/clk/hisilicon/clk.c | 60 +++++++++++++++++++++++++++++++++++++--------
 drivers/clk/hisilicon/clk.h | 10 ++++----
 2 files changed, 55 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/hisilicon/clk.c b/drivers/clk/hisilicon/clk.c
index 78675d1..9ba2d91 100644
--- a/drivers/clk/hisilicon/clk.c
+++ b/drivers/clk/hisilicon/clk.c
@@ -102,7 +102,7 @@ err:
 }
 EXPORT_SYMBOL_GPL(hisi_clk_init);
 
-void hisi_clk_register_fixed_rate(const struct hisi_fixed_rate_clock *clks,
+int hisi_clk_register_fixed_rate(const struct hisi_fixed_rate_clock *clks,
 					 int nums, struct hisi_clock_data *data)
 {
 	struct clk *clk;
@@ -116,14 +116,22 @@ void hisi_clk_register_fixed_rate(const struct hisi_fixed_rate_clock *clks,
 		if (IS_ERR(clk)) {
 			pr_err("%s: failed to register clock %s\n",
 			       __func__, clks[i].name);
-			continue;
+			goto err;
 		}
 		data->clk_data.clks[clks[i].id] = clk;
 	}
+
+	return 0;
+
+err:
+	while (i--)
+		clk_unregister_fixed_rate(data->clk_data.clks[clks[i].id]);
+
+	return PTR_ERR(clk);
 }
 EXPORT_SYMBOL_GPL(hisi_clk_register_fixed_rate);
 
-void hisi_clk_register_fixed_factor(const struct hisi_fixed_factor_clock *clks,
+int hisi_clk_register_fixed_factor(const struct hisi_fixed_factor_clock *clks,
 					   int nums,
 					   struct hisi_clock_data *data)
 {
@@ -138,14 +146,22 @@ void hisi_clk_register_fixed_factor(const struct hisi_fixed_factor_clock *clks,
 		if (IS_ERR(clk)) {
 			pr_err("%s: failed to register clock %s\n",
 			       __func__, clks[i].name);
-			continue;
+			goto err;
 		}
 		data->clk_data.clks[clks[i].id] = clk;
 	}
+
+	return 0;
+
+err:
+	while (i--)
+		clk_unregister_fixed_factor(data->clk_data.clks[clks[i].id]);
+
+	return PTR_ERR(clk);
 }
 EXPORT_SYMBOL_GPL(hisi_clk_register_fixed_factor);
 
-void hisi_clk_register_mux(const struct hisi_mux_clock *clks,
+int hisi_clk_register_mux(const struct hisi_mux_clock *clks,
 				  int nums, struct hisi_clock_data *data)
 {
 	struct clk *clk;
@@ -164,7 +180,7 @@ void hisi_clk_register_mux(const struct hisi_mux_clock *clks,
 		if (IS_ERR(clk)) {
 			pr_err("%s: failed to register clock %s\n",
 			       __func__, clks[i].name);
-			continue;
+			goto err;
 		}
 
 		if (clks[i].alias)
@@ -172,10 +188,18 @@ void hisi_clk_register_mux(const struct hisi_mux_clock *clks,
 
 		data->clk_data.clks[clks[i].id] = clk;
 	}
+
+	return 0;
+
+err:
+	while (i--)
+		clk_unregister_mux(data->clk_data.clks[clks[i].id]);
+
+	return PTR_ERR(clk);
 }
 EXPORT_SYMBOL_GPL(hisi_clk_register_mux);
 
-void hisi_clk_register_divider(const struct hisi_divider_clock *clks,
+int hisi_clk_register_divider(const struct hisi_divider_clock *clks,
 				      int nums, struct hisi_clock_data *data)
 {
 	struct clk *clk;
@@ -194,7 +218,7 @@ void hisi_clk_register_divider(const struct hisi_divider_clock *clks,
 		if (IS_ERR(clk)) {
 			pr_err("%s: failed to register clock %s\n",
 			       __func__, clks[i].name);
-			continue;
+			goto err;
 		}
 
 		if (clks[i].alias)
@@ -202,10 +226,18 @@ void hisi_clk_register_divider(const struct hisi_divider_clock *clks,
 
 		data->clk_data.clks[clks[i].id] = clk;
 	}
+
+	return 0;
+
+err:
+	while (i--)
+		clk_unregister_divider(data->clk_data.clks[clks[i].id]);
+
+	return PTR_ERR(clk);
 }
 EXPORT_SYMBOL_GPL(hisi_clk_register_divider);
 
-void hisi_clk_register_gate(const struct hisi_gate_clock *clks,
+int hisi_clk_register_gate(const struct hisi_gate_clock *clks,
 				       int nums, struct hisi_clock_data *data)
 {
 	struct clk *clk;
@@ -223,7 +255,7 @@ void hisi_clk_register_gate(const struct hisi_gate_clock *clks,
 		if (IS_ERR(clk)) {
 			pr_err("%s: failed to register clock %s\n",
 			       __func__, clks[i].name);
-			continue;
+			goto err;
 		}
 
 		if (clks[i].alias)
@@ -231,6 +263,14 @@ void hisi_clk_register_gate(const struct hisi_gate_clock *clks,
 
 		data->clk_data.clks[clks[i].id] = clk;
 	}
+
+	return 0;
+
+err:
+	while (i--)
+		clk_unregister_gate(data->clk_data.clks[clks[i].id]);
+
+	return PTR_ERR(clk);
 }
 EXPORT_SYMBOL_GPL(hisi_clk_register_gate);
 
diff --git a/drivers/clk/hisilicon/clk.h b/drivers/clk/hisilicon/clk.h
index 5fc644f..2575329 100644
--- a/drivers/clk/hisilicon/clk.h
+++ b/drivers/clk/hisilicon/clk.h
@@ -114,15 +114,15 @@ struct clk *hi6220_register_clkdiv(struct device *dev, const char *name,
 
 struct hisi_clock_data *hisi_clk_alloc(struct platform_device *, int);
 struct hisi_clock_data *hisi_clk_init(struct device_node *, int);
-void hisi_clk_register_fixed_rate(const struct hisi_fixed_rate_clock *,
+int hisi_clk_register_fixed_rate(const struct hisi_fixed_rate_clock *,
 				int, struct hisi_clock_data *);
-void hisi_clk_register_fixed_factor(const struct hisi_fixed_factor_clock *,
+int hisi_clk_register_fixed_factor(const struct hisi_fixed_factor_clock *,
 				int, struct hisi_clock_data *);
-void hisi_clk_register_mux(const struct hisi_mux_clock *, int,
+int hisi_clk_register_mux(const struct hisi_mux_clock *, int,
 				struct hisi_clock_data *);
-void hisi_clk_register_divider(const struct hisi_divider_clock *,
+int hisi_clk_register_divider(const struct hisi_divider_clock *,
 				int, struct hisi_clock_data *);
-void hisi_clk_register_gate(const struct hisi_gate_clock *,
+int hisi_clk_register_gate(const struct hisi_gate_clock *,
 				int, struct hisi_clock_data *);
 void hisi_clk_register_gate_sep(const struct hisi_gate_clock *,
 				int, struct hisi_clock_data *);
-- 
1.9.1
