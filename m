Return-Path: <maxime.ripard@free-electrons.com>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Chen-Yu Tsai <wens@csie.org>
Cc: linux-clk@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 01/16] clk: fix critical clock locking
Date: Sun,  8 May 2016 22:01:36 +0200
Message-Id: <1462737711-10017-2-git-send-email-maxime.ripard@free-electrons.com>
In-Reply-To: <1462737711-10017-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1462737711-10017-1-git-send-email-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

The critical clock handling in __clk_core_init isn't taking the enable lock
before calling clk_core_enable, which in turns triggers the warning in the
lockdep_assert_held call in that function when lockep is enabled.

Add the calls to clk_enable_lock/unlock to make sure it doesn't happen.

Fixes: 32b9b1096186 ("clk: Allow clocks to be marked as CRITICAL")
Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 drivers/clk/clk.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ce39add5a258..16a38df3c688 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2404,8 +2404,15 @@ static int __clk_core_init(struct clk_core *core)
 		core->ops->init(core->hw);
 
 	if (core->flags & CLK_IS_CRITICAL) {
+		unsigned long flags;
+
+		clk_prepare_lock();
 		clk_core_prepare(core);
+		clk_prepare_unlock();
+
+		flags = clk_enable_lock();
 		clk_core_enable(core);
+		clk_enable_unlock(flags);
 	}
 
 	kref_init(&core->ref);
-- 
2.8.2
