Return-Path: <SRS0=khTx=SO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5366C10F14
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 10:02:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8E487218E2
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 10:02:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CuriOZMv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbfDLKC2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Apr 2019 06:02:28 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42157 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbfDLKC2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Apr 2019 06:02:28 -0400
Received: by mail-wr1-f68.google.com with SMTP id g3so11127184wrx.9
        for <linux-clk@vger.kernel.org>; Fri, 12 Apr 2019 03:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=/7UXe2DQp/yMvOny3p/HegPYQz23AchTDS99VgInBWU=;
        b=CuriOZMvLZu6W5D0eoLTC8FoMZJ0zKbd+M0jAoDyAEqzbJn4eHScWYTnqr3qMAl+cr
         nSA21A3498huru6/8evhz+PrG89PYx3JJnkjfV1zSzj95EwZHpR9kWlPFAJuT5QqKjWM
         rFN4jH+2B11jUCrJKBC9May6Ol7HA3M1QsHJplEzERBg0FL9pKZlrF354tFBfndSSCmU
         Jki66MQkVLdcRLbevlSB/w7Sh4NywcDzhnadGujKZc/B3bLvNsJ2GhCjaMolR2QBNO4J
         k5KDn0F0VqlFrBvGiKvmkD7SDAJIDN9761cJmHzmj8EorNUH7NKFAeYaoCsAzpeQl+2G
         mtRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=/7UXe2DQp/yMvOny3p/HegPYQz23AchTDS99VgInBWU=;
        b=O/6QMxW8Ef9Zk71oPbadspsvnnMOkxXwzwNiR02BqhqEIAre+48xlvHQV6lYmjjM4g
         jX9afR0m/GdbSHiFimd0Mcpo93M+6629bhIcDbtds3jHTfJBKVwnUkjKcTj02AX7OVKl
         DpgzrbuzOHFDKMQ2ODe8cWulRBK02ZT9VYEHnc8j5wnCpqpoabw/C4aP/HRS7Dsqhz0m
         68q/52djDWHHk9jEFGS1FJo/ivM5yGW0QR8u0s2I9UUMow1y8vF2SJlAT+d1fAaZtj0Q
         NnyVH/tju5o8TgxunwzxkHuYs/MUcNuYgYaS9Bg8QuCwdGku9gJNFmAu0qN/43tz9F1n
         5+0w==
X-Gm-Message-State: APjAAAUUhROERGC+YpZImy7ubdsLRgtbccqO8R6xZykaiO6IzdzCCgXa
        9dRg61U2ZlzlwUG8lEjY5FQ55A==
X-Google-Smtp-Source: APXvYqyXe/x7KxLnFH96TFnOajXc5ljmtO4D8GhNtWC1yk24LarkgfUMteurHFq/GwhD8VRy650O0Q==
X-Received: by 2002:a5d:4a4f:: with SMTP id v15mr24909809wrs.5.1555063345983;
        Fri, 12 Apr 2019 03:02:25 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id t14sm5961031wmi.16.2019.04.12.03.02.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Apr 2019 03:02:24 -0700 (PDT)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     jbrunet@baylibre.com, narmstrong@baylibre.com,
        khilman@baylibre.com, linux-amlogic@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 2/2] clk: meson-g12a: Add Temperature Sensor clock
Date:   Fri, 12 Apr 2019 12:02:21 +0200
Message-Id: <20190412100221.26740-3-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190412100221.26740-1-glaroque@baylibre.com>
References: <20190412100221.26740-1-glaroque@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add TS clock used by two temperature sensor

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 drivers/clk/meson/g12a.c | 31 +++++++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h |  3 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 86a7c1b5bd42..0a1cf782670b 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -2480,6 +2480,33 @@ static struct clk_regmap g12a_mali = {
 	},
 };
 
+static struct clk_regmap g12a_ts_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_TS_CLK_CNTL,
+		.shift = 0,
+		.width = 8,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "ts_div",
+		.ops = &clk_regmap_divider_ro_ops,
+		.parent_names = (const char *[]){ "xtal" },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap g12a_ts = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_TS_CLK_CNTL,
+		.bit_idx = 8,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "ts",
+		.ops = &clk_regmap_gate_ops,
+		.parent_names = (const char *[]){ "ts_div" },
+		.num_parents = 1,
+	},
+};
+
 /* Everything Else (EE) domain gates */
 static MESON_GATE(g12a_ddr,			HHI_GCLK_MPEG0,	0);
 static MESON_GATE(g12a_dos,			HHI_GCLK_MPEG0,	1);
@@ -2769,6 +2796,8 @@ static struct clk_hw_onecell_data g12a_hw_onecell_data = {
 		[CLKID_VDEC_HEVCF_SEL]		= &g12a_vdec_hevcf_sel.hw,
 		[CLKID_VDEC_HEVCF_DIV]		= &g12a_vdec_hevcf_div.hw,
 		[CLKID_VDEC_HEVCF]		= &g12a_vdec_hevcf.hw,
+		[CLKID_TS_DIV]			= &g12a_ts_div.hw,
+		[CLKID_TS]			= &g12a_ts.hw,
 		[NR_CLKS]			= NULL,
 	},
 	.num = NR_CLKS,
@@ -2966,6 +2995,8 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
 	&g12a_vdec_hevcf_sel,
 	&g12a_vdec_hevcf_div,
 	&g12a_vdec_hevcf,
+	&g12a_ts_div,
+	&g12a_ts,
 };
 
 static const struct meson_eeclkc_data g12a_clkc_data = {
diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
index 39c41af70804..877b8d205f12 100644
--- a/drivers/clk/meson/g12a.h
+++ b/drivers/clk/meson/g12a.h
@@ -195,8 +195,9 @@
 #define CLKID_VDEC_HEVC_DIV			206
 #define CLKID_VDEC_HEVCF_SEL			208
 #define CLKID_VDEC_HEVCF_DIV			209
+#define CLKID_TS_DIV				211
 
-#define NR_CLKS					211
+#define NR_CLKS					213
 
 /* include the CLKIDs that have been made part of the DT binding */
 #include <dt-bindings/clock/g12a-clkc.h>
-- 
2.17.1

