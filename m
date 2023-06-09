Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B08B4C7EE23
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jun 2023 03:13:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbjFIDNJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Jun 2023 23:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231985AbjFIDNI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Jun 2023 23:13:08 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2397430E7
        for <linux-clk@vger.kernel.org>; Thu,  8 Jun 2023 20:13:07 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-39aab5cf7baso122312b6e.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Jun 2023 20:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686280386; x=1688872386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uq0koP/F2W4q5CpX2VXG7fhsAJ76lOHszEn4twrgKgY=;
        b=l02oS5A6QcTVuBMCjzp3Lj1Ngky5CIFaI8PYcUQNvTMhFkjzm7Wn+71/l8h5TZsTD9
         bjZpPD0pBXnR0XAntQ9qwfuQXMd0ZYWfMHrNoJljHntafFMd1fxaHwQ01kKy8KPtYHWW
         CcxPDjGsejxP+FQYv8u2LuWBIGQIWz6W5xyYG5JUCG/PW3OGMxXPHmuJMYbaXNvQgKVN
         bgH42nInQ0d0lpsUI+WE6LAqrocvrn/9gqTyuxOb/ZKMnIemVAhNUnXlcGDnow/83IJO
         bCDcCun72x8fzyn5BXPB6GjDepK1z3jrPPkh6wUkV71f8/N196kO9u7B4ukn6nO8oTrW
         otXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686280386; x=1688872386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uq0koP/F2W4q5CpX2VXG7fhsAJ76lOHszEn4twrgKgY=;
        b=U/RZtFjstYaHDhsCMeWAHCsgtBXXGqA6e3BD+faZInBPGb3AXi/J2UBj/sezJP5wun
         xsJHNz0Yrw0zcIpPR0rHZSIACW/6aSaw/yhMd897XSPV/XR3qPQY6iutyvV3Kj5AtHDN
         kpvCmEtXHqYPt+JroFKMHe/oGk6IV140wk4lhYW8lAcwQnaDBPDFAmMsd5kSp9AhsQnm
         vyya2HJR2Q2RJipThZJA6rdunlj159zYWC/2xls0Ns9BLCNeuQNsSYySARlrkL74koBu
         FSDeCzX9treYeIsvZvimjxmcBM6yRCx0qOdvQt4guPb9T+P5E4h6amEUYXsAkpISZL0J
         VNag==
X-Gm-Message-State: AC+VfDyJZ5e72fnjNnwvegzO9qTMYJaKcDMM02FdCHo9b3TZaLz4lUH/
        Ls+sxXoA8bvWDc11/fK19L8=
X-Google-Smtp-Source: ACHHUZ6nCO5DhkRn4gaNK0wK0bjSafxQDqfOgLlFFPtBHdOr2gfZ2FZ6Y5HXYbjgrTY6pvYMDlaWtQ==
X-Received: by 2002:aca:3d82:0:b0:39a:9e76:ea3c with SMTP id k124-20020aca3d82000000b0039a9e76ea3cmr268736oia.2.1686280386402;
        Thu, 08 Jun 2023 20:13:06 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8c46:67c3:a757:2399])
        by smtp.gmail.com with ESMTPSA id r3-20020acac103000000b00395f5cd1a0dsm1047493oif.9.2023.06.08.20.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 20:13:06 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     shawnguo@kernel.org
Cc:     sboyd@kernel.org, abelvesa@kernel.org, hs@denx.de,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 3/3] clk: imx: imx6sx: Allow passing the LCDIF1 parent via DT
Date:   Fri,  9 Jun 2023 00:12:49 -0300
Message-Id: <20230609031249.3692841-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609031249.3692841-1-festevam@gmail.com>
References: <20230609031249.3692841-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

It is not a good idea to hardcode the LCDIF1 parent inside the
clock driver because some users may want to use a different clock
parent for LCDIF1. One of the reasons could be related to EMI tests.

Remove the harcoded LCDIF1 parent when the LCDIF1 parent is described
via devicetree.

Old dtb's that do not describe the LCDIF1 parent via devicetree will
use the same PLL5 clock as parent to keep the same behavior.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Check for the presence of 'assigned-clock-parents'. (Stephen)

 drivers/clk/imx/clk-imx6sx.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/imx/clk-imx6sx.c b/drivers/clk/imx/clk-imx6sx.c
index 3f1502933e59..69f8f6f9ca49 100644
--- a/drivers/clk/imx/clk-imx6sx.c
+++ b/drivers/clk/imx/clk-imx6sx.c
@@ -121,6 +121,7 @@ static void __init imx6sx_clocks_init(struct device_node *ccm_node)
 {
 	struct device_node *np;
 	void __iomem *base;
+	bool lcdif1_assigned_clk;
 
 	clk_hw_data = kzalloc(struct_size(clk_hw_data, hws,
 					  IMX6SX_CLK_CLK_END), GFP_KERNEL);
@@ -498,9 +499,16 @@ static void __init imx6sx_clocks_init(struct device_node *ccm_node)
 	clk_set_parent(hws[IMX6SX_CLK_EIM_SLOW_SEL]->clk, hws[IMX6SX_CLK_PLL2_PFD2]->clk);
 	clk_set_rate(hws[IMX6SX_CLK_EIM_SLOW]->clk, 132000000);
 
-	/* set parent clock for LCDIF1 pixel clock */
-	clk_set_parent(hws[IMX6SX_CLK_LCDIF1_PRE_SEL]->clk, hws[IMX6SX_CLK_PLL5_VIDEO_DIV]->clk);
-	clk_set_parent(hws[IMX6SX_CLK_LCDIF1_SEL]->clk, hws[IMX6SX_CLK_LCDIF1_PODF]->clk);
+	np = of_find_node_by_path("/soc/bus@2200000/spba-bus@2240000/lcdif@2220000");
+	lcdif1_assigned_clk = of_find_property(np, "assigned-clock-parents", NULL);
+
+	/* Set parent clock for LCDIF1 pixel clock if not done via devicetree */
+	if (!lcdif1_assigned_clk) {
+		clk_set_parent(hws[IMX6SX_CLK_LCDIF1_PRE_SEL]->clk,
+			       hws[IMX6SX_CLK_PLL5_VIDEO_DIV]->clk);
+		clk_set_parent(hws[IMX6SX_CLK_LCDIF1_SEL]->clk,
+			       hws[IMX6SX_CLK_LCDIF1_PODF]->clk);
+	}
 
 	/* Set the parent clks of PCIe lvds1 and pcie_axi to be pcie ref, axi */
 	if (clk_set_parent(hws[IMX6SX_CLK_LVDS1_SEL]->clk, hws[IMX6SX_CLK_PCIE_REF_125M]->clk))
-- 
2.34.1

