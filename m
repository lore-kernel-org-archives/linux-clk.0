Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Jeremy McNicoll <jeremymc@redhat.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: export clk_bulk_prepare
Date: Thu,  5 Oct 2017 14:12:50 +0200
Message-Id: <20171005121301.584338-1-arnd@arndb.de>
List-ID: <linux-clk.vger.kernel.org>

The ARM allmodconfig build fails in linux-next, since one
clk interface was accidentally never exported but is now
used by an mmc driver:

ERROR: "clk_bulk_prepare" [drivers/mmc/host/sdhci-msm.ko] undefined!

This exports it as well.

Fixes: d8034e3379a8 ("mmc: sdhci-msm: Utilize bulk clock API")
Fixes: 266e4e9d9150 ("clk: add clk_bulk_get accessories")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
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
2.9.0
