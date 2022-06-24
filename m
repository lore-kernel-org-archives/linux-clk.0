Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2256CC43334
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jun 2022 11:00:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbiFXLAe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Jun 2022 07:00:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbiFXLAd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Jun 2022 07:00:33 -0400
Received: from m15114.mail.126.com (m15114.mail.126.com [220.181.15.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5017077077
        for <linux-clk@vger.kernel.org>; Fri, 24 Jun 2022 04:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=DYBw0
        nNG9to5ulFjDMrTOBhWJaKc0YNDmdkHQNsqKsI=; b=bdhSXVGNFoXisn3Z6oTXq
        JfCB65qEw951T7DT0GkCub3OjokYOiRccOPegmu4ZTE4YvDPxs4DnR+RzHSgCZRe
        ulurzQjeCGSBtH9pOxiRyWxGlFGdZNvdyWKBZjzG2f+vTgttDLCTqX+0e8PY2Kor
        qgFcJ9d/SA9FOcTTY5sv6w=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp7 (Coremail) with SMTP id DsmowABH8vsumbViWuqgDw--.22936S2;
        Fri, 24 Jun 2022 18:59:59 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        claudiu.beznea@microchip.com, linux-clk@vger.kernel.org,
        windhl@126.com
Subject: [PATCH] clk/at91: Hold reference returned by of_get_parent()
Date:   Fri, 24 Jun 2022 18:59:58 +0800
Message-Id: <20220624105958.4184250-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsmowABH8vsumbViWuqgDw--.22936S2
X-Coremail-Antispam: 1Uf129KBjvAXoW3Cry7Ar1UGFy5GF45KrW8tFb_yoW8Jr4xGo
        WxGF4fWF1jkr1rKFW5Wwn3KF1I9w4UuFyxua4kCwsF9ayq9343XryUXF43JF9Iqr13WrZ3
        Zry8tan5Gr18Jr1xn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU8Z2-DUUUU
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3BAqF1pEDyw0XAAAsk
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We need to hold the reference returned by of_get_parent() and use
it to call of_node_put() for refcount balance.

Fixes: 62061d357c7f ("clk: at91: move DT compatibility code to its own file")
Signed-off-by: Liang He <windhl@126.com>
---
 these bugs are found in 5.19rc2
 these bugs are confirmed not fixed by lore.kernel.org
 these bugs are compiled tested in 5.19rc2 with at91_dt_defconfig

 drivers/clk/at91/dt-compat.c | 108 +++++++++++++++++++++++++++--------
 1 file changed, 84 insertions(+), 24 deletions(-)

diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index 8ca8bcacf66d..cc34141864bd 100644
--- a/drivers/clk/at91/dt-compat.c
+++ b/drivers/clk/at91/dt-compat.c
@@ -33,8 +33,11 @@ static void __init of_sama5d2_clk_audio_pll_frac_setup(struct device_node *np)
 	const char *name = np->name;
 	const char *parent_name;
 	struct regmap *regmap;
+	struct device_node *tp;
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	tp = of_get_parent(np);
+	regmap = syscon_node_to_regmap(tp);
+	of_node_put(tp);
 	if (IS_ERR(regmap))
 		return;
 
@@ -56,8 +59,11 @@ static void __init of_sama5d2_clk_audio_pll_pad_setup(struct device_node *np)
 	const char *name = np->name;
 	const char *parent_name;
 	struct regmap *regmap;
+	struct device_node *tp;
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	tp = of_get_parent(np);
+	regmap = syscon_node_to_regmap(tp);
+	of_node_put(tp);
 	if (IS_ERR(regmap))
 		return;
 
@@ -79,8 +85,11 @@ static void __init of_sama5d2_clk_audio_pll_pmc_setup(struct device_node *np)
 	const char *name = np->name;
 	const char *parent_name;
 	struct regmap *regmap;
+	struct device_node *tp;
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	tp = of_get_parent(np);
+	regmap = syscon_node_to_regmap(tp);
+	of_node_put(tp);
 	if (IS_ERR(regmap))
 		return;
 
@@ -120,7 +129,7 @@ static void __init of_sama5d2_clk_generated_setup(struct device_node *np)
 	struct clk_hw *hw;
 	unsigned int num_parents;
 	const char *parent_names[GENERATED_SOURCE_MAX];
-	struct device_node *gcknp;
+	struct device_node *gcknp, *tp;
 	struct clk_range range = CLK_RANGE(0, 0);
 	struct regmap *regmap;
 
@@ -134,7 +143,9 @@ static void __init of_sama5d2_clk_generated_setup(struct device_node *np)
 	if (!num || num > PERIPHERAL_MAX)
 		return;
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	tp = of_get_parent(np);
+	regmap = syscon_node_to_regmap(tp);
+	of_node_put(tp);
 	if (IS_ERR(regmap))
 		return;
 
@@ -180,8 +191,11 @@ static void __init of_sama5d4_clk_h32mx_setup(struct device_node *np)
 	const char *name = np->name;
 	const char *parent_name;
 	struct regmap *regmap;
+	struct device_node *tp;
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	tp = of_get_parent(np);
+	regmap = syscon_node_to_regmap(tp);
+	of_node_put(tp);
 	if (IS_ERR(regmap))
 		return;
 
@@ -243,12 +257,15 @@ static void __init of_at91rm9200_clk_main_osc_setup(struct device_node *np)
 	const char *parent_name;
 	struct regmap *regmap;
 	bool bypass;
+	struct device_node *tp;
 
 	of_property_read_string(np, "clock-output-names", &name);
 	bypass = of_property_read_bool(np, "atmel,osc-bypass");
 	parent_name = of_clk_get_parent_name(np, 0);
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	tp = of_get_parent(np);
+	regmap = syscon_node_to_regmap(tp);
+	of_node_put(tp);
 	if (IS_ERR(regmap))
 		return;
 
@@ -268,12 +285,15 @@ static void __init of_at91sam9x5_clk_main_rc_osc_setup(struct device_node *np)
 	u32 accuracy = 0;
 	const char *name = np->name;
 	struct regmap *regmap;
+	struct device_node *tp;
 
 	of_property_read_string(np, "clock-output-names", &name);
 	of_property_read_u32(np, "clock-frequency", &frequency);
 	of_property_read_u32(np, "clock-accuracy", &accuracy);
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	tp = of_get_parent(np);
+	regmap = syscon_node_to_regmap(tp);
+	of_node_put(tp);
 	if (IS_ERR(regmap))
 		return;
 
@@ -292,11 +312,14 @@ static void __init of_at91rm9200_clk_main_setup(struct device_node *np)
 	const char *parent_name;
 	const char *name = np->name;
 	struct regmap *regmap;
+	struct device_node *tp;
 
 	parent_name = of_clk_get_parent_name(np, 0);
 	of_property_read_string(np, "clock-output-names", &name);
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	tp = of_get_parent(np);
+	regmap = syscon_node_to_regmap(tp);
+	of_node_put(tp);
 	if (IS_ERR(regmap))
 		return;
 
@@ -316,13 +339,16 @@ static void __init of_at91sam9x5_clk_main_setup(struct device_node *np)
 	unsigned int num_parents;
 	const char *name = np->name;
 	struct regmap *regmap;
+	struct device_node *tp;
 
 	num_parents = of_clk_get_parent_count(np);
 	if (num_parents == 0 || num_parents > 2)
 		return;
 
 	of_clk_parent_fill(np, parent_names, num_parents);
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	tp = of_get_parent(np);
+	regmap = syscon_node_to_regmap(tp);
+	of_node_put(tp);
 	if (IS_ERR(regmap))
 		return;
 
@@ -373,6 +399,7 @@ of_at91_clk_master_setup(struct device_node *np,
 	const char *name = np->name;
 	struct clk_master_characteristics *characteristics;
 	struct regmap *regmap;
+	struct device_node *tp;
 
 	num_parents = of_clk_get_parent_count(np);
 	if (num_parents == 0 || num_parents > MASTER_SOURCE_MAX)
@@ -386,7 +413,9 @@ of_at91_clk_master_setup(struct device_node *np,
 	if (!characteristics)
 		return;
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	tp = of_get_parent(np);
+	regmap = syscon_node_to_regmap(tp);
+	of_node_put(tp);
 	if (IS_ERR(regmap))
 		return;
 
@@ -433,6 +462,7 @@ of_at91_clk_periph_setup(struct device_node *np, u8 type)
 	const char *name;
 	struct device_node *periphclknp;
 	struct regmap *regmap;
+	struct device_node *tp;
 
 	parent_name = of_clk_get_parent_name(np, 0);
 	if (!parent_name)
@@ -442,7 +472,9 @@ of_at91_clk_periph_setup(struct device_node *np, u8 type)
 	if (!num || num > PERIPHERAL_MAX)
 		return;
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	tp = of_get_parent(np);
+	regmap = syscon_node_to_regmap(tp);
+	of_node_put(tp);
 	if (IS_ERR(regmap))
 		return;
 
@@ -602,6 +634,7 @@ of_at91_clk_pll_setup(struct device_node *np,
 	const char *parent_name;
 	const char *name = np->name;
 	struct clk_pll_characteristics *characteristics;
+	struct device_node *tp;
 
 	if (of_property_read_u32(np, "reg", &id))
 		return;
@@ -610,7 +643,9 @@ of_at91_clk_pll_setup(struct device_node *np,
 
 	of_property_read_string(np, "clock-output-names", &name);
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	tp = of_get_parent(np);
+	regmap = syscon_node_to_regmap(tp);
+	of_node_put(tp);
 	if (IS_ERR(regmap))
 		return;
 
@@ -665,12 +700,15 @@ of_at91sam9x5_clk_plldiv_setup(struct device_node *np)
 	const char *parent_name;
 	const char *name = np->name;
 	struct regmap *regmap;
+	struct device_node *tp;
 
 	parent_name = of_clk_get_parent_name(np, 0);
 
 	of_property_read_string(np, "clock-output-names", &name);
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	tp = of_get_parent(np);
+	regmap = syscon_node_to_regmap(tp);
+	of_node_put(tp);
 	if (IS_ERR(regmap))
 		return;
 
@@ -694,7 +732,7 @@ of_at91_clk_prog_setup(struct device_node *np,
 	unsigned int num_parents;
 	const char *parent_names[PROG_SOURCE_MAX];
 	const char *name;
-	struct device_node *progclknp;
+	struct device_node *progclknp, *tp;
 	struct regmap *regmap;
 
 	num_parents = of_clk_get_parent_count(np);
@@ -707,7 +745,9 @@ of_at91_clk_prog_setup(struct device_node *np,
 	if (!num || num > (PROG_ID_MAX + 1))
 		return;
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	tp = of_get_parent(np);
+	regmap = syscon_node_to_regmap(tp);
+	of_node_put(tp);
 	if (IS_ERR(regmap))
 		return;
 
@@ -756,13 +796,16 @@ static void __init of_at91sam9260_clk_slow_setup(struct device_node *np)
 	unsigned int num_parents;
 	const char *name = np->name;
 	struct regmap *regmap;
+	struct device_node *tp;
 
 	num_parents = of_clk_get_parent_count(np);
 	if (num_parents != 2)
 		return;
 
 	of_clk_parent_fill(np, parent_names, num_parents);
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	tp = of_get_parent(np);
+	regmap = syscon_node_to_regmap(tp);
+	of_node_put(tp);
 	if (IS_ERR(regmap))
 		return;
 
@@ -788,6 +831,7 @@ static void __init of_at91sam9x5_clk_smd_setup(struct device_node *np)
 	const char *parent_names[SMD_SOURCE_MAX];
 	const char *name = np->name;
 	struct regmap *regmap;
+	struct device_node *tp;
 
 	num_parents = of_clk_get_parent_count(np);
 	if (num_parents == 0 || num_parents > SMD_SOURCE_MAX)
@@ -797,7 +841,9 @@ static void __init of_at91sam9x5_clk_smd_setup(struct device_node *np)
 
 	of_property_read_string(np, "clock-output-names", &name);
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	tp = of_get_parent(np);
+	regmap = syscon_node_to_regmap(tp);
+	of_node_put(tp);
 	if (IS_ERR(regmap))
 		return;
 
@@ -818,7 +864,7 @@ static void __init of_at91rm9200_clk_sys_setup(struct device_node *np)
 	u32 id;
 	struct clk_hw *hw;
 	const char *name;
-	struct device_node *sysclknp;
+	struct device_node *sysclknp, *tp;
 	const char *parent_name;
 	struct regmap *regmap;
 
@@ -826,7 +872,9 @@ static void __init of_at91rm9200_clk_sys_setup(struct device_node *np)
 	if (num > (SYSTEM_MAX_ID + 1))
 		return;
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	tp = of_get_parent(np);
+	regmap = syscon_node_to_regmap(tp);
+	of_node_put(tp);
 	if (IS_ERR(regmap))
 		return;
 
@@ -859,6 +907,7 @@ static void __init of_at91sam9x5_clk_usb_setup(struct device_node *np)
 	const char *parent_names[USB_SOURCE_MAX];
 	const char *name = np->name;
 	struct regmap *regmap;
+	struct device_node *tp;
 
 	num_parents = of_clk_get_parent_count(np);
 	if (num_parents == 0 || num_parents > USB_SOURCE_MAX)
@@ -868,7 +917,9 @@ static void __init of_at91sam9x5_clk_usb_setup(struct device_node *np)
 
 	of_property_read_string(np, "clock-output-names", &name);
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	tp = of_get_parent(np);
+	regmap = syscon_node_to_regmap(tp);
+	of_node_put(tp);
 	if (IS_ERR(regmap))
 		return;
 
@@ -888,6 +939,7 @@ static void __init of_at91sam9n12_clk_usb_setup(struct device_node *np)
 	const char *parent_name;
 	const char *name = np->name;
 	struct regmap *regmap;
+	struct device_node *tp;
 
 	parent_name = of_clk_get_parent_name(np, 0);
 	if (!parent_name)
@@ -895,7 +947,9 @@ static void __init of_at91sam9n12_clk_usb_setup(struct device_node *np)
 
 	of_property_read_string(np, "clock-output-names", &name);
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	tp = of_get_parent(np);
+	regmap = syscon_node_to_regmap(tp);
+	of_node_put(tp);
 	if (IS_ERR(regmap))
 		return;
 
@@ -915,6 +969,7 @@ static void __init of_at91rm9200_clk_usb_setup(struct device_node *np)
 	const char *name = np->name;
 	u32 divisors[4] = {0, 0, 0, 0};
 	struct regmap *regmap;
+	struct device_node *tp;
 
 	parent_name = of_clk_get_parent_name(np, 0);
 	if (!parent_name)
@@ -926,7 +981,9 @@ static void __init of_at91rm9200_clk_usb_setup(struct device_node *np)
 
 	of_property_read_string(np, "clock-output-names", &name);
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	tp = of_get_parent(np);
+	regmap = syscon_node_to_regmap(tp);
+	of_node_put(tp);
 	if (IS_ERR(regmap))
 		return;
 	hw = at91rm9200_clk_register_usb(regmap, name, parent_name, divisors);
@@ -946,12 +1003,15 @@ static void __init of_at91sam9x5_clk_utmi_setup(struct device_node *np)
 	const char *parent_name;
 	const char *name = np->name;
 	struct regmap *regmap_pmc, *regmap_sfr;
+	struct device_node *tp;
 
 	parent_name = of_clk_get_parent_name(np, 0);
 
 	of_property_read_string(np, "clock-output-names", &name);
 
-	regmap_pmc = syscon_node_to_regmap(of_get_parent(np));
+	tp = of_get_parent(np);
+	regmap_pmc = syscon_node_to_regmap(tp);
+	of_node_put(tp);
 	if (IS_ERR(regmap_pmc))
 		return;
 
-- 
2.25.1

