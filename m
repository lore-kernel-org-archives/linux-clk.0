Return-Path: <sean.wang@mediatek.com>
From: <sean.wang@mediatek.com>
To: <sboyd@codeaurora.org>, <mturquette@baylibre.com>,
	<matthias.bgg@gmail.com>
CC: <jdelvare@suse.de>, <jamesjj.liao@mediatek.com>, <weiyi.lu@mediatek.com>,
	<arnd@arndb.de>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sean Wang
	<sean.wang@mediatek.com>
Subject: [PATCH 2/2] clk: mediatek: fixup test-building of MediaTek clock drivers
Date: Wed, 20 Dec 2017 14:42:59 +0800
Message-ID: <e39fbb5699f9978073fdd5a45173e12eff266800.1513741266.git.sean.wang@mediatek.com>
In-Reply-To: <971cc0e25dcf32e19bdc93a2bb0dec4cbda2fce7.1513741266.git.sean.wang@mediatek.com>
References: <971cc0e25dcf32e19bdc93a2bb0dec4cbda2fce7.1513741266.git.sean.wang@mediatek.com>
Return-Path: sean.wang@mediatek.com
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

From: Sean Wang <sean.wang@mediatek.com>

Let the build system looking into the directiory where the clock drivers
resides for the COMPILE_TEST alternative dependency allows test-building
the drivers.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/clk/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index f7f761b..2e3fb08 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -67,7 +67,7 @@ obj-$(CONFIG_ARCH_MXC)			+= imx/
 obj-$(CONFIG_MACH_INGENIC)		+= ingenic/
 obj-$(CONFIG_ARCH_KEYSTONE)		+= keystone/
 obj-$(CONFIG_MACH_LOONGSON32)		+= loongson1/
-obj-$(CONFIG_ARCH_MEDIATEK)		+= mediatek/
+obj-y					+= mediatek/
 obj-$(CONFIG_COMMON_CLK_AMLOGIC)	+= meson/
 obj-$(CONFIG_MACH_PIC32)		+= microchip/
 ifeq ($(CONFIG_COMMON_CLK), y)
-- 
2.7.4
