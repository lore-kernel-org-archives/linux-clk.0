Return-Path: <sean.wang@mediatek.com>
From: <sean.wang@mediatek.com>
To: <sboyd@codeaurora.org>, <mturquette@baylibre.com>,
	<matthias.bgg@gmail.com>
CC: <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>,
	<kbuild-all@01.org>, Jean Delvare <jdelvare@suse.de>
Subject: [PATCH v2] clk: mediatek: Fix all warnings for missing struct clk_onecell_data
Date: Mon, 25 Dec 2017 16:03:57 +0800
Message-ID: <2a2569d80e92a45e8eef2b431abfb951853ab6e0.1514188437.git.sean.wang@mediatek.com>
Return-Path: sean.wang@mediatek.com
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

From: Sean Wang <sean.wang@mediatek.com>

Even though the header file linux/clk-provider.h is already being properly
included in clk-mtk.h, the definition of struct clk_onecell_data still
must depend on CONFIG_COMMON_CLK defined and thus it's possible that
below build warnings occur when CONFIG_COMMON_CLK is not being selected.

Therefore, these functions which need struct clk_onecell_data without
declaring that structure first requires simply declaring that this struct
exists prior to referencing it in clk-mtk.h

Changes from v1->v2:
enhance v1 based on two useful solutions Jean Delvare kindly suggested.

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
Cc: Jean Delvare <jdelvare@suse.de>
Cc: linux-clk@vger.kernel.org
---
 drivers/clk/mediatek/clk-mtk.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index f10250d..bf8006d 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -20,6 +20,7 @@
 #include <linux/clk-provider.h>
 
 struct clk;
+struct clk_onecell_data;
 
 #define MAX_MUX_GATE_BIT	31
 #define INVALID_MUX_GATE_BIT	(MAX_MUX_GATE_BIT + 1)
-- 
2.7.4
