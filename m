Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35525 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752963AbdDJMTF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Apr 2017 08:19:05 -0400
From: Tobias Regnery <tobias.regnery@gmail.com>
To: maxime.ripard@free-electrons.com, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Tobias Regnery <tobias.regnery@gmail.com>
Subject: [PATCH] clk: sunxi-ng: fix build failure in ccu-sun9i-a80 driver
Date: Mon, 10 Apr 2017 14:15:44 +0200
Message-Id: <20170410121544.13248-1-tobias.regnery@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The ccu-sun9i-a80 driver uses the ccu_mult_ops struct, but unlike the other
users it doesen't select the corresponding Kconfig symbol under which the
struct is compiled in.

This results in the following link error with CONFIG_SUN9I_A80_CCU=y and
CONFIG_SUNXI_CCU_MULT=n:

drivers/built-in.o:(.data+0x2d638): undefined reference to 'ccu_mult_ops'

Fix this by explicitly selecting CONFIG_SUNXI_CCU_MULT like the other
users of the struct.

Signed-off-by: Tobias Regnery <tobias.regnery@gmail.com>
---
 drivers/clk/sunxi-ng/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
index fbd3f8cd5c22..64088e599404 100644
--- a/drivers/clk/sunxi-ng/Kconfig
+++ b/drivers/clk/sunxi-ng/Kconfig
@@ -143,6 +143,7 @@ config SUN8I_V3S_CCU
 config SUN9I_A80_CCU
 	bool "Support for the Allwinner A80 CCU"
 	select SUNXI_CCU_DIV
+	select SUNXI_CCU_MULT
 	select SUNXI_CCU_GATE
 	select SUNXI_CCU_NKMP
 	select SUNXI_CCU_NM
-- 
2.11.0

