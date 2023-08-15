Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A94C0015E
	for <linux-clk@archiver.kernel.org>; Tue, 15 Aug 2023 13:10:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235513AbjHONJ7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Aug 2023 09:09:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237413AbjHONJd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Aug 2023 09:09:33 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC1A719A7
        for <linux-clk@vger.kernel.org>; Tue, 15 Aug 2023 06:09:31 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6bca018afe8so1462995a34.0
        for <linux-clk@vger.kernel.org>; Tue, 15 Aug 2023 06:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692104971; x=1692709771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rz6wNWxCcbvBJb3svjVWeS8DfmF9/nasvPJCZoP6n4g=;
        b=CGIvZ4FmgptKCM/Xm5LWOLFLe07WdIwWhB8nIuov+SmkHdmimO8JIki+yLcNEIH7AI
         DubNW+43f/SoIAYgmzrbaZYZaa6gyAXXq8GNXN6TKKWX6BAM2fpHUjT/9b5saJJH15F6
         56gHPlNmls7M6xsgIacu6pK/YPcx7UPAPifVjliXwiREyoY5gPC/VbGrWWf08dXp+8Lr
         GTphbZBTU0pAjBpRNxiXSFy34Bups6J2l0iwHnTdutpUNgebp0I955lvKn0viPCftuHQ
         PQmlWdFTquV3zXjDUZtjebxl0DXFWsHErAHbTaOMDqtTMVZFEhKWfJHZ1EtuKMtCB8H2
         bKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692104971; x=1692709771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rz6wNWxCcbvBJb3svjVWeS8DfmF9/nasvPJCZoP6n4g=;
        b=dSRvPdUoesZ/fccgnSHPox7uGEQLvot733nfedA2KylSoXTkDFMBpeHsiOPWloJDun
         D2TPjRwskp5YAYHMroCoJw3K8jvRc1Mo+Zg2gnTKthFuvG/1Uq3xAoKZHSHKm5sVHmQ4
         I+Zbc/USq0dF75uAR1bl0hVGEcWp+3ES2p7brUQ6RfVt0RPAQQ5TpmTUxLHpUab5IJAw
         ZA5V76Dz//gOp71cb3xA/Z3Tzz2bNB5W+W0xjhw1gUUIRjh7smqYnchpulGZifckuIBA
         zPkLRSSlfVDgiGx01PpGIeAaoVPb7WtBMoRYcpLQhdjqBqPhqXTVcySfaVgN1L8V2/ys
         fScg==
X-Gm-Message-State: AOJu0Yx41BC2i8Lmcqnj1zLrt6bqRA6WDgYpCCygiScB5kQf4rkfkZ2E
        PFmT42soIvkd/4VAD0RkaXw=
X-Google-Smtp-Source: AGHT+IHe1K8tiRfheenWsfqx9trPzr9BrqnDluLWqxI0/S5kHfrzG7vewErErFKtIIH5Bpvt25JGOA==
X-Received: by 2002:a9d:7094:0:b0:6b9:db20:4d25 with SMTP id l20-20020a9d7094000000b006b9db204d25mr8945438otj.1.1692104971168;
        Tue, 15 Aug 2023 06:09:31 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:529f:fe2c:5b5a:3af1])
        by smtp.gmail.com with ESMTPSA id l7-20020a9d7a87000000b006b92c078d05sm5132844otn.31.2023.08.15.06.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 06:09:30 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     abelvesa@kernel.org
Cc:     sboyd@kernel.org, linux-clk@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Subject: [PATCH v4] clk: imx: imx6sx: Allow a different LCDIF1 clock parent
Date:   Tue, 15 Aug 2023 10:09:23 -0300
Message-Id: <20230815130923.775117-1-festevam@gmail.com>
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

