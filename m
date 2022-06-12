Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 109DDCCA47C
	for <linux-clk@archiver.kernel.org>; Sun, 12 Jun 2022 19:31:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234461AbiFLTbU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 12 Jun 2022 15:31:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234984AbiFLTaQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 12 Jun 2022 15:30:16 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B68A41FBB
        for <linux-clk@vger.kernel.org>; Sun, 12 Jun 2022 12:30:16 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id t3-20020a17090a510300b001ea87ef9a3dso4072761pjh.4
        for <linux-clk@vger.kernel.org>; Sun, 12 Jun 2022 12:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=schmorgal.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V52v8toWUF8IhJDBBzoO58I9WaMVuk6G80A6C1feD40=;
        b=FFjAIM+FdoNfCcOYnN7gcV1sob7H24JUnj3kBSo13KgZUkzscXlajzdnDP/ni1WsrR
         5C/7wvJE33gLEXd/whvP3ocTbuSttIrkdCN5P7WYWB/G8q0VzNIIx4GiJwvl3+PSxDoA
         7gqBEzay2BDIpK/YfwnoM5Oo2z4PBSM8zrtWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V52v8toWUF8IhJDBBzoO58I9WaMVuk6G80A6C1feD40=;
        b=4k1e0atDleYlZc46v0FTqtSIJdsVYD79YmpgFKIoDSoMyzqZEHOWxnPiD+TbhxJLGD
         oywc07Zn2r4k1QLM/wN3zX6PTAySfiG79ccjseUuT0jxNq2uiNC6Mt9n5FmRaWKZIPgk
         VrCtoJn/C0QWTBsEEOE/X/WelV1IE08Bgz7P2qT4KxZMqgyVNvMFeKUvTfhsN1C3dJv+
         Cs6FhlFcK52fCSaKHU0RReARHrt8eixKtHDqCsbHD1oU779Jwg+/TwG+mbDjNKdcXrOr
         6mMx0A7IdlU04F+Bdfgt+zYVrTdXT6dUXg53++21SZnZxHaqa6LJCoTrdpGl0ui/+D52
         Ybrw==
X-Gm-Message-State: AOAM532XKAh5UjR+Pg/WuBX5PpXxv739lTI2mylySBs9NayBkjJ5/XAa
        L1gbhESc4CaKOXQnX6qMvrN15A==
X-Google-Smtp-Source: ABdhPJywp6RXPZb13R+RwhewUreQMN24OqGxGT2cUUfL1rcRH2MBcfSKkXzQbUIfokpEDlVXMRlb9w==
X-Received: by 2002:a17:90b:240e:b0:1e0:775b:f8fc with SMTP id nr14-20020a17090b240e00b001e0775bf8fcmr11798804pjb.132.1655062215647;
        Sun, 12 Jun 2022 12:30:15 -0700 (PDT)
Received: from localhost.localdomain ([50.45.132.243])
        by smtp.gmail.com with ESMTPSA id i62-20020a628741000000b0050dc76281bdsm3603607pfe.151.2022.06.12.12.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 12:30:15 -0700 (PDT)
From:   Doug Brown <doug@schmorgal.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Brown <doug@schmorgal.com>
Subject: [PATCH 10/12] clk: mmp: pxa168: add clocks for SDH2 and SDH3
Date:   Sun, 12 Jun 2022 12:29:35 -0700
Message-Id: <20220612192937.162952-11-doug@schmorgal.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220612192937.162952-1-doug@schmorgal.com>
References: <20220612192937.162952-1-doug@schmorgal.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The PXA168 has four SDHC peripherals. This commit adds the last two.

Signed-off-by: Doug Brown <doug@schmorgal.com>
---
 drivers/clk/mmp/clk-of-pxa168.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/mmp/clk-of-pxa168.c b/drivers/clk/mmp/clk-of-pxa168.c
index eb6a651d2366..98046019c5c2 100644
--- a/drivers/clk/mmp/clk-of-pxa168.c
+++ b/drivers/clk/mmp/clk-of-pxa168.c
@@ -217,6 +217,8 @@ static const char * const dfc_parent_names[] = {"pll1_4", "pll1_8"};
 
 static DEFINE_SPINLOCK(sdh0_lock);
 static DEFINE_SPINLOCK(sdh1_lock);
+static DEFINE_SPINLOCK(sdh2_lock);
+static DEFINE_SPINLOCK(sdh3_lock);
 static const char * const sdh_parent_names[] = {"pll1_13", "pll1_12", "pll1_8"};
 
 static DEFINE_SPINLOCK(usb_lock);
@@ -232,6 +234,8 @@ static struct mmp_param_mux_clk apmu_mux_clks[] = {
 	{0, "dfc_mux", dfc_parent_names, ARRAY_SIZE(dfc_parent_names), CLK_SET_RATE_PARENT, APMU_DFC, 6, 1, 0, &dfc_lock},
 	{0, "sdh0_mux", sdh_parent_names, ARRAY_SIZE(sdh_parent_names), CLK_SET_RATE_PARENT, APMU_SDH0, 6, 2, 0, &sdh0_lock},
 	{0, "sdh1_mux", sdh_parent_names, ARRAY_SIZE(sdh_parent_names), CLK_SET_RATE_PARENT, APMU_SDH1, 6, 2, 0, &sdh1_lock},
+	{0, "sdh2_mux", sdh_parent_names, ARRAY_SIZE(sdh_parent_names), CLK_SET_RATE_PARENT, APMU_SDH2, 6, 2, 0, &sdh2_lock},
+	{0, "sdh3_mux", sdh_parent_names, ARRAY_SIZE(sdh_parent_names), CLK_SET_RATE_PARENT, APMU_SDH3, 6, 2, 0, &sdh3_lock},
 	{0, "disp0_mux", disp_parent_names, ARRAY_SIZE(disp_parent_names), CLK_SET_RATE_PARENT, APMU_DISP0, 6, 1, 0, &disp0_lock},
 	{0, "ccic0_mux", ccic_parent_names, ARRAY_SIZE(ccic_parent_names), CLK_SET_RATE_PARENT, APMU_CCIC0, 6, 1, 0, &ccic0_lock},
 	{0, "ccic0_phy_mux", ccic_phy_parent_names, ARRAY_SIZE(ccic_phy_parent_names), CLK_SET_RATE_PARENT, APMU_CCIC0, 7, 1, 0, &ccic0_lock},
@@ -247,6 +251,8 @@ static struct mmp_param_gate_clk apmu_gate_clks[] = {
 	{PXA168_CLK_SPH, "sph_clk", "usb_pll", 0, APMU_USB, 0x12, 0x12, 0x0, 0, &usb_lock},
 	{PXA168_CLK_SDH0, "sdh0_clk", "sdh0_mux", CLK_SET_RATE_PARENT, APMU_SDH0, 0x1b, 0x1b, 0x0, 0, &sdh0_lock},
 	{PXA168_CLK_SDH1, "sdh1_clk", "sdh1_mux", CLK_SET_RATE_PARENT, APMU_SDH1, 0x1b, 0x1b, 0x0, 0, &sdh1_lock},
+	{PXA168_CLK_SDH2, "sdh2_clk", "sdh2_mux", CLK_SET_RATE_PARENT, APMU_SDH2, 0x1b, 0x1b, 0x0, 0, &sdh2_lock},
+	{PXA168_CLK_SDH3, "sdh3_clk", "sdh3_mux", CLK_SET_RATE_PARENT, APMU_SDH3, 0x1b, 0x1b, 0x0, 0, &sdh3_lock},
 	{PXA168_CLK_DISP0, "disp0_clk", "disp0_mux", CLK_SET_RATE_PARENT, APMU_DISP0, 0x1b, 0x1b, 0x0, 0, &disp0_lock},
 	{PXA168_CLK_CCIC0, "ccic0_clk", "ccic0_mux", CLK_SET_RATE_PARENT, APMU_CCIC0, 0x1b, 0x1b, 0x0, 0, &ccic0_lock},
 	{PXA168_CLK_CCIC0_PHY, "ccic0_phy_clk", "ccic0_phy_mux", CLK_SET_RATE_PARENT, APMU_CCIC0, 0x24, 0x24, 0x0, 0, &ccic0_lock},
-- 
2.25.1

