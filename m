Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: Ignore disabled DT clock providers
Date: Fri, 26 Feb 2016 16:54:31 +0100
Message-Id: <1456502071-13516-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

of_clk_init() uses for_each_matching_node_and_match() to find clock
providers, which returns all matching device nodes, whether they are
enabled or not. Hence clock providers that are disabled explicitly in DT
using e.g.

	"status = "disabled";

are still activated.

Add a check to ignore device nodes that are not enabled, like
of_irq_init() does.

Reported-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/clk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index a1bc8db1c00a064f..4c0cb112390986b2 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3247,6 +3247,9 @@ void __init of_clk_init(const struct of_device_id *matches)
 	for_each_matching_node_and_match(np, matches, &match) {
 		struct clock_provider *parent;
 
+		if (!of_device_is_available(np))
+			continue;
+
 		parent = kzalloc(sizeof(*parent), GFP_KERNEL);
 		if (!parent) {
 			list_for_each_entry_safe(clk_provider, next,
-- 
1.9.1
