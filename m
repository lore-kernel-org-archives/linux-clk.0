Return-Path: <shawn.lin@rock-chips.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-clk@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH v2] clk: Don't show the incorrect clock phase
Date: Fri,  9 Mar 2018 08:56:39 +0800
Message-Id: <1520556999-74737-1-git-send-email-shawn.lin@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

It's found that the clock phase output from clk_summary is
wrong compared to the actual phase reading from the register.

cat /sys/kernel/debug/clk/clk_summary | grep sdio_sample
sdio_sample     0        1        0 50000000          0 -22

It exposes an issue that clk core, clk_core_get_phase, always
returns the cached core->phase which should be either updated
by calling clk_set_phase or directly from the first place the
clk was registered.

When registering the clk, the core->phase geting from ->get_phase()
may return negative value indicating error. This is quite common
since the clk's phase may be highly related to its parent chain,
but it was temporarily orphan when registered, since its parent
chains hadn't be ready at that time, so the clk drivers decide to
return error in this case. However, if no clk_set_phase is called or
maybe the ->set_phase() isn't even implemented, the core->phase would
never be updated. This is wrong, and we should try to update it when
all its parent chains are settled down, like the way of updating clock
rate for that. But it's not deserved to complicate the code now and
just update it anyway when calling clk_core_get_phase, which would be
much simple and enough.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

---

Changes in v2:
- fix the typos suggested by Geert
- update cached phase anyway suggested by Jerome

 drivers/clk/clk.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 0f686a9..4070664 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2370,6 +2370,17 @@ static int clk_core_get_phase(struct clk_core *core)
 	int ret;
 
 	clk_prepare_lock();
+	/*
+	 * Always try to update cached phase if possible since
+	 * (1) It may be invalid at the first place when registering
+	 * the hw clock but never got updated if no ->set_phase() be
+	 * implemented or called.
+	 * (2) It may be stale along with the other factors, for instance,
+	 * the hw clock's rate is changed but current framework doesn't
+	 * notify the change of phase concurrent with that of rate.
+	 */
+	if (core->ops->get_phase)
+		core->phase = core->ops->get_phase(core->hw);
 	ret = core->phase;
 	clk_prepare_unlock();
 
-- 
1.9.1
