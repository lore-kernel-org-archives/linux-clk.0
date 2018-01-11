Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:45134 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754098AbeAKDFW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 10 Jan 2018 22:05:22 -0500
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH] clk: sunxi-ng: defaultly enable DE2 CCU for sun8i/sun50i
Date: Thu, 11 Jan 2018 11:04:51 +0800
Message-Id: <20180111030451.9217-1-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

As DE2 support for more SoCs are introducing, there's many reports that
the DE2 is not functional due to DE2 CCU code not included in kernel.

Defaultly enable DE2 CCU for sun8i/sun50i to reduce this kind of
problems.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 drivers/clk/sunxi-ng/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
index 6427d0ebe2de..c2b04dcb6f18 100644
--- a/drivers/clk/sunxi-ng/Kconfig
+++ b/drivers/clk/sunxi-ng/Kconfig
@@ -60,6 +60,8 @@ config SUN8I_V3S_CCU
 
 config SUN8I_DE2_CCU
 	bool "Support for the Allwinner SoCs DE2 CCU"
+	default MACH_SUN8I || (ARM64 && ARCH_SUNXI)
+	depends on MACH_SUN8I || (ARM64 && ARCH_SUNXI) || COMPILE_TEST
 
 config SUN8I_R40_CCU
 	bool "Support for the Allwinner R40 CCU"
-- 
2.14.2

