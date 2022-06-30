Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B2ABC43334
	for <linux-clk@archiver.kernel.org>; Thu, 30 Jun 2022 14:40:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232029AbiF3Okn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Jun 2022 10:40:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232836AbiF3Okm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Jun 2022 10:40:42 -0400
Received: from m15111.mail.126.com (m15111.mail.126.com [220.181.15.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9F77732F
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 07:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ambHq
        TuI7t0nkqutkBrw5HhFDtmBz1qHDTS8mdo9hH0=; b=SARBA56R4S99mtrWDZjVj
        ERbnSP3qG0UBZoSHuaCl8VwGOHLVbGZpQhYeVSUPoWR2kIJ1pDb6ZnAlYIY91uPu
        No1xPdiFaGHl9iGiaRkaq1tD+BcDSA7keUfu+amJS3s2YX3foXkTdCxjxu0sB1x8
        wFLwMI+V1oSdm037tV1EQQ=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp1 (Coremail) with SMTP id C8mowADnszS1tb1iIvDSFg--.10625S2;
        Thu, 30 Jun 2022 22:39:50 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        claudiu.beznea@microchip.com, linux-clk@vger.kernel.org,
        windhl@126.com
Subject: [PATCH v3] clk: at91: dt-compat: Hold reference returned by  of_get_parent()
Date:   Thu, 30 Jun 2022 22:39:49 +0800
Message-Id: <20220630143949.218922-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8mowADnszS1tb1iIvDSFg--.10625S2
X-Coremail-Antispam: 1Uf129KBjvAXoW3Cry7Ar1UGF43Gr43Xr1UKFg_yoW8JFW8Xo
        W7GF4xWF10kw18tFW5W3sxtF129w1kuryxWa4qkwsF9ayjk345Xr17XF43JFnIqr1fWrZ3
        Zry8tan8GF1UJr1xn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU8Z2-DUUUU
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGg8wF1-HZab3agAAs0
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We need to hold the reference returned by of_get_parent() and use
it to call of_node_put() for refcount balance.

Signed-off-by: Liang He <windhl@126.com>
---
 changelog:

 v3: keep the order of original declarations
 v2: use 'parent_np' to replace 'tp' and use xx:yy:zz title format
 v1: hold references returned by of_get_parent() and put them


 drivers/clk/at91/dt-compat.c | 108 +++++++++++++++++++++++++++--------
 1 file changed, 84 insertions(+), 24 deletions(-)

diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index 8ca8bcacf66d..85a964cb2d89 100644
--- a/drivers/clk/at91/dt-compat.c
+++ b/drivers/clk/at91/dt-compat.c
@@ -33,8 +33,11 @@ static void __init of_sama5d2_clk_audio_pll_frac_setup(struct device_node *np)
 	const char *name = np->name;
 	const char *parent_name;
 	struct regmap *regmap;
+	struct device_node *parent_np;
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	parent_np = of_get_parent(np);
+	regmap = syscon_node_to_regmap(parent_np);
+	of_node_put(parent_np);
 	if (IS_ERR(regmap))
 		return;
 
@@ -56,8 +59,11 @@ static void __init of_sama5d2_clk_audio_pll_pad_setup(struct device_node *np)
 	const char *name = np->name;
 	const char *parent_name;
 	struct regmap *regmap;
+	struct device_node *parent_np;
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	parent_np = of_get_parent(np);
+	regmap = syscon_node_to_regmap(parent_np);
+	of_node_put(parent_np);
 	if (IS_ERR(regmap))
 		return;
 
@@ -79,8 +85,11 @@ static void __init of_sama5d2_clk_audio_pll_pmc_setup(struct device_node *np)
 	const char *name = np->name;
 	const char *parent_name;
 	struct regmap *regmap;
+	struct device_node *parent_np;
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	parent_np = of_get_parent(np);
+	regmap = syscon_node_to_regmap(parent_np);
+	of_node_put(parent_np);
 	if (IS_ERR(regmap))
 		return;
 
@@ -120,7 +129,7 @@ static void __init of_sama5d2_clk_generated_setup(struct device_node *np)
 	struct clk_hw *hw;
 	unsigned int num_parents;
 	const char *parent_names[GENERATED_SOURCE_MAX];
-	struct device_node *gcknp;
+	struct device_node *gcknp, *parent_np;
 	struct clk_range range = CLK_RANGE(0, 0);
 	struct regmap *regmap;
 
@@ -134,7 +143,9 @@ static void __init of_sama5d2_clk_generated_setup(struct device_node *np)
 	if (!num || num > PERIPHERAL_MAX)
 		return;
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	parent_np = of_get_parent(np);
+	regmap = syscon_node_to_regmap(parent_np);
+	of_node_put(parent_np);
 	if (IS_ERR(regmap))
 		return;
 
@@ -180,8 +191,11 @@ static void __init of_sama5d4_clk_h32mx_setup(struct device_node *np)
 	const char *name = np->name;
 	const char *parent_name;
 	struct regmap *regmap;
+	struct device_node *parent_np;
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	parent_np = of_get_parent(np);
+	regmap = syscon_node_to_regmap(parent_np);
+	of_node_put(parent_np);
 	if (IS_ERR(regmap))
 		return;
 
@@ -243,12 +257,15 @@ static void __init of_at91rm9200_clk_main_osc_setup(struct device_node *np)
 	const char *parent_name;
 	struct regmap *regmap;
 	bool bypass;
+	struct device_node *parent_np;
 
 	of_property_read_string(np, "clock-output-names", &name);
 	bypass = of_property_read_bool(np, "atmel,osc-bypass");
 	parent_name = of_clk_get_parent_name(np, 0);
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	parent_np = of_get_parent(np);
+	regmap = syscon_node_to_regmap(parent_np);
+	of_node_put(parent_np);
 	if (IS_ERR(regmap))
 		return;
 
@@ -268,12 +285,15 @@ static void __init of_at91sam9x5_clk_main_rc_osc_setup(struct device_node *np)
 	u32 accuracy = 0;
 	const char *name = np->name;
 	struct regmap *regmap;
+	struct device_node *parent_np;
 
 	of_property_read_string(np, "clock-output-names", &name);
 	of_property_read_u32(np, "clock-frequency", &frequency);
 	of_property_read_u32(np, "clock-accuracy", &accuracy);
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	parent_np = of_get_parent(np);
+	regmap = syscon_node_to_regmap(parent_np);
+	of_node_put(parent_np);
 	if (IS_ERR(regmap))
 		return;
 
@@ -292,11 +312,14 @@ static void __init of_at91rm9200_clk_main_setup(struct device_node *np)
 	const char *parent_name;
 	const char *name = np->name;
 	struct regmap *regmap;
+	struct device_node *parent_np;
 
 	parent_name = of_clk_get_parent_name(np, 0);
 	of_property_read_string(np, "clock-output-names", &name);
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	parent_np = of_get_parent(np);
+	regmap = syscon_node_to_regmap(parent_np);
+	of_node_put(parent_np);
 	if (IS_ERR(regmap))
 		return;
 
@@ -316,13 +339,16 @@ static void __init of_at91sam9x5_clk_main_setup(struct device_node *np)
 	unsigned int num_parents;
 	const char *name = np->name;
 	struct regmap *regmap;
+	struct device_node *parent_np;
 
 	num_parents = of_clk_get_parent_count(np);
 	if (num_parents == 0 || num_parents > 2)
 		return;
 
 	of_clk_parent_fill(np, parent_names, num_parents);
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	parent_np = of_get_parent(np);
+	regmap = syscon_node_to_regmap(parent_np);
+	of_node_put(parent_np);
 	if (IS_ERR(regmap))
 		return;
 
@@ -373,6 +399,7 @@ of_at91_clk_master_setup(struct device_node *np,
 	const char *name = np->name;
 	struct clk_master_characteristics *characteristics;
 	struct regmap *regmap;
+	struct device_node *parent_np;
 
 	num_parents = of_clk_get_parent_count(np);
 	if (num_parents == 0 || num_parents > MASTER_SOURCE_MAX)
@@ -386,7 +413,9 @@ of_at91_clk_master_setup(struct device_node *np,
 	if (!characteristics)
 		return;
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	parent_np = of_get_parent(np);
+	regmap = syscon_node_to_regmap(parent_np);
+	of_node_put(parent_np);
 	if (IS_ERR(regmap))
 		return;
 
@@ -433,6 +462,7 @@ of_at91_clk_periph_setup(struct device_node *np, u8 type)
 	const char *name;
 	struct device_node *periphclknp;
 	struct regmap *regmap;
+	struct device_node *parent_np;
 
 	parent_name = of_clk_get_parent_name(np, 0);
 	if (!parent_name)
@@ -442,7 +472,9 @@ of_at91_clk_periph_setup(struct device_node *np, u8 type)
 	if (!num || num > PERIPHERAL_MAX)
 		return;
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	parent_np = of_get_parent(np);
+	regmap = syscon_node_to_regmap(parent_np);
+	of_node_put(parent_np);
 	if (IS_ERR(regmap))
 		return;
 
@@ -601,6 +633,7 @@ of_at91_clk_pll_setup(struct device_node *np,
 	struct regmap *regmap;
 	const char *parent_name;
 	const char *name = np->name;
+	struct device_node *parent_np;
 	struct clk_pll_characteristics *characteristics;
 
 	if (of_property_read_u32(np, "reg", &id))
@@ -610,7 +643,9 @@ of_at91_clk_pll_setup(struct device_node *np,
 
 	of_property_read_string(np, "clock-output-names", &name);
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	parent_np = of_get_parent(np);
+	regmap = syscon_node_to_regmap(parent_np);
+	of_node_put(parent_np);
 	if (IS_ERR(regmap))
 		return;
 
@@ -665,12 +700,15 @@ of_at91sam9x5_clk_plldiv_setup(struct device_node *np)
 	const char *parent_name;
 	const char *name = np->name;
 	struct regmap *regmap;
+	struct device_node *parent_np;
 
 	parent_name = of_clk_get_parent_name(np, 0);
 
 	of_property_read_string(np, "clock-output-names", &name);
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	parent_np = of_get_parent(np);
+	regmap = syscon_node_to_regmap(parent_np);
+	of_node_put(parent_np);
 	if (IS_ERR(regmap))
 		return;
 
@@ -694,7 +732,7 @@ of_at91_clk_prog_setup(struct device_node *np,
 	unsigned int num_parents;
 	const char *parent_names[PROG_SOURCE_MAX];
 	const char *name;
-	struct device_node *progclknp;
+	struct device_node *progclknp, *parent_np;
 	struct regmap *regmap;
 
 	num_parents = of_clk_get_parent_count(np);
@@ -707,7 +745,9 @@ of_at91_clk_prog_setup(struct device_node *np,
 	if (!num || num > (PROG_ID_MAX + 1))
 		return;
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	parent_np = of_get_parent(np);
+	regmap = syscon_node_to_regmap(parent_np);
+	of_node_put(parent_np);
 	if (IS_ERR(regmap))
 		return;
 
@@ -756,13 +796,16 @@ static void __init of_at91sam9260_clk_slow_setup(struct device_node *np)
 	unsigned int num_parents;
 	const char *name = np->name;
 	struct regmap *regmap;
+	struct device_node *parent_np;
 
 	num_parents = of_clk_get_parent_count(np);
 	if (num_parents != 2)
 		return;
 
 	of_clk_parent_fill(np, parent_names, num_parents);
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	parent_np = of_get_parent(np);
+	regmap = syscon_node_to_regmap(parent_np);
+	of_node_put(parent_np);
 	if (IS_ERR(regmap))
 		return;
 
@@ -788,6 +831,7 @@ static void __init of_at91sam9x5_clk_smd_setup(struct device_node *np)
 	const char *parent_names[SMD_SOURCE_MAX];
 	const char *name = np->name;
 	struct regmap *regmap;
+	struct device_node *parent_np;
 
 	num_parents = of_clk_get_parent_count(np);
 	if (num_parents == 0 || num_parents > SMD_SOURCE_MAX)
@@ -797,7 +841,9 @@ static void __init of_at91sam9x5_clk_smd_setup(struct device_node *np)
 
 	of_property_read_string(np, "clock-output-names", &name);
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	parent_np = of_get_parent(np);
+	regmap = syscon_node_to_regmap(parent_np);
+	of_node_put(parent_np);
 	if (IS_ERR(regmap))
 		return;
 
@@ -818,7 +864,7 @@ static void __init of_at91rm9200_clk_sys_setup(struct device_node *np)
 	u32 id;
 	struct clk_hw *hw;
 	const char *name;
-	struct device_node *sysclknp;
+	struct device_node *sysclknp, *parent_np;
 	const char *parent_name;
 	struct regmap *regmap;
 
@@ -826,7 +872,9 @@ static void __init of_at91rm9200_clk_sys_setup(struct device_node *np)
 	if (num > (SYSTEM_MAX_ID + 1))
 		return;
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	parent_np = of_get_parent(np);
+	regmap = syscon_node_to_regmap(parent_np);
+	of_node_put(parent_np);
 	if (IS_ERR(regmap))
 		return;
 
@@ -859,6 +907,7 @@ static void __init of_at91sam9x5_clk_usb_setup(struct device_node *np)
 	const char *parent_names[USB_SOURCE_MAX];
 	const char *name = np->name;
 	struct regmap *regmap;
+	struct device_node *parent_np;
 
 	num_parents = of_clk_get_parent_count(np);
 	if (num_parents == 0 || num_parents > USB_SOURCE_MAX)
@@ -868,7 +917,9 @@ static void __init of_at91sam9x5_clk_usb_setup(struct device_node *np)
 
 	of_property_read_string(np, "clock-output-names", &name);
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	parent_np = of_get_parent(np);
+	regmap = syscon_node_to_regmap(parent_np);
+	of_node_put(parent_np);
 	if (IS_ERR(regmap))
 		return;
 
@@ -888,6 +939,7 @@ static void __init of_at91sam9n12_clk_usb_setup(struct device_node *np)
 	const char *parent_name;
 	const char *name = np->name;
 	struct regmap *regmap;
+	struct device_node *parent_np;
 
 	parent_name = of_clk_get_parent_name(np, 0);
 	if (!parent_name)
@@ -895,7 +947,9 @@ static void __init of_at91sam9n12_clk_usb_setup(struct device_node *np)
 
 	of_property_read_string(np, "clock-output-names", &name);
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	parent_np = of_get_parent(np);
+	regmap = syscon_node_to_regmap(parent_np);
+	of_node_put(parent_np);
 	if (IS_ERR(regmap))
 		return;
 
@@ -915,6 +969,7 @@ static void __init of_at91rm9200_clk_usb_setup(struct device_node *np)
 	const char *name = np->name;
 	u32 divisors[4] = {0, 0, 0, 0};
 	struct regmap *regmap;
+	struct device_node *parent_np;
 
 	parent_name = of_clk_get_parent_name(np, 0);
 	if (!parent_name)
@@ -926,7 +981,9 @@ static void __init of_at91rm9200_clk_usb_setup(struct device_node *np)
 
 	of_property_read_string(np, "clock-output-names", &name);
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	parent_np = of_get_parent(np);
+	regmap = syscon_node_to_regmap(parent_np);
+	of_node_put(parent_np);
 	if (IS_ERR(regmap))
 		return;
 	hw = at91rm9200_clk_register_usb(regmap, name, parent_name, divisors);
@@ -946,12 +1003,15 @@ static void __init of_at91sam9x5_clk_utmi_setup(struct device_node *np)
 	const char *parent_name;
 	const char *name = np->name;
 	struct regmap *regmap_pmc, *regmap_sfr;
+	struct device_node *parent_np;
 
 	parent_name = of_clk_get_parent_name(np, 0);
 
 	of_property_read_string(np, "clock-output-names", &name);
 
-	regmap_pmc = syscon_node_to_regmap(of_get_parent(np));
+	parent_np = of_get_parent(np);
+	regmap_pmc = syscon_node_to_regmap(parent_np);
+	of_node_put(parent_np);
 	if (IS_ERR(regmap_pmc))
 		return;
 
-- 
2.25.1

