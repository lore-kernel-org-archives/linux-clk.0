Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C121FC4320A
	for <linux-clk@archiver.kernel.org>; Tue, 10 Aug 2021 15:15:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E08860F41
	for <linux-clk@archiver.kernel.org>; Tue, 10 Aug 2021 15:15:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242856AbhHJPPw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 Aug 2021 11:15:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242847AbhHJPPw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 Aug 2021 11:15:52 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FE0AC0613C1
        for <linux-clk@vger.kernel.org>; Tue, 10 Aug 2021 08:15:30 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <afa@pengutronix.de>)
        id 1mDTTL-0006X6-CS; Tue, 10 Aug 2021 17:15:19 +0200
Received: from afa by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <afa@pengutronix.de>)
        id 1mDTTK-0005xN-Ck; Tue, 10 Aug 2021 17:15:18 +0200
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
To:     Abel Vesa <abel.vesa@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Ahmad Fatoum <a.fatoum@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH] clk: imx8m: fix clock tree update of TF-A managed clocks
Date:   Tue, 10 Aug 2021 17:14:33 +0200
Message-Id: <20210810151432.9228-1-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: afa@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On the i.MX8M*, the TF-A exposes a SiP (Silicon Provider) service
for DDR frequency scaling. The imx8m-ddrc-devfreq driver calls the
SiP and then does clk_set_parent on the DDR muxes to synchronize
the clock tree.

Since 936c383673b9 ("clk: imx: fix composite peripheral flags"),
these TF-A managed muxes have SET_PARENT_GATE set, which results
in imx8m-ddrc-devfreq's clk_set_parent after SiP failing with -EBUSY:

	echo 25000000 > userspace/set_freq
	imx8m-ddrc-devfreq 3d400000.memory-controller: failed to set
		dram_apb parent: -16

Fix this by adding a new i.MX composite flag for firmware managed
clocks, which clears SET_PARENT_GATE.

This is safe to do, because updating the Linux clock tree to reflect
reality will always be glitch-free.

Fixes: 936c383673b9 ("clk: imx: fix composite peripheral flags")
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
To: Abel Vesa <abel.vesa@nxp.com>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: NXP Linux Team <linux-imx@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-clk@vger.kernel.org
---
 drivers/clk/imx/clk-composite-8m.c |  3 ++-
 drivers/clk/imx/clk-imx8mm.c       |  7 ++++---
 drivers/clk/imx/clk-imx8mn.c       |  7 ++++---
 drivers/clk/imx/clk-imx8mq.c       |  7 ++++---
 drivers/clk/imx/clk.h              | 16 ++++++++++++++--
 5 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/imx/clk-composite-8m.c b/drivers/clk/imx/clk-composite-8m.c
index 2c309e3dc8e3..04e728538cef 100644
--- a/drivers/clk/imx/clk-composite-8m.c
+++ b/drivers/clk/imx/clk-composite-8m.c
@@ -216,7 +216,8 @@ struct clk_hw *imx8m_clk_hw_composite_flags(const char *name,
 		div->width = PCG_PREDIV_WIDTH;
 		divider_ops = &imx8m_clk_composite_divider_ops;
 		mux_ops = &clk_mux_ops;
-		flags |= CLK_SET_PARENT_GATE;
+		if (!(composite_flags & IMX_COMPOSITE_FW_MANAGED))
+			flags |= CLK_SET_PARENT_GATE;
 	}
 
 	div->lock = &imx_ccm_lock;
diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index f1919fafb124..73cc9805ec59 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -470,10 +470,11 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 
 	/*
 	 * DRAM clocks are manipulated from TF-A outside clock framework.
-	 * Mark with GET_RATE_NOCACHE to always read div value from hardware
+	 * The fw_managed helper sets GET_RATE_NOCACHE and clears SET_PARENT_GATE
+	 * as div value should always be read from hardware
 	 */
-	hws[IMX8MM_CLK_DRAM_ALT] = __imx8m_clk_hw_composite("dram_alt", imx8mm_dram_alt_sels, base + 0xa000, CLK_GET_RATE_NOCACHE);
-	hws[IMX8MM_CLK_DRAM_APB] = __imx8m_clk_hw_composite("dram_apb", imx8mm_dram_apb_sels, base + 0xa080, CLK_IS_CRITICAL | CLK_GET_RATE_NOCACHE);
+	hws[IMX8MM_CLK_DRAM_ALT] = imx8m_clk_hw_fw_managed_composite("dram_alt", imx8mm_dram_alt_sels, base + 0xa000);
+	hws[IMX8MM_CLK_DRAM_APB] = imx8m_clk_hw_fw_managed_composite_critical("dram_apb", imx8mm_dram_apb_sels, base + 0xa080);
 
 	/* IP */
 	hws[IMX8MM_CLK_VPU_G1] = imx8m_clk_hw_composite("vpu_g1", imx8mm_vpu_g1_sels, base + 0xa100);
diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index 88f6630cd472..0a76f969b28b 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -453,10 +453,11 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 
 	/*
 	 * DRAM clocks are manipulated from TF-A outside clock framework.
-	 * Mark with GET_RATE_NOCACHE to always read div value from hardware
+	 * The fw_managed helper sets GET_RATE_NOCACHE and clears SET_PARENT_GATE
+	 * as div value should always be read from hardware
 	 */
-	hws[IMX8MN_CLK_DRAM_ALT] = __imx8m_clk_hw_composite("dram_alt", imx8mn_dram_alt_sels, base + 0xa000, CLK_GET_RATE_NOCACHE);
-	hws[IMX8MN_CLK_DRAM_APB] = __imx8m_clk_hw_composite("dram_apb", imx8mn_dram_apb_sels, base + 0xa080, CLK_IS_CRITICAL | CLK_GET_RATE_NOCACHE);
+	hws[IMX8MN_CLK_DRAM_ALT] = imx8m_clk_hw_fw_managed_composite("dram_alt", imx8mn_dram_alt_sels, base + 0xa000);
+	hws[IMX8MN_CLK_DRAM_APB] = imx8m_clk_hw_fw_managed_composite_critical("dram_apb", imx8mn_dram_apb_sels, base + 0xa080);
 
 	hws[IMX8MN_CLK_DISP_PIXEL] = imx8m_clk_hw_composite("disp_pixel", imx8mn_disp_pixel_sels, base + 0xa500);
 	hws[IMX8MN_CLK_SAI2] = imx8m_clk_hw_composite("sai2", imx8mn_sai2_sels, base + 0xa600);
diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
index c491bc9c61ce..83cc2b1c3294 100644
--- a/drivers/clk/imx/clk-imx8mq.c
+++ b/drivers/clk/imx/clk-imx8mq.c
@@ -449,11 +449,12 @@ static int imx8mq_clocks_probe(struct platform_device *pdev)
 
 	/*
 	 * DRAM clocks are manipulated from TF-A outside clock framework.
-	 * Mark with GET_RATE_NOCACHE to always read div value from hardware
+	 * The fw_managed helper sets GET_RATE_NOCACHE and clears SET_PARENT_GATE
+	 * as div value should always be read from hardware
 	 */
 	hws[IMX8MQ_CLK_DRAM_CORE] = imx_clk_hw_mux2_flags("dram_core_clk", base + 0x9800, 24, 1, imx8mq_dram_core_sels, ARRAY_SIZE(imx8mq_dram_core_sels), CLK_IS_CRITICAL);
-	hws[IMX8MQ_CLK_DRAM_ALT] = __imx8m_clk_hw_composite("dram_alt", imx8mq_dram_alt_sels, base + 0xa000, CLK_GET_RATE_NOCACHE);
-	hws[IMX8MQ_CLK_DRAM_APB] = __imx8m_clk_hw_composite("dram_apb", imx8mq_dram_apb_sels, base + 0xa080, CLK_IS_CRITICAL | CLK_GET_RATE_NOCACHE);
+	hws[IMX8MQ_CLK_DRAM_ALT] = imx8m_clk_hw_fw_managed_composite("dram_alt", imx8mq_dram_alt_sels, base + 0xa000);
+	hws[IMX8MQ_CLK_DRAM_APB] = imx8m_clk_hw_fw_managed_composite_critical("dram_apb", imx8mq_dram_apb_sels, base + 0xa080);
 
 	/* IP */
 	hws[IMX8MQ_CLK_VPU_G1] = imx8m_clk_hw_composite("vpu_g1", imx8mq_vpu_g1_sels, base + 0xa100);
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index 7571603bee23..e144f983fd8c 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -530,8 +530,9 @@ struct clk_hw *imx_clk_hw_cpu(const char *name, const char *parent_name,
 		struct clk *div, struct clk *mux, struct clk *pll,
 		struct clk *step);
 
-#define IMX_COMPOSITE_CORE	BIT(0)
-#define IMX_COMPOSITE_BUS	BIT(1)
+#define IMX_COMPOSITE_CORE		BIT(0)
+#define IMX_COMPOSITE_BUS		BIT(1)
+#define IMX_COMPOSITE_FW_MANAGED	BIT(2)
 
 struct clk_hw *imx8m_clk_hw_composite_flags(const char *name,
 					    const char * const *parent_names,
@@ -567,6 +568,17 @@ struct clk_hw *imx8m_clk_hw_composite_flags(const char *name,
 		ARRAY_SIZE(parent_names), reg, 0, \
 		flags | CLK_SET_RATE_NO_REPARENT | CLK_OPS_PARENT_ENABLE)
 
+#define __imx8m_clk_hw_fw_managed_composite(name, parent_names, reg, flags) \
+	imx8m_clk_hw_composite_flags(name, parent_names, \
+		ARRAY_SIZE(parent_names), reg, IMX_COMPOSITE_FW_MANAGED, \
+		flags | CLK_GET_RATE_NOCACHE | CLK_SET_RATE_NO_REPARENT | CLK_OPS_PARENT_ENABLE)
+
+#define imx8m_clk_hw_fw_managed_composite(name, parent_names, reg) \
+	__imx8m_clk_hw_fw_managed_composite(name, parent_names, reg, 0)
+
+#define imx8m_clk_hw_fw_managed_composite_critical(name, parent_names, reg) \
+	__imx8m_clk_hw_fw_managed_composite(name, parent_names, reg, CLK_IS_CRITICAL)
+
 #define __imx8m_clk_composite(name, parent_names, reg, flags) \
 	to_clk(__imx8m_clk_hw_composite(name, parent_names, reg, flags))
 
-- 
2.30.2

