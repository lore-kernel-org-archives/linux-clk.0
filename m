Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30AEEC433FE
	for <linux-clk@archiver.kernel.org>; Mon, 11 Apr 2022 07:24:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245347AbiDKH0h (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Apr 2022 03:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245338AbiDKH0g (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Apr 2022 03:26:36 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48C75193C0
        for <linux-clk@vger.kernel.org>; Mon, 11 Apr 2022 00:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1649661861; x=1681197861;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SNoeLigDyTw1Cancdccozb6dxDfUAxB0MNSrsNTLnEg=;
  b=NMswAvDd/RmhSrSFJal4hv1RjpFrzv1C5OtmHLZEsATIle8FZd0TQHUe
   DllrEGi6cm/4hcfcRHCBjrCuxC2ChpjFE59lgue3ptfIk8A5j7+mKRj4Q
   CzusE+bkQGj4y7NknBpv3xYIYT9R0WpaImyBbePzzt+JlI9MqzSizckxY
   vejC4rSXiXdwbG8nuhfCT7sm5+7wQKftBNkZFI0s9b7cxYnHGsriQdZaE
   1LNu2GVVQDuu/WXuR6x9bVRBjmMisZsgJ0EtyWM4VZIX7t9lRO0/q7rjI
   6++Z5ODNwWN6xEDh/jQK2tDKuL8rSnBzv4R8/C5pghmbgk9fRzrQUC4g0
   Q==;
X-IronPort-AV: E=Sophos;i="5.90,251,1643698800"; 
   d="scan'208";a="159613695"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Apr 2022 00:24:17 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 11 Apr 2022 00:24:16 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 11 Apr 2022 00:24:14 -0700
From:   Conor Dooley <conor.dooley@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>
CC:     <daire.mcnamara@microchip.com>, <linux-riscv@lists.infradead.org>,
        <palmer@rivosinc.com>, <andrew@lunn.ch>, <linux@armlinux.org.uk>,
        "Conor Dooley" <conor.dooley@microchip.com>
Subject: [PATCH v2] clk: microchip: mpfs: don't reset disabled peripherals
Date:   Mon, 11 Apr 2022 08:23:41 +0100
Message-ID: <20220411072340.740981-1-conor.dooley@microchip.com>
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

Fix this (for now) by removing the reset from mpfs_periph_clk_disable.

Fixes: 635e5e73370e ("clk: microchip: Add driver for Microchip PolarFire SoC")
Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---

Changes since v1:
  The first stage bootloader takes most, but not all, of the peripherals
  out of reset. In v1 all code touching the reset reg was removed, but in
  v2 the code taking peripherals out of reset is kept to cover the edge
  case peripherals.
  The permanent fix will be to move the reset stuff its own driver.

 drivers/clk/microchip/clk-mpfs.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index aa1561b773d6..744ef2ba2a0c 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -200,10 +200,6 @@ static void mpfs_periph_clk_disable(struct clk_hw *hw)
 
 	spin_lock_irqsave(&mpfs_clk_lock, flags);
 
-	reg = readl_relaxed(base_addr + REG_SUBBLK_RESET_CR);
-	val = reg | (1u << periph->shift);
-	writel_relaxed(val, base_addr + REG_SUBBLK_RESET_CR);
-
 	reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
 	val = reg & ~(1u << periph->shift);
 	writel_relaxed(val, base_addr + REG_SUBBLK_CLOCK_CR);
-- 
2.35.1

