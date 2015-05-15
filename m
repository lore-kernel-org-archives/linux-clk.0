Return-Path: <jcliang@chromium.org>
Return-Path: <jcliang@chromium.org>
From: Ricky Liang <jcliang@chromium.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Ricky Liang <jcliang@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	James Liao <jamesjj.liao@mediatek.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Henry Chen <henryc.chen@mediatek.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC...),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC...)
Subject: [PATCH] clk: mediatek: Initialize clk flags
Date: Fri, 15 May 2015 14:22:45 +0800
Message-Id: <1431670969-1996-1-git-send-email-jcliang@chromium.org>
List-ID: <linux-clk.vger.kernel.org>

The variable init (struct clk_init_data) is allocated on the stack.
We weren't initializing the .flags field, so it contains random junk,
which can cause all kinds of interesting issues when the flags are
parsed by clk_register.

The best solution seems to just pass on the flags passed in to our
clk_register wrappers.

Signed-off-by: Ricky Liang <jcliang@chromium.org>
---
 drivers/clk/mediatek/clk-pll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index 66154ca..72fe307 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -289,6 +289,7 @@ static struct clk *mtk_clk_register_pll(const struct mtk_pll_data *data,
 	init.ops = &mtk_pll_ops;
 	init.parent_names = &parent_name;
 	init.num_parents = 1;
+	init.flags = data->flags;
 
 	clk = clk_register(NULL, &pll->hw);
 
-- 
2.1.2
