Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D80CCA482
	for <linux-clk@archiver.kernel.org>; Sun, 12 Jun 2022 19:31:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234394AbiFLTbS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 12 Jun 2022 15:31:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234511AbiFLTaO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 12 Jun 2022 15:30:14 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F4A241FB6
        for <linux-clk@vger.kernel.org>; Sun, 12 Jun 2022 12:30:13 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id v11-20020a17090a4ecb00b001e2c5b837ccso6901987pjl.3
        for <linux-clk@vger.kernel.org>; Sun, 12 Jun 2022 12:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=schmorgal.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cprXuiFbfEMbBdwJOyZm3k5W9HarXXePbgPfOeP2l0k=;
        b=eHmBIcf214I4Exmcub5JPo0+TBff2kJJe/YPLfoampAa8tGs/KNPq9Ufc+sksKQBfg
         AYxn80Da67mU1appaDi7QqaKEIWO4ZocIJrjAskK+3Nu7QCwVxW547G4shGBJtrbL+Bf
         XMpDeBmN2Htfanh8C3xj7+pxuGcbOANnCXDuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cprXuiFbfEMbBdwJOyZm3k5W9HarXXePbgPfOeP2l0k=;
        b=hcUmoElwct3N3bFVLLUIuumtHJt6uoA88tAqNA3G9j7I8diiFJbu1zIoO+uYxyHBHp
         H5GPKD6C7o2UsugXQc0H4FuxF4PuElmCEKxfGhR4fNQMdeapMBtmU39mSPT5M6wIu9wC
         BnzIvfKUGc1KpOKWRaTRvzw2GE9Oul2+HTQrm4vgnFfFOtAOUNtEphjBdfQ7MAeXKgD5
         zN+hFSQtcRbZAkq5jt6Zvyc4qVtY0jNKBvQYoIJGvf/naV0uA7Ctfjq9AwUygN8kqavC
         H74yH6hXCk4OkDbO9Zw+q76vdykeJdQdQc+J1MY2/3QtyPDLnDbajsgbX7GQSjBn3MCO
         G+5A==
X-Gm-Message-State: AOAM5303O0izqAcBYDDMsLsd9gwNVePqqR1qvj+w6EvSu5FaCF4/i0K9
        rTw9BvuWBDAo3EsFJBjmxHCBQtBngPtUmub9NVroUg==
X-Google-Smtp-Source: ABdhPJwhujEViTB1UlTYxxVYqCWMc8DYwYenQjCHu7aREvHnbmQTetgr3AkoRZ7XTZdDLyM2wIwbtA==
X-Received: by 2002:a17:90b:3909:b0:1e8:4669:ce47 with SMTP id ob9-20020a17090b390900b001e84669ce47mr11684294pjb.124.1655062212886;
        Sun, 12 Jun 2022 12:30:12 -0700 (PDT)
Received: from localhost.localdomain ([50.45.132.243])
        by smtp.gmail.com with ESMTPSA id i62-20020a628741000000b0050dc76281bdsm3603607pfe.151.2022.06.12.12.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 12:30:12 -0700 (PDT)
From:   Doug Brown <doug@schmorgal.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Brown <doug@schmorgal.com>
Subject: [PATCH 06/12] clk: mmp: pxa168: fix incorrect parent clocks
Date:   Sun, 12 Jun 2022 12:29:31 -0700
Message-Id: <20220612192937.162952-7-doug@schmorgal.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220612192937.162952-1-doug@schmorgal.com>
References: <20220612192937.162952-1-doug@schmorgal.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The UART, SDHC, LCD, and CCIC peripherals' muxed parent clocks didn't
match the information provided by the PXA168 datasheet:

- The UART clocks can be 58.5 MHz or the UART PLL. Previously, the first
  mux option was being calculated as 117 MHz, confirmed on hardware to
  be incorrect.

- The SDHC clocks can be 48 MHz, 52 MHz, or 78 MHz. Previously, 48 MHz
  and 52 MHz were swapped. 78 MHz wasn't listed as an option.

- The LCD clock can be 624 MHz or 312 Mhz. Previously, it was being
  calculated as 312 MHz or 52 MHz.

- The CCIC clock can be 156 MHz or 78 MHz. Previously, it was being
  calculated as 312 MHz or 52 MHz.

Signed-off-by: Doug Brown <doug@schmorgal.com>
---
 drivers/clk/mmp/clk-of-pxa168.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/mmp/clk-of-pxa168.c b/drivers/clk/mmp/clk-of-pxa168.c
index 108a85438858..86e88519938e 100644
--- a/drivers/clk/mmp/clk-of-pxa168.c
+++ b/drivers/clk/mmp/clk-of-pxa168.c
@@ -133,7 +133,7 @@ static void pxa168_pll_init(struct pxa168_clk_unit *pxa_unit)
 static DEFINE_SPINLOCK(uart0_lock);
 static DEFINE_SPINLOCK(uart1_lock);
 static DEFINE_SPINLOCK(uart2_lock);
-static const char * const uart_parent_names[] = {"pll1_3_16", "uart_pll"};
+static const char * const uart_parent_names[] = {"pll1_2_3_16", "uart_pll"};
 
 static DEFINE_SPINLOCK(ssp0_lock);
 static DEFINE_SPINLOCK(ssp1_lock);
@@ -195,20 +195,20 @@ static void pxa168_apb_periph_clk_init(struct pxa168_clk_unit *pxa_unit)
 
 static DEFINE_SPINLOCK(sdh0_lock);
 static DEFINE_SPINLOCK(sdh1_lock);
-static const char * const sdh_parent_names[] = {"pll1_12", "pll1_13"};
+static const char * const sdh_parent_names[] = {"pll1_13", "pll1_12", "pll1_8"};
 
 static DEFINE_SPINLOCK(usb_lock);
 
 static DEFINE_SPINLOCK(disp0_lock);
-static const char * const disp_parent_names[] = {"pll1_2", "pll1_12"};
+static const char * const disp_parent_names[] = {"pll1", "pll1_2"};
 
 static DEFINE_SPINLOCK(ccic0_lock);
-static const char * const ccic_parent_names[] = {"pll1_2", "pll1_12"};
+static const char * const ccic_parent_names[] = {"pll1_4", "pll1_8"};
 static const char * const ccic_phy_parent_names[] = {"pll1_6", "pll1_12"};
 
 static struct mmp_param_mux_clk apmu_mux_clks[] = {
-	{0, "sdh0_mux", sdh_parent_names, ARRAY_SIZE(sdh_parent_names), CLK_SET_RATE_PARENT, APMU_SDH0, 6, 1, 0, &sdh0_lock},
-	{0, "sdh1_mux", sdh_parent_names, ARRAY_SIZE(sdh_parent_names), CLK_SET_RATE_PARENT, APMU_SDH1, 6, 1, 0, &sdh1_lock},
+	{0, "sdh0_mux", sdh_parent_names, ARRAY_SIZE(sdh_parent_names), CLK_SET_RATE_PARENT, APMU_SDH0, 6, 2, 0, &sdh0_lock},
+	{0, "sdh1_mux", sdh_parent_names, ARRAY_SIZE(sdh_parent_names), CLK_SET_RATE_PARENT, APMU_SDH1, 6, 2, 0, &sdh1_lock},
 	{0, "disp0_mux", disp_parent_names, ARRAY_SIZE(disp_parent_names), CLK_SET_RATE_PARENT, APMU_DISP0, 6, 1, 0, &disp0_lock},
 	{0, "ccic0_mux", ccic_parent_names, ARRAY_SIZE(ccic_parent_names), CLK_SET_RATE_PARENT, APMU_CCIC0, 6, 1, 0, &ccic0_lock},
 	{0, "ccic0_phy_mux", ccic_phy_parent_names, ARRAY_SIZE(ccic_phy_parent_names), CLK_SET_RATE_PARENT, APMU_CCIC0, 7, 1, 0, &ccic0_lock},
-- 
2.25.1

