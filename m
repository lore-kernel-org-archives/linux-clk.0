Return-Path: <SRS0=RhxI=CY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D8ECC433E2
	for <linux-clk@archiver.kernel.org>; Tue, 15 Sep 2020 12:48:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB68521655
	for <linux-clk@archiver.kernel.org>; Tue, 15 Sep 2020 12:48:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LSMKV9E1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726137AbgIOMsF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Sep 2020 08:48:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbgIOMrr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Sep 2020 08:47:47 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 301D9C061356
        for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2020 05:46:04 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id l9so3320590wme.3
        for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2020 05:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LHSM2iu4K745x/v3ZOpzSJ39ii9pvOm29QBeCUqbXig=;
        b=LSMKV9E1RHvzyFXuIfZParKjQcDPzMHd+HNuG37MfAhMeuciO6NZQUeZ7RvfnR2o8I
         tBolL7KrYEQOphZRKiQTAIcWGU4SgWclzi6VE7bbcnu/R9jxwRfgBwjqtJwnUumgTHFB
         DzX7NkyCfMmzrlumnfUV/7em/7/vUQi15L5SLJ912p2vxY9u4bR6d/SmNfejlb3WiT57
         08CoSBUacR84AMPDP52ukk/2zHu/QX+tuRRl7zX2GrlnykDRz/bPHNfyRJmSIfVRhxXT
         ieHIfJvOhB5Lxo7UNxPzhNBKIXYLHD4HSkSjHxEpzFN6WGmGUPDh+wwykTSSPz401PPw
         x3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LHSM2iu4K745x/v3ZOpzSJ39ii9pvOm29QBeCUqbXig=;
        b=m1Ne30OWp+sPju4oWpwqQW4ORxKy2NPbBdw7FpyXB6xImROq70NsZWqS4Kp3E7PezB
         Prf/I5OUbCglcQgsXyH0H/gHZSeAdgi1SySurHcME1A/KbeLXg1ewrdazxfZScfxGQLX
         bvsoeLlzYvvVkZTzbjoyzjzsAmfuNiqlTALT/mgj8Y05s+2JEDDk6gnyvZiJF6eNIZZi
         gze3MdfQ3SGs9WYadQicTWiCflS5S4ddlXjQifSXAlByG5+s1emATlOfNkulWcK9ezYr
         j4ykpFC2cGTfLkpgOHmplQxP80oy1ZF5viDBh60r6wM8UCeuEgkibAqR11xPRkZocCqI
         d44A==
X-Gm-Message-State: AOAM5309X7tX4khvciC4FClf/kI/F/GXiBETtc/sjcm/vPgp37Nbv4eU
        tiTu2dVDIX1g7CGJqoXqqawJbA==
X-Google-Smtp-Source: ABdhPJx7awCJQT1ZbKP8GwvwkIGpiaGrgV9tODdJfba635Qj3aWUUkYLeL9InIbQo6ZmEyQ3rtobOA==
X-Received: by 2002:a7b:c090:: with SMTP id r16mr4677613wmh.56.1600173962213;
        Tue, 15 Sep 2020 05:46:02 -0700 (PDT)
Received: from bender.baylibre.local (home.beaume.starnux.net. [82.236.8.43])
        by smtp.gmail.com with ESMTPSA id q8sm26548589wrx.79.2020.09.15.05.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 05:46:01 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com
Cc:     linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 4/4] clk: meson: axg: add MIPI DSI Host clock
Date:   Tue, 15 Sep 2020 14:45:53 +0200
Message-Id: <20200915124553.8056-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200915124553.8056-1-narmstrong@baylibre.com>
References: <20200915124553.8056-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This adds the MIPI DSI Host clock, used to measure the signal timings (ENC VSYNC or
DW-MIPI-DSI eDPI timings).

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/axg.c | 66 +++++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/axg.h |  4 ++-
 2 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index a4e8949297cf..089a81ce2385 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -1703,6 +1703,66 @@ static struct clk_regmap axg_cts_encl = {
 	},
 };
 
+/* MIPI DSI Host Clock */
+
+static u32 mux_table_axg_vdin_meas[]    = { 0, 1, 2, 3, 6, 7 };
+static const struct clk_parent_data axg_vdin_meas_parent_data[] = {
+	{ .fw_name = "xtal", },
+	{ .hw = &axg_fclk_div4.hw },
+	{ .hw = &axg_fclk_div3.hw },
+	{ .hw = &axg_fclk_div5.hw },
+	{ .hw = &axg_fclk_div2.hw },
+	{ .hw = &axg_fclk_div7.hw },
+};
+
+static struct clk_regmap axg_vdin_meas_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_VDIN_MEAS_CLK_CNTL,
+		.mask = 0x7,
+		.shift = 21,
+		.flags = CLK_MUX_ROUND_CLOSEST,
+		.table = mux_table_axg_vdin_meas,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vdin_meas_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_data = axg_vdin_meas_parent_data,
+		.num_parents = ARRAY_SIZE(axg_vdin_meas_parent_data),
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap axg_vdin_meas_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_VDIN_MEAS_CLK_CNTL,
+		.shift = 12,
+		.width = 7,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vdin_meas_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_vdin_meas_sel.hw },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap axg_vdin_meas = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VDIN_MEAS_CLK_CNTL,
+		.bit_idx = 20,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vdin_meas",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_vdin_meas_div.hw },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
 static u32 mux_table_gen_clk[]	= { 0, 4, 5, 6, 7, 8,
 				    9, 10, 11, 13, 14, };
 static const struct clk_parent_data gen_clk_parent_data[] = {
@@ -1966,6 +2026,9 @@ static struct clk_hw_onecell_data axg_hw_onecell_data = {
 		[CLKID_VCLK2_DIV12]		= &axg_vclk2_div12.hw,
 		[CLKID_CTS_ENCL_SEL]		= &axg_cts_encl_sel.hw,
 		[CLKID_CTS_ENCL]		= &axg_cts_encl.hw,
+		[CLKID_VDIN_MEAS_SEL]		= &axg_vdin_meas_sel.hw,
+		[CLKID_VDIN_MEAS_DIV]		= &axg_vdin_meas_div.hw,
+		[CLKID_VDIN_MEAS]		= &axg_vdin_meas.hw,
 		[NR_CLKS]			= NULL,
 	},
 	.num = NR_CLKS,
@@ -2094,6 +2157,9 @@ static struct clk_regmap *const axg_clk_regmaps[] = {
 	&axg_vclk2_div12_en,
 	&axg_cts_encl_sel,
 	&axg_cts_encl,
+	&axg_vdin_meas_sel,
+	&axg_vdin_meas_div,
+	&axg_vdin_meas,
 };
 
 static const struct meson_eeclkc_data axg_clkc_data = {
diff --git a/drivers/clk/meson/axg.h b/drivers/clk/meson/axg.h
index a8787b394a47..481b307ea3cb 100644
--- a/drivers/clk/meson/axg.h
+++ b/drivers/clk/meson/axg.h
@@ -158,8 +158,10 @@
 #define CLKID_VCLK2_DIV6_EN			120
 #define CLKID_VCLK2_DIV12_EN			121
 #define CLKID_CTS_ENCL_SEL			132
+#define CLKID_VDIN_MEAS_SEL			134
+#define CLKID_VDIN_MEAS_DIV			135
 
-#define NR_CLKS					134
+#define NR_CLKS					137
 
 /* include the CLKIDs that have been made part of the DT binding */
 #include <dt-bindings/clock/axg-clkc.h>
-- 
2.22.0

