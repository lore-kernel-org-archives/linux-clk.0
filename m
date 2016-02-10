Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from p01c11o141.mxlogic.net ([208.65.144.64]:54172 "EHLO
	p01c11o141.mxlogic.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750723AbcBJU6u convert rfc822-to-8bit (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 10 Feb 2016 15:58:50 -0500
From: Kevin Smith <kevin.smith@elecsyscorp.com>
To: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC: Kevin Smith <kevin.smith@elecsyscorp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	"Gregory CLEMENT" <gregory.clement@free-electrons.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH] clk: mvebu: Require corediv clock for Armada 38x
Date: Wed, 10 Feb 2016 20:41:13 +0000
Message-ID: <1455136849-7888-1-git-send-email-kevin.smith@elecsyscorp.com>
Content-Type: text/plain; charset=US-ASCII
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The corediv clock driver is required for the pxa3xx_nand driver,
but is not included in the ARMADA_38X_CLK config.  Add
MVEBU_CLK_COREDIV as a dependency of ARMADA_38X_CLK.

Without the corediv driver, nand initialization fails with the
message:

pxa3xx-nand f10d0000.flash: failed to get nand clock
pxa3xx-nand f10d0000.flash: alloc nand resource failed

With corediv enabled, flash is successfully detected.

Signed-off-by: Kevin Smith <kevin.smith@elecsyscorp.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 drivers/clk/mvebu/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mvebu/Kconfig b/drivers/clk/mvebu/Kconfig
index 2769625..1107056 100644
--- a/drivers/clk/mvebu/Kconfig
+++ b/drivers/clk/mvebu/Kconfig
@@ -20,6 +20,7 @@ config ARMADA_375_CLK
 config ARMADA_38X_CLK
 	bool
 	select MVEBU_CLK_COMMON
+	select MVEBU_CLK_COREDIV
 
 config ARMADA_39X_CLK
 	bool
-- 
2.4.6
