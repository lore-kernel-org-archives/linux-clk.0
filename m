Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A03EC433F5
	for <linux-clk@archiver.kernel.org>; Tue, 18 Jan 2022 20:30:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237591AbiARUaS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Jan 2022 15:30:18 -0500
Received: from phobos.denx.de ([85.214.62.61]:50654 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230264AbiARUaS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 18 Jan 2022 15:30:18 -0500
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id C30278303A;
        Tue, 18 Jan 2022 21:30:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1642537817;
        bh=4vlJQViHiRSeddYnY36K5HsMu8V0Pl0vpaw3u5O6HKU=;
        h=From:To:Cc:Subject:Date:From;
        b=cTplIhhT1DKLs2haeYRTEKdXN67FPq/teqfIGDymT8PF1sutcE16jGRpXoBkXcmta
         tz2dy/vuzBzimFcjt7r4yYeAW31agyYfxbg12Jj7nSHcMHZVlyryrKNTdWvWt3atWf
         GN7725kNOdtEkPC3z58gox9BYa6DNrmt4DWUNz58ybNQvZrekIJosBo3Fh0w/l22ng
         Kl908eioEM7lpIZkmwZBPxQbU7da4mgSBTP9LjqdIhOqdIis0I/fChcV4UiuA50CzC
         17CBwoKn5SBtRGNPAaOAKZkpFYjUZQasv6Y4o+JlIfbQJFFY0S3Gptbg8XvjC5i2i4
         5Wbq8NBeplvRQ==
From:   Marek Vasut <marex@denx.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     jneuhauser@dh-electronics.com, Marek Vasut <marex@denx.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Patrick Delaunay <patrick.delaunay@foss.st.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 1/5] clk: stm32mp1: Split ETHCK_K into separate MUX and GATE clock
Date:   Tue, 18 Jan 2022 21:29:54 +0100
Message-Id: <20220118202958.1840431-1-marex@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 drivers/clk/clk-stm32mp1.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
index 863274aa50e38..23a34ab459a3b 100644
--- a/drivers/clk/clk-stm32mp1.c
+++ b/drivers/clk/clk-stm32mp1.c
@@ -2008,7 +2008,6 @@ static const struct clock_config stm32mp1_clock_cfg[] = {
 	KCLK(DSI_K, "dsi_k", dsi_src, 0, G_DSI, M_DSI),
 	KCLK(ADFSDM_K, "adfsdm_k", sai_src, 0, G_ADFSDM, M_SAI1),
 	KCLK(USBO_K, "usbo_k", usbo_src, 0, G_USBO, M_USBO),
-	KCLK(ETHCK_K, "ethck_k", eth_src, 0, G_ETHCK, M_ETHCK),
 
 	/* Particulary Kernel Clocks (no mux or no gate) */
 	MGATE_MP1(DFSDM_K, "dfsdm_k", "ck_mcu", 0, G_DFSDM),
@@ -2017,11 +2016,16 @@ static const struct clock_config stm32mp1_clock_cfg[] = {
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
 	COMPOSITE(RTC, "ck_rtc", rtc_src, CLK_OPS_PARENT_ENABLE,
-- 
2.34.1

