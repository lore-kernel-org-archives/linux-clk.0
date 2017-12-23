Return-Path: <sean.wang@mediatek.com>
From: <sean.wang@mediatek.com>
To: <sboyd@codeaurora.org>, <mturquette@baylibre.com>,
	<matthias.bgg@gmail.com>
CC: <jdelvare@suse.de>, <jamesjj.liao@mediatek.com>, <weiyi.lu@mediatek.com>,
	<arnd@arndb.de>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sean Wang
	<sean.wang@mediatek.com>, <kbuild-all@01.org>
Subject: [PATCH] clk: mediatek: Fix all warnings for missing struct clk_onecell_data
Date: Sat, 23 Dec 2017 15:56:36 +0800
Message-ID: <a7e0a625fb6a71b7fab810f1cc8ec196b1732305.1514015506.git.sean.wang@mediatek.com>
Return-Path: sean.wang@mediatek.com
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

From: Sean Wang <sean.wang@mediatek.com>

In fact, the clk-mtk.h header is unnecessary for reset.c and thus it's
safe to remove it from the file to get rid of below build warnings.

All warnings (new ones prefixed by >>):

   In file included from drivers/clk/mediatek/reset.c:22:0:
>>drivers/clk/mediatek/clk-mtk.h:44:19: warning: 'struct clk_onecell_data'
declared inside parameter list will not be visible outside of
this definition or declaration
      int num, struct clk_onecell_data *clk_data);
                      ^~~~~~~~~~~~~~~~
drivers/clk/mediatek/clk-mtk.h:63:19: warning: 'struct clk_onecell_data'
declared inside parameter list will not be visible outside of
this definition or declaration
      int num, struct clk_onecell_data *clk_data);
                      ^~~~~~~~~~~~~~~~
drivers/clk/mediatek/clk-mtk.h:145:10: warning: 'struct clk_onecell_data'
declared inside parameter list will not be visible outside of
this definition or declaration
      struct clk_onecell_data *clk_data);
             ^~~~~~~~~~~~~~~~
drivers/clk/mediatek/clk-mtk.h:164:11: warning: 'struct clk_onecell_data'
declared inside parameter list will not be visible outside of
this definition or declaration
       struct clk_onecell_data *clk_data);
              ^~~~~~~~~~~~~~~~
drivers/clk/mediatek/clk-mtk.h:190:12: warning: 'struct clk_onecell_data'
declared inside parameter list will not be visible outside of this
definition or declaration
        struct clk_onecell_data *clk_data);
               ^~~~~~~~~~~~~~~~

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Cc: kbuild-all@01.org
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org
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
