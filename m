Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B9CFCCA473
	for <linux-clk@archiver.kernel.org>; Sun, 12 Jun 2022 19:31:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234520AbiFLTbW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 12 Jun 2022 15:31:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235058AbiFLTaS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 12 Jun 2022 15:30:18 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A448641FBE
        for <linux-clk@vger.kernel.org>; Sun, 12 Jun 2022 12:30:17 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id y196so4022300pfb.6
        for <linux-clk@vger.kernel.org>; Sun, 12 Jun 2022 12:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=schmorgal.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=owW+nBGY5KQZbmIX7FckqySpt3Bs/rQ8fif+G1Lctfc=;
        b=DuAXWYsJXOnoau6qyz/cIENh+uIFhWRvx/tJJp6KkS6gpGjtmWmuave4BMWGBanzQo
         uEkt8Q0z+WeTrZHK3XStAO7LUKbVBFtnqQSZL86QAyhUhaYJfbs2bBBaRq67SaC86BBK
         Ff2ZfjULOBTQHv90ADLeDDpuF5BMKlq87m088=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=owW+nBGY5KQZbmIX7FckqySpt3Bs/rQ8fif+G1Lctfc=;
        b=EgSjfMbgBNJ+F5ue0Fk7oPaMHIefz8IZA4HURlgzwn2Y0x1w8EDlnVtBnoIt3QN4qW
         lVK5AhuDfjgMi5bSCTX5jSKeiKClz3Bu8SiL9SZuCmf58lUKQTCDdoNnoM9T4xBE4mFs
         EiOBnWHvyeLIp89DKGUCzR+vY55OFy3I/lYaFp8TuirttrIki3udXedegvGkY8+t0qTq
         xR0JfPOHNpd1rSuh3tVNBgM20anU/AhQOsAx4flF0ObFfVuldyN2wXIpyzv+P5KjnXXv
         Ws0UkHzIt+M6mGa9Y8SXmClBQJLhW2REsmm7dOeX3t7VceVCQHhXMxk+jSWgdJ6EcbzE
         Bh4A==
X-Gm-Message-State: AOAM531JbAUFfrgy3Ik/zQd7NHjHKwSbhCyeFRZgbGSGw3GhjmgOaH0f
        k4THVF002L/Q4I7gm9wgU4o/eA==
X-Google-Smtp-Source: ABdhPJySe0dxz7H+On2G+CHzJ/BlEJdN2Q8LdWeNbfs8kIE0/b53X3hUsGD12Expbm27b5eYS/je2g==
X-Received: by 2002:a63:c63:0:b0:3fe:e14b:b5a0 with SMTP id 35-20020a630c63000000b003fee14bb5a0mr18479240pgm.428.1655062217066;
        Sun, 12 Jun 2022 12:30:17 -0700 (PDT)
Received: from localhost.localdomain ([50.45.132.243])
        by smtp.gmail.com with ESMTPSA id i62-20020a628741000000b0050dc76281bdsm3603607pfe.151.2022.06.12.12.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 12:30:16 -0700 (PDT)
From:   Doug Brown <doug@schmorgal.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Brown <doug@schmorgal.com>
Subject: [PATCH 12/12] clk: mmp: pxa168: control shared SDH bits with separate clock
Date:   Sun, 12 Jun 2022 12:29:37 -0700
Message-Id: <20220612192937.162952-13-doug@schmorgal.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220612192937.162952-1-doug@schmorgal.com>
References: <20220612192937.162952-1-doug@schmorgal.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The PXA168 has a peculiar setup with the AXI clock enable control for
the SDHC controllers. The bits in the SDH0 register control the AXI
clock enable for both SDH0 and SDH1. Likewise, the bits in the SDH2
register control both SDH2 and SDH3. This is modeled with two new
parentless clocks that control the shared bits.

Previously, SDH0 had to be enabled in order for SDH1 to be used, and
when SDH1 was enabled, unused bits in the SDH1 register were being
controlled. This fixes those issues. A future commit will add support
for these new shared clocks to be enabled by the PXA168 SDHC driver.

Signed-off-by: Doug Brown <doug@schmorgal.com>
---
 drivers/clk/mmp/clk-of-pxa168.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mmp/clk-of-pxa168.c b/drivers/clk/mmp/clk-of-pxa168.c
index 98046019c5c2..8d0ec06f25ee 100644
--- a/drivers/clk/mmp/clk-of-pxa168.c
+++ b/drivers/clk/mmp/clk-of-pxa168.c
@@ -249,10 +249,13 @@ static struct mmp_param_gate_clk apmu_gate_clks[] = {
 	{PXA168_CLK_DFC, "dfc_clk", "dfc_mux", CLK_SET_RATE_PARENT, APMU_DFC, 0x19b, 0x19b, 0x0, 0, &dfc_lock},
 	{PXA168_CLK_USB, "usb_clk", "usb_pll", 0, APMU_USB, 0x9, 0x9, 0x0, 0, &usb_lock},
 	{PXA168_CLK_SPH, "sph_clk", "usb_pll", 0, APMU_USB, 0x12, 0x12, 0x0, 0, &usb_lock},
-	{PXA168_CLK_SDH0, "sdh0_clk", "sdh0_mux", CLK_SET_RATE_PARENT, APMU_SDH0, 0x1b, 0x1b, 0x0, 0, &sdh0_lock},
-	{PXA168_CLK_SDH1, "sdh1_clk", "sdh1_mux", CLK_SET_RATE_PARENT, APMU_SDH1, 0x1b, 0x1b, 0x0, 0, &sdh1_lock},
-	{PXA168_CLK_SDH2, "sdh2_clk", "sdh2_mux", CLK_SET_RATE_PARENT, APMU_SDH2, 0x1b, 0x1b, 0x0, 0, &sdh2_lock},
-	{PXA168_CLK_SDH3, "sdh3_clk", "sdh3_mux", CLK_SET_RATE_PARENT, APMU_SDH3, 0x1b, 0x1b, 0x0, 0, &sdh3_lock},
+	{PXA168_CLK_SDH0, "sdh0_clk", "sdh0_mux", CLK_SET_RATE_PARENT, APMU_SDH0, 0x12, 0x12, 0x0, 0, &sdh0_lock},
+	{PXA168_CLK_SDH1, "sdh1_clk", "sdh1_mux", CLK_SET_RATE_PARENT, APMU_SDH1, 0x12, 0x12, 0x0, 0, &sdh1_lock},
+	{PXA168_CLK_SDH2, "sdh2_clk", "sdh2_mux", CLK_SET_RATE_PARENT, APMU_SDH2, 0x12, 0x12, 0x0, 0, &sdh2_lock},
+	{PXA168_CLK_SDH3, "sdh3_clk", "sdh3_mux", CLK_SET_RATE_PARENT, APMU_SDH3, 0x12, 0x12, 0x0, 0, &sdh3_lock},
+	/* SDH0/1 and 2/3 AXI clocks are also gated by common bits in SDH0 and SDH2 registers */
+	{PXA168_CLK_SDH01_AXI, "sdh01_axi_clk", NULL, CLK_SET_RATE_PARENT, APMU_SDH0, 0x9, 0x9, 0x0, 0, &sdh0_lock},
+	{PXA168_CLK_SDH23_AXI, "sdh23_axi_clk", NULL, CLK_SET_RATE_PARENT, APMU_SDH2, 0x9, 0x9, 0x0, 0, &sdh2_lock},
 	{PXA168_CLK_DISP0, "disp0_clk", "disp0_mux", CLK_SET_RATE_PARENT, APMU_DISP0, 0x1b, 0x1b, 0x0, 0, &disp0_lock},
 	{PXA168_CLK_CCIC0, "ccic0_clk", "ccic0_mux", CLK_SET_RATE_PARENT, APMU_CCIC0, 0x1b, 0x1b, 0x0, 0, &ccic0_lock},
 	{PXA168_CLK_CCIC0_PHY, "ccic0_phy_clk", "ccic0_phy_mux", CLK_SET_RATE_PARENT, APMU_CCIC0, 0x24, 0x24, 0x0, 0, &ccic0_lock},
-- 
2.25.1

