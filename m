Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 996B5C6379F
	for <linux-clk@archiver.kernel.org>; Mon, 23 Nov 2020 16:38:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 578E92073C
	for <linux-clk@archiver.kernel.org>; Mon, 23 Nov 2020 16:38:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bsiVR9Mm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389938AbgKWQiV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Nov 2020 11:38:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389781AbgKWQiU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Nov 2020 11:38:20 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D13C061A4E
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2020 08:38:20 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id i2so201201wrs.4
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2020 08:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q5avTsDM6MbYbagqqzSLf9X5FFe4EbwFCqAUyBew2Gc=;
        b=bsiVR9MmCxdO/RJoXzPuNvTXPzqEQFYpuHUMbVD9MgKdaYyyTn/aPe67lcdCK8iI3k
         nvAWR8FhlV9qQohIRFS1h5Jv6FflHtusqkR/UemyvZrq0+H97d8J0QnJoxkvezT+GX4O
         1tYnL7PFm4q2jCob+k5rWmq/u3ZPeh8bEwSrlu9mU56NlIihZF820CE0x72MAamiTPAa
         Nplcl2RRe99ds0zofPuReZuonza8ex3LwkY0rlSN8DZLBw9gVx48cy7tR41t0jURrBy/
         stzihb0S3D9uGqKGJp65KkT+IEvz3G/hGzO6oHsyT6Pn43kA2Fp/XLfx/zyJaAQRcmFh
         0uSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q5avTsDM6MbYbagqqzSLf9X5FFe4EbwFCqAUyBew2Gc=;
        b=ms8EilMqoiOJWi9/Xs3Y2lPZrB7pryevIu7vYPC9x3ThUHF2J3uMmLBBE/g+Fro7Dw
         nHhI2QasHh/KI3be4QCVgoNj/A9+V11N2nmn28R0r1/3r2xOYun+9A+qji4+GKoNtXhg
         WUPoZdvQhyRcnUz+LHqmA9It5VwhuZIKqSogMXMPjvQrceWUC+H86qbXCMYlDmMFhPZ0
         7ON+pZV5NUshpENOyvYGso4L9hZn+1pS9sjkGLvb8B3Ij4GtR5tKKnAXQmRvOa8qHPRR
         h+WPDrxCi2TnPWNqcOXW0VIjs7KcPqjhtsLKNxSSBZr0irBnBBbZoVNzgsZnMXANEJP7
         WN/w==
X-Gm-Message-State: AOAM532j6j7d2d7llxtwNRsyH1LsWzp4vprlo+BsLlMSy7pB2uaEvPpO
        suV/WY7pTUPtzAO1CY76Zgg4wg==
X-Google-Smtp-Source: ABdhPJx6pAjMpdAe+9714Rlp3PkaN3t2kdqPdj4MSGVV16wLMsTmu04aZ4SPTNOhvLbSm6jE7O4Mcw==
X-Received: by 2002:a5d:6050:: with SMTP id j16mr589970wrt.158.1606149499088;
        Mon, 23 Nov 2020 08:38:19 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:9541:d2fd:3a68:67ae])
        by smtp.gmail.com with ESMTPSA id l3sm19566386wmf.0.2020.11.23.08.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 08:38:18 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com
Cc:     linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/2] clk: meson: g12a: add MIPI DSI Host Pixel Clock
Date:   Mon, 23 Nov 2020 17:38:11 +0100
Message-Id: <20201123163811.353444-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123163811.353444-1-narmstrong@baylibre.com>
References: <20201123163811.353444-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This adds the MIPI DSI Host Pixel Clock, unlike AXG, the pixel clock can be different
from the VPU ENCL output clock to feed the DSI Host controller with a different clock rate.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/g12a.c | 72 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h |  3 +-
 2 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 3cb8196c8e29..3dedf8408405 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -3658,6 +3658,66 @@ static struct clk_regmap g12a_hdmi_tx = {
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
+		.flags = CLK_SET_RATE_PARENT,
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
+					&g12a_mipi_dsi_pxclk_sel.hw },
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
+					&g12a_mipi_dsi_pxclk_div.hw },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
 /* HDMI Clocks */
 
 static const struct clk_parent_data g12a_hdmi_parent_data[] = {
@@ -4403,6 +4463,9 @@ static struct clk_hw_onecell_data g12a_hw_onecell_data = {
 		[CLKID_SPICC1_SCLK_SEL]		= &g12a_spicc1_sclk_sel.hw,
 		[CLKID_SPICC1_SCLK_DIV]		= &g12a_spicc1_sclk_div.hw,
 		[CLKID_SPICC1_SCLK]		= &g12a_spicc1_sclk.hw,
+		[CLKID_MIPI_DSI_PXCLK_SEL]	= &g12a_mipi_dsi_pxclk_sel.hw,
+		[CLKID_MIPI_DSI_PXCLK_DIV]	= &g12a_mipi_dsi_pxclk_div.hw,
+		[CLKID_MIPI_DSI_PXCLK]		= &g12a_mipi_dsi_pxclk.hw,
 		[NR_CLKS]			= NULL,
 	},
 	.num = NR_CLKS,
@@ -4658,6 +4721,9 @@ static struct clk_hw_onecell_data g12b_hw_onecell_data = {
 		[CLKID_SPICC1_SCLK_SEL]		= &g12a_spicc1_sclk_sel.hw,
 		[CLKID_SPICC1_SCLK_DIV]		= &g12a_spicc1_sclk_div.hw,
 		[CLKID_SPICC1_SCLK]		= &g12a_spicc1_sclk.hw,
+		[CLKID_MIPI_DSI_PXCLK_SEL]	= &g12a_mipi_dsi_pxclk_sel.hw,
+		[CLKID_MIPI_DSI_PXCLK_DIV]	= &g12a_mipi_dsi_pxclk_div.hw,
+		[CLKID_MIPI_DSI_PXCLK]		= &g12a_mipi_dsi_pxclk.hw,
 		[NR_CLKS]			= NULL,
 	},
 	.num = NR_CLKS,
@@ -4904,6 +4970,9 @@ static struct clk_hw_onecell_data sm1_hw_onecell_data = {
 		[CLKID_NNA_CORE_CLK_SEL]	= &sm1_nna_core_clk_sel.hw,
 		[CLKID_NNA_CORE_CLK_DIV]	= &sm1_nna_core_clk_div.hw,
 		[CLKID_NNA_CORE_CLK]		= &sm1_nna_core_clk.hw,
+		[CLKID_MIPI_DSI_PXCLK_SEL]	= &g12a_mipi_dsi_pxclk_sel.hw,
+		[CLKID_MIPI_DSI_PXCLK_DIV]	= &g12a_mipi_dsi_pxclk_div.hw,
+		[CLKID_MIPI_DSI_PXCLK]		= &g12a_mipi_dsi_pxclk.hw,
 		[NR_CLKS]			= NULL,
 	},
 	.num = NR_CLKS,
@@ -5151,6 +5220,9 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
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

