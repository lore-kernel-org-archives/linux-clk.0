Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: fix phase reported being zero
Date: Thu, 15 Feb 2018 11:19:58 +0100
Message-Id: <20180215101958.22676-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

While introducing clk_core_set_phase_nolock, assigning core->phase was
mistakenly removed. Fixing this now

Fixes: 9e4d04adeb1a ("clk: add clk_core_set_phase_nolock function")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 9d56be6ead39..b33d362239e7 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2314,6 +2314,9 @@ static int clk_core_set_phase_nolock(struct clk_core *core, int degrees)
 	if (core->ops->set_phase)
 		ret = core->ops->set_phase(core->hw, degrees);
 
+	if (!ret)
+		core->phase = degrees;
+
 	trace_clk_set_phase_complete(core, degrees);
 
 	return ret;
-- 
2.14.3
