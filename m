Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/4] clk: Improve flags doc for of_clk_detect_critical()
Date: Wed,  3 Jan 2018 12:06:14 +0100
Message-Id: <1514977577-11854-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1514977577-11854-1-git-send-email-geert+renesas@glider.be>
References: <1514977577-11854-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

The "flags" parameter passed to of_clk_detect_critical() cannot be a
pointer to a real clk_core.flags field, as clk_core is private to the
clock framework internals.

Change the comment to refer to top-level framework flags instead.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Split off from "clk: Fix debugfs_create_*() usage" into a separate
    patch,
  - Change comment to match <linux/clk-provider.h> naming.
---
 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 5ec580914089510a..8c4769c50a71be93 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3927,7 +3927,7 @@ static int parent_ready(struct device_node *np)
  * of_clk_detect_critical() - set CLK_IS_CRITICAL flag from Device Tree
  * @np: Device node pointer associated with clock provider
  * @index: clock index
- * @flags: pointer to clk_core->flags
+ * @flags: pointer to top-level framework flags
  *
  * Detects if the clock-critical property exists and, if so, sets the
  * corresponding CLK_IS_CRITICAL flag.
-- 
2.7.4
