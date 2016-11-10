Return-Path: <weiyj.lk@gmail.com>
Return-Path: <weiyj.lk@gmail.com>
From: Wei Yongjun <weiyj.lk@gmail.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Alexandre Courbot <gnurou@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH -next] clk: tegra: dfll: Use builtin_platform_driver to simplify the code
Date: Thu, 10 Nov 2016 15:20:24 +0000
Message-Id: <1478791224-21510-1-git-send-email-weiyj.lk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-clk.vger.kernel.org>

From: Wei Yongjun <weiyongjun1@huawei.com>

Use the builtin_platform_driver() macro to make the code simpler.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
index 4301569..ad1c1cc 100644
--- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
+++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
@@ -163,9 +163,4 @@ static struct platform_driver tegra124_dfll_fcpu_driver = {
 		.pm = &tegra124_dfll_pm_ops,
 	},
 };
-
-static int __init tegra124_dfll_fcpu_init(void)
-{
-	return platform_driver_register(&tegra124_dfll_fcpu_driver);
-}
-device_initcall(tegra124_dfll_fcpu_init);
+builtin_platform_driver(tegra124_dfll_fcpu_driver);
