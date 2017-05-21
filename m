Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v2 02/11] clk: add clk_core_set_phase_nolock function
Date: Sun, 21 May 2017 23:59:49 +0200
Message-Id: <20170521215958.19743-3-jbrunet@baylibre.com>
In-Reply-To: <20170521215958.19743-1-jbrunet@baylibre.com>
References: <20170521215958.19743-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Create a core function for set_phase, as it is done for set_rate and
set_parent.

This rework is done to ease the integration of "protected" clock
functionality.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index f5c371532509..6031fada37f9 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1873,6 +1873,23 @@ int clk_set_parent(struct clk *clk, struct clk *parent)
 }
 EXPORT_SYMBOL_GPL(clk_set_parent);
 
+static int clk_core_set_phase_nolock(struct clk_core *core, int degrees)
+{
+	int ret = -EINVAL;
+
+	if (!core)
+		return 0;
+
+	trace_clk_set_phase(clk->core, degrees);
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
@@ -1895,7 +1912,7 @@ EXPORT_SYMBOL_GPL(clk_set_parent);
  */
 int clk_set_phase(struct clk *clk, int degrees)
 {
-	int ret = -EINVAL;
+	int ret;
 
 	if (!clk)
 		return 0;
@@ -1906,17 +1923,7 @@ int clk_set_phase(struct clk *clk, int degrees)
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
2.9.4
