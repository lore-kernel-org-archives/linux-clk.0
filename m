Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtpbgbr2.qq.com ([54.207.22.56]:54088 "EHLO smtpbgbr2.qq.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754131AbdAEGdg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 5 Jan 2017 01:33:36 -0500
Date: Thu, 5 Jan 2017 14:32:55 +0800
From: =?utf-8?B?6LCi6Ie06YKmIChYSUUgWmhpYmFuZyk=?= <Yeking@Red54.com>
To: linux-clk@vger.kernel.org
Cc: linux-mips@linux-mips.org
Subject: [PATCH] MIPS: Loongson: Add OSC support
Message-ID: <20170105063237.GB14323@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Loongson 1B can connect to 25MHz or 33MHz OSC.

Signed-off-by: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>
---
 arch/mips/loongson32/Kconfig           | 15 +++++++++++++++
 arch/mips/loongson32/common/platform.c |  8 ++++++++
 drivers/clk/loongson1/clk-loongson1b.c |  6 +++++-
 3 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/mips/loongson32/Kconfig b/arch/mips/loongson32/Kconfig
index 3c0c2f20..1893e08b 100644
--- a/arch/mips/loongson32/Kconfig
+++ b/arch/mips/loongson32/Kconfig
@@ -19,6 +19,21 @@ config LOONGSON1_LS1B
 	select USE_GENERIC_EARLY_PRINTK_8250
 	select COMMON_CLK
 
+if LOONGSON1_LS1B
+
+choice
+	prompt "OSC Type"
+	default OSC_33M
+
+config OSC_33M
+	bool "33 MHz OSC"
+
+config OSC_25M
+	bool "25 MHz OSC"
+endchoice
+
+endif
+
 config LOONGSON1_LS1C
 	bool "Loongson LS1C board"
 	select CEVT_R4K if !MIPS_EXTERNAL_TIMER
diff --git a/arch/mips/loongson32/common/platform.c b/arch/mips/loongson32/common/platform.c
index f9d877d4..683c8469 100644
--- a/arch/mips/loongson32/common/platform.c
+++ b/arch/mips/loongson32/common/platform.c
@@ -83,8 +83,16 @@ void __init ls1x_rtc_set_extclk(struct platform_device *pdev)
 static struct plat_ls1x_cpufreq ls1x_cpufreq_pdata = {
 	.clk_name	= "cpu_clk",
 	.osc_clk_name	= "osc_clk",
+#if defined(CONFIG_LOONGSON1_LS1C)
+	.max_freq	= 300 * 1000,
+	.min_freq	= 24 * 1000,
+#elif defined(CONFIG_OSC_25M)
+	.max_freq	= 200 * 1000,
+	.min_freq	= 25 * 1000,
+#else
 	.max_freq	= 266 * 1000,
 	.min_freq	= 33 * 1000,
+#endif
 };
 
 struct platform_device ls1x_cpufreq_pdev = {
diff --git a/drivers/clk/loongson1/clk-loongson1b.c b/drivers/clk/loongson1/clk-loongson1b.c
index f36a97e9..225b53e7 100644
--- a/drivers/clk/loongson1/clk-loongson1b.c
+++ b/drivers/clk/loongson1/clk-loongson1b.c
@@ -15,7 +15,11 @@
 #include <loongson1.h>
 #include "clk.h"
 
+#if defined(CONFIG_OSC_25M)
+#define OSC		(25 * 1000000)
+#else
 #define OSC		(33 * 1000000)
+#endif
 #define DIV_APB		2
 
 static DEFINE_SPINLOCK(_lock);
@@ -48,7 +52,7 @@ void __init ls1x_clk_init(void)
 	hw = clk_hw_register_fixed_rate(NULL, "osc_clk", NULL, 0, OSC);
 	clk_hw_register_clkdev(hw, "osc_clk", NULL);
 
-	/* clock derived from 33 MHz OSC clk */
+	/* clock derived from OSC clk */
 	hw = clk_hw_register_pll(NULL, "pll_clk", "osc_clk",
 				 &ls1x_pll_clk_ops, 0);
 	clk_hw_register_clkdev(hw, "pll_clk", NULL);
-- 
2.11.0




