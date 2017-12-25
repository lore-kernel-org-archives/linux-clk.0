Return-Path: <sean.wang@mediatek.com>
From: <sean.wang@mediatek.com>
To: <sboyd@codeaurora.org>, <mturquette@baylibre.com>,
	<matthias.bgg@gmail.com>
CC: <jdelvare@suse.de>, <jamesjj.liao@mediatek.com>, <weiyi.lu@mediatek.com>,
	<arnd@arndb.de>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sean Wang
	<sean.wang@mediatek.com>
Subject: [PATCH] clk: mediatek: remove unnecessary include header from reset.c
Date: Mon, 25 Dec 2017 16:31:10 +0800
Message-ID: <b5937ad5c068eeec19005d40dbddb97e09c1b3d0.1514190227.git.sean.wang@mediatek.com>
Return-Path: sean.wang@mediatek.com
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

From: Sean Wang <sean.wang@mediatek.com>

In fact, the clk-mtk.h header is indeed not needed for reset.c and thus
it's safe and good change to remove it from the file.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
Cc: Jean Delvare <jdelvare@suse.de>
---
 drivers/clk/mediatek/reset.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
index d3551d5..70ebb2e 100644
--- a/drivers/clk/mediatek/reset.c
+++ b/drivers/clk/mediatek/reset.c
@@ -19,8 +19,6 @@
 #include <linux/reset-controller.h>
 #include <linux/slab.h>
 
-#include "clk-mtk.h"
-
 struct mtk_reset {
 	struct regmap *regmap;
 	int regofs;
-- 
2.7.4
