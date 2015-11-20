Return-Path: <sudipm.mukherjee@gmail.com>
Return-Path: <sudipm.mukherjee@gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] clk: versatile: remove unneeded error message
Date: Fri, 20 Nov 2015 14:22:28 +0530
Message-Id: <1448009548-30317-1-git-send-email-sudipm.mukherjee@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

If kzalloc fails we will already have many messages in the log and we do
not need another message to know that kzalloc for sp810 has failed.

Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
---
 drivers/clk/versatile/clk-sp810.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/versatile/clk-sp810.c b/drivers/clk/versatile/clk-sp810.c
index 6a36c8b..e78755e 100644
--- a/drivers/clk/versatile/clk-sp810.c
+++ b/drivers/clk/versatile/clk-sp810.c
@@ -95,10 +95,8 @@ static void __init clk_sp810_of_setup(struct device_node *node)
 	int i;
 	bool deprecated;
 
-	if (!sp810) {
-		pr_err("Failed to allocate memory for SP810!\n");
+	if (!sp810)
 		return;
-	}
 
 	if (of_clk_parent_fill(node, parent_names, num) != num) {
 		pr_warn("Failed to obtain parent clocks for SP810!\n");
-- 
1.9.1
