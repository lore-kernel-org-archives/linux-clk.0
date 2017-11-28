Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:38167 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750883AbdK1G6a (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Nov 2017 01:58:30 -0500
Received: by mail-wm0-f66.google.com with SMTP id n74so13945016wmi.3
        for <linux-clk@vger.kernel.org>; Mon, 27 Nov 2017 22:58:30 -0800 (PST)
To: Sudeep Holla <sudeep.holla@arm.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] clk: fix compile testing of scpi clk driver
Cc: linux-clk@vger.kernel.org,
        kbuild test robot <fengguang.wu@intel.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Message-ID: <24058ecb-9f12-f7e1-503d-bd98eb894c6c@gmail.com>
Date: Tue, 28 Nov 2017 07:58:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

We now have a hard dependency on ARM_SCPI_PROTOCOL and may end up with
the following error:
ERROR: "get_scpi_ops" [drivers/clk/clk-scpi.ko] undefined!
Fix this by removing COMPILE_TEST from COMMON_CLK_SCPI dependencies.

Fixes: f7fee8be06a6 "firmware: arm_scpi: remove default for get_scpi_ops if not reachable"
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/clk/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 1c4e1aa67..fe6fd705f 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -64,7 +64,7 @@ config COMMON_CLK_HI655X
 
 config COMMON_CLK_SCPI
 	tristate "Clock driver controlled via SCPI interface"
-	depends on ARM_SCPI_PROTOCOL || COMPILE_TEST
+	depends on ARM_SCPI_PROTOCOL
 	  ---help---
 	  This driver provides support for clocks that are controlled
 	  by firmware that implements the SCPI interface.
-- 
2.15.0

