Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [RFC 2/7] clk: add set_phase core function
Date: Tue, 21 Mar 2017 19:33:25 +0100
Message-Id: <20170321183330.26722-3-jbrunet@baylibre.com>
In-Reply-To: <20170321183330.26722-1-jbrunet@baylibre.com>
References: <20170321183330.26722-1-jbrunet@baylibre.com>
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
index e77f03a47da6..57982a06dbce 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1876,6 +1876,23 @@ int clk_set_parent(struct clk *clk, struct clk *parent)
 }
 EXPORT_SYMBOL_GPL(clk_set_parent);
 
+static int clk_core_set_phase(struct clk_core *core, int degrees)
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
@@ -1898,7 +1915,7 @@ EXPORT_SYMBOL_GPL(clk_set_parent);
  */
 int clk_set_phase(struct clk *clk, int degrees)
 {
-	int ret = -EINVAL;
+	int ret;
 
 	if (!clk)
 		return 0;
@@ -1909,17 +1926,7 @@ int clk_set_phase(struct clk *clk, int degrees)
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
+	ret = clk_core_set_phase(clk->core, degrees);
 	clk_prepare_unlock();
 
 	return ret;
-- 
2.9.3
