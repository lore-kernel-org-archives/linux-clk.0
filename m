Return-Path: <SRS0=rluM=64=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B3AC433E0
	for <linux-clk@archiver.kernel.org>; Thu, 14 May 2020 12:58:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 53CDA206A5
	for <linux-clk@archiver.kernel.org>; Thu, 14 May 2020 12:58:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbgENM6W (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 May 2020 08:58:22 -0400
Received: from foss.arm.com ([217.140.110.172]:36050 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726050AbgENM6V (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 14 May 2020 08:58:21 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B2421042;
        Thu, 14 May 2020 05:58:21 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 19B6C3F305;
        Thu, 14 May 2020 05:58:19 -0700 (PDT)
From:   Robin Murphy <robin.murphy@arm.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, heiko@sntech.de
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: [PATCH] Revert "clk: rockchip: fix wrong mmc sample phase shift for rk3328"
Date:   Thu, 14 May 2020 13:58:14 +0100
Message-Id: <e563eea358181446dc42c99e842c33f7ce911936.1589460539.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.23.0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This reverts commit 82f4b67f018c88a7cc9337f0067ed3d6ec352648.

According to a subsequent revert in the vendor kernel, the original
change was based on unclear documentation and was in fact incorrect.

Emprically, my board's SD card at 50MHz and eMMC at 200MHZ seem to get
lucky with a phase where it had no impact, but limiting the eMMC clock
to 150MHz to match the nominal limit for the I/O pins made it virtually
unusable, constantly throwing errors and retuning. With this revert, it
starts behaving perfectly at 150MHz too.

Fixes: 82f4b67f018c ("clk: rockchip: fix wrong mmc sample phase shift for rk3328")
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/clk/rockchip/clk-rk3328.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3328.c b/drivers/clk/rockchip/clk-rk3328.c
index c186a1985bf4..2429b7c2a8b3 100644
--- a/drivers/clk/rockchip/clk-rk3328.c
+++ b/drivers/clk/rockchip/clk-rk3328.c
@@ -808,22 +808,22 @@ static struct rockchip_clk_branch rk3328_clk_branches[] __initdata = {
 	MMC(SCLK_SDMMC_DRV, "sdmmc_drv", "clk_sdmmc",
 	    RK3328_SDMMC_CON0, 1),
 	MMC(SCLK_SDMMC_SAMPLE, "sdmmc_sample", "clk_sdmmc",
-	    RK3328_SDMMC_CON1, 0),
+	    RK3328_SDMMC_CON1, 1),
 
 	MMC(SCLK_SDIO_DRV, "sdio_drv", "clk_sdio",
 	    RK3328_SDIO_CON0, 1),
 	MMC(SCLK_SDIO_SAMPLE, "sdio_sample", "clk_sdio",
-	    RK3328_SDIO_CON1, 0),
+	    RK3328_SDIO_CON1, 1),
 
 	MMC(SCLK_EMMC_DRV, "emmc_drv", "clk_emmc",
 	    RK3328_EMMC_CON0, 1),
 	MMC(SCLK_EMMC_SAMPLE, "emmc_sample", "clk_emmc",
-	    RK3328_EMMC_CON1, 0),
+	    RK3328_EMMC_CON1, 1),
 
 	MMC(SCLK_SDMMC_EXT_DRV, "sdmmc_ext_drv", "clk_sdmmc_ext",
 	    RK3328_SDMMC_EXT_CON0, 1),
 	MMC(SCLK_SDMMC_EXT_SAMPLE, "sdmmc_ext_sample", "clk_sdmmc_ext",
-	    RK3328_SDMMC_EXT_CON1, 0),
+	    RK3328_SDMMC_EXT_CON1, 1),
 };
 
 static const char *const rk3328_critical_clocks[] __initconst = {
-- 
2.23.0.dirty

