Return-Path: <SRS0=4m2Q=TA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C42B8C43219
	for <linux-clk@archiver.kernel.org>; Tue, 30 Apr 2019 14:44:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 956FA2147A
	for <linux-clk@archiver.kernel.org>; Tue, 30 Apr 2019 14:44:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726218AbfD3OoU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Apr 2019 10:44:20 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:60286 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726053AbfD3OoU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 Apr 2019 10:44:20 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x3UEYdu6014852;
        Tue, 30 Apr 2019 09:44:17 -0500
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail2.cirrus.com (mail2.cirrus.com [141.131.128.20])
        by mx0a-001ae601.pphosted.com with ESMTP id 2s4mg1mba1-1;
        Tue, 30 Apr 2019 09:44:17 -0500
Received: from EDIEX02.ad.cirrus.com (unknown [198.61.84.81])
        by mail2.cirrus.com (Postfix) with ESMTP id 84A99605A6AC;
        Tue, 30 Apr 2019 09:44:16 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 30 Apr
 2019 15:44:13 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Tue, 30 Apr 2019 15:44:13 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0FFB745;
        Tue, 30 Apr 2019 15:44:13 +0100 (BST)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <sboyd@kernel.org>
CC:     <mturquette@baylibre.com>, <linux-clk@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 2/2] clk: lochnagar: Use new parent_data approach to register clock parents
Date:   Tue, 30 Apr 2019 15:44:12 +0100
Message-ID: <20190430144412.20950-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190430144412.20950-1-ckeepax@opensource.cirrus.com>
References: <20190430144412.20950-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1904300092
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Switch over to the more modern style of registering parents and simplify
the code in the process.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/clk/clk-lochnagar.c | 192 ++++++++++++++++++--------------------------
 1 file changed, 76 insertions(+), 116 deletions(-)

diff --git a/drivers/clk/clk-lochnagar.c b/drivers/clk/clk-lochnagar.c
index ced832e82f46b..58576db6e31a3 100644
--- a/drivers/clk/clk-lochnagar.c
+++ b/drivers/clk/clk-lochnagar.c
@@ -42,46 +42,45 @@ struct lochnagar_clk_priv {
 	struct regmap *regmap;
 	enum lochnagar_type type;
 
-	const char **parents;
-	unsigned int nparents;
-
 	struct lochnagar_clk lclks[LOCHNAGAR_NUM_CLOCKS];
 };
 
-static const char * const lochnagar1_clk_parents[] = {
-	"ln-none",
-	"ln-spdif-mclk",
-	"ln-psia1-mclk",
-	"ln-psia2-mclk",
-	"ln-cdc-clkout",
-	"ln-dsp-clkout",
-	"ln-pmic-32k",
-	"ln-gf-mclk1",
-	"ln-gf-mclk3",
-	"ln-gf-mclk2",
-	"ln-gf-mclk4",
+#define LN_PARENT(NAME) { .name = NAME, .fw_name = NAME }
+
+static const struct clk_parent_data lochnagar1_clk_parents[] = {
+	LN_PARENT("ln-none"),
+	LN_PARENT("ln-spdif-mclk"),
+	LN_PARENT("ln-psia1-mclk"),
+	LN_PARENT("ln-psia2-mclk"),
+	LN_PARENT("ln-cdc-clkout"),
+	LN_PARENT("ln-dsp-clkout"),
+	LN_PARENT("ln-pmic-32k"),
+	LN_PARENT("ln-gf-mclk1"),
+	LN_PARENT("ln-gf-mclk3"),
+	LN_PARENT("ln-gf-mclk2"),
+	LN_PARENT("ln-gf-mclk4"),
 };
 
-static const char * const lochnagar2_clk_parents[] = {
-	"ln-none",
-	"ln-cdc-clkout",
-	"ln-dsp-clkout",
-	"ln-pmic-32k",
-	"ln-spdif-mclk",
-	"ln-clk-12m",
-	"ln-clk-11m",
-	"ln-clk-24m",
-	"ln-clk-22m",
-	"ln-clk-8m",
-	"ln-usb-clk-24m",
-	"ln-gf-mclk1",
-	"ln-gf-mclk3",
-	"ln-gf-mclk2",
-	"ln-psia1-mclk",
-	"ln-psia2-mclk",
-	"ln-spdif-clkout",
-	"ln-adat-mclk",
-	"ln-usb-clk-12m",
+static const struct clk_parent_data lochnagar2_clk_parents[] = {
+	LN_PARENT("ln-none"),
+	LN_PARENT("ln-cdc-clkout"),
+	LN_PARENT("ln-dsp-clkout"),
+	LN_PARENT("ln-pmic-32k"),
+	LN_PARENT("ln-spdif-mclk"),
+	LN_PARENT("ln-clk-12m"),
+	LN_PARENT("ln-clk-11m"),
+	LN_PARENT("ln-clk-24m"),
+	LN_PARENT("ln-clk-22m"),
+	LN_PARENT("ln-clk-8m"),
+	LN_PARENT("ln-usb-clk-24m"),
+	LN_PARENT("ln-gf-mclk1"),
+	LN_PARENT("ln-gf-mclk3"),
+	LN_PARENT("ln-gf-mclk2"),
+	LN_PARENT("ln-psia1-mclk"),
+	LN_PARENT("ln-psia2-mclk"),
+	LN_PARENT("ln-spdif-clkout"),
+	LN_PARENT("ln-adat-mclk"),
+	LN_PARENT("ln-usb-clk-12m"),
 };
 
 #define LN1_CLK(ID, NAME, REG) \
@@ -183,7 +182,7 @@ static u8 lochnagar_clk_get_parent(struct clk_hw *hw)
 	if (ret < 0) {
 		dev_dbg(priv->dev, "Failed to read parent of %s: %d\n",
 			lclk->name, ret);
-		return priv->nparents;
+		return hw->init->num_parents;
 	}
 
 	val &= lclk->src_mask;
@@ -198,46 +197,6 @@ static const struct clk_ops lochnagar_clk_ops = {
 	.get_parent = lochnagar_clk_get_parent,
 };
 
-static int lochnagar_init_parents(struct lochnagar_clk_priv *priv)
-{
-	struct device_node *np = priv->dev->of_node;
-	int i, j;
-
-	switch (priv->type) {
-	case LOCHNAGAR1:
-		memcpy(priv->lclks, lochnagar1_clks, sizeof(lochnagar1_clks));
-
-		priv->nparents = ARRAY_SIZE(lochnagar1_clk_parents);
-		priv->parents = devm_kmemdup(priv->dev, lochnagar1_clk_parents,
-					     sizeof(lochnagar1_clk_parents),
-					     GFP_KERNEL);
-		break;
-	case LOCHNAGAR2:
-		memcpy(priv->lclks, lochnagar2_clks, sizeof(lochnagar2_clks));
-
-		priv->nparents = ARRAY_SIZE(lochnagar2_clk_parents);
-		priv->parents = devm_kmemdup(priv->dev, lochnagar2_clk_parents,
-					     sizeof(lochnagar2_clk_parents),
-					     GFP_KERNEL);
-		break;
-	default:
-		dev_err(priv->dev, "Unknown Lochnagar type: %d\n", priv->type);
-		return -EINVAL;
-	}
-
-	if (!priv->parents)
-		return -ENOMEM;
-
-	for (i = 0; i < priv->nparents; i++) {
-		j = of_property_match_string(np, "clock-names",
-					     priv->parents[i]);
-		if (j >= 0)
-			priv->parents[i] = of_clk_get_parent_name(np, j);
-	}
-
-	return 0;
-}
-
 static struct clk_hw *
 lochnagar_of_clk_hw_get(struct of_phandle_args *clkspec, void *data)
 {
@@ -252,16 +211,54 @@ lochnagar_of_clk_hw_get(struct of_phandle_args *clkspec, void *data)
 	return &priv->lclks[idx].hw;
 }
 
-static int lochnagar_init_clks(struct lochnagar_clk_priv *priv)
+static const struct of_device_id lochnagar_of_match[] = {
+	{ .compatible = "cirrus,lochnagar1-clk", .data = (void *)LOCHNAGAR1 },
+	{ .compatible = "cirrus,lochnagar2-clk", .data = (void *)LOCHNAGAR2 },
+	{}
+};
+MODULE_DEVICE_TABLE(of, lochnagar_of_match);
+
+static int lochnagar_clk_probe(struct platform_device *pdev)
 {
 	struct clk_init_data clk_init = {
 		.ops = &lochnagar_clk_ops,
-		.parent_names = priv->parents,
-		.num_parents = priv->nparents,
 	};
+	struct device *dev = &pdev->dev;
+	struct lochnagar_clk_priv *priv;
+	const struct of_device_id *of_id;
 	struct lochnagar_clk *lclk;
 	int ret, i;
 
+	of_id = of_match_device(lochnagar_of_match, dev);
+	if (!of_id)
+		return -EINVAL;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	priv->regmap = dev_get_regmap(dev->parent, NULL);
+	priv->type = (enum lochnagar_type)of_id->data;
+
+	switch (priv->type) {
+	case LOCHNAGAR1:
+		memcpy(priv->lclks, lochnagar1_clks, sizeof(lochnagar1_clks));
+
+		clk_init.parent_data = lochnagar1_clk_parents;
+		clk_init.num_parents = ARRAY_SIZE(lochnagar1_clk_parents);
+		break;
+	case LOCHNAGAR2:
+		memcpy(priv->lclks, lochnagar2_clks, sizeof(lochnagar2_clks));
+
+		clk_init.parent_data = lochnagar2_clk_parents;
+		clk_init.num_parents = ARRAY_SIZE(lochnagar2_clk_parents);
+		break;
+	default:
+		dev_err(priv->dev, "Unknown Lochnagar type: %d\n", priv->type);
+		return -EINVAL;
+	}
+
 	for (i = 0; i < ARRAY_SIZE(priv->lclks); i++) {
 		lclk = &priv->lclks[i];
 
@@ -289,43 +286,6 @@ static int lochnagar_init_clks(struct lochnagar_clk_priv *priv)
 	return ret;
 }
 
-static const struct of_device_id lochnagar_of_match[] = {
-	{ .compatible = "cirrus,lochnagar1-clk", .data = (void *)LOCHNAGAR1 },
-	{ .compatible = "cirrus,lochnagar2-clk", .data = (void *)LOCHNAGAR2 },
-	{}
-};
-MODULE_DEVICE_TABLE(of, lochnagar_of_match);
-
-static int lochnagar_clk_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct lochnagar_clk_priv *priv;
-	const struct of_device_id *of_id;
-	int ret;
-
-	of_id = of_match_device(lochnagar_of_match, dev);
-	if (!of_id)
-		return -EINVAL;
-
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	priv->dev = dev;
-	priv->regmap = dev_get_regmap(dev->parent, NULL);
-	priv->type = (enum lochnagar_type)of_id->data;
-
-	ret = lochnagar_init_parents(priv);
-	if (ret)
-		return ret;
-
-	ret = lochnagar_init_clks(priv);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
 static struct platform_driver lochnagar_clk_driver = {
 	.driver = {
 		.name = "lochnagar-clk",
-- 
2.11.0

