Return-Path: <shawn.lin@rock-chips.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-clk@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH v3] clk: Don't show the incorrect clock phase
Date: Wed, 14 Mar 2018 08:28:31 +0800
Message-Id: <1520987311-114705-1-git-send-email-shawn.lin@rock-chips.com>
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
Acked-by: Jerome Brunet <jbrunet@baylibre.com>
---

Changes in v3:
- simplify the comment suggested by Jerome
- add Jerome's ack tag

Changes in v2:
- fix the typos suggested by Geert
- update cached phase anyway suggested by Jerome

 drivers/clk/clk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index f9a19c8..b6174b1 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2375,6 +2375,9 @@ static int clk_core_get_phase(struct clk_core *core)
 	int ret;
 
 	clk_prepare_lock();
+	/* Always try to update cached phase if possible */
+	if (core->ops->get_phase)
+		core->phase = core->ops->get_phase(core->hw);
 	ret = core->phase;
 	clk_prepare_unlock();
 
-- 
1.9.1
