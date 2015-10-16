Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-clk@vger.kernel.org,
	linux-sh@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: shmobile: mstp: Drop bogus closing parenthesis in error message
Date: Fri, 16 Oct 2015 17:18:27 +0200
Message-Id: <1445008707-27922-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/shmobile/clk-mstp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/shmobile/clk-mstp.c b/drivers/clk/shmobile/clk-mstp.c
index a0a56e99882ac9ab..3b09716ebda28227 100644
--- a/drivers/clk/shmobile/clk-mstp.c
+++ b/drivers/clk/shmobile/clk-mstp.c
@@ -214,7 +214,7 @@ static void __init cpg_mstp_clocks_init(struct device_node *np)
 			break;
 
 		if (clkidx >= MSTP_MAX_CLOCKS) {
-			pr_err("%s: invalid clock %s %s index %u)\n",
+			pr_err("%s: invalid clock %s %s index %u\n",
 			       __func__, np->name, name, clkidx);
 			continue;
 		}
-- 
1.9.1
