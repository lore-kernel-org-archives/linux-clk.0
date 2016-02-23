Return-Path: <sudipm.mukherjee@gmail.com>
Return-Path: <sudipm.mukherjee@gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] clk: shmobile: check for failure
Date: Tue, 23 Feb 2016 15:00:03 +0530
Message-Id: <1456219803-24824-1-git-send-email-sudipm.mukherjee@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

We were not checking the return from devm_add_action() which can fail.
Start using the helper devm_add_action_or_reset() and return directly
as we know that the cleanup has been done by this helper.

Signed-off-by: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
---

I think this will go throuh clk tree, so this doesnot have to wait as
devm_add_action_or_reset() is already in clk tree.

 drivers/clk/shmobile/renesas-cpg-mssr.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/shmobile/renesas-cpg-mssr.c b/drivers/clk/shmobile/renesas-cpg-mssr.c
index 9a4d888..925b600 100644
--- a/drivers/clk/shmobile/renesas-cpg-mssr.c
+++ b/drivers/clk/shmobile/renesas-cpg-mssr.c
@@ -568,7 +568,11 @@ static int __init cpg_mssr_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
-	devm_add_action(dev, cpg_mssr_del_clk_provider, np);
+	error = devm_add_action_or_reset(dev,
+					 cpg_mssr_del_clk_provider,
+					 np);
+	if (error)
+		return error;
 
 	error = cpg_mssr_add_clk_domain(dev, info->core_pm_clks,
 					info->num_core_pm_clks);
-- 
1.9.1
