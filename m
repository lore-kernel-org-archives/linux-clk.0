Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:33989 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751908AbdC0KBS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Mar 2017 06:01:18 -0400
From: Tobias Regnery <tobias.regnery@gmail.com>
To: maxime.ripard@free-electrons.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc: Tobias Regnery <tobias.regnery@gmail.com>
Subject: [PATCH] clk: sunxi-ng: fix build error without CONFIG_RESET_CONTROLLER
Date: Mon, 27 Mar 2017 11:57:53 +0200
Message-Id: <20170327095753.29091-1-tobias.regnery@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

With CONFIG_RESET_CONTROLLER=n we get the following link error in the
sunxi-ng clk driver:

drivers/built-in.o: In function `sunxi_ccu_probe':
mux-core.c:(.text+0x12fe68): undefined reference to 'reset_controller_register'
mux-core.c:(.text+0x12fe68): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol 'reset_controller_register'

Fix this by adding the appropriate select statement.

Signed-off-by: Tobias Regnery <tobias.regnery@gmail.com>
---
 drivers/clk/sunxi-ng/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
index 213cf64e4fab..8af8f4be8e3b 100644
--- a/drivers/clk/sunxi-ng/Kconfig
+++ b/drivers/clk/sunxi-ng/Kconfig
@@ -1,6 +1,7 @@
 config SUNXI_CCU
 	bool "Clock support for Allwinner SoCs"
 	depends on ARCH_SUNXI || COMPILE_TEST
+	select RESET_CONTROLLER
 	default ARCH_SUNXI
 
 if SUNXI_CCU
-- 
2.11.0

