Return-Path: <SRS0=5BEl=XU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63092C432C2
	for <linux-clk@archiver.kernel.org>; Wed, 25 Sep 2019 11:23:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3612D21D80
	for <linux-clk@archiver.kernel.org>; Wed, 25 Sep 2019 11:23:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390743AbfIYLXw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Sep 2019 07:23:52 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:46563 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732430AbfIYLXw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Sep 2019 07:23:52 -0400
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iD5Og-0004hr-Jp; Wed, 25 Sep 2019 12:23:50 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iD5Of-0003gs-Un; Wed, 25 Sep 2019 12:23:49 +0100
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 2/2] clk: hisilicon: fix sparse warnings in clk-hi3660.c
Date:   Wed, 25 Sep 2019 12:23:47 +0100
Message-Id: <20190925112347.14141-2-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190925112347.14141-1-ben.dooks@codethink.co.uk>
References: <20190925112347.14141-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix sparse warnings of a 0 being used for a pointer by removing it from
the initialiser.

drivers/clk/hisilicon/clk-hi3660.c:336:69: warning: Using plain integer as NULL pointer
drivers/clk/hisilicon/clk-hi3660.c:338:69: warning: Using plain integer as NULL pointer
drivers/clk/hisilicon/clk-hi3660.c:340:70: warning: Using plain integer as NULL pointer
drivers/clk/hisilicon/clk-hi3660.c:342:69: warning: Using plain integer as NULL pointer
drivers/clk/hisilicon/clk-hi3660.c:344:69: warning: Using plain integer as NULL pointer
drivers/clk/hisilicon/clk-hi3660.c:346:69: warning: Using plain integer as NULL pointer
drivers/clk/hisilicon/clk-hi3660.c:348:70: warning: Using plain integer as NULL pointer
drivers/clk/hisilicon/clk-hi3660.c:350:69: warning: Using plain integer as NULL pointer
drivers/clk/hisilicon/clk-hi3660.c:352:69: warning: Using plain integer as NULL pointer
drivers/clk/hisilicon/clk-hi3660.c:354:70: warning: Using plain integer as NULL pointer
drivers/clk/hisilicon/clk-hi3660.c:356:69: warning: Using plain integer as NULL pointer
drivers/clk/hisilicon/clk-hi3660.c:358:69: warning: Using plain integer as NULL pointer
drivers/clk/hisilicon/clk-hi3660.c:360:69: warning: Using plain integer as NULL pointer
drivers/clk/hisilicon/clk-hi3660.c:362:69: warning: Using plain integer as NULL pointer
drivers/clk/hisilicon/clk-hi3660.c:364:69: warning: Using plain integer as NULL pointer
drivers/clk/hisilicon/clk-hi3660.c:366:69: warning: Using plain integer as NULL pointer
drivers/clk/hisilicon/clk-hi3660.c:368:69: warning: Using plain integer as NULL pointer
drivers/clk/hisilicon/clk-hi3660.c:370:69: warning: Using plain integer as NULL pointer
drivers/clk/hisilicon/clk-hi3660.c:372:70: warning: Using plain integer as NULL pointer
drivers/clk/hisilicon/clk-hi3660.c:374:70: warning: Using plain integer as NULL pointer
drivers/clk/hisilicon/clk-hi3660.c:376:70: warning: Using plain integer as NULL pointer
drivers/clk/hisilicon/clk-hi3660.c:378:71: warning: Using plain integer as NULL pointer
drivers/clk/hisilicon/clk-hi3660.c:423:68: warning: Using plain integer as NULL pointer
drivers/clk/hisilicon/clk-hi3660.c:425:68: warning: Using plain integer as NULL pointer
drivers/clk/hisilicon/clk-hi3660.c:427:68: warning: Using plain integer as NULL pointer
drivers/clk/hisilicon/clk-hi3660.c:429:68: warning: Using plain integer as NULL pointer
drivers/clk/hisilicon/clk-hi3660.c:449:70: warning: Using plain integer as NULL pointer
drivers/clk/hisilicon/clk-hi3660.c:451:71: warning: Using plain integer as NULL pointer
drivers/clk/hisilicon/clk-hi3660.c:453:71: warning: Using plain integer as NULL pointer
drivers/clk/hisilicon/clk-hi3660.c:455:71: warning: Using plain integer as NULL pointer

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/clk/hisilicon/clk-hi3660.c | 60 +++++++++++++++---------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/hisilicon/clk-hi3660.c b/drivers/clk/hisilicon/clk-hi3660.c
index 5b3ad26dcc77..41f61726ab19 100644
--- a/drivers/clk/hisilicon/clk-hi3660.c
+++ b/drivers/clk/hisilicon/clk-hi3660.c
@@ -333,49 +333,49 @@ static const struct hisi_mux_clock hi3660_crgctrl_mux_clks[] = {
 
 static const struct hisi_divider_clock hi3660_crgctrl_divider_clks[] = {
 	{ HI3660_CLK_DIV_UART0, "clk_div_uart0", "clk_andgt_uart0",
-	  CLK_SET_RATE_PARENT, 0xb0, 4, 4, CLK_DIVIDER_HIWORD_MASK, 0, },
+	  CLK_SET_RATE_PARENT, 0xb0, 4, 4, CLK_DIVIDER_HIWORD_MASK, },
 	{ HI3660_CLK_DIV_UART1, "clk_div_uart1", "clk_andgt_uart1",
-	  CLK_SET_RATE_PARENT, 0xb0, 8, 4, CLK_DIVIDER_HIWORD_MASK, 0, },
+	  CLK_SET_RATE_PARENT, 0xb0, 8, 4, CLK_DIVIDER_HIWORD_MASK, },
 	{ HI3660_CLK_DIV_UARTH, "clk_div_uarth", "clk_andgt_uarth",
-	  CLK_SET_RATE_PARENT, 0xb0, 12, 4, CLK_DIVIDER_HIWORD_MASK, 0, },
+	  CLK_SET_RATE_PARENT, 0xb0, 12, 4, CLK_DIVIDER_HIWORD_MASK, },
 	{ HI3660_CLK_DIV_MMC, "clk_div_mmc", "clk_andgt_mmc",
-	  CLK_SET_RATE_PARENT, 0xb4, 3, 4, CLK_DIVIDER_HIWORD_MASK, 0, },
+	  CLK_SET_RATE_PARENT, 0xb4, 3, 4, CLK_DIVIDER_HIWORD_MASK, },
 	{ HI3660_CLK_DIV_SD, "clk_div_sd", "clk_andgt_sd",
-	  CLK_SET_RATE_PARENT, 0xb8, 0, 4, CLK_DIVIDER_HIWORD_MASK, 0, },
+	  CLK_SET_RATE_PARENT, 0xb8, 0, 4, CLK_DIVIDER_HIWORD_MASK, },
 	{ HI3660_CLK_DIV_EDC0, "clk_div_edc0", "clk_andgt_edc0",
-	  CLK_SET_RATE_PARENT, 0xbc, 0, 6, CLK_DIVIDER_HIWORD_MASK, 0, },
+	  CLK_SET_RATE_PARENT, 0xbc, 0, 6, CLK_DIVIDER_HIWORD_MASK, },
 	{ HI3660_CLK_DIV_LDI0, "clk_div_ldi0", "clk_andgt_ldi0",
-	  CLK_SET_RATE_PARENT, 0xbc, 10, 6, CLK_DIVIDER_HIWORD_MASK, 0, },
+	  CLK_SET_RATE_PARENT, 0xbc, 10, 6, CLK_DIVIDER_HIWORD_MASK, },
 	{ HI3660_CLK_DIV_SDIO, "clk_div_sdio", "clk_andgt_sdio",
-	  CLK_SET_RATE_PARENT, 0xc0, 0, 4, CLK_DIVIDER_HIWORD_MASK, 0, },
+	  CLK_SET_RATE_PARENT, 0xc0, 0, 4, CLK_DIVIDER_HIWORD_MASK, },
 	{ HI3660_CLK_DIV_LDI1, "clk_div_ldi1", "clk_andgt_ldi1",
-	  CLK_SET_RATE_PARENT, 0xc0, 8, 6, CLK_DIVIDER_HIWORD_MASK, 0, },
+	  CLK_SET_RATE_PARENT, 0xc0, 8, 6, CLK_DIVIDER_HIWORD_MASK, },
 	{ HI3660_CLK_DIV_SPI, "clk_div_spi", "clk_andgt_spi",
-	  CLK_SET_RATE_PARENT, 0xc4, 12, 4, CLK_DIVIDER_HIWORD_MASK, 0, },
+	  CLK_SET_RATE_PARENT, 0xc4, 12, 4, CLK_DIVIDER_HIWORD_MASK, },
 	{ HI3660_CLK_DIV_VENC, "clk_div_venc", "clk_andgt_venc",
-	  CLK_SET_RATE_PARENT, 0xc8, 6, 5, CLK_DIVIDER_HIWORD_MASK, 0, },
+	  CLK_SET_RATE_PARENT, 0xc8, 6, 5, CLK_DIVIDER_HIWORD_MASK, },
 	{ HI3660_CLK_DIV_VDEC, "clk_div_vdec", "clk_andgt_vdec",
-	  CLK_SET_RATE_PARENT, 0xcc, 0, 5, CLK_DIVIDER_HIWORD_MASK, 0, },
+	  CLK_SET_RATE_PARENT, 0xcc, 0, 5, CLK_DIVIDER_HIWORD_MASK,  },
 	{ HI3660_CLK_DIV_VIVOBUS, "clk_div_vivobus", "clk_vivobus_andgt",
-	  CLK_SET_RATE_PARENT, 0xd0, 7, 5, CLK_DIVIDER_HIWORD_MASK, 0, },
+	  CLK_SET_RATE_PARENT, 0xd0, 7, 5, CLK_DIVIDER_HIWORD_MASK, },
 	{ HI3660_CLK_DIV_I2C, "clk_div_i2c", "clk_div_320m",
-	  CLK_SET_RATE_PARENT, 0xe8, 4, 4, CLK_DIVIDER_HIWORD_MASK, 0, },
+	  CLK_SET_RATE_PARENT, 0xe8, 4, 4, CLK_DIVIDER_HIWORD_MASK, },
 	{ HI3660_CLK_DIV_UFSPHY, "clk_div_ufsphy_cfg", "clk_gate_ufsphy_gt",
-	  CLK_SET_RATE_PARENT, 0xe8, 9, 2, CLK_DIVIDER_HIWORD_MASK, 0, },
+	  CLK_SET_RATE_PARENT, 0xe8, 9, 2, CLK_DIVIDER_HIWORD_MASK, },
 	{ HI3660_CLK_DIV_CFGBUS, "clk_div_cfgbus", "clk_div_sysbus",
-	  CLK_SET_RATE_PARENT, 0xec, 0, 2, CLK_DIVIDER_HIWORD_MASK, 0, },
+	  CLK_SET_RATE_PARENT, 0xec, 0, 2, CLK_DIVIDER_HIWORD_MASK, },
 	{ HI3660_CLK_DIV_MMC0BUS, "clk_div_mmc0bus", "autodiv_emmc0bus",
-	  CLK_SET_RATE_PARENT, 0xec, 2, 1, CLK_DIVIDER_HIWORD_MASK, 0, },
+	  CLK_SET_RATE_PARENT, 0xec, 2, 1, CLK_DIVIDER_HIWORD_MASK, },
 	{ HI3660_CLK_DIV_MMC1BUS, "clk_div_mmc1bus", "clk_div_sysbus",
-	  CLK_SET_RATE_PARENT, 0xec, 3, 1, CLK_DIVIDER_HIWORD_MASK, 0, },
+	  CLK_SET_RATE_PARENT, 0xec, 3, 1, CLK_DIVIDER_HIWORD_MASK, },
 	{ HI3660_CLK_DIV_UFSPERI, "clk_div_ufsperi", "clk_gate_ufs_subsys",
-	  CLK_SET_RATE_PARENT, 0xec, 14, 1, CLK_DIVIDER_HIWORD_MASK, 0, },
+	  CLK_SET_RATE_PARENT, 0xec, 14, 1, CLK_DIVIDER_HIWORD_MASK, },
 	{ HI3660_CLK_DIV_AOMM, "clk_div_aomm", "clk_aomm_andgt",
-	  CLK_SET_RATE_PARENT, 0x100, 7, 4, CLK_DIVIDER_HIWORD_MASK, 0, },
+	  CLK_SET_RATE_PARENT, 0x100, 7, 4, CLK_DIVIDER_HIWORD_MASK, },
 	{ HI3660_CLK_DIV_ISP_SNCLK, "clk_isp_snclk_div", "clk_isp_snclk_fac",
-	  CLK_SET_RATE_PARENT, 0x108, 0, 2, CLK_DIVIDER_HIWORD_MASK, 0, },
+	  CLK_SET_RATE_PARENT, 0x108, 0, 2, CLK_DIVIDER_HIWORD_MASK, },
 	{ HI3660_CLK_DIV_IOPERI, "clk_div_ioperi", "clk_mux_ioperi",
-	  CLK_SET_RATE_PARENT, 0x108, 11, 4, CLK_DIVIDER_HIWORD_MASK, 0, },
+	  CLK_SET_RATE_PARENT, 0x108, 11, 4, CLK_DIVIDER_HIWORD_MASK, },
 };
 
 /* clk_pmuctrl */
@@ -420,13 +420,13 @@ static const struct hisi_gate_clock hi3660_sctrl_gate_clks[] = {
 	{ HI3660_PCLK_MMBUF_ANDGT, "pclk_mmbuf_andgt", "clk_sw_mmbuf",
 	  CLK_SET_RATE_PARENT, 0x258, 7, CLK_GATE_HIWORD_MASK, },
 	{ HI3660_CLK_MMBUF_PLL_ANDGT, "clk_mmbuf_pll_andgt", "clk_ppll0",
-	  CLK_SET_RATE_PARENT, 0x260, 11, CLK_DIVIDER_HIWORD_MASK, 0, },
+	  CLK_SET_RATE_PARENT, 0x260, 11, CLK_DIVIDER_HIWORD_MASK, },
 	{ HI3660_CLK_FLL_MMBUF_ANDGT, "clk_fll_mmbuf_andgt", "clk_fll_src",
-	  CLK_SET_RATE_PARENT, 0x260, 12, CLK_DIVIDER_HIWORD_MASK, 0, },
+	  CLK_SET_RATE_PARENT, 0x260, 12, CLK_DIVIDER_HIWORD_MASK, },
 	{ HI3660_CLK_SYS_MMBUF_ANDGT, "clk_sys_mmbuf_andgt", "clkin_sys",
-	  CLK_SET_RATE_PARENT, 0x260, 13, CLK_DIVIDER_HIWORD_MASK, 0, },
+	  CLK_SET_RATE_PARENT, 0x260, 13, CLK_DIVIDER_HIWORD_MASK, },
 	{ HI3660_CLK_GATE_PCIEPHY_GT, "clk_gate_pciephy_gt", "clk_ppll0",
-	  CLK_SET_RATE_PARENT, 0x268, 11, CLK_DIVIDER_HIWORD_MASK, 0, },
+	  CLK_SET_RATE_PARENT, 0x268, 11, CLK_DIVIDER_HIWORD_MASK, },
 };
 
 static const char *const
@@ -446,13 +446,13 @@ static const struct hisi_mux_clock hi3660_sctrl_mux_clks[] = {
 
 static const struct hisi_divider_clock hi3660_sctrl_divider_clks[] = {
 	{ HI3660_CLK_DIV_AOBUS, "clk_div_aobus", "clk_ppll0",
-	  CLK_SET_RATE_PARENT, 0x254, 0, 6, CLK_DIVIDER_HIWORD_MASK, 0, },
+	  CLK_SET_RATE_PARENT, 0x254, 0, 6, CLK_DIVIDER_HIWORD_MASK, },
 	{ HI3660_PCLK_DIV_MMBUF, "pclk_div_mmbuf", "pclk_mmbuf_andgt",
-	  CLK_SET_RATE_PARENT, 0x258, 10, 2, CLK_DIVIDER_HIWORD_MASK, 0, },
+	  CLK_SET_RATE_PARENT, 0x258, 10, 2, CLK_DIVIDER_HIWORD_MASK, },
 	{ HI3660_ACLK_DIV_MMBUF, "aclk_div_mmbuf", "clk_mmbuf_pll_andgt",
-	  CLK_SET_RATE_PARENT, 0x258, 12, 4, CLK_DIVIDER_HIWORD_MASK, 0, },
+	  CLK_SET_RATE_PARENT, 0x258, 12, 4, CLK_DIVIDER_HIWORD_MASK, },
 	{ HI3660_CLK_DIV_PCIEPHY, "clk_div_pciephy", "clk_gate_pciephy_gt",
-	  CLK_SET_RATE_PARENT, 0x268, 12, 4, CLK_DIVIDER_HIWORD_MASK, 0, },
+	  CLK_SET_RATE_PARENT, 0x268, 12, 4, CLK_DIVIDER_HIWORD_MASK, },
 };
 
 /* clk_iomcu */
-- 
2.23.0

