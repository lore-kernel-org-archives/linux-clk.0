Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: cpg-mssr: Remove bogus commas from error messages
Date: Fri, 21 Oct 2016 11:00:01 +0200
Message-Id: <1477040401-3817-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
I plan to queue this up in clk-renesas-for-v4.10.

 drivers/clk/renesas/renesas-cpg-mssr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index e927d98f134516e8..cf46ebccec0a5d49 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -313,7 +313,7 @@ static void __init cpg_mssr_register_core_clk(const struct cpg_core_clk *core,
 	return;
 
 fail:
-	dev_err(dev, "Failed to register %s clock %s: %ld\n", "core,",
+	dev_err(dev, "Failed to register %s clock %s: %ld\n", "core",
 		core->name, PTR_ERR(clk));
 }
 
@@ -386,7 +386,7 @@ static void __init cpg_mssr_register_mod_clk(const struct mssr_mod_clk *mod,
 	return;
 
 fail:
-	dev_err(dev, "Failed to register %s clock %s: %ld\n", "module,",
+	dev_err(dev, "Failed to register %s clock %s: %ld\n", "module",
 		mod->name, PTR_ERR(clk));
 	kfree(clock);
 }
-- 
1.9.1
