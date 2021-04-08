Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18138C433ED
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 18:57:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E982861055
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 18:57:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232919AbhDHS56 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Apr 2021 14:57:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231676AbhDHS55 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Apr 2021 14:57:57 -0400
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22322C061761
        for <linux-clk@vger.kernel.org>; Thu,  8 Apr 2021 11:57:46 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4FGVrS6c6Jz1s0tT;
        Thu,  8 Apr 2021 20:57:44 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4FGVrS6B6zz1sP6L;
        Thu,  8 Apr 2021 20:57:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id tXPFZTZEgpD8; Thu,  8 Apr 2021 20:57:42 +0200 (CEST)
X-Auth-Info: p5cMduAmyOqEn8MAeK5uyJwgZkRL6v4PETODEROFxhg=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Thu,  8 Apr 2021 20:57:42 +0200 (CEST)
From:   Marek Vasut <marex@denx.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Marek Vasut <marex@denx.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Patrick Delaunay <patrick.delaunay@foss.st.com>,
        Stephen Boyd <swboyd@chromium.org>, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 1/7] clk: stm32mp1: Split ETHCK_K into separate MUX and GATE clock
Date:   Thu,  8 Apr 2021 20:57:25 +0200
Message-Id: <20210408185731.135511-2-marex@denx.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210408185731.135511-1-marex@denx.de>
References: <20210408185731.135511-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The ETHCK_K are modeled as composite clock of MUX and GATE, however per
STM32MP1 Reference Manual RM0436 Rev 3, Page 574, Figure 83. Peripheral
clock distribution for Ethernet, ETHPTPDIV divider is attached past the
ETHCK_K mux, and ETH_CLK/eth_clk_fb clock are output past ETHCKEN gate.
Therefore, in case ETH_CLK/eth_clk_fb are not in use AND PTP clock are
in use, ETHCKEN gate can be turned off. Current driver does not permit
that, fix it.

This patch converts ETHCK_K from composite clock into a ETHCKEN gate,
ETHPTP_K from composite clock into ETHPTPDIV divider, and adds another
NO_ID clock "ck_ker_eth" which models the ETHSRC mux and is parent clock
to both ETHCK_K and ETHPTP_K. Therefore, all references to ETHCK_K and
ETHPTP_K remain functional as before.

[1] STM32MP1 Reference Manual RM0436 Rev 3, Page 574,
    Figure 83. Peripheral clock distribution for Ethernet
    https://www.st.com/resource/en/reference_manual/dm00327659-stm32mp157-advanced-armbased-32bit-mpus-stmicroelectronics.pdf

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 drivers/clk/clk-stm32mp1.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
index a875649df8b8..a7c7f544ee5d 100644
--- a/drivers/clk/clk-stm32mp1.c
+++ b/drivers/clk/clk-stm32mp1.c
@@ -1949,7 +1949,6 @@ static const struct clock_config stm32mp1_clock_cfg[] = {
 	KCLK(DSI_K, "dsi_k", dsi_src, 0, G_DSI, M_DSI),
 	KCLK(ADFSDM_K, "adfsdm_k", sai_src, 0, G_ADFSDM, M_SAI1),
 	KCLK(USBO_K, "usbo_k", usbo_src, 0, G_USBO, M_USBO),
-	KCLK(ETHCK_K, "ethck_k", eth_src, 0, G_ETHCK, M_ETHCK),
 
 	/* Particulary Kernel Clocks (no mux or no gate) */
 	MGATE_MP1(DFSDM_K, "dfsdm_k", "ck_mcu", 0, G_DFSDM),
@@ -1958,11 +1957,16 @@ static const struct clock_config stm32mp1_clock_cfg[] = {
 	MGATE_MP1(GPU_K, "gpu_k", "pll2_q", 0, G_GPU),
 	MGATE_MP1(DAC12_K, "dac12_k", "ck_lsi", 0, G_DAC12),
 
-	COMPOSITE(ETHPTP_K, "ethptp_k", eth_src, CLK_OPS_PARENT_ENABLE |
+	COMPOSITE(NO_ID, "ck_ker_eth", eth_src, CLK_OPS_PARENT_ENABLE |
 		  CLK_SET_RATE_NO_REPARENT,
 		  _NO_GATE,
 		  _MMUX(M_ETHCK),
-		  _DIV(RCC_ETHCKSELR, 4, 4, 0, NULL)),
+		  _NO_DIV),
+
+	MGATE_MP1(ETHCK_K, "ethck_k", "ck_ker_eth", 0, G_ETHCK),
+
+	DIV(ETHPTP_K, "ethptp_k", "ck_ker_eth", CLK_OPS_PARENT_ENABLE |
+	    CLK_SET_RATE_NO_REPARENT, RCC_ETHCKSELR, 4, 4, 0),
 
 	/* RTC clock */
 	DIV(NO_ID, "ck_hse_rtc", "ck_hse", 0, RCC_RTCDIVR, 0, 6, 0),
-- 
2.30.2

