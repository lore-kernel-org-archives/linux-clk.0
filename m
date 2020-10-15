Return-Path: <SRS0=IVDQ=DW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4865C433DF
	for <linux-clk@archiver.kernel.org>; Thu, 15 Oct 2020 09:25:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 691C522260
	for <linux-clk@archiver.kernel.org>; Thu, 15 Oct 2020 09:25:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgJOJZu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Oct 2020 05:25:50 -0400
Received: from inva020.nxp.com ([92.121.34.13]:40222 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727753AbgJOJZu (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 15 Oct 2020 05:25:50 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 8A1811A07AE;
        Thu, 15 Oct 2020 11:25:48 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7A6BF1A061D;
        Thu, 15 Oct 2020 11:25:48 +0200 (CEST)
Received: from fsr-ub1664-175.ea.freescale.net (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id E8C29202DB;
        Thu, 15 Oct 2020 11:25:47 +0200 (CEST)
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH] clk: imx8mq: Fix usdhc parents order
Date:   Thu, 15 Oct 2020 12:25:44 +0300
Message-Id: <1602753944-30757-1-git-send-email-abel.vesa@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

According to the latest RM (see Table 5-1. Clock Root Table),
both usdhc root clocks have the parent order as follows:

000 - 25M_REF_CLK
001 - SYSTEM_PLL1_DIV2
010 - SYSTEM_PLL1_CLK
011 - SYSTEM_PLL2_DIV2
100 - SYSTEM_PLL3_CLK
101 - SYSTEM_PLL1_DIV3
110 - AUDIO_PLL2_CLK
111 - SYSTEM_PLL1_DIV8

So the audio_pll2_out and sys3_pll_out have to be swapped.

Fixes: b80522040cd3 ("clk: imx: Add clock driver for i.MX8MQ CCM")
Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
Reported-by: Cosmin Stefan Stoica <cosmin.stoica@nxp.com>
---
 drivers/clk/imx/clk-imx8mq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
index 238835c..75f6aa0 100644
--- a/drivers/clk/imx/clk-imx8mq.c
+++ b/drivers/clk/imx/clk-imx8mq.c
@@ -160,10 +160,10 @@ static const char * const imx8mq_qspi_sels[] = {"osc_25m", "sys1_pll_400m", "sys
 					 "audio_pll2_out", "sys1_pll_266m", "sys3_pll_out", "sys1_pll_100m", };
 
 static const char * const imx8mq_usdhc1_sels[] = {"osc_25m", "sys1_pll_400m", "sys1_pll_800m", "sys2_pll_500m",
-					 "audio_pll2_out", "sys1_pll_266m", "sys3_pll_out", "sys1_pll_100m", };
+					 "sys3_pll_out", "sys1_pll_266m", "audio_pll2_out", "sys1_pll_100m", };
 
 static const char * const imx8mq_usdhc2_sels[] = {"osc_25m", "sys1_pll_400m", "sys1_pll_800m", "sys2_pll_500m",
-					 "audio_pll2_out", "sys1_pll_266m", "sys3_pll_out", "sys1_pll_100m", };
+					 "sys3_pll_out", "sys1_pll_266m", "audio_pll2_out", "sys1_pll_100m", };
 
 static const char * const imx8mq_i2c1_sels[] = {"osc_25m", "sys1_pll_160m", "sys2_pll_50m", "sys3_pll_out", "audio_pll1_out",
 					 "video_pll1_out", "audio_pll2_out", "sys1_pll_133m", };
-- 
2.7.4

