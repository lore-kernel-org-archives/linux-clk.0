Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F750C77B75
	for <linux-clk@archiver.kernel.org>; Wed, 17 May 2023 07:35:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230101AbjEQHfT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 May 2023 03:35:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbjEQHem (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 May 2023 03:34:42 -0400
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D00D49C8;
        Wed, 17 May 2023 00:34:30 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34H7YJFK012002;
        Wed, 17 May 2023 02:34:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1684308859;
        bh=SurKxmYjN5Bv7FmjQikKSl/trg/4aPhCBp9rmv79JmI=;
        h=From:Date:Subject:References:In-Reply-To:To:CC;
        b=ViK5qqhfTo6ZKjTvWhw6dJoORtpi2xCh/7j6rZdL/cJxGamiXUDtnJAE51Y5Rd6m3
         Lz+heXplxcyWMCpQY5JSSuXZuGqnUQshZX9LTkKCb8JFI6EYqhRJ6GPqs9GLFnmuLF
         T+WUYpLiwwqFJtw8kMwo5DF47v8Q8O7U00ZvfD9I=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34H7YJAk022103
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 17 May 2023 02:34:19 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 17
 May 2023 02:34:19 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 17 May 2023 02:34:19 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34H7YIgY004132;
        Wed, 17 May 2023 02:34:19 -0500
From:   Jai Luthra <j-luthra@ti.com>
Date:   Wed, 17 May 2023 13:04:06 +0530
Subject: [PATCH 2/2] clk: keystone: syscon-clk: Add support for audio
 refclk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230515-refclk-v1-2-5e89f01d6733@ti.com>
References: <20230515-refclk-v1-0-5e89f01d6733@ti.com>
In-Reply-To: <20230515-refclk-v1-0-5e89f01d6733@ti.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>
CC:     Vignesh Raghavendra <vigneshr@ti.com>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Jai Luthra <j-luthra@ti.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4225; i=j-luthra@ti.com;
 h=from:subject:message-id; bh=X8TcJviMlXnmqvG67lFDb/1YxmPAbeMa3ngfvAcRa4M=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBkZIN4jhDdYp7be+1izoE0oUrWI9LGpHFhn+e4H
 XfZVuDuWG6JAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZGSDeAAKCRBD3pH5JJpx
 RatlD/0d1olmmGG8RIQEyq4cYZGobCiJ9e+qReZzryBBQUL/hzNbUAGxISQZbn4btCNJ9UgFhut
 P11PO2ba2pDpg09cSybZiadP+pc8/24BVYg7GOgUPQOBnKNvOBQdzs56TdwV3tadtYMp+q1omNx
 vD2dbrdDq+c/prlzJECitBQbQrBRFWdg2qKpuiuyZEehVT+qyMfULW8Hkb9j8HIT8Pn79xGih4Z
 r5Omu8NL7W3TFtn9NzxpJ+kCI4XTWbPxqZp8c4R5Tfqx1agDRXiBhI9gd+8faaXClp+zD6NcXBY
 7ZS8VsSG0Bc/Kufr4HmwXWNXX4OOHPbIxMUgvLziZHED8PUOm8RJst6FMeoizyVUyeqsk0E25OA
 mqH2z2jneWUQfVe4bACNIJhX6sNLVcxqMDjkK1UQ987F2utf0tFEeWISMGmK8fKNveNxeobmSCY
 DIBT/h25rj9IkPhFBi445roWt65dD0pkFPJweCVJkWPFjBogpaSHW4rVPKD1R/7yhm8rNyT3pyk
 MxWgLEqH4qtkyhNK8vw8TN2nTqZyvFg5Aj5p3g3zsD+OT0ZNixVHbgBv4KzS3dTCmJbl3rkXdRN
 PSPiChuWTFYSwGuxXF5KNyPVR+SHufm9GMVef8KqUj1EtgivhWObiSd+W5sYP9mQMlSOmVFhpEO
 cot0UpmyWxuSZrA==
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
peripherals outside the SoC by setting a bit through the syscon
(CTRL_MMR) registers.

This bit only controls the direction of the clock, while the parent
is a muxed input from sci-clk [1] which may be a configurable PLL or a
master clock from one of the McASP instances.

Link: http://downloads.ti.com/tisci/esd/latest/5_soc_doc/am62x/clocks.html#clocks-for-board0-device [1]
Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 drivers/clk/keystone/syscon-clk.c | 43 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/keystone/syscon-clk.c b/drivers/clk/keystone/syscon-clk.c
index 5d7cc83682da..9f9ba7420756 100644
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

