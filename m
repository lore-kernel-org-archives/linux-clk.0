Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48BDEEB64DD
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jul 2023 05:33:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231722AbjG0FdM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Jul 2023 01:33:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231686AbjG0FdH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Jul 2023 01:33:07 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2756E2D5D
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:32:52 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-563f752774fso285120a12.1
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1690435971; x=1691040771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAVoXHZ5zvjZ262DesmDLqKSRAd4U2FxEZjVJgo3dJ4=;
        b=KKy2c5+u7/wBLVinxt7z+Adc/SzVAGTOKbC3oRrvt/QKaoxeyCBPKBDeJHrLp8VSyE
         9oRgHE/+LQ80G3STCVua5wTWya0lyHpftSD/8YWYlg74zjVHQtRon1/gSfN0DevPIjPL
         zUBBoHIgDZg+PSR6VKx8gLrqTAfGoRJb+61fAa6kXgMrpLMSMolHRGkqLAVF4oED/z6d
         DPXVHNe7HKdyVgjBDPN09rDTvFGuvp1p1w36Zsafb8O3KdSmQleN0qKJLMePNjUlueEo
         XTwdE8H57g4Aq6ZNp+SuHRXNcHIi/B5tx06TdhfAFe0KQEddGyTw4IUbvF4fToLFOo9V
         K2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690435971; x=1691040771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAVoXHZ5zvjZ262DesmDLqKSRAd4U2FxEZjVJgo3dJ4=;
        b=BZ0hsTzDOvJ/wAXuI9njvMpr5DCFgbxU+p6M7BPXI/j7it3B2t3ZIuaMfMVTK+C/R8
         CLzUV/oU49/SNdbUEsDh6j+2xWp2TCYbInWkvhZocyXd1bkzXYGSJkMEhQma6l2ynOJc
         JxHKA68laRQX8ThW2Hxm56nzEc42xmkLGNyLuaJaOwEHNurxiuA/SdzujN7VVa5SOZwp
         zKAo/ftfF2i6vd6TSYfZ3HDSSVdwtm5QLgS/styFKceOqjRbA//ra+ucFU/g53Ev/5ur
         BL6D4peBKpOEl3D10iZcBdDioHG+aESw07HLPqJbDh4QOifuv7f4YUcxuux2z44jemUK
         oNQw==
X-Gm-Message-State: ABy/qLa3Qi2ns/2pjsoRZzUNtQcX5IjlLmkytKZ7VouiWg5IpvTNAdkg
        0wDEX7LHkx+CQZAHHEUCyS3iNmpctd7o65s9F0rwRv7m
X-Google-Smtp-Source: APBJJlHYYoR6bV0fsTShxkpROL+ii8w1aBMMilcwh8A7MOFW0fRhhOj0GLZM2UL26NRudApmi9ugrA==
X-Received: by 2002:a05:6a21:790b:b0:137:a9d7:de12 with SMTP id bg11-20020a056a21790b00b00137a9d7de12mr3456463pzc.59.1690435971266;
        Wed, 26 Jul 2023 22:32:51 -0700 (PDT)
Received: from localhost.localdomain ([82.78.167.79])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c11500b001bb889530adsm319059pli.217.2023.07.26.22.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 22:32:50 -0700 (PDT)
From:   Claudiu Beznea <claudiu.beznea@tuxon.dev>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        mripard@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH 03/42] clk: at91: sam9x60: switch to parent_hw and parent_data
Date:   Thu, 27 Jul 2023 08:31:17 +0300
Message-Id: <20230727053156.13587-4-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
References: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Switch SAM9X60 clocks to use parent_hw and parent_data. Having
parent_hw instead of parent names improves to clock registration
speed and re-parenting. Extra time saved on registration is
~180us when running at 600MHz.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 drivers/clk/at91/sam9x60.c | 124 ++++++++++++++++++++-----------------
 1 file changed, 68 insertions(+), 56 deletions(-)

diff --git a/drivers/clk/at91/sam9x60.c b/drivers/clk/at91/sam9x60.c
index ddf993fe391f..c68cd969dd46 100644
--- a/drivers/clk/at91/sam9x60.c
+++ b/drivers/clk/at91/sam9x60.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/mfd/syscon.h>
 #include <linux/slab.h>
@@ -72,9 +73,9 @@ static const struct clk_pcr_layout sam9x60_pcr_layout = {
 	.pid_mask = GENMASK(6, 0),
 };
 
-static const struct {
+static struct {
 	char *n;
-	char *p;
+	struct clk_hw *parent_hw;
 	unsigned long flags;
 	u8 id;
 } sam9x60_systemck[] = {
@@ -82,11 +83,11 @@ static const struct {
 	 * ddrck feeds DDR controller and is enabled by bootloader thus we need
 	 * to keep it enabled in case there is no Linux consumer for it.
 	 */
-	{ .n = "ddrck",  .p = "masterck_div", .id = 2, .flags = CLK_IS_CRITICAL },
-	{ .n = "uhpck",  .p = "usbck",    .id = 6 },
-	{ .n = "pck0",   .p = "prog0",    .id = 8 },
-	{ .n = "pck1",   .p = "prog1",    .id = 9 },
-	{ .n = "qspick", .p = "masterck_div", .id = 19 },
+	{ .n = "ddrck",  .id = 2, .flags = CLK_IS_CRITICAL },
+	{ .n = "uhpck",  .id = 6 },
+	{ .n = "pck0",   .id = 8 },
+	{ .n = "pck1",   .id = 9 },
+	{ .n = "qspick", .id = 19 },
 };
 
 static const struct {
@@ -177,31 +178,34 @@ static const struct {
 
 static void __init sam9x60_pmc_setup(struct device_node *np)
 {
+	struct clk_hw *td_slck_hw, *md_slck_hw, *main_xtal_hw, *main_rc_hw, *main_osc_hw;
+	struct clk_hw *parent_hws[6], *hw, *usbck_hw;
+	static struct clk_parent_data parent_data;
 	struct clk_range range = CLK_RANGE(0, 0);
-	const char *td_slck_name, *md_slck_name, *mainxtal_name;
+	const char *main_xtal_name = "main_xtal";
 	struct pmc_data *sam9x60_pmc;
-	const char *parent_names[6];
-	struct clk_hw *main_osc_hw;
 	struct regmap *regmap;
-	struct clk_hw *hw;
+	struct clk *clk;
 	int i;
 
-	i = of_property_match_string(np, "clock-names", "td_slck");
-	if (i < 0)
+	clk = of_clk_get_by_name(np, "td_slck");
+	if (IS_ERR(clk))
 		return;
-
-	td_slck_name = of_clk_get_parent_name(np, i);
-
-	i = of_property_match_string(np, "clock-names", "md_slck");
-	if (i < 0)
+	td_slck_hw = __clk_get_hw(clk);
+	if (!td_slck_hw)
 		return;
-
-	md_slck_name = of_clk_get_parent_name(np, i);
-
-	i = of_property_match_string(np, "clock-names", "main_xtal");
-	if (i < 0)
+	clk = of_clk_get_by_name(np, "md_slck");
+	if (IS_ERR(clk))
+		return;
+	md_slck_hw = __clk_get_hw(clk);
+	if (!md_slck_hw)
+		return;
+	clk = of_clk_get_by_name(np, main_xtal_name);
+	if (IS_ERR(clk))
+		return;
+	main_xtal_hw = __clk_get_hw(clk);
+	if (!main_xtal_hw)
 		return;
-	mainxtal_name = of_clk_get_parent_name(np, i);
 
 	regmap = device_node_to_regmap(np);
 	if (IS_ERR(regmap))
@@ -214,26 +218,28 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 	if (!sam9x60_pmc)
 		return;
 
-	hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
-					   50000000);
-	if (IS_ERR(hw))
+	main_rc_hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
+						   50000000);
+	if (IS_ERR(main_rc_hw))
 		goto err_free;
 
-	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL, 0);
+	parent_data.name = main_xtal_name;
+	parent_data.fw_name = main_xtal_name;
+	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
+						 &parent_data, 0);
 	if (IS_ERR(hw))
 		goto err_free;
-	main_osc_hw = hw;
 
-	parent_names[0] = "main_rc_osc";
-	parent_names[1] = "main_osc";
-	hw = at91_clk_register_sam9x5_main(regmap, "mainck", parent_names, NULL, 2);
+	parent_hws[0] = main_rc_hw;
+	parent_hws[1] = main_osc_hw;
+	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_hws, 2);
 	if (IS_ERR(hw))
 		goto err_free;
 
 	sam9x60_pmc->chws[PMC_MAIN] = hw;
 
 	hw = sam9x60_clk_register_frac_pll(regmap, &pmc_pll_lock, "pllack_fracck",
-					   "mainck", sam9x60_pmc->chws[PMC_MAIN],
+					   NULL, sam9x60_pmc->chws[PMC_MAIN],
 					   0, &plla_characteristics,
 					   &pll_frac_layout,
 					   /*
@@ -246,7 +252,7 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 		goto err_free;
 
 	hw = sam9x60_clk_register_div_pll(regmap, &pmc_pll_lock, "pllack_divck",
-					  "pllack_fracck", NULL, 0, &plla_characteristics,
+					  NULL, hw, 0, &plla_characteristics,
 					  &pll_div_layout,
 					   /*
 					    * This feeds CPU. It should not
@@ -259,14 +265,14 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 	sam9x60_pmc->chws[PMC_PLLACK] = hw;
 
 	hw = sam9x60_clk_register_frac_pll(regmap, &pmc_pll_lock, "upllck_fracck",
-					   "main_osc", main_osc_hw, 1,
+					   NULL, main_osc_hw, 1,
 					   &upll_characteristics,
 					   &pll_frac_layout, CLK_SET_RATE_GATE);
 	if (IS_ERR(hw))
 		goto err_free;
 
 	hw = sam9x60_clk_register_div_pll(regmap, &pmc_pll_lock, "upllck_divck",
-					  "upllck_fracck", NULL, 1, &upll_characteristics,
+					  NULL, hw, 1, &upll_characteristics,
 					  &pll_div_layout,
 					  CLK_SET_RATE_GATE |
 					  CLK_SET_PARENT_GATE |
@@ -276,17 +282,17 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 
 	sam9x60_pmc->chws[PMC_UTMI] = hw;
 
-	parent_names[0] = md_slck_name;
-	parent_names[1] = "mainck";
-	parent_names[2] = "pllack_divck";
+	parent_hws[0] = md_slck_hw;
+	parent_hws[1] = sam9x60_pmc->chws[PMC_MAIN];
+	parent_hws[2] = sam9x60_pmc->chws[PMC_PLLACK];
 	hw = at91_clk_register_master_pres(regmap, "masterck_pres", 3,
-					   parent_names, NULL, &sam9x60_master_layout,
+					   NULL, parent_hws, &sam9x60_master_layout,
 					   &mck_characteristics, &mck_lock);
 	if (IS_ERR(hw))
 		goto err_free;
 
 	hw = at91_clk_register_master_div(regmap, "masterck_div",
-					  "masterck_pres", NULL, &sam9x60_master_layout,
+					  NULL, hw, &sam9x60_master_layout,
 					  &mck_characteristics, &mck_lock,
 					  CLK_SET_RATE_GATE, 0);
 	if (IS_ERR(hw))
@@ -294,26 +300,26 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 
 	sam9x60_pmc->chws[PMC_MCK] = hw;
 
-	parent_names[0] = "pllack_divck";
-	parent_names[1] = "upllck_divck";
-	parent_names[2] = "main_osc";
-	hw = sam9x60_clk_register_usb(regmap, "usbck", parent_names, NULL, 3);
-	if (IS_ERR(hw))
+	parent_hws[0] = sam9x60_pmc->chws[PMC_PLLACK];
+	parent_hws[1] = sam9x60_pmc->chws[PMC_UTMI];
+	parent_hws[2] = main_osc_hw;
+	usbck_hw = sam9x60_clk_register_usb(regmap, "usbck", NULL, parent_hws, 3);
+	if (IS_ERR(usbck_hw))
 		goto err_free;
 
-	parent_names[0] = md_slck_name;
-	parent_names[1] = td_slck_name;
-	parent_names[2] = "mainck";
-	parent_names[3] = "masterck_div";
-	parent_names[4] = "pllack_divck";
-	parent_names[5] = "upllck_divck";
+	parent_hws[0] = md_slck_hw;
+	parent_hws[1] = td_slck_hw;
+	parent_hws[2] = sam9x60_pmc->chws[PMC_MAIN];
+	parent_hws[3] = sam9x60_pmc->chws[PMC_MCK];
+	parent_hws[4] = sam9x60_pmc->chws[PMC_PLLACK];
+	parent_hws[5] = sam9x60_pmc->chws[PMC_UTMI];
 	for (i = 0; i < 2; i++) {
 		char name[6];
 
 		snprintf(name, sizeof(name), "prog%d", i);
 
 		hw = at91_clk_register_programmable(regmap, name,
-						    parent_names, NULL, 6, i,
+						    NULL, parent_hws, 6, i,
 						    &sam9x60_programmable_layout,
 						    NULL);
 		if (IS_ERR(hw))
@@ -322,9 +328,15 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 		sam9x60_pmc->pchws[i] = hw;
 	}
 
+	/* Set systemck parent hws. */
+	sam9x60_systemck[0].parent_hw = sam9x60_pmc->chws[PMC_MCK];
+	sam9x60_systemck[1].parent_hw = usbck_hw;
+	sam9x60_systemck[2].parent_hw = sam9x60_pmc->pchws[0];
+	sam9x60_systemck[3].parent_hw = sam9x60_pmc->pchws[1];
+	sam9x60_systemck[4].parent_hw = sam9x60_pmc->chws[PMC_MCK];
 	for (i = 0; i < ARRAY_SIZE(sam9x60_systemck); i++) {
 		hw = at91_clk_register_system(regmap, sam9x60_systemck[i].n,
-					      sam9x60_systemck[i].p, NULL,
+					      NULL, sam9x60_systemck[i].parent_hw,
 					      sam9x60_systemck[i].id,
 					      sam9x60_systemck[i].flags);
 		if (IS_ERR(hw))
@@ -337,7 +349,7 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
 							 &sam9x60_pcr_layout,
 							 sam9x60_periphck[i].n,
-							 "masterck_div", NULL,
+							 NULL, sam9x60_pmc->chws[PMC_MCK],
 							 sam9x60_periphck[i].id,
 							 &range, INT_MIN,
 							 sam9x60_periphck[i].flags);
@@ -351,7 +363,7 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 		hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
 						 &sam9x60_pcr_layout,
 						 sam9x60_gck[i].n,
-						 parent_names, NULL, NULL, 6,
+						 NULL, parent_hws, NULL, 6,
 						 sam9x60_gck[i].id,
 						 &sam9x60_gck[i].r, INT_MIN);
 		if (IS_ERR(hw))
-- 
2.39.2

