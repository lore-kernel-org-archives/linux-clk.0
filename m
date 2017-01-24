Return-Path: <jdelvare@suse.de>
Date: Tue, 24 Jan 2017 13:07:04 +0100
From: Jean Delvare <jdelvare@suse.de>
To: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>, James Liao
 <jamesjj.liao@mediatek.com>, Shunli Wang <shunli.wang@mediatek.com>, Erin
 Lo <erin.lo@mediatek.com>, Stephen Boyd <sboyd@codeaurora.org>, Michael
 Turquette <mturquette@baylibre.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH v2] clk: mediatek: Fix MT2701 dependencies
Message-ID: <20170124130704.14015da3@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

If I say "no" to "Clock driver for Mediatek MT2701", I don't want to
be asked individually about each sub-driver. No means no.

Additionally, this driver shouldn't be proposed at all on non-mediatek
builds, unless build-testing.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Fixes: e9862118272a ("clk: mediatek: Add MT2701 clock support")
Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
Reviewed-by: James Liao <jamesjj.liao@mediatek.com>
Cc: Shunli Wang <shunli.wang@mediatek.com>
Cc: Erin Lo <erin.lo@mediatek.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
---
Changes since v1:
 * Restrict to 32-bit ARM.

 drivers/clk/mediatek/Kconfig |   15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

--- linux-4.10-rc4.orig/drivers/clk/mediatek/Kconfig	2017-01-16 11:13:07.14=
6675028 +0100
+++ linux-4.10-rc4/drivers/clk/mediatek/Kconfig	2017-01-24 12:55:50.1921007=
13 +0100
@@ -8,44 +8,45 @@ config COMMON_CLK_MEDIATEK
=20
 config COMMON_CLK_MT2701
 	bool "Clock driver for Mediatek MT2701"
+	depends on (ARCH_MEDIATEK && ARM) || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
-	default ARCH_MEDIATEK
+	default ARCH_MEDIATEK && ARM
 	---help---
 	  This driver supports Mediatek MT2701 basic clocks.
=20
 config COMMON_CLK_MT2701_MMSYS
 	bool "Clock driver for Mediatek MT2701 mmsys"
-	select COMMON_CLK_MT2701
+	depends on COMMON_CLK_MT2701
 	---help---
 	  This driver supports Mediatek MT2701 mmsys clocks.
=20
 config COMMON_CLK_MT2701_IMGSYS
 	bool "Clock driver for Mediatek MT2701 imgsys"
-	select COMMON_CLK_MT2701
+	depends on COMMON_CLK_MT2701
 	---help---
 	  This driver supports Mediatek MT2701 imgsys clocks.
=20
 config COMMON_CLK_MT2701_VDECSYS
 	bool "Clock driver for Mediatek MT2701 vdecsys"
-	select COMMON_CLK_MT2701
+	depends on COMMON_CLK_MT2701
 	---help---
 	  This driver supports Mediatek MT2701 vdecsys clocks.
=20
 config COMMON_CLK_MT2701_HIFSYS
 	bool "Clock driver for Mediatek MT2701 hifsys"
-	select COMMON_CLK_MT2701
+	depends on COMMON_CLK_MT2701
 	---help---
 	  This driver supports Mediatek MT2701 hifsys clocks.
=20
 config COMMON_CLK_MT2701_ETHSYS
 	bool "Clock driver for Mediatek MT2701 ethsys"
-	select COMMON_CLK_MT2701
+	depends on COMMON_CLK_MT2701
 	---help---
 	  This driver supports Mediatek MT2701 ethsys clocks.
=20
 config COMMON_CLK_MT2701_BDPSYS
 	bool "Clock driver for Mediatek MT2701 bdpsys"
-	select COMMON_CLK_MT2701
+	depends on COMMON_CLK_MT2701
 	---help---
 	  This driver supports Mediatek MT2701 bdpsys clocks.
=20


--=20
Jean Delvare
SUSE L3 Support
