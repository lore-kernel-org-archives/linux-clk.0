Return-Path: <SRS0=eZMu=MX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16037C32788
	for <linux-clk@archiver.kernel.org>; Thu, 11 Oct 2018 07:36:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0A6D02085B
	for <linux-clk@archiver.kernel.org>; Thu, 11 Oct 2018 07:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A6D02085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rock-chips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726311AbeJKPCH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Oct 2018 11:02:07 -0400
Received: from lucky1.263xmail.com ([211.157.147.134]:33966 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbeJKPCH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Oct 2018 11:02:07 -0400
X-Greylist: delayed 463 seconds by postgrey-1.27 at vger.kernel.org; Thu, 11 Oct 2018 11:02:05 EDT
Received: from shawn.lin?rock-chips.com (unknown [192.168.167.153])
        by lucky1.263xmail.com (Postfix) with ESMTP id 37CAC2CD;
        Thu, 11 Oct 2018 15:28:18 +0800 (CST)
X-263anti-spam: KSV:0;
X-MAIL-GRAY: 1
X-MAIL-DELIVERY: 0
X-KSVirus-check: 0
X-ABS-CHECKED: 4
Received: from localhost.localdomain (localhost [127.0.0.1])
        by smtp.263.net (Postfix) with ESMTPA id D5D003B4;
        Thu, 11 Oct 2018 15:28:16 +0800 (CST)
X-IP-DOMAINF: 1
X-RL-SENDER: shawn.lin@rock-chips.com
X-FST-TO: heiko@sntech.de
X-SENDER-IP: 58.22.7.114
X-LOGIN-NAME: shawn.lin@rock-chips.com
X-UNIQUE-TAG: <34d9d4df5a45e49f42c554f1c9e8da8b>
X-ATTACHMENT-NUM: 0
X-SENDER: lintao@rock-chips.com
X-DNS-TYPE: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (Postfix) whith ESMTP id 270034B9X3N;
        Thu, 11 Oct 2018 15:28:17 +0800 (CST)
From:   Shawn Lin <shawn.lin@rock-chips.com>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org,
        Finley Xiao <finley.xiao@rock-chips.com>,
        Elaine Zhang <zhangqing@rock-chips.com>,
        Ziyuan Xu <xzy.xu@rock-chips.com>,
        Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH] clk: rockchip: fix wrong mmc sample phase shift for rk3328
Date:   Thu, 11 Oct 2018 15:26:43 +0800
Message-Id: <1539242803-68356-1-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Ziyuan Xu <xzy.xu@rock-chips.com>

mmc sample shift is 0 for RK3328 referring to the TRM.
So fix them.

Signed-off-by: Ziyuan Xu <xzy.xu@rock-chips.com>
Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/clk/rockchip/clk-rk3328.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3328.c b/drivers/clk/rockchip/clk-rk3328.c
index 252366a..2c54266 100644
--- a/drivers/clk/rockchip/clk-rk3328.c
+++ b/drivers/clk/rockchip/clk-rk3328.c
@@ -813,22 +813,22 @@ enum rk3328_plls {
 	MMC(SCLK_SDMMC_DRV, "sdmmc_drv", "clk_sdmmc",
 	    RK3328_SDMMC_CON0, 1),
 	MMC(SCLK_SDMMC_SAMPLE, "sdmmc_sample", "clk_sdmmc",
-	    RK3328_SDMMC_CON1, 1),
+	    RK3328_SDMMC_CON1, 0),
 
 	MMC(SCLK_SDIO_DRV, "sdio_drv", "clk_sdio",
 	    RK3328_SDIO_CON0, 1),
 	MMC(SCLK_SDIO_SAMPLE, "sdio_sample", "clk_sdio",
-	    RK3328_SDIO_CON1, 1),
+	    RK3328_SDIO_CON1, 0),
 
 	MMC(SCLK_EMMC_DRV, "emmc_drv", "clk_emmc",
 	    RK3328_EMMC_CON0, 1),
 	MMC(SCLK_EMMC_SAMPLE, "emmc_sample", "clk_emmc",
-	    RK3328_EMMC_CON1, 1),
+	    RK3328_EMMC_CON1, 0),
 
 	MMC(SCLK_SDMMC_EXT_DRV, "sdmmc_ext_drv", "clk_sdmmc_ext",
 	    RK3328_SDMMC_EXT_CON0, 1),
 	MMC(SCLK_SDMMC_EXT_SAMPLE, "sdmmc_ext_sample", "clk_sdmmc_ext",
-	    RK3328_SDMMC_EXT_CON1, 1),
+	    RK3328_SDMMC_EXT_CON1, 0),
 };
 
 static const char *const rk3328_critical_clocks[] __initconst = {
-- 
1.9.1


