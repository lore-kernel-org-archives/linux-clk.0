Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Russell King <rmk+kernel@arm.linux.org.uk>
Subject: [PATCH] clk: mvebu: Mark ioremapped memory as __iomem
Date: Fri,  8 Jan 2016 09:38:14 -0800
Message-Id: <1452274694-30401-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Silence the following sparse warning

drivers/clk/mvebu/dove-divider.c:252:14: warning: incorrect type in assignment (different address spaces)
drivers/clk/mvebu/dove-divider.c:252:14:    expected void *base
drivers/clk/mvebu/dove-divider.c:252:14:    got void [noderef] <asn:2>*
drivers/clk/mvebu/dove-divider.c:256:13: warning: incorrect type in argument 2 (different address spaces)
drivers/clk/mvebu/dove-divider.c:256:13:    expected void [noderef] <asn:2>*base
drivers/clk/mvebu/dove-divider.c:256:13:    got void *base
drivers/clk/mvebu/dove-divider.c:257:25: warning: incorrect type in argument 1 (different address spaces)
drivers/clk/mvebu/dove-divider.c:257:25:    expected void volatile [noderef] <asn:2>*iomem_cookie
drivers/clk/mvebu/dove-divider.c:257:25:    got void *base

Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/mvebu/dove-divider.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mvebu/dove-divider.c b/drivers/clk/mvebu/dove-divider.c
index d5c5bfa35a5a..3e0b52daa35f 100644
--- a/drivers/clk/mvebu/dove-divider.c
+++ b/drivers/clk/mvebu/dove-divider.c
@@ -247,7 +247,7 @@ static struct clk_onecell_data dove_divider_data = {
 
 void __init dove_divider_clk_init(struct device_node *np)
 {
-	void *base;
+	void __iomem *base;
 
 	base = of_iomap(np, 0);
 	if (WARN_ON(!base))
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
