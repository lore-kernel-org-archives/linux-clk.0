Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Quentin Schulz <quentin.schulz@free-electrons.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v5 03/10] clk: add clk_core_set_phase_nolock function
Date: Fri,  1 Dec 2017 22:51:53 +0100
Message-Id: <20171201215200.23523-4-jbrunet@baylibre.com>
In-Reply-To: <20171201215200.23523-1-jbrunet@baylibre.com>
References: <20171201215200.23523-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Create a core function for set_phase, as it is done for set_rate and
set_parent.

This rework is done to ease the integration of "protected" clock
functionality.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Tested-by: Quentin Schulz <quentin.schulz@free-electrons.com>
Tested-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Acked-by: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index e60b2a26b10b..7946a069ba2e 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1966,6 +1966,25 @@ int clk_set_parent(struct clk *clk, struct clk *parent)
 }
 EXPORT_SYMBOL_GPL(clk_set_parent);
 
+static int clk_core_set_phase_nolock(struct clk_core *core, int degrees)
+{
+	int ret = -EINVAL;
+
+	lockdep_assert_held(&prepare_lock);
+
+	if (!core)
+		return 0;
+
+	trace_clk_set_phase(core, degrees);
+
+	if (core->ops->set_phase)
+		ret = core->ops->set_phase(core->hw, degrees);
+
+	trace_clk_set_phase_complete(core, degrees);
+
+	return ret;
+}
+
 /**
  * clk_set_phase - adjust the phase shift of a clock signal
  * @clk: clock signal source
@@ -1988,7 +2007,7 @@ EXPORT_SYMBOL_GPL(clk_set_parent);
  */
 int clk_set_phase(struct clk *clk, int degrees)
 {
-	int ret = -EINVAL;
+	int ret;
 
 	if (!clk)
 		return 0;
@@ -1999,17 +2018,7 @@ int clk_set_phase(struct clk *clk, int degrees)
 		degrees += 360;
 
 	clk_prepare_lock();
-
-	trace_clk_set_phase(clk->core, degrees);
-
-	if (clk->core->ops->set_phase)
-		ret = clk->core->ops->set_phase(clk->core->hw, degrees);
-
-	trace_clk_set_phase_complete(clk->core, degrees);
-
-	if (!ret)
-		clk->core->phase = degrees;
-
+	ret = clk_core_set_phase_nolock(clk->core, degrees);
 	clk_prepare_unlock();
 
 	return ret;
-- 
2.14.3
