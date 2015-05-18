Return-Path: <jcliang@chromium.org>
Return-Path: <jcliang@chromium.org>
From: Ricky Liang <jcliang@chromium.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Ricky Liang <jcliang@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	James Liao <jamesjj.liao@mediatek.com>,
	Henry Chen <henryc.chen@mediatek.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC...),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC...)
Subject: [PATCH v2] clk: mediatek: Initialize clk_init_data
Date: Mon, 18 May 2015 11:41:49 +0800
Message-Id: <1431920513-1491-1-git-send-email-jcliang@chromium.org>
List-ID: <linux-clk.vger.kernel.org>

The variable init (struct clk_init_data) is allocated on the stack.
We weren't initializing the .flags field, so it contains random junk,
which can cause all kinds of interesting issues when the flags are
parsed by clk_register.

Signed-off-by: Ricky Liang <jcliang@chromium.org>
---
 drivers/clk/mediatek/clk-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index 66154ca..44409e9 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -268,7 +268,7 @@ static struct clk *mtk_clk_register_pll(const struct mtk_pll_data *data,
 		void __iomem *base)
 {
 	struct mtk_clk_pll *pll;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct clk *clk;
 	const char *parent_name = "clk26m";
 
-- 
2.1.2
