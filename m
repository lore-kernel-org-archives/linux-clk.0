Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-pa0-f67.google.com ([209.85.220.67]:36617 "EHLO
	mail-pa0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751636AbcHLK4V (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 12 Aug 2016 06:56:21 -0400
From: Keguang Zhang <keguang.zhang@gmail.com>
To: linux-mips@linux-mips.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ralf Baechle <ralf@linux-mips.org>,
	Kelvin Cheung <keguang.zhang@gmail.com>
Subject: [PATCH] MIPS: Loongson1B: Change the OSC clock name
Date: Fri, 12 Aug 2016 18:56:03 +0800
Message-Id: <1470999363-9978-1-git-send-email-keguang.zhang@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Kelvin Cheung <keguang.zhang@gmail.com>

This patch changes the OSC clock name to "osc_clk".

Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
---
 arch/mips/loongson32/common/platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/loongson32/common/platform.c b/arch/mips/loongson32/common/platform.c
index 4d12e36..fb60602 100644
--- a/arch/mips/loongson32/common/platform.c
+++ b/arch/mips/loongson32/common/platform.c
@@ -69,7 +69,7 @@ void __init ls1x_serial_set_uartclk(struct platform_device *pdev)
 /* CPUFreq */
 static struct plat_ls1x_cpufreq ls1x_cpufreq_pdata = {
 	.clk_name	= "cpu_clk",
-	.osc_clk_name	= "osc_33m_clk",
+	.osc_clk_name	= "osc_clk",
 	.max_freq	= 266 * 1000,
 	.min_freq	= 33 * 1000,
 };
-- 
1.9.1

