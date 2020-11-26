Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED19C64E7B
	for <linux-clk@archiver.kernel.org>; Thu, 26 Nov 2020 14:16:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2E7E20B80
	for <linux-clk@archiver.kernel.org>; Thu, 26 Nov 2020 14:16:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gVtPSCQa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391096AbgKZOQM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Nov 2020 09:16:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390350AbgKZOQM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Nov 2020 09:16:12 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2160CC0613D4
        for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2020 06:16:10 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id a3so2548849wmb.5
        for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2020 06:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tMVgTeO03AHhfaOSmS4teYNEJZSWM7hPB1HU15pX36k=;
        b=gVtPSCQalNvDgr33ts7W1WaWeEMcrGJRwq51W7OCAC9uj3VCBekCCfcLbzwb/8S0zm
         NUD1DrOfqHWkkbKBLKyftCMjuEyeP8yU8ATXGOOjFRoUyWZL6wZ/6dn/inrI834Mx9i3
         SuPNcVzNtodBIqclscIz8iPdzdIAukRemLN1OQN4J7/sW4VMRg91TBHtENsC+pRfsoa3
         4wVd9b4D7BE9eQgMaXglhfjd6YNh16MgNJ+lZXfs+qbQaGKzP1yEkX1BJvEoVE2kdORk
         Ahr45Mh5BFRvrDn0Ek6KeV+eKzEL2fL4KEF4LY/sturMGkDNCBv/zKQhBsVjJOCBiCYR
         bcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tMVgTeO03AHhfaOSmS4teYNEJZSWM7hPB1HU15pX36k=;
        b=Ne1yItTbY/J/N6ENoFmZW3EUwaLC8Z6JF5OTWLrXQzYD8kYKsAzyZ6WWXHo5mPD8/l
         Cww9iGd1N8CPB+tCB+n4qYNHyw/V3gARN6G95nd3wYqkdtZpu/nmP8gWBuFLZ6c3coD4
         5I+6yb3+7rn7whkghBpWouvr5OYzY3h/ZHkAEUWg6a6RTlq+jjx8GLlht9Fh/VP3zgmg
         KgTxLxYC8DjgZLKi5gvt070vG7hGq67JcjyibTVeBbdWWLjOT8XGFCtUwmD/CVmYGfJn
         pZ2HRFXCXMo76HNKd6Wlp3xaQ/2zyTp+rhgpbb1gauF9jhPeTxDSzxyv5+J3e/WHH72U
         ciQg==
X-Gm-Message-State: AOAM533OM1Yz6vl630u4pA03xqvUjqTVKMLu/V/8/qT1KWKrRT03KNkr
        1jx1Ocqx+ozKTBL9XdYCqarvww==
X-Google-Smtp-Source: ABdhPJzyw6FRZRnhPaXyj5fKgnv9UjDJ2IPRJKrRiF/jQm3EgOpM1u2p5SXBCxI6KRvHok2ByHZ0Qg==
X-Received: by 2002:a1c:61c5:: with SMTP id v188mr3597306wmb.141.1606400168632;
        Thu, 26 Nov 2020 06:16:08 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:193b:ad82:52ad:936c])
        by smtp.gmail.com with ESMTPSA id q16sm9286079wrn.13.2020.11.26.06.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 06:16:07 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com
Cc:     linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 2/2] clk: meson: g12a: add MIPI DSI Host Pixel Clock
Date:   Thu, 26 Nov 2020 15:16:00 +0100
Message-Id: <20201126141600.2084586-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126141600.2084586-1-narmstrong@baylibre.com>
References: <20201126141600.2084586-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This adds the MIPI DSI Host Pixel Clock, unlike AXG, the pixel clock can be different
from the VPU ENCL output clock to feed the DSI Host controller with a different clock rate.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/g12a.c | 74 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h |  3 +-
 2 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 3cb8196c8e29..b080359b4645 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -3658,6 +3658,68 @@ static struct clk_regmap g12a_hdmi_tx = {
 	},
 };
 
+/* MIPI DSI Host Clocks */
+
+static const struct clk_hw *g12a_mipi_dsi_pxclk_parent_hws[] = {
+	&g12a_vid_pll.hw,
+	&g12a_gp0_pll.hw,
+	&g12a_hifi_pll.hw,
+	&g12a_mpll1.hw,
+	&g12a_fclk_div2.hw,
+	&g12a_fclk_div2p5.hw,
+	&g12a_fclk_div3.hw,
+	&g12a_fclk_div7.hw,
+};
+
+static struct clk_regmap g12a_mipi_dsi_pxclk_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_MIPIDSI_PHY_CLK_CNTL,
+		.mask = 0x7,
+		.shift = 12,
+		.flags = CLK_MUX_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "mipi_dsi_pxclk_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_hws = g12a_mipi_dsi_pxclk_parent_hws,
+		.num_parents = ARRAY_SIZE(g12a_mipi_dsi_pxclk_parent_hws),
+		.flags = CLK_SET_RATE_NO_REPARENT,
+	},
+};
+
+static struct clk_regmap g12a_mipi_dsi_pxclk_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_MIPIDSI_PHY_CLK_CNTL,
+		.shift = 0,
+		.width = 7,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "mipi_dsi_pxclk_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12a_mipi_dsi_pxclk_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap g12a_mipi_dsi_pxclk = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_MIPIDSI_PHY_CLK_CNTL,
+		.bit_idx = 8,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "mipi_dsi_pxclk",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12a_mipi_dsi_pxclk_div.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
 /* HDMI Clocks */
 
 static const struct clk_parent_data g12a_hdmi_parent_data[] = {
@@ -4403,6 +4465,9 @@ static struct clk_hw_onecell_data g12a_hw_onecell_data = {
 		[CLKID_SPICC1_SCLK_SEL]		= &g12a_spicc1_sclk_sel.hw,
 		[CLKID_SPICC1_SCLK_DIV]		= &g12a_spicc1_sclk_div.hw,
 		[CLKID_SPICC1_SCLK]		= &g12a_spicc1_sclk.hw,
+		[CLKID_MIPI_DSI_PXCLK_SEL]	= &g12a_mipi_dsi_pxclk_sel.hw,
+		[CLKID_MIPI_DSI_PXCLK_DIV]	= &g12a_mipi_dsi_pxclk_div.hw,
+		[CLKID_MIPI_DSI_PXCLK]		= &g12a_mipi_dsi_pxclk.hw,
 		[NR_CLKS]			= NULL,
 	},
 	.num = NR_CLKS,
@@ -4658,6 +4723,9 @@ static struct clk_hw_onecell_data g12b_hw_onecell_data = {
 		[CLKID_SPICC1_SCLK_SEL]		= &g12a_spicc1_sclk_sel.hw,
 		[CLKID_SPICC1_SCLK_DIV]		= &g12a_spicc1_sclk_div.hw,
 		[CLKID_SPICC1_SCLK]		= &g12a_spicc1_sclk.hw,
+		[CLKID_MIPI_DSI_PXCLK_SEL]	= &g12a_mipi_dsi_pxclk_sel.hw,
+		[CLKID_MIPI_DSI_PXCLK_DIV]	= &g12a_mipi_dsi_pxclk_div.hw,
+		[CLKID_MIPI_DSI_PXCLK]		= &g12a_mipi_dsi_pxclk.hw,
 		[NR_CLKS]			= NULL,
 	},
 	.num = NR_CLKS,
@@ -4904,6 +4972,9 @@ static struct clk_hw_onecell_data sm1_hw_onecell_data = {
 		[CLKID_NNA_CORE_CLK_SEL]	= &sm1_nna_core_clk_sel.hw,
 		[CLKID_NNA_CORE_CLK_DIV]	= &sm1_nna_core_clk_div.hw,
 		[CLKID_NNA_CORE_CLK]		= &sm1_nna_core_clk.hw,
+		[CLKID_MIPI_DSI_PXCLK_SEL]	= &g12a_mipi_dsi_pxclk_sel.hw,
+		[CLKID_MIPI_DSI_PXCLK_DIV]	= &g12a_mipi_dsi_pxclk_div.hw,
+		[CLKID_MIPI_DSI_PXCLK]		= &g12a_mipi_dsi_pxclk.hw,
 		[NR_CLKS]			= NULL,
 	},
 	.num = NR_CLKS,
@@ -5151,6 +5222,9 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
 	&sm1_nna_core_clk_sel,
 	&sm1_nna_core_clk_div,
 	&sm1_nna_core_clk,
+	&g12a_mipi_dsi_pxclk_sel,
+	&g12a_mipi_dsi_pxclk_div,
+	&g12a_mipi_dsi_pxclk,
 };
 
 static const struct reg_sequence g12a_init_regs[] = {
diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
index 69b6a69549c7..a97613df38b3 100644
--- a/drivers/clk/meson/g12a.h
+++ b/drivers/clk/meson/g12a.h
@@ -264,8 +264,9 @@
 #define CLKID_NNA_AXI_CLK_DIV			263
 #define CLKID_NNA_CORE_CLK_SEL			265
 #define CLKID_NNA_CORE_CLK_DIV			266
+#define CLKID_MIPI_DSI_PXCLK_DIV		268
 
-#define NR_CLKS					268
+#define NR_CLKS					271
 
 /* include the CLKIDs that have been made part of the DT binding */
 #include <dt-bindings/clock/g12a-clkc.h>
-- 
2.25.1

