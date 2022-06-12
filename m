Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB5CCCA473
	for <linux-clk@archiver.kernel.org>; Sun, 12 Jun 2022 19:30:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234220AbiFLTaf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 12 Jun 2022 15:30:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234483AbiFLTaO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 12 Jun 2022 15:30:14 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C913441FBE
        for <linux-clk@vger.kernel.org>; Sun, 12 Jun 2022 12:30:12 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id k5-20020a17090a404500b001e8875e6242so4064548pjg.5
        for <linux-clk@vger.kernel.org>; Sun, 12 Jun 2022 12:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=schmorgal.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wYGtf8Y7PN9sDEq1OygO8iVCFXaVE/futL9OqjqKUhs=;
        b=EpQEr+ss78H+TGjxehQ7FlyElBV+kd7IDryl+D3rzfCNEDMy7iq1rz1uzc32UkwomB
         h8dThT66nnVPFAr0z+cG9CL5+OrllotPp+UMaqfR67ZXrcqLY65flt2TuyAFccUH6mAS
         NXCmPHOfePoDRbTxLQ7SOO+TNUqSpHm3J2WOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wYGtf8Y7PN9sDEq1OygO8iVCFXaVE/futL9OqjqKUhs=;
        b=G+DFx5H26wktXwVx5juXqkslQYgVEqFFqHiQEERhrJb2fec7Xn1BuAgSm2dmlori9R
         whzcyUBn2NwIhkdjBQiygocp9x9abMuNkZZ9j0q0/j/Dofiw9Gfg9A/5E5dBW1uZPtaU
         FrgDQG5jGiXJwoxYNbsFLnFO2YxsefCz+65gXjGBxQeHM2ooScDd7PEoH674lj0bKCQm
         QAlmF8hdEYbYG/2/WM5t1vZrGXaqtDVSfmuh5U8upa9Cyu0GA9Iq5BFQn62imEmjmuQ4
         bn34qTxQ2SDZhpqccexldPN94NuV6eIcWxEEPQgR0yUAP5ZU9Sg3P9ufiPoPgPovCMNJ
         U4Vg==
X-Gm-Message-State: AOAM533vZT7MOzQezRcmRqtMBgr0vR4JHtVXr2wODNzpGGJOuEEweH6N
        KV9Z88AnUvoaqeSxbJaCYq78jA==
X-Google-Smtp-Source: ABdhPJyus0IzKVozmKxUntTMQfxh1peJ/K+M95GVkl4j0J/XYPgv/AboIuX/s3EOo4FNuHP2m+ESzw==
X-Received: by 2002:a17:90b:4b82:b0:1e6:7835:2f05 with SMTP id lr2-20020a17090b4b8200b001e678352f05mr11540641pjb.121.1655062212252;
        Sun, 12 Jun 2022 12:30:12 -0700 (PDT)
Received: from localhost.localdomain ([50.45.132.243])
        by smtp.gmail.com with ESMTPSA id i62-20020a628741000000b0050dc76281bdsm3603607pfe.151.2022.06.12.12.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 12:30:12 -0700 (PDT)
From:   Doug Brown <doug@schmorgal.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Brown <doug@schmorgal.com>
Subject: [PATCH 05/12] clk: mmp: pxa168: fix const-correctness
Date:   Sun, 12 Jun 2022 12:29:30 -0700
Message-Id: <20220612192937.162952-6-doug@schmorgal.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220612192937.162952-1-doug@schmorgal.com>
References: <20220612192937.162952-1-doug@schmorgal.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

While working on this series of patches, checkpatch recommended that
an extra const should be added to the mux parent arrays.

Signed-off-by: Doug Brown <doug@schmorgal.com>
---
 drivers/clk/mmp/clk-of-pxa168.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mmp/clk-of-pxa168.c b/drivers/clk/mmp/clk-of-pxa168.c
index aba58ce6e60c..108a85438858 100644
--- a/drivers/clk/mmp/clk-of-pxa168.c
+++ b/drivers/clk/mmp/clk-of-pxa168.c
@@ -133,17 +133,17 @@ static void pxa168_pll_init(struct pxa168_clk_unit *pxa_unit)
 static DEFINE_SPINLOCK(uart0_lock);
 static DEFINE_SPINLOCK(uart1_lock);
 static DEFINE_SPINLOCK(uart2_lock);
-static const char *uart_parent_names[] = {"pll1_3_16", "uart_pll"};
+static const char * const uart_parent_names[] = {"pll1_3_16", "uart_pll"};
 
 static DEFINE_SPINLOCK(ssp0_lock);
 static DEFINE_SPINLOCK(ssp1_lock);
 static DEFINE_SPINLOCK(ssp2_lock);
 static DEFINE_SPINLOCK(ssp3_lock);
 static DEFINE_SPINLOCK(ssp4_lock);
-static const char *ssp_parent_names[] = {"pll1_96", "pll1_48", "pll1_24", "pll1_12"};
+static const char * const ssp_parent_names[] = {"pll1_96", "pll1_48", "pll1_24", "pll1_12"};
 
 static DEFINE_SPINLOCK(timer_lock);
-static const char *timer_parent_names[] = {"pll1_48", "clk32", "pll1_96", "pll1_192"};
+static const char * const timer_parent_names[] = {"pll1_48", "clk32", "pll1_96", "pll1_192"};
 
 static DEFINE_SPINLOCK(reset_lock);
 
@@ -195,16 +195,16 @@ static void pxa168_apb_periph_clk_init(struct pxa168_clk_unit *pxa_unit)
 
 static DEFINE_SPINLOCK(sdh0_lock);
 static DEFINE_SPINLOCK(sdh1_lock);
-static const char *sdh_parent_names[] = {"pll1_12", "pll1_13"};
+static const char * const sdh_parent_names[] = {"pll1_12", "pll1_13"};
 
 static DEFINE_SPINLOCK(usb_lock);
 
 static DEFINE_SPINLOCK(disp0_lock);
-static const char *disp_parent_names[] = {"pll1_2", "pll1_12"};
+static const char * const disp_parent_names[] = {"pll1_2", "pll1_12"};
 
 static DEFINE_SPINLOCK(ccic0_lock);
-static const char *ccic_parent_names[] = {"pll1_2", "pll1_12"};
-static const char *ccic_phy_parent_names[] = {"pll1_6", "pll1_12"};
+static const char * const ccic_parent_names[] = {"pll1_2", "pll1_12"};
+static const char * const ccic_phy_parent_names[] = {"pll1_6", "pll1_12"};
 
 static struct mmp_param_mux_clk apmu_mux_clks[] = {
 	{0, "sdh0_mux", sdh_parent_names, ARRAY_SIZE(sdh_parent_names), CLK_SET_RATE_PARENT, APMU_SDH0, 6, 1, 0, &sdh0_lock},
-- 
2.25.1

