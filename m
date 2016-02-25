Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: shmobile: Free 'clock' on error path
Date: Thu, 25 Feb 2016 12:26:25 -0800
Message-Id: <1456431985-31750-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

We forgot to free this clock when we return early in this code.

Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/shmobile/renesas-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/shmobile/renesas-cpg-mssr.c b/drivers/clk/shmobile/renesas-cpg-mssr.c
index 925b6007e531..58e24b326a48 100644
--- a/drivers/clk/shmobile/renesas-cpg-mssr.c
+++ b/drivers/clk/shmobile/renesas-cpg-mssr.c
@@ -348,6 +348,7 @@ static void __init cpg_mssr_register_mod_clk(const struct mssr_mod_clk *mod,
 #else
 			dev_dbg(dev, "Ignoring MSTP %s to prevent disabling\n",
 				mod->name);
+			kfree(clock);
 			return;
 #endif
 		}
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
