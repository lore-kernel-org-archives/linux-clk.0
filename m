Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E19A2EB64DC
	for <linux-clk@archiver.kernel.org>; Thu, 15 Jun 2023 12:02:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344693AbjFOMCE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Jun 2023 08:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344684AbjFOMBr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 15 Jun 2023 08:01:47 -0400
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D155330EA;
        Thu, 15 Jun 2023 04:56:50 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35FBuhOe086497;
        Thu, 15 Jun 2023 06:56:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1686830203;
        bh=qomwGudXqU8u2dCCqjZr/S7+LgN8kxTz9m8PzXPb+zg=;
        h=From:Date:Subject:References:In-Reply-To:To:CC;
        b=ibpr8ZCb5Env4vzevgyD4MpSKS2XYJKiX4hVUdi0viJgzPx3O3VQQs6DVd9paGUtV
         Y+uq26b7iJNY0evZ4MGbGr3kqHDcxDMp29g8SJWUQZfULcob2+JFZtvDHW1gFVOZT9
         GYAsZ2KlAAvY5+sd2qHshkJc+gpR/nGVou30zaKE=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35FBuhuL080535
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 15 Jun 2023 06:56:43 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Jun 2023 06:56:42 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Jun 2023 06:56:42 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35FBugTh002023;
        Thu, 15 Jun 2023 06:56:42 -0500
From:   Jai Luthra <j-luthra@ti.com>
Date:   Thu, 15 Jun 2023 17:25:36 +0530
Subject: [PATCH v3 2/2] clk: keystone: syscon-clk: Add support for audio
 refclk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230515-refclk-v3-2-37c0b550f406@ti.com>
References: <20230515-refclk-v3-0-37c0b550f406@ti.com>
In-Reply-To: <20230515-refclk-v3-0-37c0b550f406@ti.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>
CC:     Vignesh Raghavendra <vigneshr@ti.com>, Andrew Davis <afd@ti.com>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Jai Luthra <j-luthra@ti.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4511; i=j-luthra@ti.com;
 h=from:subject:message-id; bh=aXX5Y52h5kNHxME7gJtDWJYnpKWKJmaU80P5vBuWNYo=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBkivx4WhsqIOJTkWUzYotuipsajHTOEF3z7JgKK
 HRCuctNnUOJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZIr8eAAKCRBD3pH5JJpx
 RbXSD/0WSikZXm55sBRaxLwJraqF1Rzo2i5uBodRi1AAXrlahgenCmskTF0ItYJgHxE9dUwSoN2
 SLVIWgXwgYrGFY+YLhRCsYRAcKCT/5GfO9QavLKMmHUhNIAq3+LxF/pLj88bbex4Tvd7/qwQQw1
 8tke3LplyXnRfYkwFMTb072TGM8XZEwKlmQeI9anwH+ZGaT9gnAaLttoBjm2EHJJcIBDkBTSy2G
 2nodUBWx/R/s6XySSHH1sX8r72tZgr6GLXyzBVLStLBu7sXW5RyuRrMP41nJvrmiN8p/5mxvfCb
 RjAOAjInxP68fJoex5OX7YY5ZujOLaizsBgDCVsbkRQhoOwRAI0vUUcJn0uvwC3yUrIIuHiz51G
 0dYRMz7QqLov3c6sw00ePJgvWiVdEtd6c5w9aAnQc4aGdcZFVZo8AxDhPR8MBElMXoir9YwwnAQ
 /ea/lazKeZFm60MhXE7k91Tq51P5jsrm7rmRK+ldWfL7WQ6Pv+Fa0aA3dF0lQGgQHyNjXUrR01O
 jfFzSvf9rhaiC9W8UoDPpKjcKsgiDiTTotzAZkKYvR+CHCgWX8WIjL3ZGg4toUXBnIVQT1otsoS
 Hx3a5C+MukBtYkTysU+QrA/CDb5TNiNCRQNGd39EmZ1997c4n73kZTRA76iXVanCSjKXuWXiXvh
 xPzA6ORChbthXFQ==
X-Developer-Key: i=j-luthra@ti.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

TI's AM62 SoC can optionally provide two audio reference clocks
(AUDIO_REFCLKx) to external peripherals.

By default this reference clock is looped-back inside the SoC to a mux
that goes to McASP AHCLK, but can optionally be enabled as an output to
peripherals outside the SoC by setting a bit through CTRL_MMR registers.

This bit only controls the direction of the clock, while the parent
is a muxed input from sci-clk [1] which may be a configurable PLL or a
master clock from one of the McASP instances.

Link: http://downloads.ti.com/tisci/esd/latest/5_soc_doc/am62x/clocks.html#clocks-for-board0-device [1]
Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 drivers/clk/keystone/syscon-clk.c | 45 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/keystone/syscon-clk.c b/drivers/clk/keystone/syscon-clk.c
index bd5cec0bd12d..d33f74119488 100644
--- a/drivers/clk/keystone/syscon-clk.c
+++ b/drivers/clk/keystone/syscon-clk.c
@@ -4,10 +4,12 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/slab.h>
 
 struct ti_syscon_gate_clk_priv {
 	struct clk_hw hw;
@@ -61,21 +63,31 @@ static const struct clk_ops ti_syscon_gate_clk_ops = {
 
 static struct clk_hw
 *ti_syscon_gate_clk_register(struct device *dev, struct regmap *regmap,
+			     const char *parent_name,
 			     const struct ti_syscon_gate_clk_data *data)
 {
 	struct ti_syscon_gate_clk_priv *priv;
 	struct clk_init_data init;
+	char *name = NULL;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return ERR_PTR(-ENOMEM);
 
-	init.name = data->name;
 	init.ops = &ti_syscon_gate_clk_ops;
-	init.parent_names = NULL;
-	init.num_parents = 0;
-	init.flags = 0;
+	if (parent_name) {
+		name = kasprintf(GFP_KERNEL, "%s:%s", data->name, parent_name);
+		init.name = name;
+		init.parent_names = &parent_name;
+		init.num_parents = 1;
+		init.flags = CLK_SET_RATE_PARENT;
+	} else {
+		init.name = data->name;
+		init.parent_names = NULL;
+		init.num_parents = 0;
+		init.flags = 0;
+	}
 
 	priv->regmap = regmap;
 	priv->reg = data->offset;
@@ -83,6 +95,10 @@ static struct clk_hw
 	priv->hw.init = &init;
 
 	ret = devm_clk_hw_register(dev, &priv->hw);
+
+	if (name)
+		kfree(init.name);
+
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -94,8 +110,9 @@ static int ti_syscon_gate_clk_probe(struct platform_device *pdev)
 	const struct ti_syscon_gate_clk_data *data, *p;
 	struct clk_hw_onecell_data *hw_data;
 	struct device *dev = &pdev->dev;
+	int num_clks, num_parents, i;
+	const char *parent_name;
 	struct regmap *regmap;
-	int num_clks, i;
 
 	data = device_get_match_data(dev);
 	if (!data)
@@ -110,6 +127,13 @@ static int ti_syscon_gate_clk_probe(struct platform_device *pdev)
 	for (p = data; p->name; p++)
 		num_clks++;
 
+	num_parents = of_clk_get_parent_count(dev->of_node);
+	if (of_device_is_compatible(dev->of_node, "ti,am62-audio-refclk") &&
+	    num_parents == 0) {
+		return dev_err_probe(dev, -EINVAL,
+				     "must specify a parent clock\n");
+	}
+
 	hw_data = devm_kzalloc(dev, struct_size(hw_data, hws, num_clks),
 			       GFP_KERNEL);
 	if (!hw_data)
@@ -117,8 +141,10 @@ static int ti_syscon_gate_clk_probe(struct platform_device *pdev)
 
 	hw_data->num = num_clks;
 
+	parent_name = of_clk_get_parent_name(dev->of_node, 0);
 	for (i = 0; i < num_clks; i++) {
 		hw_data->hws[i] = ti_syscon_gate_clk_register(dev, regmap,
+							      parent_name,
 							      &data[i]);
 		if (IS_ERR(hw_data->hws[i]))
 			dev_warn(dev, "failed to register %s\n",
@@ -166,6 +192,11 @@ static const struct ti_syscon_gate_clk_data am62_clk_data[] = {
 	{ /* Sentinel */ },
 };
 
+static const struct ti_syscon_gate_clk_data am62_audio_clk_data[] = {
+	TI_SYSCON_CLK_GATE("audio_refclk", 0x0, 15),
+	{ /* Sentinel */ },
+};
+
 static const struct of_device_id ti_syscon_gate_clk_ids[] = {
 	{
 		.compatible = "ti,am654-ehrpwm-tbclk",
@@ -179,6 +210,10 @@ static const struct of_device_id ti_syscon_gate_clk_ids[] = {
 		.compatible = "ti,am62-epwm-tbclk",
 		.data = &am62_clk_data,
 	},
+	{
+		.compatible = "ti,am62-audio-refclk",
+		.data = &am62_audio_clk_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ti_syscon_gate_clk_ids);

-- 
2.41.0

