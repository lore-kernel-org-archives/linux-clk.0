Return-Path: <weiyj.lk@gmail.com>
Return-Path: <weiyj.lk@gmail.com>
From: Wei Yongjun <weiyj.lk@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	sboyd@codeaurora.org,
	carlo@caione.org,
	khilman@baylibre.com,
	serveralex@gmail.com,
	paul.gortmaker@windriver.com
Cc: Wei Yongjun <weiyongjun1@huawei.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH -next] meson: clk: Use builtin_platform_driver to simplify the code
Date: Sat, 10 Sep 2016 12:02:49 +0000
Message-Id: <1473508969-2776-1-git-send-email-weiyj.lk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-clk.vger.kernel.org>

From: Wei Yongjun <weiyongjun1@huawei.com>

Use the builtin_platform_driver() macro to make the code simpler.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/clk/meson/meson8b.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index e1d4aa1..aaa3e39 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -673,8 +673,4 @@ static struct platform_driver meson8b_driver = {
 	},
 };
 
-static int __init meson8b_clkc_init(void)
-{
-	return platform_driver_register(&meson8b_driver);
-}
-device_initcall(meson8b_clkc_init);
+builtin_platform_driver(meson8b_driver);
