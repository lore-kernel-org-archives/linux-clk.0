Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:34638 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750721AbdAXMJS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 24 Jan 2017 07:09:18 -0500
Date: Tue, 24 Jan 2017 13:09:12 +0100
From: Jean Delvare <jdelvare@suse.de>
To: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: "Andreas =?UTF-8?B?RsOkcmJlcg==?=" <afaerber@suse.de>,
        James Liao <jamesjj.liao@mediatek.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] clk: mediatek: Fix MT8135 dependencies
Message-ID: <20170124130912.14375a32@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The MT8135 is a 32-bit SoC, so only propose it on ARM architecture,
not ARM64.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Fixes: 234d511d8c15 ("clk: mediatek: Add hardware dependency")
Cc: Andreas Färber <afaerber@suse.de>
Cc: James Liao <jamesjj.liao@mediatek.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/clk/mediatek/Kconfig |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-4.10-rc4.orig/drivers/clk/mediatek/Kconfig	2017-01-24 12:55:50.192100713 +0100
+++ linux-4.10-rc4/drivers/clk/mediatek/Kconfig	2017-01-24 12:59:08.703066604 +0100
@@ -52,9 +52,9 @@ config COMMON_CLK_MT2701_BDPSYS
 
 config COMMON_CLK_MT8135
 	bool "Clock driver for Mediatek MT8135"
-	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on (ARCH_MEDIATEK && ARM) || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
-	default ARCH_MEDIATEK
+	default ARCH_MEDIATEK && ARM
 	---help---
 	  This driver supports Mediatek MT8135 clocks.
 

-- 
Jean Delvare
SUSE L3 Support
