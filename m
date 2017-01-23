Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: mstp: Reformat cpg_mstp_clock_register() for git diff
Date: Mon, 23 Jan 2017 11:06:10 +0100
Message-Id: <1485165970-25149-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

As the function header of cpg_mstp_clock_register() is split in an
unusual way, "git diff" gets confused when changes to the body of
the function are made, and attributes them to the wrong function.

Reformat the function header to fix this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas-for-v4.11.
---
 drivers/clk/renesas/clk-mstp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
index c0319b8acf3521a2..93506251f7edcd13 100644
--- a/drivers/clk/renesas/clk-mstp.c
+++ b/drivers/clk/renesas/clk-mstp.c
@@ -127,9 +127,9 @@ static int cpg_mstp_clock_is_enabled(struct clk_hw *hw)
 	.is_enabled = cpg_mstp_clock_is_enabled,
 };
 
-static struct clk * __init
-cpg_mstp_clock_register(const char *name, const char *parent_name,
-			unsigned int index, struct mstp_clock_group *group)
+static struct clk * __init cpg_mstp_clock_register(const char *name,
+	const char *parent_name, unsigned int index,
+	struct mstp_clock_group *group)
 {
 	struct clk_init_data init;
 	struct mstp_clock *clock;
-- 
1.9.1
