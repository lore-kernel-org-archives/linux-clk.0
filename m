Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D300E7B604
	for <linux-clk@archiver.kernel.org>; Wed,  4 Oct 2023 12:35:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233088AbjJDMf0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Oct 2023 08:35:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233165AbjJDMf0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Oct 2023 08:35:26 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F161AD9
        for <linux-clk@vger.kernel.org>; Wed,  4 Oct 2023 05:35:21 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-693400e09afso474779b3a.1
        for <linux-clk@vger.kernel.org>; Wed, 04 Oct 2023 05:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696422921; x=1697027721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5pIhEk6TIXWTRC7Pe7bfqLe0piZFrp1Th9jvIcny7Gk=;
        b=CeP+i94OXeTOTMOQiYYErDHHSFgb8H9tK3fcx4DYH8AjXxX1XaWZK4cwmbg/ErkJ/Y
         6teXwtzuwxJ7YcLngZf2oaLgz7A+bYhhPHNIw3HlbVUPnhQZZ/xWHSX/OnvUg4W2xZNq
         Z9eVDcEChfenYN92sQZ+gRnLx8mS0GClsJCCdailnrUCEfksjvIUH2oTA+mpc4zznwNC
         OjctGuddwvuOv2oN/d7rugY/bRT+/W7IeUxzr1bXLHk33OQoHXqCidSfh8MNYmw+oM59
         LNnJrG4BhuSNasJ8iSxL0+dvfJGgBRRejZdAsoFIMnPAP3PlvHsabBgsu122nYnFNIOA
         HNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696422921; x=1697027721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5pIhEk6TIXWTRC7Pe7bfqLe0piZFrp1Th9jvIcny7Gk=;
        b=OOwQ1D8uzxuiasFGLbtGjnTn5vDKbiLkRonlsNCd3KUEEkhylZc8Ht7zvRG+Ip2012
         G7DM3Kuhv7CKGAHOdZPySDYMoXYb1nPyZcy6PFRVkJZ0+JLgw31KBXCaZ14dAvziafTo
         98GybZ12sOwg3PuNThnBfb7RqrAQxz+qRI7b1bagVen3ri+Rt2sm7ChgiEmMPzwG7uLN
         bsCz8LCJXWwhoqdAbsRznI0zC9xBSHNVuJPh/deXgKPJMXqjSW5GV5sE3bpJqBTVI0Nn
         5lQbk0S2X4oF6akgdq6Y87Iy5McUgrcHnuIwJJepmfuIFeUkGdSapSJ0zqWgw8G+fMT3
         Hw4g==
X-Gm-Message-State: AOJu0Yx1LU0eFPrQR3nA+ZIULjtiKXFgigr+QxgpsYvZwMX6+gRB/qBM
        kKXwh5k8p2TgqhJtUtropZ4=
X-Google-Smtp-Source: AGHT+IHvJKpX4xhe5mzK66nCOVIvRp8Dgnyd1jVbM/5cK/1BG0Rc6rF/KvEzao3C8M/GgSrrWHul4A==
X-Received: by 2002:a17:902:da87:b0:1c6:2902:24f9 with SMTP id j7-20020a170902da8700b001c6290224f9mr2484301plx.1.1696422921280;
        Wed, 04 Oct 2023 05:35:21 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:cb87:d6f:eb43:afca])
        by smtp.gmail.com with ESMTPSA id o12-20020a170902778c00b001bdc8a5e96csm3575570pll.169.2023.10.04.05.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 05:35:20 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     abelvesa@kernel.org
Cc:     peng.fan@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@denx.de>,
        Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH RESEND v4] clk: imx: imx6sx: Allow a different LCDIF1 clock parent
Date:   Wed,  4 Oct 2023 09:34:58 -0300
Message-Id: <20231004123458.2251635-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Fabio Estevam <festevam@denx.de>

It is not a good idea to hardcode the LCDIF1 parent inside the
clock driver because some users may want to use a different clock
parent for LCDIF1. One of the reasons could be related to EMI tests.

Remove the harcoded LCDIF1 parent when the LCDIF1 parent is described
via devicetree.

Old dtb's that do not describe the LCDIF1 parent via devicetree will
use the same PLL5 clock as parent to keep the original behavior.

Signed-off-by: Fabio Estevam <festevam@denx.de>
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes since v3:
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

