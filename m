Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28731C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 13 Sep 2021 08:25:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 139B460ED7
	for <linux-clk@archiver.kernel.org>; Mon, 13 Sep 2021 08:25:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237988AbhIMI0a (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Sep 2021 04:26:30 -0400
Received: from inva021.nxp.com ([92.121.34.21]:59760 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235987AbhIMI03 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 13 Sep 2021 04:26:29 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 418CE202A01;
        Mon, 13 Sep 2021 10:25:13 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 34C562029EC;
        Mon, 13 Sep 2021 10:25:13 +0200 (CEST)
Received: from fsr-ub1664-175.ea.freescale.net (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id E5845202EC;
        Mon, 13 Sep 2021 10:25:12 +0200 (CEST)
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     NXP Linux Team <linux-imx@nxp.com>, linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH 2/8] clk: imx: Make mux/mux2 clk based helpers use clk_hw based ones
Date:   Mon, 13 Sep 2021 11:24:44 +0300
Message-Id: <1631521490-17171-3-git-send-email-abel.vesa@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631521490-17171-1-git-send-email-abel.vesa@nxp.com>
References: <1631521490-17171-1-git-send-email-abel.vesa@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Implement the clk based helpers as macros rather than as inline
functions. Once all the provider drivers have switch to clk_hw,
all the clk based macros will go away.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 drivers/clk/imx/clk.h | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index 4a755498cb17..371d8de417ef 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -106,6 +106,12 @@ extern struct imx_pll14xx_clk imx_1443x_dram_pll;
 #define imx_clk_mux(name, reg, shift, width, parents, num_parents) \
 	to_clk(imx_clk_hw_mux(name, reg, shift, width, parents, num_parents))
 
+#define imx_clk_mux_flags(name, reg, shift, width, parents, num_parents, flags) \
+	to_clk(imx_clk_hw_mux_flags(name, reg, shift, width, parents, num_parents, flags))
+
+#define imx_clk_mux2_flags(name, reg, shift, width, parents, num_parents, flags) \
+	to_clk(imx_clk_hw_mux2_flags(name, reg, shift, width, parents, num_parents, flags))
+
 #define imx_clk_pllv1(type, name, parent, base) \
 	to_clk(imx_clk_hw_pllv1(type, name, parent, base))
 
@@ -395,16 +401,6 @@ static inline struct clk_hw *imx_clk_hw_mux2(const char *name, void __iomem *reg
 				   reg, shift, width, 0, &imx_ccm_lock);
 }
 
-static inline struct clk *imx_clk_mux_flags(const char *name,
-			void __iomem *reg, u8 shift, u8 width,
-			const char * const *parents, int num_parents,
-			unsigned long flags)
-{
-	return clk_register_mux(NULL, name, parents, num_parents,
-			flags | CLK_SET_RATE_NO_REPARENT, reg, shift, width, 0,
-			&imx_ccm_lock);
-}
-
 static inline struct clk_hw *imx_clk_hw_mux2_flags(const char *name,
 		void __iomem *reg, u8 shift, u8 width,
 		const char * const *parents,
@@ -415,16 +411,6 @@ static inline struct clk_hw *imx_clk_hw_mux2_flags(const char *name,
 			reg, shift, width, 0, &imx_ccm_lock);
 }
 
-static inline struct clk *imx_clk_mux2_flags(const char *name,
-		void __iomem *reg, u8 shift, u8 width,
-		const char * const *parents,
-		int num_parents, unsigned long flags)
-{
-	return clk_register_mux(NULL, name, parents, num_parents,
-			flags | CLK_SET_RATE_NO_REPARENT | CLK_OPS_PARENT_ENABLE,
-			reg, shift, width, 0, &imx_ccm_lock);
-}
-
 static inline struct clk_hw *imx_clk_hw_mux_flags(const char *name,
 						  void __iomem *reg, u8 shift,
 						  u8 width,
-- 
2.31.1

