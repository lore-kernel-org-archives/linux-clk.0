Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36046 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1761440AbdDXKJQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Apr 2017 06:09:16 -0400
From: Tobias Regnery <tobias.regnery@gmail.com>
To: narmstrong@baylibre.com, sboyd@codeaurora.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Tobias Regnery <tobias.regnery@gmail.com>
Subject: [PATCH] clk: meson: gxbb: fix build error without RESET_CONTROLLER
Date: Mon, 24 Apr 2017 12:05:42 +0200
Message-Id: <20170424100542.20226-1-tobias.regnery@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

With CONFIG_RESET_CONTROLLER=n we see the following link error in the
meson gxbb clk driver:

drivers/built-in.o: In function 'gxbb_aoclkc_probe':
drivers/clk/meson/gxbb-aoclk.c:161: undefined reference to 'devm_reset_controller_register'

Fix this by selecting the reset controller subsystem.

Signed-off-by: Tobias Regnery <tobias.regnery@gmail.com>
---
 drivers/clk/meson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index 19480bcc7046..2f29ee1a4d00 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -14,6 +14,7 @@ config COMMON_CLK_MESON8B
 config COMMON_CLK_GXBB
 	bool
 	depends on COMMON_CLK_AMLOGIC
+	select RESET_CONTROLLER
 	help
 	  Support for the clock controller on AmLogic S905 devices, aka gxbb.
 	  Say Y if you want peripherals and CPU frequency scaling to work.
-- 
2.11.0

