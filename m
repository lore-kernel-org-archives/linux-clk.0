Return-Path: <weiyj.lk@gmail.com>
Return-Path: <weiyj.lk@gmail.com>
From: Wei Yongjun <weiyj.lk@gmail.com>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Icenowy Zheng <icenowy@aosc.io>
Cc: Wei Yongjun <weiyongjun1@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH -next] clk: sunxi-ng: de2: fix wrong pointer passed to PTR_ERR()
Date: Thu, 18 May 2017 15:55:13 +0000
Message-Id: <20170518155513.29628-1-weiyj.lk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-clk.vger.kernel.org>

From: Wei Yongjun <weiyongjun1@huawei.com>

PTR_ERR should access the value just tested by IS_ERR, otherwise
the wrong error code will be returned.

Fixes: b0d9a4bd52bd ("clk: sunxi-ng: add support for DE2 CCU")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index 15aaa9c..5cdaf52 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -184,7 +184,7 @@ static int sunxi_de2_clk_probe(struct platform_device *pdev)
 
 	rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(rstc)) {
-		ret = PTR_ERR(bus_clk);
+		ret = PTR_ERR(rstc);
 		if (ret != -EPROBE_DEFER)
 			dev_err(&pdev->dev,
 				"Couldn't get reset control: %d\n", ret);
