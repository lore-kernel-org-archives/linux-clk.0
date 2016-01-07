Return-Path: <vz@mleia.com>
From: Vladimir Zapolskiy <vz@mleia.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Joachim Eastwood <manabian@gmail.com>,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: remove duplicated COMMON_CLK_NXP record from clk/Kconfig
Date: Thu,  7 Jan 2016 05:07:07 +0200
Message-Id: <1452136027-32076-1-git-send-email-vz@mleia.com>
List-ID: <linux-clk.vger.kernel.org>

Presumably the second COMMON_CLK_NXP config option in
drivers/clk/Kconfig appeared after a merge conflict resolution, remove
the wrong record of two.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
Hi Mike, Stephen,

I've found this issue in clk-next while working on something else,
please consider to include this change to clk-next, no objections if
it is squashed with f7c82a60ba2 ("clk: lpc32xx: add common clock
framework driver").

In fact it is a revert of 8a896310a7e ("clk: lpc18xx: add NXP specific
COMMON_CLK_NXP configuration symbol"), but this preparatory change is
good as is.

The original change doesn't have this kind of a problem (see
http://www.spinics.net/lists/devicetree/msg105709.html), so I
believe it is caused by a merge conflict, probably after done
alphabetical sorting.

 drivers/clk/Kconfig | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 41f6c7f..eca8e01 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -187,11 +187,6 @@ config COMMON_CLK_PWM
 	  Adapter driver so that any PWM output can be (mis)used as clock signal
 	  at 50% duty cycle.
 
-config COMMON_CLK_NXP
-	def_bool COMMON_CLK && ARCH_LPC18XX
-	---help---
-	  Support for clock providers on NXP platforms.
-
 config COMMON_CLK_PXA
 	def_bool COMMON_CLK && ARCH_PXA
 	---help---
-- 
2.1.4
