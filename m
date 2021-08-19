Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B9A0C4338F
	for <linux-clk@archiver.kernel.org>; Thu, 19 Aug 2021 20:20:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED86A610E5
	for <linux-clk@archiver.kernel.org>; Thu, 19 Aug 2021 20:20:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233212AbhHSUVb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Aug 2021 16:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231683AbhHSUVa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Aug 2021 16:21:30 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7639C061575
        for <linux-clk@vger.kernel.org>; Thu, 19 Aug 2021 13:20:53 -0700 (PDT)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id EBE868032E;
        Thu, 19 Aug 2021 22:20:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1629404451;
        bh=WjJ++G/pBDOGVfUD3axdgR5VWf7Bk8K+OciLvf52Y8Y=;
        h=From:To:Cc:Subject:Date:From;
        b=fuNOKAezeTwiRCGcVEq4HwFuTdGIxFasXBSozJruv01tB+T1qnOsHHcM5Be6al+W9
         dOR/IL6dGmGvjSfB+ImYZ1etpeBr7BOCq/uEUJrQzEaxP+dWJ8KFnE/AxpwBD7MNMs
         6x0ZJN4jV3wmP1Za6Si4fR6Hdz3coPg/qE9sowoOAUfYQslNr9UAYULV5uLkBgwB4T
         gM1P3Rj6gnBfZoqV5FpJlumP19Cg0kEGsHFcQEtBp6eDOSToOEAHvWCtzojTMsV2TM
         iQpZVW5GzzRP85Z4zl7cfujTwWBKOAb7fjCTwTYoXFylVFuz3WuXQuThmtuHZHi/hX
         jiJPenR3NqxJA==
From:   Marek Vasut <marex@denx.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-clk@vger.kernel.org, Marek Vasut <marex@denx.de>,
        Abel Vesa <abel.vesa@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH] clk: imx8mn: Add M7 core clock
Date:   Thu, 19 Aug 2021 22:20:36 +0200
Message-Id: <20210819202036.2084782-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add missing M7 core clock entry to the iMX8MN clock driver.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Abel Vesa <abel.vesa@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>
---
 drivers/clk/imx/clk-imx8mn.c             | 5 +++++
 include/dt-bindings/clock/imx8mn-clock.h | 4 +++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index 212708e9388e2..9dba4eb643ab9 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -40,6 +40,9 @@ static const char * const imx8mn_a53_sels[] = {"osc_24m", "arm_pll_out", "sys_pl
 
 static const char * const imx8mn_a53_core_sels[] = {"arm_a53_div", "arm_pll_out", };
 
+static const char * const imx8mn_m7_sels[] = {"osc_24m", "sys_pll2_200m", "sys_pll2_250m", "vpu_pll_out",
+				       "sys_pll1_800m", "audio_pll1_out", "video_pll1_out", "sys_pll3_out", };
+
 static const char * const imx8mn_gpu_core_sels[] = {"osc_24m", "gpu_pll_out", "sys_pll1_800m",
 						    "sys_pll3_out", "sys_pll2_1000m", "audio_pll1_out",
 						    "video_pll1_out", "audio_pll2_out", };
@@ -421,6 +424,8 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MN_CLK_A53_SRC] = hws[IMX8MN_CLK_A53_DIV];
 	hws[IMX8MN_CLK_A53_CG] = hws[IMX8MN_CLK_A53_DIV];
 
+	hws[IMX8MN_CLK_M7_CORE] = imx8m_clk_hw_composite_core("arm_m7_core", imx8mn_m7_sels, base + 0x8080);
+
 	hws[IMX8MN_CLK_GPU_CORE] = imx8m_clk_hw_composite_core("gpu_core", imx8mn_gpu_core_sels, base + 0x8180);
 	hws[IMX8MN_CLK_GPU_SHADER] = imx8m_clk_hw_composite_core("gpu_shader", imx8mn_gpu_shader_sels, base + 0x8200);
 
diff --git a/include/dt-bindings/clock/imx8mn-clock.h b/include/dt-bindings/clock/imx8mn-clock.h
index d24b627cb2e71..01e8bab1d767a 100644
--- a/include/dt-bindings/clock/imx8mn-clock.h
+++ b/include/dt-bindings/clock/imx8mn-clock.h
@@ -241,6 +241,8 @@
 #define IMX8MN_CLK_CLKOUT2_DIV			219
 #define IMX8MN_CLK_CLKOUT2			220
 
-#define IMX8MN_CLK_END				221
+#define IMX8MN_CLK_M7_CORE			221
+
+#define IMX8MN_CLK_END				222
 
 #endif
-- 
2.30.2

