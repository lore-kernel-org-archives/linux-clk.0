Return-Path: <sudipm.mukherjee@gmail.com>
Return-Path: <sudipm.mukherjee@gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] clk: versatile: fix memory leak
Date: Mon, 16 Nov 2015 19:16:40 +0530
Message-Id: <1447681600-14120-1-git-send-email-sudipm.mukherjee@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

If of_clk_parent_fill() fails then we printed an error message and
returned. But we missed freeing sp810.

Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
---
 drivers/clk/versatile/clk-sp810.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/versatile/clk-sp810.c b/drivers/clk/versatile/clk-sp810.c
index a1cdef6..6a36c8b 100644
--- a/drivers/clk/versatile/clk-sp810.c
+++ b/drivers/clk/versatile/clk-sp810.c
@@ -102,6 +102,7 @@ static void __init clk_sp810_of_setup(struct device_node *node)
 
 	if (of_clk_parent_fill(node, parent_names, num) != num) {
 		pr_warn("Failed to obtain parent clocks for SP810!\n");
+		kfree(sp810);
 		return;
 	}
 
-- 
1.9.1
