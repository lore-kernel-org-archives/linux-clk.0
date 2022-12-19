Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40464C10F1B
	for <linux-clk@archiver.kernel.org>; Mon, 19 Dec 2022 17:11:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232270AbiLSRLq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Dec 2022 12:11:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232267AbiLSRLU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Dec 2022 12:11:20 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21EBC13E31
        for <linux-clk@vger.kernel.org>; Mon, 19 Dec 2022 09:11:13 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1p7JfI-0003x3-S9; Mon, 19 Dec 2022 18:11:00 +0100
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mfe@pengutronix.de>)
        id 1p7JfH-000OAh-Q5; Mon, 19 Dec 2022 18:10:59 +0100
Received: from mfe by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mfe@pengutronix.de>)
        id 1p7JfH-000gmF-0A; Mon, 19 Dec 2022 18:10:59 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, festevam@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, Anson.Huang@nxp.com
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 1/2] clk: imx8mp: fix sai4 clock
Date:   Mon, 19 Dec 2022 18:10:57 +0100
Message-Id: <20221219171058.164381-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The reference manual don't mention a SAI4 hardware block. This would be
clock slice 78 which is skipped (TRM, page 237). Remove any reference to
this clock to align the driver with the reality.

Fixes: 9c140d992676 ("clk: imx: Add support for i.MX8MP clock driver")
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/clk/imx/clk-imx8mp.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index 652ae58c2735..c161a18a8130 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -176,10 +176,6 @@ static const char * const imx8mp_sai3_sels[] = {"osc_24m", "audio_pll1_out", "au
 						"video_pll1_out", "sys_pll1_133m", "osc_hdmi",
 						"clk_ext3", "clk_ext4", };
 
-static const char * const imx8mp_sai4_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out",
-						"video_pll1_out", "sys_pll1_133m", "osc_hdmi",
-						"clk_ext1", "clk_ext2", };
-
 static const char * const imx8mp_sai5_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out",
 						"video_pll1_out", "sys_pll1_133m", "osc_hdmi",
 						"clk_ext2", "clk_ext3", };
@@ -568,7 +564,6 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_CLK_SAI1] = imx8m_clk_hw_composite("sai1", imx8mp_sai1_sels, ccm_base + 0xa580);
 	hws[IMX8MP_CLK_SAI2] = imx8m_clk_hw_composite("sai2", imx8mp_sai2_sels, ccm_base + 0xa600);
 	hws[IMX8MP_CLK_SAI3] = imx8m_clk_hw_composite("sai3", imx8mp_sai3_sels, ccm_base + 0xa680);
-	hws[IMX8MP_CLK_SAI4] = imx8m_clk_hw_composite("sai4", imx8mp_sai4_sels, ccm_base + 0xa700);
 	hws[IMX8MP_CLK_SAI5] = imx8m_clk_hw_composite("sai5", imx8mp_sai5_sels, ccm_base + 0xa780);
 	hws[IMX8MP_CLK_SAI6] = imx8m_clk_hw_composite("sai6", imx8mp_sai6_sels, ccm_base + 0xa800);
 	hws[IMX8MP_CLK_ENET_QOS] = imx8m_clk_hw_composite("enet_qos", imx8mp_enet_qos_sels, ccm_base + 0xa880);
-- 
2.30.2

