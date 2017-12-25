Return-Path: <sean.wang@mediatek.com>
From: <sean.wang@mediatek.com>
To: <sboyd@codeaurora.org>, <mturquette@baylibre.com>,
	<matthias.bgg@gmail.com>
CC: <jdelvare@suse.de>, <jamesjj.liao@mediatek.com>, <weiyi.lu@mediatek.com>,
	<kevin-cw.chen@mediatek.com>, <shunli.wang@mediatek.com>,
	<chen.zhong@mediatek.com>, <arnd@arndb.de>,
	<linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH] clk: mediatek: remove superfluous line including linux/clk-provider.h
Date: Mon, 25 Dec 2017 17:05:56 +0800
Message-ID: <96d2fcd536d75dbbfde0aa0ad0797e80da89117b.1514191770.git.sean.wang@mediatek.com>
Return-Path: sean.wang@mediatek.com
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

From: Sean Wang <sean.wang@mediatek.com>

clk-mtk.h has already included linux/clk-provider.h inside, so remove
the superfluous line including linux/clk-provider.h from these files which
also included clk-mtk.h.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Cc: Jean Delvare <jdelvare@suse.de>
---
 drivers/clk/mediatek/clk-cpumux.c        | 1 -
 drivers/clk/mediatek/clk-mt2701-bdp.c    | 1 -
 drivers/clk/mediatek/clk-mt2701-eth.c    | 1 -
 drivers/clk/mediatek/clk-mt2701-hif.c    | 1 -
 drivers/clk/mediatek/clk-mt2701-img.c    | 1 -
 drivers/clk/mediatek/clk-mt2701-mm.c     | 1 -
 drivers/clk/mediatek/clk-mt2701-vdec.c   | 1 -
 drivers/clk/mediatek/clk-mt2701.c        | 1 -
 drivers/clk/mediatek/clk-mt2712-bdp.c    | 1 -
 drivers/clk/mediatek/clk-mt2712-img.c    | 1 -
 drivers/clk/mediatek/clk-mt2712-jpgdec.c | 1 -
 drivers/clk/mediatek/clk-mt2712-mfg.c    | 1 -
 drivers/clk/mediatek/clk-mt2712-mm.c     | 1 -
 drivers/clk/mediatek/clk-mt2712-vdec.c   | 1 -
 drivers/clk/mediatek/clk-mt2712-venc.c   | 1 -
 drivers/clk/mediatek/clk-mt6797-img.c    | 1 -
 drivers/clk/mediatek/clk-mt6797-mm.c     | 1 -
 drivers/clk/mediatek/clk-mt6797-vdec.c   | 1 -
 drivers/clk/mediatek/clk-mt6797-venc.c   | 1 -
 drivers/clk/mediatek/clk-mt7622-aud.c    | 1 -
 drivers/clk/mediatek/clk-mt7622-eth.c    | 1 -
 drivers/clk/mediatek/clk-mt7622-hif.c    | 1 -
 drivers/clk/mediatek/clk-mt7622.c        | 1 -
 23 files changed, 23 deletions(-)

diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
index 16e5677..83b5522 100644
--- a/drivers/clk/mediatek/clk-cpumux.c
+++ b/drivers/clk/mediatek/clk-cpumux.c
@@ -12,7 +12,6 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/clk-provider.h>
 #include <linux/mfd/syscon.h>
 #include <linux/slab.h>
 
diff --git a/drivers/clk/mediatek/clk-mt2701-bdp.c b/drivers/clk/mediatek/clk-mt2701-bdp.c
index fe4964d..306da4a 100644
--- a/drivers/clk/mediatek/clk-mt2701-bdp.c
+++ b/drivers/clk/mediatek/clk-mt2701-bdp.c
@@ -12,7 +12,6 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/clk-provider.h>
 #include <linux/platform_device.h>
 
 #include "clk-mtk.h"
diff --git a/drivers/clk/mediatek/clk-mt2701-eth.c b/drivers/clk/mediatek/clk-mt2701-eth.c
index 9251a65..c94d85b 100644
--- a/drivers/clk/mediatek/clk-mt2701-eth.c
+++ b/drivers/clk/mediatek/clk-mt2701-eth.c
@@ -12,7 +12,6 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/clk-provider.h>
 #include <linux/platform_device.h>
 
 #include "clk-mtk.h"
diff --git a/drivers/clk/mediatek/clk-mt2701-hif.c b/drivers/clk/mediatek/clk-mt2701-hif.c
index 18f3723..2285b48 100644
--- a/drivers/clk/mediatek/clk-mt2701-hif.c
+++ b/drivers/clk/mediatek/clk-mt2701-hif.c
@@ -12,7 +12,6 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/clk-provider.h>
 #include <linux/platform_device.h>
 
 #include "clk-mtk.h"
diff --git a/drivers/clk/mediatek/clk-mt2701-img.c b/drivers/clk/mediatek/clk-mt2701-img.c
index b7441c9..023dafc 100644
--- a/drivers/clk/mediatek/clk-mt2701-img.c
+++ b/drivers/clk/mediatek/clk-mt2701-img.c
@@ -12,7 +12,6 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/clk-provider.h>
 #include <linux/platform_device.h>
 
 #include "clk-mtk.h"
diff --git a/drivers/clk/mediatek/clk-mt2701-mm.c b/drivers/clk/mediatek/clk-mt2701-mm.c
index fe1f850..e2d88f3 100644
--- a/drivers/clk/mediatek/clk-mt2701-mm.c
+++ b/drivers/clk/mediatek/clk-mt2701-mm.c
@@ -12,7 +12,6 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/clk-provider.h>
 #include <linux/platform_device.h>
 
 #include "clk-mtk.h"
diff --git a/drivers/clk/mediatek/clk-mt2701-vdec.c b/drivers/clk/mediatek/clk-mt2701-vdec.c
index d3c0fc9..df27e11 100644
--- a/drivers/clk/mediatek/clk-mt2701-vdec.c
+++ b/drivers/clk/mediatek/clk-mt2701-vdec.c
@@ -12,7 +12,6 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/clk-provider.h>
 #include <linux/platform_device.h>
 
 #include "clk-mtk.h"
diff --git a/drivers/clk/mediatek/clk-mt2701.c b/drivers/clk/mediatek/clk-mt2701.c
index 8e7f16f..92e149e 100644
--- a/drivers/clk/mediatek/clk-mt2701.c
+++ b/drivers/clk/mediatek/clk-mt2701.c
@@ -12,7 +12,6 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
diff --git a/drivers/clk/mediatek/clk-mt2712-bdp.c b/drivers/clk/mediatek/clk-mt2712-bdp.c
index 5fe4728..0c85977 100644
--- a/drivers/clk/mediatek/clk-mt2712-bdp.c
+++ b/drivers/clk/mediatek/clk-mt2712-bdp.c
@@ -12,7 +12,6 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/clk-provider.h>
 #include <linux/platform_device.h>
 
 #include "clk-mtk.h"
diff --git a/drivers/clk/mediatek/clk-mt2712-img.c b/drivers/clk/mediatek/clk-mt2712-img.c
index 139ff55..a32b02e 100644
--- a/drivers/clk/mediatek/clk-mt2712-img.c
+++ b/drivers/clk/mediatek/clk-mt2712-img.c
@@ -12,7 +12,6 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/clk-provider.h>
 #include <linux/platform_device.h>
 
 #include "clk-mtk.h"
diff --git a/drivers/clk/mediatek/clk-mt2712-jpgdec.c b/drivers/clk/mediatek/clk-mt2712-jpgdec.c
index c7d4aad..883700e 100644
--- a/drivers/clk/mediatek/clk-mt2712-jpgdec.c
+++ b/drivers/clk/mediatek/clk-mt2712-jpgdec.c
@@ -12,7 +12,6 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/clk-provider.h>
 #include <linux/platform_device.h>
 
 #include "clk-mtk.h"
diff --git a/drivers/clk/mediatek/clk-mt2712-mfg.c b/drivers/clk/mediatek/clk-mt2712-mfg.c
index 570f72d..a7a65db 100644
--- a/drivers/clk/mediatek/clk-mt2712-mfg.c
+++ b/drivers/clk/mediatek/clk-mt2712-mfg.c
@@ -12,7 +12,6 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/clk-provider.h>
 #include <linux/platform_device.h>
 
 #include "clk-mtk.h"
diff --git a/drivers/clk/mediatek/clk-mt2712-mm.c b/drivers/clk/mediatek/clk-mt2712-mm.c
index a8b4b6d..fa52338 100644
--- a/drivers/clk/mediatek/clk-mt2712-mm.c
+++ b/drivers/clk/mediatek/clk-mt2712-mm.c
@@ -12,7 +12,6 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/clk-provider.h>
 #include <linux/platform_device.h>
 
 #include "clk-mtk.h"
diff --git a/drivers/clk/mediatek/clk-mt2712-vdec.c b/drivers/clk/mediatek/clk-mt2712-vdec.c
index 55c64ee..2cd75c8 100644
--- a/drivers/clk/mediatek/clk-mt2712-vdec.c
+++ b/drivers/clk/mediatek/clk-mt2712-vdec.c
@@ -12,7 +12,6 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/clk-provider.h>
 #include <linux/platform_device.h>
 
 #include "clk-mtk.h"
diff --git a/drivers/clk/mediatek/clk-mt2712-venc.c b/drivers/clk/mediatek/clk-mt2712-venc.c
index ccbfe98..99c3e6a 100644
--- a/drivers/clk/mediatek/clk-mt2712-venc.c
+++ b/drivers/clk/mediatek/clk-mt2712-venc.c
@@ -12,7 +12,6 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/clk-provider.h>
 #include <linux/platform_device.h>
 
 #include "clk-mtk.h"
diff --git a/drivers/clk/mediatek/clk-mt6797-img.c b/drivers/clk/mediatek/clk-mt6797-img.c
index 94cc480..3146376 100644
--- a/drivers/clk/mediatek/clk-mt6797-img.c
+++ b/drivers/clk/mediatek/clk-mt6797-img.c
@@ -11,7 +11,6 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/clk-provider.h>
 #include <linux/platform_device.h>
 #include <dt-bindings/clock/mt6797-clk.h>
 
diff --git a/drivers/clk/mediatek/clk-mt6797-mm.c b/drivers/clk/mediatek/clk-mt6797-mm.c
index c57d3ee..99a91af 100644
--- a/drivers/clk/mediatek/clk-mt6797-mm.c
+++ b/drivers/clk/mediatek/clk-mt6797-mm.c
@@ -12,7 +12,6 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/clk-provider.h>
 #include <linux/platform_device.h>
 #include <dt-bindings/clock/mt6797-clk.h>
 
diff --git a/drivers/clk/mediatek/clk-mt6797-vdec.c b/drivers/clk/mediatek/clk-mt6797-vdec.c
index 7c402ca..736d9e3 100644
--- a/drivers/clk/mediatek/clk-mt6797-vdec.c
+++ b/drivers/clk/mediatek/clk-mt6797-vdec.c
@@ -12,7 +12,6 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/clk-provider.h>
 #include <linux/platform_device.h>
 
 #include "clk-mtk.h"
diff --git a/drivers/clk/mediatek/clk-mt6797-venc.c b/drivers/clk/mediatek/clk-mt6797-venc.c
index e73d517..bfecf5e 100644
--- a/drivers/clk/mediatek/clk-mt6797-venc.c
+++ b/drivers/clk/mediatek/clk-mt6797-venc.c
@@ -12,7 +12,6 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/clk-provider.h>
 #include <linux/platform_device.h>
 
 #include "clk-mtk.h"
diff --git a/drivers/clk/mediatek/clk-mt7622-aud.c b/drivers/clk/mediatek/clk-mt7622-aud.c
index fad7d9f..838b523 100644
--- a/drivers/clk/mediatek/clk-mt7622-aud.c
+++ b/drivers/clk/mediatek/clk-mt7622-aud.c
@@ -13,7 +13,6 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
diff --git a/drivers/clk/mediatek/clk-mt7622-eth.c b/drivers/clk/mediatek/clk-mt7622-eth.c
index 6328127..3b521d1 100644
--- a/drivers/clk/mediatek/clk-mt7622-eth.c
+++ b/drivers/clk/mediatek/clk-mt7622-eth.c
@@ -13,7 +13,6 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
diff --git a/drivers/clk/mediatek/clk-mt7622-hif.c b/drivers/clk/mediatek/clk-mt7622-hif.c
index a6e8534..8c96ac0 100644
--- a/drivers/clk/mediatek/clk-mt7622-hif.c
+++ b/drivers/clk/mediatek/clk-mt7622-hif.c
@@ -13,7 +13,6 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
diff --git a/drivers/clk/mediatek/clk-mt7622.c b/drivers/clk/mediatek/clk-mt7622.c
index 92f7e32..3e0e05f 100644
--- a/drivers/clk/mediatek/clk-mt7622.c
+++ b/drivers/clk/mediatek/clk-mt7622.c
@@ -13,7 +13,6 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
-- 
2.7.4
