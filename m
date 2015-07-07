Return-Path: <dinguyen@opensource.altera.com>
From: <dinguyen@opensource.altera.com>
To: <sboyd@codeaurora.org>, <mturquette@linaro.org>
CC: <dinh.linux@gmail.com>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: [PATCHv2 3/6] clk: keystone: make use of of_clk_parent_fill helper function
Date: Mon, 6 Jul 2015 22:59:03 -0500
Message-ID: <1436241546-16731-4-git-send-email-dinguyen@opensource.altera.com>
In-Reply-To: <1436241546-16731-1-git-send-email-dinguyen@opensource.altera.com>
References: <1436241546-16731-1-git-send-email-dinguyen@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: dinguyen@opensource.altera.com
List-ID: <linux-clk.vger.kernel.org>

From: Dinh Nguyen <dinguyen@opensource.altera.com>

Use of_clk_parent_fill to fill in the parent clock names' array.

Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
Acked-by: Santosh Shilimkar <ssantosh@kernel.org>
---
 drivers/clk/keystone/pll.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/keystone/pll.c b/drivers/clk/keystone/pll.c
index 4a375ea..d6ef063 100644
--- a/drivers/clk/keystone/pll.c
+++ b/drivers/clk/keystone/pll.c
@@ -309,8 +309,7 @@ static void __init of_pll_mux_clk_init(struct device_node *node)
 		return;
 	}
 
-	parents[0] = of_clk_get_parent_name(node, 0);
-	parents[1] = of_clk_get_parent_name(node, 1);
+	of_clk_parent_fill(node, parents, 2);
 	if (!parents[0] || !parents[1]) {
 		pr_err("%s: missing parent clocks\n", __func__);
 		return;
-- 
1.7.9.5
