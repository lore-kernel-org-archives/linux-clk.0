Return-Path: <chris.brandt@renesas.com>
From: Chris Brandt <chris.brandt@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Simon Horman <horms+renesas@verge.net.au>,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2] clk: renesas: mstp: ensure register writes complete
Date: Mon, 13 Feb 2017 13:44:05 -0500
Message-Id: <20170213184405.5657-1-chris.brandt@renesas.com>
List-ID: <linux-clk.vger.kernel.org>

When there is no status bit, it is possible for the clock enable/disable
operation to have not completed by the time the driver code resumes
execution. This is due to the fact that write operations are sometimes
queued and delayed internally. Doing a read ensures the write operations
has completed.

Fixes: b6face404f38 ("ARM: shmobile: r7s72100: add essential clock nodes to dtsi")
Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
v2:
* add Fixes because technically this is a bug fix
---
 drivers/clk/renesas/clk-mstp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
index 3ce819c..69cfdb9 100644
--- a/drivers/clk/renesas/clk-mstp.c
+++ b/drivers/clk/renesas/clk-mstp.c
@@ -91,6 +91,12 @@ static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 		value |= bitmask;
 	cpg_mstp_write(group, value, group->smstpcr);
 
+	if (!group->mstpsr) {
+		/* dummy read to ensure write has completed */
+		clk_readl(group->smstpcr);
+		barrier_data(group->smstpcr);
+	}
+
 	spin_unlock_irqrestore(&group->lock, flags);
 
 	if (!enable || !group->mstpsr)
-- 
2.10.1
