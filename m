Return-Path: <bjorn.andersson@linaro.org>
Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH] clk: Export clk_bulk_prepare()
Date: Fri, 22 Sep 2017 22:00:29 -0700
Message-Id: <20170923050029.19013-1-bjorn.andersson@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Allow clk_bulk_prepare() to be referenced by kernel modules by adding
the missing EXPORT_SYMBOL_GPL().

Fixes: 266e4e9d9150 ("clk: add clk_bulk_get accessories")
Reported-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/clk-bulk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-bulk.c b/drivers/clk/clk-bulk.c
index c834f5abfc49..4c10456f8a32 100644
--- a/drivers/clk/clk-bulk.c
+++ b/drivers/clk/clk-bulk.c
@@ -105,6 +105,7 @@ int __must_check clk_bulk_prepare(int num_clks,
 
 	return  ret;
 }
+EXPORT_SYMBOL_GPL(clk_bulk_prepare);
 
 #endif /* CONFIG_HAVE_CLK_PREPARE */
 
-- 
2.12.0
