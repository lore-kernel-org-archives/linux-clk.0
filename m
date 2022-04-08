Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41650C433F5
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 13:14:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236090AbiDHNQ7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 09:16:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232740AbiDHNQ7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 09:16:59 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1033D1140BB
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 06:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1649423692; x=1680959692;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FePuzuKtXWC9ClkTIEjnana6zB8ROeqVYJMIfvz4VFY=;
  b=vehBGfx6YCRiWtfP3ya0z3V1usd9r1Ll/5lRngz1hrtYtCVDUYmd8DVq
   Rj8+swwfGPNFLINiWYhO2fl51aYVBNRjbnQmO/KiE2chTFJAL6auTtnRE
   iZR2OACSysYc7F74iwJpR5C7HyNYFZXPR52W31JHWle6mnE8AvGbBeeSK
   FQ5ko7WX+J/eAGUKL6PDGQArDYzb/1yk6VsGfbUTjRnDijK0SPdHJ+9at
   6XhPYGDV6O8jPXyNpp1PkmFyN8iFbFC4JdyBjaFZWrqntd1wNb6np4ha0
   6RVQYY+vA+sIotSfTyz+dsG7FZKlIvASOr9QV9Cz7DylI0NICmZ4rhZWj
   Q==;
X-IronPort-AV: E=Sophos;i="5.90,245,1643698800"; 
   d="scan'208";a="154917200"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Apr 2022 06:14:49 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 8 Apr 2022 06:14:46 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 8 Apr 2022 06:14:44 -0700
From:   Conor Dooley <conor.dooley@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>
CC:     <daire.mcnamara@microchip.com>, <linux-riscv@lists.infradead.org>,
        <palmer@rivosinc.com>, <andrew@lunn.ch>, <linux@armlinux.org.uk>,
        "Conor Dooley" <conor.dooley@microchip.com>
Subject: [PATCH v1] clk: microchip: mpfs: don't reset disabled peripherals
Date:   Fri, 8 Apr 2022 13:13:53 +0000
Message-ID: <20220408131352.3421559-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The current clock driver for PolarFire SoC puts the hardware behind
"periph" clocks into reset if their clock is disabled. CONFIG_PM was
recently added to the riscv defconfig and exposed issues caused by this
behaviour, where the Cadence GEM was being put into reset between its
bringup & the PHY bringup:

https://lore.kernel.org/linux-riscv/9f4b057d-1985-5fd3-65c0-f944161c7792@microchip.com/

Fix this by removing the reset enable/disable code from the driver &
rely (for now) on the bootloader bringing peripherals out of reset
during boot.

Fixes: 635e5e73370e ("clk: microchip: Add driver for Microchip PolarFire SoC")
Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/clk-mpfs.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index aa1561b773d6..4ddc7e7c9766 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -13,7 +13,6 @@
 /* address offset of control registers */
 #define REG_CLOCK_CONFIG_CR	0x08u
 #define REG_SUBBLK_CLOCK_CR	0x84u
-#define REG_SUBBLK_RESET_CR	0x88u
 
 struct mpfs_clock_data {
 	void __iomem *base;
@@ -177,10 +176,6 @@ static int mpfs_periph_clk_enable(struct clk_hw *hw)
 
 	spin_lock_irqsave(&mpfs_clk_lock, flags);
 
-	reg = readl_relaxed(base_addr + REG_SUBBLK_RESET_CR);
-	val = reg & ~(1u << periph->shift);
-	writel_relaxed(val, base_addr + REG_SUBBLK_RESET_CR);
-
 	reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
 	val = reg | (1u << periph->shift);
 	writel_relaxed(val, base_addr + REG_SUBBLK_CLOCK_CR);
@@ -200,10 +195,6 @@ static void mpfs_periph_clk_disable(struct clk_hw *hw)
 
 	spin_lock_irqsave(&mpfs_clk_lock, flags);
 
-	reg = readl_relaxed(base_addr + REG_SUBBLK_RESET_CR);
-	val = reg | (1u << periph->shift);
-	writel_relaxed(val, base_addr + REG_SUBBLK_RESET_CR);
-
 	reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
 	val = reg & ~(1u << periph->shift);
 	writel_relaxed(val, base_addr + REG_SUBBLK_CLOCK_CR);
@@ -218,12 +209,9 @@ static int mpfs_periph_clk_is_enabled(struct clk_hw *hw)
 	void __iomem *base_addr = periph_hw->sys_base;
 	u32 reg;
 
-	reg = readl_relaxed(base_addr + REG_SUBBLK_RESET_CR);
-	if ((reg & (1u << periph->shift)) == 0u) {
-		reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
-		if (reg & (1u << periph->shift))
-			return 1;
-	}
+	reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
+	if (reg & (1u << periph->shift))
+		return 1;
 
 	return 0;
 }
-- 
2.35.1

