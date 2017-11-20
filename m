Return-Path: <Chunyan.Zhang@spreadtrum.com>
From: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette
	<mturquette@baylibre.com>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Cai Li
	<cai.li@spreadtrum.com>,
        Orson Zhai <orson.zhai@spreadtrum.com>,
        Chunyan
 Zhang <zhang.lyra@gmail.com>
Subject: [PATCH] clk: fix a panic error caused by accessing NULL pointer
Date: Mon, 20 Nov 2017 11:38:16 +0800
Message-ID: <20171120033816.28414-1-chunyan.zhang@spreadtrum.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

From: Cai Li <cai.li@spreadtrum.com>

In some cases the clock parent would be set NULL when doing re-parent,
it will cause a NULL pointer accessing if clk_set trace event is enabled,
since the trace event function would not check the input parameter.

Signed-off-by: Cai Li <cai.li@spreadtrum.com>
Signed-off-by: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
---
 drivers/clk/clk.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index c8d83ac..64efaf0 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1242,13 +1242,12 @@ static int __clk_set_parent(struct clk_core *core, struct clk_core *parent,
 
 	old_parent = __clk_set_parent_before(core, parent);
 
-	trace_clk_set_parent(core, parent);
-
 	/* change clock input source */
-	if (parent && core->ops->set_parent)
+	if (parent && core->ops->set_parent) {
+		trace_clk_set_parent(core, parent);
 		ret = core->ops->set_parent(core->hw, p_index);
-
-	trace_clk_set_parent_complete(core, parent);
+		trace_clk_set_parent_complete(core, parent);
+	}
 
 	if (ret) {
 		flags = clk_enable_lock();
-- 
2.7.4
