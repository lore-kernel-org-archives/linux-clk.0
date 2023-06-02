Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75465C7EE2C
	for <linux-clk@archiver.kernel.org>; Fri,  2 Jun 2023 22:16:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236313AbjFBWQY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Jun 2023 18:16:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235994AbjFBWQX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Jun 2023 18:16:23 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 061C21B7
        for <linux-clk@vger.kernel.org>; Fri,  2 Jun 2023 15:16:23 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-19f4c3aa5a8so295749fac.1
        for <linux-clk@vger.kernel.org>; Fri, 02 Jun 2023 15:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685744182; x=1688336182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2rErrTpHTVSZk1IodoNCi7TyWfBvMAj2ALKyW0WqhMw=;
        b=SabottUfBEm5+Lv2y3aUvRIpF6SzEBgMAHVToCOvtyTOh+L8v8JrA8Qzw+OIygiQBH
         7jwz6OrBsVcxq/N7i+fItJZhrz4oKfNLCIZPEVBDZqpLOeaQHGHREdRDaMv95OCPpjiQ
         rHaxtnfGaxylyBwGxFb17SClT+jiJtO8/Ow6ooDvYRq+E8A4FJnNCVMsDPsLVe1sGzIF
         +dZ1wv4chVEOVg7WU95j0O8aFiK1TCyEXxLQZ9BqYftE7kSM5FYzpnBObMbzsHkp+rRl
         CAAcRLoN+Bb+NhMbohtIo20AVI4PO5qunhseoizrl52Mxpb5JRsfEmW2gGOb6LuKI/Nd
         arQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685744182; x=1688336182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2rErrTpHTVSZk1IodoNCi7TyWfBvMAj2ALKyW0WqhMw=;
        b=e/KfNBxqmHRCuIWMAO/IZSMPLujucYumTgmKy+Y367aF/0jP4hl0Eh1oPTgxKlTU9T
         3F1WmW0zqjg45IOUwaXIfkQcGe9FM6VhkUAHFE00/VtQ92doc0MKnNe/eO73K0+I347b
         tZeP2x1JMpNaNStbCkaXU0yt1kve8Q8h5T6IrMyu9TKATr0hWmQZVV7iLryjyReGoALQ
         7YRz3fyV0695Z6Ma2jgfgNLHfcqOJ/EkWOSxsUelEILToFQ8tyihHRCp/0QxcJXhCbnA
         yOAwOCp3aaVW92/q+jsBZsGLuWcIF6qA6xNuBOZRDN5s7og3bE8emNgbMfvpCjmW0fic
         Aw4g==
X-Gm-Message-State: AC+VfDyIljCVYXzWQvegecZRd3hzLRaxtlzimPGyQUaWccjkLb+88OWY
        XLj0gf4LSAqdZHwqOzqSjJpi5bOGees=
X-Google-Smtp-Source: ACHHUZ4sxR8twVuVuqR45j0iedDkPDiMF8PknPV7ZyI4sX8skgaWe5xRXuzh3ossftDr0lRyOa3Fcg==
X-Received: by 2002:a4a:ba8d:0:b0:547:50b4:9236 with SMTP id d13-20020a4aba8d000000b0054750b49236mr5707180oop.0.1685744182271;
        Fri, 02 Jun 2023 15:16:22 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:dad1:c980:e6de:3901])
        by smtp.gmail.com with ESMTPSA id k4-20020a4a4304000000b005584e0c8f9csm951587ooj.3.2023.06.02.15.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 15:16:21 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     shawnguo@kernel.org
Cc:     hs@denx.de, abelvesa@kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@denx.de>
Subject: [PATCH 3/3] clk: imx: imx6sx: Remove hardcoded LCDIF1 parent
Date:   Fri,  2 Jun 2023 19:16:04 -0300
Message-Id: <20230602221604.155027-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602221604.155027-1-festevam@gmail.com>
References: <20230602221604.155027-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Fabio Estevam <festevam@denx.de>

It is not a good idea to hardcode the LCDIF1 parent inside the
clock driver because some users may want to use a different clock
parent for LCDIF1. One of the reasons could be related to EMI tests.

Remove the harcoded LCDIF1 parent as this is better described via
devicetree.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/clk/imx/clk-imx6sx.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/imx/clk-imx6sx.c b/drivers/clk/imx/clk-imx6sx.c
index 3f1502933e59..b110258b9036 100644
--- a/drivers/clk/imx/clk-imx6sx.c
+++ b/drivers/clk/imx/clk-imx6sx.c
@@ -498,10 +498,6 @@ static void __init imx6sx_clocks_init(struct device_node *ccm_node)
 	clk_set_parent(hws[IMX6SX_CLK_EIM_SLOW_SEL]->clk, hws[IMX6SX_CLK_PLL2_PFD2]->clk);
 	clk_set_rate(hws[IMX6SX_CLK_EIM_SLOW]->clk, 132000000);
 
-	/* set parent clock for LCDIF1 pixel clock */
-	clk_set_parent(hws[IMX6SX_CLK_LCDIF1_PRE_SEL]->clk, hws[IMX6SX_CLK_PLL5_VIDEO_DIV]->clk);
-	clk_set_parent(hws[IMX6SX_CLK_LCDIF1_SEL]->clk, hws[IMX6SX_CLK_LCDIF1_PODF]->clk);
-
 	/* Set the parent clks of PCIe lvds1 and pcie_axi to be pcie ref, axi */
 	if (clk_set_parent(hws[IMX6SX_CLK_LVDS1_SEL]->clk, hws[IMX6SX_CLK_PCIE_REF_125M]->clk))
 		pr_err("Failed to set pcie bus parent clk.\n");
-- 
2.34.1

