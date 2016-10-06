Return-Path: <javier@osg.samsung.com>
From: Javier Martinez Canillas <javier@osg.samsung.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Reichl <m.reichl@fivetechno.de>,
	Tobias Jakobi <tjakobi@math.uni-bielefeld.de>,
	Javier Martinez Canillas <javier@osg.samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: max77686: fix number of clocks setup for clk_hw based registration
Date: Thu,  6 Oct 2016 11:59:59 -0300
Message-Id: <1475765999-14366-1-git-send-email-javier@osg.samsung.com>
List-ID: <linux-clk.vger.kernel.org>

The commit 9b4cac33adc7 ("clk: max77686: Migrate to clk_hw based OF and
registration APIs") converted the driver to use the new provider API to
register clocks using clk_hw.

But unfortunately, in the conversion it missed to set the num_clks value
which lead to the following error when trying to register a clk provider:

[    1.963782] of_clk_max77686_get: invalid index 0
[    1.967460] ERROR: could not get clock /rtc@10070000:rtc_src(1)
[    1.973638] s3c-rtc 10070000.rtc: failed to find rtc source clock

Fix it by correctly set the max77686_clk_driver_data num_clks member.

Fixes: 9b4cac33adc7 ("clk: max77686: Migrate to clk_hw based OF and registration APIs")
Reported-by: Markus Reichl <m.reichl@fivetechno.de>
Suggested-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
Tested-by: Markus Reichl <m.reichl@fivetechno.de>

---

 drivers/clk/clk-max77686.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-max77686.c b/drivers/clk/clk-max77686.c
index b637f5979023..eb953d3b0b69 100644
--- a/drivers/clk/clk-max77686.c
+++ b/drivers/clk/clk-max77686.c
@@ -216,6 +216,7 @@ static int max77686_clk_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	drv_data->num_clks = num_clks;
 	drv_data->max_clk_data = devm_kcalloc(dev, num_clks,
 					      sizeof(*drv_data->max_clk_data),
 					      GFP_KERNEL);
-- 
2.7.4
