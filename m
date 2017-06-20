Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtpbg340.qq.com ([14.17.44.35]:46556 "EHLO smtpbg340.qq.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751920AbdFTI5l (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 20 Jun 2017 04:57:41 -0400
From: Binbin Zhou <zhoubb@lemote.com>
To: Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <james.hogan@imgtec.com>
Cc: John Crispin <john@phrozen.org>,
        "Steven J . Hill" <Steven.Hill@imgtec.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Kelvin Cheung <keguang.zhang@gmail.com>,
        Yang Ling <gnaygnil@gmail.com>,
        =?UTF-8?q?=E8=B0=A2=E8=87=B4=E9=82=A6?= <Yeking@Red54.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-mips@linux-mips.org, linux-clk@vger.kernel.org,
        Binbin Zhou <zhoubb@lemote.com>,
        HuaCai Chen <chenhc@lemote.com>
Subject: [PATCH v8 6/9] MIPS: Loongson: Add Loongson-1A board support
Date: Tue, 20 Jun 2017 16:57:04 +0800
Message-Id: <1497949027-10988-7-git-send-email-zhoubb@lemote.com>
In-Reply-To: <1497949027-10988-1-git-send-email-zhoubb@lemote.com>
References: <1497949027-10988-1-git-send-email-zhoubb@lemote.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Register basic devices for Loongson-1A, and setup clk for UART.

Signed-off-by: Binbin Zhou <zhoubb@lemote.com>
Signed-off-by: HuaCai Chen <chenhc@lemote.com>
---
 arch/mips/loongson32/Makefile      |  6 ++++++
 arch/mips/loongson32/ls1a/Makefile |  5 +++++
 arch/mips/loongson32/ls1a/board.c  | 31 +++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+)
 create mode 100644 arch/mips/loongson32/ls1a/Makefile
 create mode 100644 arch/mips/loongson32/ls1a/board.c

diff --git a/arch/mips/loongson32/Makefile b/arch/mips/loongson32/Makefile
index 1ab2c5b..cd1f597 100644
--- a/arch/mips/loongson32/Makefile
+++ b/arch/mips/loongson32/Makefile
@@ -5,6 +5,12 @@
 obj-$(CONFIG_MACH_LOONGSON32) += common/
 
 #
+# Loongson LS1A board
+#
+
+obj-$(CONFIG_LOONGSON1_LS1A)  += ls1a/
+
+#
 # Loongson LS1B board
 #
 
diff --git a/arch/mips/loongson32/ls1a/Makefile b/arch/mips/loongson32/ls1a/Makefile
new file mode 100644
index 0000000..dc23a9a
--- /dev/null
+++ b/arch/mips/loongson32/ls1a/Makefile
@@ -0,0 +1,5 @@
+#
+# Makefile for loongson1A based machines.
+#
+
+obj-y += board.o
diff --git a/arch/mips/loongson32/ls1a/board.c b/arch/mips/loongson32/ls1a/board.c
new file mode 100644
index 0000000..7993f6c
--- /dev/null
+++ b/arch/mips/loongson32/ls1a/board.c
@@ -0,0 +1,31 @@
+/*
+ * Copyright (c) 2016 Binbin Zhou <zhoubb@lemote.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or (at your
+ * option) any later version.
+ */
+
+#include <platform.h>
+
+static struct platform_device *ls1a_platform_devices[] __initdata = {
+	&ls1x_uart_pdev,
+	&ls1x_eth0_pdev,
+	&ls1x_eth1_pdev,
+	&ls1x_rtc_pdev,
+	&ls1x_wdt_pdev,
+	&ls1x_ahci_pdev,
+	&ls1x_ohci_pdev,
+};
+
+static int __init ls1a_platform_init(void)
+{
+	ls1x_serial_set_uartclk(&ls1x_uart_pdev);
+	ls1x_rtc_set_extclk(&ls1x_rtc_pdev);
+
+	return platform_add_devices(ls1a_platform_devices,
+				   ARRAY_SIZE(ls1a_platform_devices));
+}
+
+arch_initcall(ls1a_platform_init);
-- 
2.9.4

