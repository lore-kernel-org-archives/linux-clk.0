Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37128C43334
	for <linux-clk@archiver.kernel.org>; Sun, 12 Jun 2022 19:31:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234325AbiFLTbS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 12 Jun 2022 15:31:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234931AbiFLTaP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 12 Jun 2022 15:30:15 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D4EC41FBA
        for <linux-clk@vger.kernel.org>; Sun, 12 Jun 2022 12:30:14 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id o6-20020a17090a0a0600b001e2c6566046so6942419pjo.0
        for <linux-clk@vger.kernel.org>; Sun, 12 Jun 2022 12:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=schmorgal.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/O5CERdZGY2zFlkCKgFb4wyePn597GVj1UrNqxXlMMo=;
        b=YMhgfdQth9bM9HDlAR/yzr5GysjhwkH06D6K4ZrU8FACWxvKQ4WDuwVz/z3j1GOlBM
         nfMUPOr6legvNe2XLd8UR2MSudZ44QX/KC2nf8GrXthG6P2OId5P5wuD8V3SSupHnter
         fhMw/zrZh+BbKVRpaVGGL8SQWlPcAEsFFwOYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/O5CERdZGY2zFlkCKgFb4wyePn597GVj1UrNqxXlMMo=;
        b=anvsr7s24l9AIviCxpeBb+yhaZq9GySoGYOmLpu83k7pcW+s5Hof5oQbgP4sNcTKsY
         cTzI5x9AesIf/bv7eYpOAh13+1HQX+ntCrg0AdHjHSP43t+pT/9GP63lg5Bhu4P0tzZt
         OE9fBUOSGx5cuAlYX0F5o1/NFkQx+xYBB3zspdYrK5j5IhnL9mttfTGp0hkT7SMx+1jr
         LidbJlyzYGIAxoHXnV5Awe8dmOtNLsfcjcArIrFngQfqyL69/Y4O4S6bkLd6bc0pee+Q
         xXNHAVyUu7EKrq1G65+/jBzjRSekTC6GU88Mu7M9Y1665+15a6naa6X6a4LWm2Z7r5pw
         +c/g==
X-Gm-Message-State: AOAM5304R/JNDr3snt+vZWsUhFaOjgkbuyjKaiZS0ArTCgWJwN8ysj1W
        NM4MSthh/o4V2bFG9JF6mOMYDg==
X-Google-Smtp-Source: ABdhPJwAJzpl1TID+AjEm0d9+RWMXrlU1fKIDDWdJjMEKmKWmEiqrof/xYx7m1rA4WOHGxyrdxM78Q==
X-Received: by 2002:a17:90a:5d04:b0:1e0:83d7:413c with SMTP id s4-20020a17090a5d0400b001e083d7413cmr11825724pji.201.1655062213577;
        Sun, 12 Jun 2022 12:30:13 -0700 (PDT)
Received: from localhost.localdomain ([50.45.132.243])
        by smtp.gmail.com with ESMTPSA id i62-20020a628741000000b0050dc76281bdsm3603607pfe.151.2022.06.12.12.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 12:30:13 -0700 (PDT)
From:   Doug Brown <doug@schmorgal.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Brown <doug@schmorgal.com>
Subject: [PATCH 07/12] clk: mmp: pxa168: add muxes for more peripherals
Date:   Sun, 12 Jun 2022 12:29:32 -0700
Message-Id: <20220612192937.162952-8-doug@schmorgal.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220612192937.162952-1-doug@schmorgal.com>
References: <20220612192937.162952-1-doug@schmorgal.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The TWSI, KPC, PWM, and DFC peripherals didn't have their muxes modeled
in the code, but the PXA168 datasheet shows that they are indeed muxed:

- TWSI can be 31.2 MHz or 62.4 MHz
- KPC can be 32 kHz, 16 kHz, or 26 MHz
- PWM can be 13 MHz or 32 kHz
- DFC can be 156 MHz or 78 MHz

Signed-off-by: Doug Brown <doug@schmorgal.com>
---
 drivers/clk/mmp/clk-of-pxa168.c | 42 +++++++++++++++++++++++++--------
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/mmp/clk-of-pxa168.c b/drivers/clk/mmp/clk-of-pxa168.c
index 86e88519938e..d779b3f89656 100644
--- a/drivers/clk/mmp/clk-of-pxa168.c
+++ b/drivers/clk/mmp/clk-of-pxa168.c
@@ -130,6 +130,19 @@ static void pxa168_pll_init(struct pxa168_clk_unit *pxa_unit)
 	mmp_clk_add(unit, PXA168_CLK_UART_PLL, clk);
 }
 
+static DEFINE_SPINLOCK(twsi0_lock);
+static DEFINE_SPINLOCK(twsi1_lock);
+static const char * const twsi_parent_names[] = {"pll1_2_1_10", "pll1_2_1_5"};
+
+static DEFINE_SPINLOCK(kpc_lock);
+static const char * const kpc_parent_names[] = {"clk32", "clk32_2", "pll1_24"};
+
+static DEFINE_SPINLOCK(pwm0_lock);
+static DEFINE_SPINLOCK(pwm1_lock);
+static DEFINE_SPINLOCK(pwm2_lock);
+static DEFINE_SPINLOCK(pwm3_lock);
+static const char * const pwm_parent_names[] = {"pll1_48", "clk32"};
+
 static DEFINE_SPINLOCK(uart0_lock);
 static DEFINE_SPINLOCK(uart1_lock);
 static DEFINE_SPINLOCK(uart2_lock);
@@ -148,6 +161,13 @@ static const char * const timer_parent_names[] = {"pll1_48", "clk32", "pll1_96",
 static DEFINE_SPINLOCK(reset_lock);
 
 static struct mmp_param_mux_clk apbc_mux_clks[] = {
+	{0, "twsi0_mux", twsi_parent_names, ARRAY_SIZE(twsi_parent_names), CLK_SET_RATE_PARENT, APBC_TWSI0, 4, 3, 0, &twsi0_lock},
+	{0, "twsi1_mux", twsi_parent_names, ARRAY_SIZE(twsi_parent_names), CLK_SET_RATE_PARENT, APBC_TWSI1, 4, 3, 0, &twsi1_lock},
+	{0, "kpc_mux", kpc_parent_names, ARRAY_SIZE(kpc_parent_names), CLK_SET_RATE_PARENT, APBC_KPC, 4, 3, 0, &kpc_lock},
+	{0, "pwm0_mux", pwm_parent_names, ARRAY_SIZE(pwm_parent_names), CLK_SET_RATE_PARENT, APBC_PWM0, 4, 3, 0, &pwm0_lock},
+	{0, "pwm1_mux", pwm_parent_names, ARRAY_SIZE(pwm_parent_names), CLK_SET_RATE_PARENT, APBC_PWM1, 4, 3, 0, &pwm1_lock},
+	{0, "pwm2_mux", pwm_parent_names, ARRAY_SIZE(pwm_parent_names), CLK_SET_RATE_PARENT, APBC_PWM2, 4, 3, 0, &pwm2_lock},
+	{0, "pwm3_mux", pwm_parent_names, ARRAY_SIZE(pwm_parent_names), CLK_SET_RATE_PARENT, APBC_PWM3, 4, 3, 0, &pwm3_lock},
 	{0, "uart0_mux", uart_parent_names, ARRAY_SIZE(uart_parent_names), CLK_SET_RATE_PARENT, APBC_UART0, 4, 3, 0, &uart0_lock},
 	{0, "uart1_mux", uart_parent_names, ARRAY_SIZE(uart_parent_names), CLK_SET_RATE_PARENT, APBC_UART1, 4, 3, 0, &uart1_lock},
 	{0, "uart2_mux", uart_parent_names, ARRAY_SIZE(uart_parent_names), CLK_SET_RATE_PARENT, APBC_UART2, 4, 3, 0, &uart2_lock},
@@ -160,16 +180,15 @@ static struct mmp_param_mux_clk apbc_mux_clks[] = {
 };
 
 static struct mmp_param_gate_clk apbc_gate_clks[] = {
-	{PXA168_CLK_TWSI0, "twsi0_clk", "pll1_13_1_5", CLK_SET_RATE_PARENT, APBC_TWSI0, 0x3, 0x3, 0x0, 0, &reset_lock},
-	{PXA168_CLK_TWSI1, "twsi1_clk", "pll1_13_1_5", CLK_SET_RATE_PARENT, APBC_TWSI1, 0x3, 0x3, 0x0, 0, &reset_lock},
+	{PXA168_CLK_TWSI0, "twsi0_clk", "twsi0_mux", CLK_SET_RATE_PARENT, APBC_TWSI0, 0x3, 0x3, 0x0, 0, &twsi0_lock},
+	{PXA168_CLK_TWSI1, "twsi1_clk", "twsi1_mux", CLK_SET_RATE_PARENT, APBC_TWSI1, 0x3, 0x3, 0x0, 0, &twsi1_lock},
 	{PXA168_CLK_GPIO, "gpio_clk", "vctcxo", CLK_SET_RATE_PARENT, APBC_GPIO, 0x3, 0x3, 0x0, 0, &reset_lock},
-	{PXA168_CLK_KPC, "kpc_clk", "clk32", CLK_SET_RATE_PARENT, APBC_KPC, 0x3, 0x3, 0x0, MMP_CLK_GATE_NEED_DELAY, NULL},
+	{PXA168_CLK_KPC, "kpc_clk", "kpc_mux", CLK_SET_RATE_PARENT, APBC_KPC, 0x3, 0x3, 0x0, MMP_CLK_GATE_NEED_DELAY, &kpc_lock},
 	{PXA168_CLK_RTC, "rtc_clk", "clk32", CLK_SET_RATE_PARENT, APBC_RTC, 0x83, 0x83, 0x0, MMP_CLK_GATE_NEED_DELAY, NULL},
-	{PXA168_CLK_PWM0, "pwm0_clk", "pll1_48", CLK_SET_RATE_PARENT, APBC_PWM0, 0x3, 0x3, 0x0, 0, &reset_lock},
-	{PXA168_CLK_PWM1, "pwm1_clk", "pll1_48", CLK_SET_RATE_PARENT, APBC_PWM1, 0x3, 0x3, 0x0, 0, &reset_lock},
-	{PXA168_CLK_PWM2, "pwm2_clk", "pll1_48", CLK_SET_RATE_PARENT, APBC_PWM2, 0x3, 0x3, 0x0, 0, &reset_lock},
-	{PXA168_CLK_PWM3, "pwm3_clk", "pll1_48", CLK_SET_RATE_PARENT, APBC_PWM3, 0x3, 0x3, 0x0, 0, &reset_lock},
-	/* The gate clocks has mux parent. */
+	{PXA168_CLK_PWM0, "pwm0_clk", "pwm0_mux", CLK_SET_RATE_PARENT, APBC_PWM0, 0x3, 0x3, 0x0, 0, &pwm0_lock},
+	{PXA168_CLK_PWM1, "pwm1_clk", "pwm1_mux", CLK_SET_RATE_PARENT, APBC_PWM1, 0x3, 0x3, 0x0, 0, &pwm1_lock},
+	{PXA168_CLK_PWM2, "pwm2_clk", "pwm2_mux", CLK_SET_RATE_PARENT, APBC_PWM2, 0x3, 0x3, 0x0, 0, &pwm2_lock},
+	{PXA168_CLK_PWM3, "pwm3_clk", "pwm3_mux", CLK_SET_RATE_PARENT, APBC_PWM3, 0x3, 0x3, 0x0, 0, &pwm3_lock},
 	{PXA168_CLK_UART0, "uart0_clk", "uart0_mux", CLK_SET_RATE_PARENT, APBC_UART0, 0x3, 0x3, 0x0, 0, &uart0_lock},
 	{PXA168_CLK_UART1, "uart1_clk", "uart1_mux", CLK_SET_RATE_PARENT, APBC_UART1, 0x3, 0x3, 0x0, 0, &uart1_lock},
 	{PXA168_CLK_UART2, "uart2_clk", "uart2_mux", CLK_SET_RATE_PARENT, APBC_UART2, 0x3, 0x3, 0x0, 0, &uart2_lock},
@@ -193,6 +212,9 @@ static void pxa168_apb_periph_clk_init(struct pxa168_clk_unit *pxa_unit)
 
 }
 
+static DEFINE_SPINLOCK(dfc_lock);
+static const char * const dfc_parent_names[] = {"pll1_4", "pll1_8"};
+
 static DEFINE_SPINLOCK(sdh0_lock);
 static DEFINE_SPINLOCK(sdh1_lock);
 static const char * const sdh_parent_names[] = {"pll1_13", "pll1_12", "pll1_8"};
@@ -207,6 +229,7 @@ static const char * const ccic_parent_names[] = {"pll1_4", "pll1_8"};
 static const char * const ccic_phy_parent_names[] = {"pll1_6", "pll1_12"};
 
 static struct mmp_param_mux_clk apmu_mux_clks[] = {
+	{0, "dfc_mux", dfc_parent_names, ARRAY_SIZE(dfc_parent_names), CLK_SET_RATE_PARENT, APMU_DFC, 6, 1, 0, &dfc_lock},
 	{0, "sdh0_mux", sdh_parent_names, ARRAY_SIZE(sdh_parent_names), CLK_SET_RATE_PARENT, APMU_SDH0, 6, 2, 0, &sdh0_lock},
 	{0, "sdh1_mux", sdh_parent_names, ARRAY_SIZE(sdh_parent_names), CLK_SET_RATE_PARENT, APMU_SDH1, 6, 2, 0, &sdh1_lock},
 	{0, "disp0_mux", disp_parent_names, ARRAY_SIZE(disp_parent_names), CLK_SET_RATE_PARENT, APMU_DISP0, 6, 1, 0, &disp0_lock},
@@ -219,10 +242,9 @@ static struct mmp_param_div_clk apmu_div_clks[] = {
 };
 
 static struct mmp_param_gate_clk apmu_gate_clks[] = {
-	{PXA168_CLK_DFC, "dfc_clk", "pll1_4", CLK_SET_RATE_PARENT, APMU_DFC, 0x19b, 0x19b, 0x0, 0, NULL},
+	{PXA168_CLK_DFC, "dfc_clk", "dfc_mux", CLK_SET_RATE_PARENT, APMU_DFC, 0x19b, 0x19b, 0x0, 0, &dfc_lock},
 	{PXA168_CLK_USB, "usb_clk", "usb_pll", 0, APMU_USB, 0x9, 0x9, 0x0, 0, &usb_lock},
 	{PXA168_CLK_SPH, "sph_clk", "usb_pll", 0, APMU_USB, 0x12, 0x12, 0x0, 0, &usb_lock},
-	/* The gate clocks has mux parent. */
 	{PXA168_CLK_SDH0, "sdh0_clk", "sdh0_mux", CLK_SET_RATE_PARENT, APMU_SDH0, 0x1b, 0x1b, 0x0, 0, &sdh0_lock},
 	{PXA168_CLK_SDH1, "sdh1_clk", "sdh1_mux", CLK_SET_RATE_PARENT, APMU_SDH1, 0x1b, 0x1b, 0x0, 0, &sdh1_lock},
 	{PXA168_CLK_DISP0, "disp0_clk", "disp0_mux", CLK_SET_RATE_PARENT, APMU_DISP0, 0x1b, 0x1b, 0x0, 0, &disp0_lock},
-- 
2.25.1

