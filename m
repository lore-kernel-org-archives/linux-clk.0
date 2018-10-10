Return-Path: <SRS0=fkKI=MW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A66BC43441
	for <linux-clk@archiver.kernel.org>; Wed, 10 Oct 2018 15:07:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0E603214DA
	for <linux-clk@archiver.kernel.org>; Wed, 10 Oct 2018 15:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E603214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726886AbeJJW3u (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Oct 2018 18:29:50 -0400
Received: from relmlor3.renesas.com ([210.160.252.173]:12889 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726713AbeJJW3u (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 Oct 2018 18:29:50 -0400
Received: from unknown (HELO relmlir4.idc.renesas.com) ([10.200.68.154])
  by relmlie2.idc.renesas.com with ESMTP; 11 Oct 2018 00:07:12 +0900
Received: from relmlii1.idc.renesas.com (relmlii1.idc.renesas.com [10.200.68.65])
        by relmlir4.idc.renesas.com (Postfix) with ESMTP id 4311E86BE3;
        Thu, 11 Oct 2018 00:07:12 +0900 (JST)
X-IronPort-AV: E=Sophos;i="5.54,364,1534777200"; 
   d="scan'208";a="293194387"
Received: from unknown (HELO rtamta01.rta.renesas.com) ([143.103.48.75])
  by relmlii1.idc.renesas.com with ESMTP; 11 Oct 2018 00:07:10 +0900
Received: from ubuntu.localdomain (unknown [143.103.58.82])
        by rtamta01.rta.renesas.com (Postfix) with ESMTP id 3C308233;
        Wed, 10 Oct 2018 15:07:05 +0000 (UTC)
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v3 2/3] mmc: renesas_sdhi_internal_dmac: Add R7S9210 support
Date:   Wed, 10 Oct 2018 10:06:41 -0500
Message-Id: <20181010150642.73890-3-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20181010150642.73890-1-chris.brandt@renesas.com>
References: <20181010150642.73890-1-chris.brandt@renesas.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The SDHI/MMC controller in the RZ/A2 is almost the same as R-Car gen3, but
with some minor differences.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
v3:
 * Removed extra space in Kconfig
 * Removed unneeded parentheses
v2:
 * Made comment clearer
---
 drivers/mmc/host/Kconfig                      |  5 +++--
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 28 +++++++++++++++++++++++++--
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index cf984f0f0246..b69d5cd45d0f 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -636,13 +636,14 @@ config MMC_SDHI_SYS_DMAC
 
 config MMC_SDHI_INTERNAL_DMAC
 	tristate "DMA for SDHI SD/SDIO controllers using on-chip bus mastering"
-	depends on ARM64 || COMPILE_TEST
+	depends on ARM64 || ARCH_R7S9210 || COMPILE_TEST
 	depends on MMC_SDHI
 	default MMC_SDHI if ARM64
 	help
 	  This provides DMA support for SDHI SD/SDIO controllers
 	  using on-chip bus mastering. This supports the controllers
-	  found in arm64 based SoCs.
+	  found in arm64 based SoCs. This controller is also found in
+	  RZ/A2 series SoCs.
 
 config MMC_UNIPHIER
 	tristate "UniPhier SD/eMMC Host Controller support"
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index e5e5015ca680..e3c4fa764609 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -34,7 +34,7 @@
 #define DTRAN_MODE_CH_NUM_CH0	0	/* "downstream" = for write commands */
 #define DTRAN_MODE_CH_NUM_CH1	BIT(16)	/* "upstream" = for read commands */
 #define DTRAN_MODE_BUS_WIDTH	(BIT(5) | BIT(4))
-#define DTRAN_MODE_ADDR_MODE	BIT(0)	/* 1 = Increment address */
+#define DTRAN_MODE_ADDR_MODE	BIT(0)	/* 1 = Increment address, 0 = Fixed */
 
 /* DM_CM_DTRAN_CTRL */
 #define DTRAN_CTRL_DM_START	BIT(0)
@@ -73,6 +73,9 @@ static unsigned long global_flags;
 #define SDHI_INTERNAL_DMAC_ONE_RX_ONLY	0
 #define SDHI_INTERNAL_DMAC_RX_IN_USE	1
 
+/* RZ/A2 does not have the ADRR_MODE bit */
+#define SDHI_INTERNAL_DMAC_ADRR_MODE_FIXED 2
+
 /* Definitions for sampling clocks */
 static struct renesas_sdhi_scc rcar_gen3_scc_taps[] = {
 	{
@@ -81,6 +84,21 @@ static struct renesas_sdhi_scc rcar_gen3_scc_taps[] = {
 	},
 };
 
+static const struct renesas_sdhi_of_data of_rza2_compatible = {
+	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
+			  TMIO_MMC_HAVE_CBSY,
+	.tmio_ocr_mask	= MMC_VDD_32_33,
+	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
+			  MMC_CAP_CMD23,
+	.bus_shift	= 2,
+	.scc_offset	= 0 - 0x1000,
+	.taps		= rcar_gen3_scc_taps,
+	.taps_num	= ARRAY_SIZE(rcar_gen3_scc_taps),
+	/* DMAC can handle 0xffffffff blk count but only 1 segment */
+	.max_blk_count	= 0xffffffff,
+	.max_segs	= 1,
+};
+
 static const struct renesas_sdhi_of_data of_rcar_r8a7795_compatible = {
 	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
 			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2 |
@@ -113,6 +131,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen3_compatible = {
 };
 
 static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
+	{ .compatible = "renesas,sdhi-r7s9210", .data = &of_rza2_compatible, },
 	{ .compatible = "renesas,sdhi-r8a7795", .data = &of_rcar_r8a7795_compatible, },
 	{ .compatible = "renesas,sdhi-r8a7796", .data = &of_rcar_r8a7795_compatible, },
 	{ .compatible = "renesas,rcar-gen3-sdhi", .data = &of_rcar_gen3_compatible, },
@@ -171,7 +190,10 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
 				     struct mmc_data *data)
 {
 	struct scatterlist *sg = host->sg_ptr;
-	u32 dtran_mode = DTRAN_MODE_BUS_WIDTH | DTRAN_MODE_ADDR_MODE;
+	u32 dtran_mode = DTRAN_MODE_BUS_WIDTH;
+
+	if (!test_bit(SDHI_INTERNAL_DMAC_ADRR_MODE_FIXED, &global_flags))
+		dtran_mode |= DTRAN_MODE_ADDR_MODE;
 
 	if (!dma_map_sg(&host->pdev->dev, sg, host->sg_len,
 			mmc_get_dma_dir(data)))
@@ -290,6 +312,8 @@ static const struct tmio_mmc_dma_ops renesas_sdhi_internal_dmac_dma_ops = {
  */
 static const struct soc_device_attribute gen3_soc_whitelist[] = {
 	/* specific ones */
+	{ .soc_id = "r7s9210",
+	  .data = (void *)BIT(SDHI_INTERNAL_DMAC_ADRR_MODE_FIXED) },
 	{ .soc_id = "r8a7795", .revision = "ES1.*",
 	  .data = (void *)BIT(SDHI_INTERNAL_DMAC_ONE_RX_ONLY) },
 	{ .soc_id = "r8a7796", .revision = "ES1.0",
-- 
2.16.1

