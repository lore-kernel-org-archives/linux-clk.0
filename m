Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51AC0C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 28 Jun 2022 13:28:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230353AbiF1N2E (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Jun 2022 09:28:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346259AbiF1N0o (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Jun 2022 09:26:44 -0400
Received: from mail-m963.mail.126.com (mail-m963.mail.126.com [123.126.96.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 26D3E3139A
        for <linux-clk@vger.kernel.org>; Tue, 28 Jun 2022 06:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Uk0ar
        11Ph77wbmifa2Hj9EZ4YWfZlgBAdGL2dAONd50=; b=DkSo+ZaDFkRaPru8CQCrH
        jdS8XHkpIGKwJRkRc2sYIpAjMbMwNnG9WQ5bqZH/He82/FaYlcuEzv+j1Yo/QobY
        oezHiel42oBnvtnQIq8/tzHJeaIWsZtOejNDdI1abGWhOH0FVKZGtmVYSmBrQzBg
        DZcz/B+91NhiE3cIqdIb+k=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp8 (Coremail) with SMTP id NORpCgB3f3OzALtiXknKGg--.24496S2;
        Tue, 28 Jun 2022 21:23:00 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        claudiu.beznea@microchip.com, linux-clk@vger.kernel.org,
        windhl@126.com
Subject: [PATCH v2] clk: at91: dt-compat: Hold reference returned by of_get_parent()
Date:   Tue, 28 Jun 2022 21:22:56 +0800
Message-Id: <20220628132256.164120-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NORpCgB3f3OzALtiXknKGg--.24496S2
X-Coremail-Antispam: 1Uf129KBjvAXoW3ZFW3urWkZrWfuw15ZryftFb_yoW8Jw48Wo
        W7GF4xWF18Cw18tFW5W3sxtF129w1kuryxWa4qkwsF9ayjk345Xr17XF43JFnIqr1fWrZ3
        Zry8tan8GF1UJr1xn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RpGQDUUUUU
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi2hQuF1uwMTa7RwAAsn
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We need to hold the reference returned by of_get_parent() and use
it to call of_node_put() for refcount balance.

Signed-off-by: Liang He <windhl@126.com>
---
 changelog:

 v2: use 'parent_np' to replace 'tp' and use xx:yy:zz title format
 v1: hold references returned by of_get_parent() and put them

 drivers/clk/at91/dt-compat.c | 112 +++++++++++++++++++++++++++--------
 1 file changed, 86 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index 8ca8bcacf66d..0d36b4e7fd6e 100644
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
 
@@ -694,8 +732,8 @@ of_at91_clk_prog_setup(struct device_node *np,
 	unsigned int num_parents;
 	const char *parent_names[PROG_SOURCE_MAX];
 	const char *name;
-	struct device_node *progclknp;
 	struct regmap *regmap;
+	struct device_node *progclknp, *parent_np;
 
 	num_parents = of_clk_get_parent_count(np);
 	if (num_parents == 0 || num_parents > PROG_SOURCE_MAX)
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
 
@@ -818,15 +864,17 @@ static void __init of_at91rm9200_clk_sys_setup(struct device_node *np)
 	u32 id;
 	struct clk_hw *hw;
 	const char *name;
-	struct device_node *sysclknp;
 	const char *parent_name;
 	struct regmap *regmap;
+	struct device_node *sysclknp, *parent_np;
 
 	num = of_get_child_count(np);
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
 
@@ -885,9 +936,10 @@ CLK_OF_DECLARE(at91sam9x5_clk_usb, "atmel,at91sam9x5-clk-usb",
 static void __init of_at91sam9n12_clk_usb_setup(struct device_node *np)
 {
 	struct clk_hw *hw;
+	struct regmap *regmap;
 	const char *parent_name;
 	const char *name = np->name;
-	struct regmap *regmap;
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
 
@@ -911,10 +965,11 @@ CLK_OF_DECLARE(at91sam9n12_clk_usb, "atmel,at91sam9n12-clk-usb",
 static void __init of_at91rm9200_clk_usb_setup(struct device_node *np)
 {
 	struct clk_hw *hw;
+	struct regmap *regmap;
 	const char *parent_name;
 	const char *name = np->name;
+	struct device_node *parent_np;
 	u32 divisors[4] = {0, 0, 0, 0};
-	struct regmap *regmap;
 
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
@@ -945,13 +1002,16 @@ static void __init of_at91sam9x5_clk_utmi_setup(struct device_node *np)
 	struct clk_hw *hw;
 	const char *parent_name;
 	const char *name = np->name;
+	struct device_node *parent_np;
 	struct regmap *regmap_pmc, *regmap_sfr;
 
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

