Return-Path: <sudeep.holla@arm.com>
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: versatile: add min/max rate boundaries for vexpress osc clock
Date: Fri, 10 Nov 2017 16:06:57 +0000
Message-Id: <1510330017-32200-1-git-send-email-sudeep.holla@arm.com>
List-ID: <linux-clk.vger.kernel.org>

Clock framework has a provider API(clk_hw_set_rate_range) to set the
min/max rate of a clock. Use the same to set the boundaries for the
vexpress osc clock.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/clk/versatile/clk-vexpress-osc.c | 1 +
 1 file changed, 1 insertion(+)

Hi Stephen,

Just a quick question, does the clk core ensure the round_rate request
to the clock provider is within this bounds ? A quick grep suggests it's
used after the call to round_rate in clk_calc_new_rates. I can't recall
the details from when you introduced clk_hw_set_rate_range.

Regards,
Sudeep

diff --git a/drivers/clk/versatile/clk-vexpress-osc.c b/drivers/clk/versatile/clk-vexpress-osc.c
index e7a868b83fe5..d3b5af2a02ab 100644
--- a/drivers/clk/versatile/clk-vexpress-osc.c
+++ b/drivers/clk/versatile/clk-vexpress-osc.c
@@ -104,6 +104,7 @@ static int vexpress_osc_probe(struct platform_device *pdev)
 		return PTR_ERR(clk);

 	of_clk_add_provider(pdev->dev.of_node, of_clk_src_simple_get, clk);
+	clk_hw_set_rate_range(&osc->hw, osc->rate_min, osc->rate_max);

 	dev_dbg(&pdev->dev, "Registered clock '%s'\n", init.name);

--
2.7.4
