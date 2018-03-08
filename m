Return-Path: <shawn.lin@rock-chips.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH] clk: Don't show the incorrect clock phase
Date: Thu,  8 Mar 2018 15:54:03 +0800
Message-Id: <1520495643-164458-1-git-send-email-shawn.lin@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

It's found that the clock phase output from clk_summary is
wrong compared to the actual phase reading from the register.

cat /sys/kernel/debug/clk/clk_summary | grep sdio_sample
sdio_sample     0        1        0 50000000          0 -22

It expose an issue that clk core, clk_core_get_phase, always
return the cached core->phase which should be either updated
by calling clk_set_phase or directly from the first place the
clk was registered. When registering the clk, the core->phase
geting from ->get_phase() may return negative value indicating
error. This is quite common since the clk's phase may be highly
related to its praent chain, but it was temporary orphan when
registered, since its parent chain hadn't be ready at that time,
so the clk drivers decide to return error in this case. However,
if no clk_set_phase is called, core->phase would never be updated.
This is wrong, and we should try to update it when all its parent
chain is settled down, like the way of updating clock rate for that.
It's not derserved to complicate the code but just update it if
seeing it's a nagative number when calling clk_core_get_phase, which
would be much simple and enough.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/clk/clk.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 0f686a9..b49e4c8 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2370,6 +2370,15 @@ static int clk_core_get_phase(struct clk_core *core)
 	int ret;
 
 	clk_prepare_lock();
+	/*
+	 * clk_set_phase always set the phase in [0, 360],
+	 * so the only reason for core->phase to be nagative
+	 * number is it's a error number propagated back from
+	 * the clk drivers. So we should try to update it if
+	 * possible.
+	 */
+	if (core->phase < 0 && core->ops->get_phase)
+		core->phase = core->ops->get_phase(core->hw);
 	ret = core->phase;
 	clk_prepare_unlock();
 
-- 
1.9.1
