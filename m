Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 837E5C11F66
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jul 2021 23:25:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67DF96135A
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jul 2021 23:25:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237068AbhGMX2P (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Jul 2021 19:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237061AbhGMX2P (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jul 2021 19:28:15 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC79CC0613EE;
        Tue, 13 Jul 2021 16:25:22 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id m11-20020a05600c3b0bb0290228f19cb433so2726661wms.0;
        Tue, 13 Jul 2021 16:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FH75JwQEVliZTaWQznunNwTYXm+Fo6iQYmM7PbpCqSg=;
        b=fX5FxxXqlzoY7IxLhQNQg1smTSkSn1eHqVimKllvBWfJTwrNPzR1Vrmp8VR/Lq1jIo
         a0SbXWKhZenNgh0uKQDmLwDf6R3mFKNIuOupKkUclmsRjj8EKFOWCVZug+H0eE15Japw
         /hxLUZTqVdzeTa7nhhGLSSRlbSsUxM4JRlmxKHE9khgg2nsjtk+euga2pgJTtQuFcIpb
         1apBe7gFE6sDYtHpr0+XzvUcS216jM1IejOTdxW1WfkoHmCzZVDAMD8zDrzKAqvb19Dd
         VaxEtLmqr3NId1hApJ1XxE1uvcQpuyM7pZrIs9WKSmG19HsMwOLMhYz0PxMjl3W+HJiE
         247g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FH75JwQEVliZTaWQznunNwTYXm+Fo6iQYmM7PbpCqSg=;
        b=aOtIdfqbSC3dpZXXNVZ5LkWo3Hq2csqHtA4lNdwV/5uMEAi709S5sFdZSF8gM95FUi
         9UA8SRSr2dVlMiey9WXYuk9+qoAcWvnDmQ4+9D8eDQDDYrNsYZKmrGZm1f/CWHyXPZ3I
         6hCTTkuOpdNE/hYpgqg8bUf6f12kVX76FTpJFUc5w/xQmRjXrd6O/WdwGPgbI9+h1Aws
         V52CY7XNjWXwfBitF1Xo8+gDVQp7tF45XgWLuBJUDwkpIr3uWXjcV+TlM/q7xY7OFMk9
         IMnjJrIV3e/tiT4SWajPWlpR9o2mauxFzOf7LSbtCqeYRgezuC5q6KKJ6nwHdzfhSKwH
         f+aw==
X-Gm-Message-State: AOAM532g/O4QuLYtNy5J+q8xF/exKKb4e8q17j3XpSTOYFJPmJV2WSoX
        toGAPoXLKVCiV1VXyzKDZE8=
X-Google-Smtp-Source: ABdhPJxnNKco3a/kivcsIRnmdxRAj+ZXML03zzTKPNo++xrIsOEnuoPpZAmSAlxRz8mspb013enWwg==
X-Received: by 2002:a05:600c:4841:: with SMTP id j1mr7773098wmo.88.1626218721546;
        Tue, 13 Jul 2021 16:25:21 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a01-0c23-c041-6f00-f22f-74ff-fe21-0725.c23.pool.telefonica.de. [2a01:c23:c041:6f00:f22f:74ff:fe21:725])
        by smtp.googlemail.com with ESMTPSA id o11sm3857390wmc.2.2021.07.13.16.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 16:25:21 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-amlogic@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, jbrunet@baylibre.com,
        narmstrong@baylibre.com,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 6/6] clk: meson: meson8b: Export the video clocks
Date:   Wed, 14 Jul 2021 01:25:10 +0200
Message-Id: <20210713232510.3057750-7-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210713232510.3057750-1-martin.blumenstingl@googlemail.com>
References: <20210713232510.3057750-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Setting the video clocks requires fine-tuned adjustments of various
video clocks. Export the required ones to allow changing the video clock
for the CVBS and HDMI outputs at runtime.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.h              | 12 +-----------
 include/dt-bindings/clock/meson8b-clkc.h | 10 ++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
index b5b591943e80..ce62ed47cbfc 100644
--- a/drivers/clk/meson/meson8b.h
+++ b/drivers/clk/meson/meson8b.h
@@ -117,14 +117,11 @@
 #define CLKID_PERIPH_SEL	125
 #define CLKID_AXI_SEL		127
 #define CLKID_L2_DRAM_SEL	129
-#define CLKID_HDMI_PLL_LVDS_OUT	131
-#define CLKID_HDMI_PLL_HDMI_OUT	132
+#define CLKID_HDMI_PLL_LVDS_OUT 131
 #define CLKID_VID_PLL_IN_SEL	133
 #define CLKID_VID_PLL_IN_EN	134
 #define CLKID_VID_PLL_PRE_DIV	135
 #define CLKID_VID_PLL_POST_DIV	136
-#define CLKID_VID_PLL_FINAL_DIV	137
-#define CLKID_VCLK_IN_SEL	138
 #define CLKID_VCLK_IN_EN	139
 #define CLKID_VCLK_DIV1		140
 #define CLKID_VCLK_DIV2_DIV	141
@@ -135,7 +132,6 @@
 #define CLKID_VCLK_DIV6		146
 #define CLKID_VCLK_DIV12_DIV	147
 #define CLKID_VCLK_DIV12	148
-#define CLKID_VCLK2_IN_SEL	149
 #define CLKID_VCLK2_IN_EN	150
 #define CLKID_VCLK2_DIV1	151
 #define CLKID_VCLK2_DIV2_DIV	152
@@ -147,17 +143,11 @@
 #define CLKID_VCLK2_DIV12_DIV	158
 #define CLKID_VCLK2_DIV12	159
 #define CLKID_CTS_ENCT_SEL	160
-#define CLKID_CTS_ENCT		161
 #define CLKID_CTS_ENCP_SEL	162
-#define CLKID_CTS_ENCP		163
 #define CLKID_CTS_ENCI_SEL	164
-#define CLKID_CTS_ENCI		165
 #define CLKID_HDMI_TX_PIXEL_SEL	166
-#define CLKID_HDMI_TX_PIXEL	167
 #define CLKID_CTS_ENCL_SEL	168
-#define CLKID_CTS_ENCL		169
 #define CLKID_CTS_VDAC0_SEL	170
-#define CLKID_CTS_VDAC0		171
 #define CLKID_HDMI_SYS_SEL	172
 #define CLKID_HDMI_SYS_DIV	173
 #define CLKID_MALI_0_SEL	175
diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
index f33781338eda..78aa07fd7cc0 100644
--- a/include/dt-bindings/clock/meson8b-clkc.h
+++ b/include/dt-bindings/clock/meson8b-clkc.h
@@ -105,6 +105,16 @@
 #define CLKID_PERIPH		126
 #define CLKID_AXI		128
 #define CLKID_L2_DRAM		130
+#define CLKID_HDMI_PLL_HDMI_OUT	132
+#define CLKID_VID_PLL_FINAL_DIV	137
+#define CLKID_VCLK_IN_SEL	138
+#define CLKID_VCLK2_IN_SEL	149
+#define CLKID_CTS_ENCT		161
+#define CLKID_CTS_ENCP		163
+#define CLKID_CTS_ENCI		165
+#define CLKID_HDMI_TX_PIXEL	167
+#define CLKID_CTS_ENCL		169
+#define CLKID_CTS_VDAC0		171
 #define CLKID_HDMI_SYS		174
 #define CLKID_VPU		190
 #define CLKID_VDEC_1		196
-- 
2.32.0

