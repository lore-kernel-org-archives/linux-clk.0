Return-Path: <weiyj.lk@gmail.com>
Return-Path: <weiyj.lk@gmail.com>
From: Wei Yongjun <weiyj.lk@gmail.com>
To: Jun Nie <jun.nie@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH -next] clk: zx296718: use builtin_platform_driver to simplify the code
Date: Fri, 16 Sep 2016 13:03:31 +0000
Message-Id: <1474031011-6700-1-git-send-email-weiyj.lk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-clk.vger.kernel.org>

From: Wei Yongjun <weiyongjun1@huawei.com>

Use the builtin_platform_driver() macro to make the code simpler.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/clk/zte/clk-zx296718.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/clk/zte/clk-zx296718.c b/drivers/clk/zte/clk-zx296718.c
index 025e324..b4fe8dd 100644
--- a/drivers/clk/zte/clk-zx296718.c
+++ b/drivers/clk/zte/clk-zx296718.c
@@ -917,8 +917,4 @@ static struct platform_driver zx_clk_driver = {
 	},
 };
 
-static int __init zx_clkc_init(void)
-{
-	return platform_driver_register(&zx_clk_driver);
-}
-device_initcall(zx_clkc_init);
+builtin_platform_driver(zx_clk_driver);
