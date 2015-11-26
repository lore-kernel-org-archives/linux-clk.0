Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 1/6] clk: qcom: gdsc: Add support for hierarchical power domains
Date: Thu, 26 Nov 2015 11:24:52 +0530
Message-Id: <1448517297-32419-2-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1448517297-32419-1-git-send-email-rnayak@codeaurora.org>
References: <1448517297-32419-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Some qcom SoCs' can have hierarchical power domains. Let the gdsc structs
specify the parents (if any) and the driver add genpd subdomains for them.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/qcom/common.c | 14 +++++++++-----
 drivers/clk/qcom/gdsc.c   | 27 +++++++++++++++++++++++++--
 drivers/clk/qcom/gdsc.h   | 17 ++++++++++++-----
 3 files changed, 46 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 8fa4772..cf100f9 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -98,6 +98,7 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 	struct clk **clks;
 	struct qcom_reset_controller *reset;
 	struct qcom_cc *cc;
+	struct gdsc_desc *scd;
 	size_t num_clks = desc->num_clks;
 	struct clk_regmap **rclks = desc->clks;
 
@@ -143,15 +144,18 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 	devm_add_action(dev, qcom_cc_reset_unregister, &reset->rcdev);
 
 	if (desc->gdscs && desc->num_gdscs) {
-		ret = gdsc_register(dev, desc->gdscs, desc->num_gdscs,
-				    &reset->rcdev, regmap);
+		scd = devm_kzalloc(dev, sizeof(*scd), GFP_KERNEL);
+		if (!scd)
+			return -ENOMEM;
+		scd->dev = dev;
+		scd->scs = desc->gdscs;
+		scd->num = desc->num_gdscs;
+		ret = gdsc_register(scd, &reset->rcdev, regmap);
 		if (ret)
 			return ret;
+		devm_add_action(dev, qcom_cc_gdsc_unregister, scd);
 	}
 
-	devm_add_action(dev, qcom_cc_gdsc_unregister, dev);
-
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_cc_really_probe);
diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index da9fad8..a164c38 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -201,11 +201,14 @@ static int gdsc_init(struct gdsc *sc)
 	return 0;
 }
 
-int gdsc_register(struct device *dev, struct gdsc **scs, size_t num,
+int gdsc_register(struct gdsc_desc *desc,
 		  struct reset_controller_dev *rcdev, struct regmap *regmap)
 {
 	int i, ret;
 	struct genpd_onecell_data *data;
+	struct device *dev = desc->dev;
+	struct gdsc **scs = desc->scs;
+	size_t num = desc->num;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -228,10 +231,30 @@ int gdsc_register(struct device *dev, struct gdsc **scs, size_t num,
 		data->domains[i] = &scs[i]->pd;
 	}
 
+	/* Add subdomains */
+	for (i = 0; i < num; i++) {
+		if (!scs[i])
+			continue;
+		if (scs[i]->parent)
+			pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
+	}
+
 	return of_genpd_add_provider_onecell(dev->of_node, data);
 }
 
-void gdsc_unregister(struct device *dev)
+void gdsc_unregister(struct gdsc_desc *desc)
 {
+	int i;
+	struct device *dev = desc->dev;
+	struct gdsc **scs = desc->scs;
+	size_t num = desc->num;
+
+	/* Remove subdomains */
+	for (i = 0; i < num; i++) {
+		if (!scs[i])
+			continue;
+		if (scs[i]->parent)
+			pm_genpd_remove_subdomain(scs[i]->parent, &scs[i]->pd);
+	}
 	of_genpd_del_provider(dev->of_node);
 }
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index 5ded268..4e9dfc1 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -41,6 +41,7 @@ struct reset_controller_dev;
  */
 struct gdsc {
 	struct generic_pm_domain	pd;
+	struct generic_pm_domain	*parent;
 	struct regmap			*regmap;
 	unsigned int			gdscr;
 	unsigned int			*cxcs;
@@ -51,18 +52,24 @@ struct gdsc {
 	unsigned int			reset_count;
 };
 
+struct gdsc_desc {
+	struct device *dev;
+	struct gdsc **scs;
+	size_t num;
+};
+
 #ifdef CONFIG_QCOM_GDSC
-int gdsc_register(struct device *, struct gdsc **, size_t n,
-		  struct reset_controller_dev *, struct regmap *);
-void gdsc_unregister(struct device *);
+int gdsc_register(struct gdsc_desc *desc, struct reset_controller_dev *,
+		  struct regmap *);
+void gdsc_unregister(struct gdsc_desc *desc);
 #else
-static inline int gdsc_register(struct device *d, struct gdsc **g, size_t n,
+static inline int gdsc_register(struct gdsc_desc *desc,
 				struct reset_controller_dev *rcdev,
 				struct regmap *r)
 {
 	return -ENOSYS;
 }
 
-static inline void gdsc_unregister(struct device *d) {};
+static inline void gdsc_unregister(struct gdsc_desc *desc) {};
 #endif /* CONFIG_QCOM_GDSC */
 #endif /* __QCOM_GDSC_H__ */
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
