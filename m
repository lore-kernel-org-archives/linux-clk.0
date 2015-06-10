Return-Path: <dinguyen@opensource.altera.com>
From: <dinguyen@opensource.altera.com>
To: <sboyd@codeaurora.org>, <mturquette@linaro.org>
CC: <dinh.linux@gmail.com>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@opensource.altera.com>,
	Santosh Shilimkar <ssantosh@kernel.org>
Subject: [PATCH 3/6] clk: keystone: make use of of_clk_parent_fill helper function
Date: Wed, 10 Jun 2015 16:49:22 -0500
Message-ID: <1433972965-24974-4-git-send-email-dinguyen@opensource.altera.com>
In-Reply-To: <1433972965-24974-1-git-send-email-dinguyen@opensource.altera.com>
References: <1433972965-24974-1-git-send-email-dinguyen@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: dinguyen@opensource.altera.com
List-ID: <linux-clk.vger.kernel.org>

From: Dinh Nguyen <dinguyen@opensource.altera.com>

Use of_clk_parent_fill to fill in the parent clock names' array.

Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
Cc: Santosh Shilimkar <ssantosh@kernel.org>
---
 drivers/clk/keystone/pll.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/keystone/pll.c b/drivers/clk/keystone/pll.c
index 0dd8a4b..d885372 100644
--- a/drivers/clk/keystone/pll.c
+++ b/drivers/clk/keystone/pll.c
@@ -293,8 +293,7 @@ static void __init of_pll_mux_clk_init(struct device_node *node)
 		return;
 	}
 
-	parents[0] = of_clk_get_parent_name(node, 0);
-	parents[1] = of_clk_get_parent_name(node, 1);
+	of_clk_parent_fill(node, parents, 2);
 	if (!parents[0] || !parents[1]) {
 		pr_err("%s: missing parent clocks\n", __func__);
 		return;
-- 
2.2.1
