Return-Path: <SRS0=ECv2=VT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 451E9C76195
	for <linux-clk@archiver.kernel.org>; Mon, 22 Jul 2019 09:51:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 151E62199C
	for <linux-clk@archiver.kernel.org>; Mon, 22 Jul 2019 09:51:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Q2z4ruLW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729466AbfGVJvH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Jul 2019 05:51:07 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34090 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729454AbfGVJvG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Jul 2019 05:51:06 -0400
Received: by mail-wr1-f66.google.com with SMTP id 31so38751538wrm.1
        for <linux-clk@vger.kernel.org>; Mon, 22 Jul 2019 02:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=F7Mh7mTqrbPLzmnSm+w4TaapVEFVgSoarhlGaaKtxEs=;
        b=Q2z4ruLWFUqm3bzHc62r+k8sGCT5VoixCVDKNa823mpq2NaHSVn5yRnqtfbM3CDXLD
         pjcZ+hMS1+ntjhYCAUNZ5FLpP6UJEKdHxmDAjt74NLzGwvOQCCYwatwo5f53RDfpB4zT
         t+gGwXjweEspNm+0f0XAYbx9rZrtjvHtlda1u7/zhFvSK4VvjG+dC9vGpLFQsMK6Dpbk
         46DH6ql/kF2c61FBPltSwBf3k5ItfOeD15cDj+kxQ8xqXIIZ7y/QYCOfXsR2r3g9Ab5d
         tseVf5SnI/LtBCszBE1SEwHdpq16pDJw69a/9JTu/TFpri6NmQUZB/qvEgbsv18nxe0m
         hk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=F7Mh7mTqrbPLzmnSm+w4TaapVEFVgSoarhlGaaKtxEs=;
        b=YvkAQOJoLm65VM9D0cZWos+/Stf6D4yGNV2DIevN+yGFJfW5EtjOtjFdN7W82nV6hk
         +05Zb87tyJrsqqAe2qb+hA7LYVp/0ji3s1WG1dYCiJvA8PdQNaiQ+h+PBmpRY1rTNplC
         cgga7QA3RtnKuHmdClXHnLV2yvPhfv3EHk4iRyqcJWBnBWK8v9TGhFh9a58TbZdMBsuP
         Ffw+77UVq5mgt43G1HCuYIBPiTWVVvS6zvwQP6B7CvuQc3oybE7tlI/3x/3AFFqwEMHV
         B9USgStncwSCjXIlYGR06zP1TBcdwR0B6ADfKlTwI9j4fPwe1SkpHVkwOx+eFwb0BPEO
         LK5Q==
X-Gm-Message-State: APjAAAUuUjkgjtsx8rsUd+Y1O80cRlZPwQDnIXCzhOX5a6EcfUGx/sMQ
        JRX5XTXtbFG8mUDqVQcSApgdkA==
X-Google-Smtp-Source: APXvYqzlqaAWwlrRPPWNRf6/qG7naQ+KqKzm8VGf48NEROBs26mXQxPoNmmrpfUNa488nZ/bDRjk9A==
X-Received: by 2002:a5d:6287:: with SMTP id k7mr24209024wru.108.1563789063793;
        Mon, 22 Jul 2019 02:51:03 -0700 (PDT)
Received: from pop-os.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id o3sm31050738wrs.59.2019.07.22.02.51.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 02:51:03 -0700 (PDT)
From:   Alexandre Mergnat <amergnat@baylibre.com>
To:     jbrunet@baylibre.com
Cc:     khilman@baylibre.com, sboyd@kernel.org, narmstrong@baylibre.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        baylibre-upstreaming@groups.io,
        Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH 3/4] clk: meson: axg-aoclk: migrate to the new parent description method
Date:   Mon, 22 Jul 2019 11:50:52 +0200
Message-Id: <20190722095053.14104-4-amergnat@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190722095053.14104-1-amergnat@baylibre.com>
References: <20190722095053.14104-1-amergnat@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This clock controller use the string comparison method to describe parent
relation between the clocks, which is not optimized.

Migrate to the new way by using .parent_hws where possible (when parent
clocks are localy declared in the controller) and use .parent_data
otherwise.

Remove clk input helper and all bypass clocks (declared in probe function)
which are no longer used since we are able to use device-tree clock name
directly.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/clk/meson/axg-aoclk.c | 63 ++++++++++++++++++++---------------
 1 file changed, 37 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/meson/axg-aoclk.c b/drivers/clk/meson/axg-aoclk.c
index 0086f31288eb..b488b40c9d0e 100644
--- a/drivers/clk/meson/axg-aoclk.c
+++ b/drivers/clk/meson/axg-aoclk.c
@@ -18,8 +18,6 @@
 #include "clk-regmap.h"
 #include "clk-dualdiv.h"
 
-#define IN_PREFIX "ao-in-"
-
 /*
  * AO Configuration Clock registers offsets
  * Register offsets from the data sheet must be multiplied by 4.
@@ -42,7 +40,9 @@ static struct clk_regmap axg_aoclk_##_name = {				\
 	.hw.init = &(struct clk_init_data) {				\
 		.name =  "axg_ao_" #_name,				\
 		.ops = &clk_regmap_gate_ops,				\
-		.parent_names = (const char *[]){ IN_PREFIX "mpeg-clk" }, \
+		.parent_data = &(const struct clk_parent_data) {	\
+			.fw_name = "mpeg-clk",				\
+		},							\
 		.num_parents = 1,					\
 		.flags = CLK_IGNORE_UNUSED,				\
 	},								\
@@ -64,7 +64,9 @@ static struct clk_regmap axg_aoclk_cts_oscin = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_oscin",
 		.ops = &clk_regmap_gate_ro_ops,
-		.parent_names = (const char *[]){ IN_PREFIX "xtal" },
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "xtal",
+		},
 		.num_parents = 1,
 	},
 };
@@ -77,7 +79,9 @@ static struct clk_regmap axg_aoclk_32k_pre = {
 	.hw.init = &(struct clk_init_data){
 		.name = "axg_ao_32k_pre",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "cts_oscin" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_aoclk_cts_oscin.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -124,7 +128,9 @@ static struct clk_regmap axg_aoclk_32k_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "axg_ao_32k_div",
 		.ops = &meson_clk_dualdiv_ops,
-		.parent_names = (const char *[]){ "axg_ao_32k_pre" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_aoclk_32k_pre.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -139,8 +145,10 @@ static struct clk_regmap axg_aoclk_32k_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "axg_ao_32k_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = (const char *[]){ "axg_ao_32k_div",
-						  "axg_ao_32k_pre" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_aoclk_32k_div.hw,
+			&axg_aoclk_32k_pre.hw,
+		},
 		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -154,7 +162,9 @@ static struct clk_regmap axg_aoclk_32k = {
 	.hw.init = &(struct clk_init_data){
 		.name = "axg_ao_32k",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "axg_ao_32k_sel" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_aoclk_32k_sel.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -170,8 +180,10 @@ static struct clk_regmap axg_aoclk_cts_rtc_oscin = {
 	.hw.init = &(struct clk_init_data){
 		.name = "axg_ao_cts_rtc_oscin",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = (const char *[]){ "axg_ao_32k",
-						  IN_PREFIX "ext_32k-0" },
+		.parent_data = (const struct clk_parent_data []) {
+			{ .hw = &axg_aoclk_32k.hw },
+			{ .fw_name = "ext_32k-0", },
+		},
 		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -187,8 +199,10 @@ static struct clk_regmap axg_aoclk_clk81 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "axg_ao_clk81",
 		.ops = &clk_regmap_mux_ro_ops,
-		.parent_names = (const char *[]){ IN_PREFIX "mpeg-clk",
-						  "axg_ao_cts_rtc_oscin"},
+		.parent_data = (const struct clk_parent_data []) {
+			{ .fw_name = "mpeg-clk", },
+			{ .hw = &axg_aoclk_cts_rtc_oscin.hw },
+		},
 		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -203,8 +217,10 @@ static struct clk_regmap axg_aoclk_saradc_mux = {
 	.hw.init = &(struct clk_init_data){
 		.name = "axg_ao_saradc_mux",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = (const char *[]){ IN_PREFIX "xtal",
-						  "axg_ao_clk81" },
+		.parent_data = (const struct clk_parent_data []) {
+			{ .fw_name = "xtal", },
+			{ .hw = &axg_aoclk_clk81.hw },
+		},
 		.num_parents = 2,
 	},
 };
@@ -218,7 +234,9 @@ static struct clk_regmap axg_aoclk_saradc_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "axg_ao_saradc_div",
 		.ops = &clk_regmap_divider_ops,
-		.parent_names = (const char *[]){ "axg_ao_saradc_mux" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_aoclk_saradc_mux.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -232,7 +250,9 @@ static struct clk_regmap axg_aoclk_saradc_gate = {
 	.hw.init = &(struct clk_init_data){
 		.name = "axg_ao_saradc_gate",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "axg_ao_saradc_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_aoclk_saradc_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -290,12 +310,6 @@ static const struct clk_hw_onecell_data axg_aoclk_onecell_data = {
 	.num = NR_CLKS,
 };
 
-static const struct meson_aoclk_input axg_aoclk_inputs[] = {
-	{ .name = "xtal",	.required = true  },
-	{ .name = "mpeg-clk",	.required = true  },
-	{ .name = "ext-32k-0",	.required = false },
-};
-
 static const struct meson_aoclk_data axg_aoclkc_data = {
 	.reset_reg	= AO_RTI_GEN_CNTL_REG0,
 	.num_reset	= ARRAY_SIZE(axg_aoclk_reset),
@@ -303,9 +317,6 @@ static const struct meson_aoclk_data axg_aoclkc_data = {
 	.num_clks	= ARRAY_SIZE(axg_aoclk_regmap),
 	.clks		= axg_aoclk_regmap,
 	.hw_data	= &axg_aoclk_onecell_data,
-	.inputs		= axg_aoclk_inputs,
-	.num_inputs	= ARRAY_SIZE(axg_aoclk_inputs),
-	.input_prefix	= IN_PREFIX,
 };
 
 static const struct of_device_id axg_aoclkc_match_table[] = {
-- 
2.17.1

