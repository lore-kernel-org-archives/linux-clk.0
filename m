Return-Path: <weiyj.lk@gmail.com>
Return-Path: <weiyj.lk@gmail.com>
From: Wei Yongjun <weiyj.lk@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH -next] clk: sunxi-ng: sun9i-a80: Fix wrong pointer passed to PTR_ERR()
Date: Mon,  6 Feb 2017 16:09:26 +0000
Message-Id: <20170206160926.8274-1-weiyj.lk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-clk.vger.kernel.org>

From: Wei Yongjun <weiyongjun1@huawei.com>

PTR_ERR should access the value just tested by IS_ERR, otherwise
the wrong error code will be returned.

Fixes: 783ab76ae553 ("clk: sunxi-ng: Add A80 Display Engine CCU")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c b/drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c
index 3fc27db..6d11658 100644
--- a/drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c
+++ b/drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c
@@ -232,7 +232,7 @@ static int sun9i_a80_de_clk_probe(struct platform_device *pdev)
 
 	rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(rstc)) {
-		ret = PTR_ERR(bus_clk);
+		ret = PTR_ERR(rstc);
 		if (ret != -EPROBE_DEFER)
 			dev_err(&pdev->dev,
 				"Couldn't get reset control: %d\n", ret);
