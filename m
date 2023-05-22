Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7EE8C7EE2D
	for <linux-clk@archiver.kernel.org>; Mon, 22 May 2023 06:32:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjEVGcX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 May 2023 02:32:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbjEVGcW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 May 2023 02:32:22 -0400
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11EABDB;
        Sun, 21 May 2023 23:32:16 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34M6W1jO087189;
        Mon, 22 May 2023 01:32:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1684737121;
        bh=ogPbVDCU54/sxqzMwna8jLDsQGKPOdbkB99e+HaBCQ8=;
        h=From:Date:Subject:References:In-Reply-To:To:CC;
        b=rZuRqLUQ29HStom512qOF1e4EuF0Ll9yIEbWvY8R3rdecptjeWXbAJuqSbO8jPPCG
         iQ+OOKOt//32nm+o+VtryHJXuOyL2Wv8otVYpGJk1xv/ThTVaiDTHoCb3xJX3iCtsj
         7Q6xvX5aCZXKhSBckC5Yz6TG7vr4mZCV6GbUdluY=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34M6W1L1112686
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 22 May 2023 01:32:01 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 May 2023 01:32:01 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 May 2023 01:32:01 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34M6W05T014378;
        Mon, 22 May 2023 01:32:01 -0500
From:   Jai Luthra <j-luthra@ti.com>
Date:   Mon, 22 May 2023 12:01:56 +0530
Subject: [PATCH v2 2/2] clk: keystone: syscon-clk: Add support for audio
 refclk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230515-refclk-v2-2-fc9ff08826f5@ti.com>
References: <20230515-refclk-v2-0-fc9ff08826f5@ti.com>
In-Reply-To: <20230515-refclk-v2-0-fc9ff08826f5@ti.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4211; i=j-luthra@ti.com;
 h=from:subject:message-id; bh=1OzTfUSpjR4REarTZh76zHNZ7RzUS4w0+ba0D9vqK7s=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBkawxfQnHmMzLFiY78JW5j1v1AX7PO7magNPFId
 Js5a0KWrAmJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZGsMXwAKCRBD3pH5JJpx
 RVUWD/9rUv52D/C/WSBmzCrn3o3TtU7wabRaGg62QL9M5tP4DgOkhKMCM1wKYxSI8TiNi5UC+Ri
 0K3h17r53i5yW90bJ7/mp47+PpL2VNm3Ag/VKQx7YwiUkUIj28xhySmg9yFH93PJmcSHh5fSLD/
 tPzfAGY/6VvzHk6KB4v8XNh6kjs7hXbDG5FxQbW/gqxcbSro7Jlg0n9ZPImc/qXHHt7k5tjkh/t
 mhZ6LSOA90szKELTbUaqjhGJ1zO3HypQZ1Mpw08Y0twBsdJS/qEcAzDrhSUFYcCRa3pctEddg+z
 Fvo05WuQ0UUFuH0KZZTKOR2qyWvLG2vnhf66z/3eoSxtQ50PPUtKvAoHLvz51NBmpro2Vkm5mjt
 cE8a0GaoZccX2yUxJE9iPLtRPiORHkkhyUPwVxfX5fbBQTWUFZmGx0hY7sgfw2QDstKT6KHxn5E
 dGmBORWKymb1NNk/pntzpsoU1f/Mn4nMcYhaTY101FU5CUIi1ritqYiFFJEDaMJ6Enl47f7g3MK
 Y+jLCstgVCftzoxE2VDLQmLtL617LiUvmeyo4YFCnIbL/VT/rPqeUOd+nF0o4BmvjnWotPSCQqy
 jz297uHYGBVp3pmnpwx4uHVna8mzsIP1/JIb5d8cYG9GfoZje3+RCENfXh1xyx9mJU4zjUcbyiU
 Z5+/YqdjUXKCCIw==
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
 drivers/clk/keystone/syscon-clk.c | 43 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/keystone/syscon-clk.c b/drivers/clk/keystone/syscon-clk.c
index bd5cec0bd12d..7f686c12a109 100644
--- a/drivers/clk/keystone/syscon-clk.c
+++ b/drivers/clk/keystone/syscon-clk.c
@@ -61,21 +61,31 @@ static const struct clk_ops ti_syscon_gate_clk_ops = {
 
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
@@ -83,6 +93,10 @@ static struct clk_hw
 	priv->hw.init = &init;
 
 	ret = devm_clk_hw_register(dev, &priv->hw);
+
+	if (name)
+		kfree(init.name);
+
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -94,8 +108,9 @@ static int ti_syscon_gate_clk_probe(struct platform_device *pdev)
 	const struct ti_syscon_gate_clk_data *data, *p;
 	struct clk_hw_onecell_data *hw_data;
 	struct device *dev = &pdev->dev;
+	int num_clks, num_parents, i;
+	const char *parent_name;
 	struct regmap *regmap;
-	int num_clks, i;
 
 	data = device_get_match_data(dev);
 	if (!data)
@@ -110,6 +125,13 @@ static int ti_syscon_gate_clk_probe(struct platform_device *pdev)
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
@@ -117,8 +139,10 @@ static int ti_syscon_gate_clk_probe(struct platform_device *pdev)
 
 	hw_data->num = num_clks;
 
+	parent_name = of_clk_get_parent_name(dev->of_node, 0);
 	for (i = 0; i < num_clks; i++) {
 		hw_data->hws[i] = ti_syscon_gate_clk_register(dev, regmap,
+							      parent_name,
 							      &data[i]);
 		if (IS_ERR(hw_data->hws[i]))
 			dev_warn(dev, "failed to register %s\n",
@@ -166,6 +190,11 @@ static const struct ti_syscon_gate_clk_data am62_clk_data[] = {
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
@@ -179,6 +208,10 @@ static const struct of_device_id ti_syscon_gate_clk_ids[] = {
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
2.40.1

