Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Gabriel Fernandez <gabriel.fernandez@linaro.org>,
	Pankaj Dev <pankaj.dev@st.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: st: avoid uninitialized variable use
Date: Mon, 25 Jan 2016 16:54:04 +0100
Message-Id: <1453737255-1959849-1-git-send-email-arnd@arndb.de>
List-ID: <linux-clk.vger.kernel.org>

My previous patch fixed some warnings about printing a couple
of variables that are always uninitialized in quadfs_pll_fs660c32_set_rate(),
but I now got a warning that only shows up in some configurations (i.e.
without gcc -Os) about the params.ndiv being used uninitialized in the
error case:

drivers/clk/st/clkgen-fsyn.c: In function 'quadfs_pll_fs660c32_set_rate':
drivers/clk/st/clkgen-fsyn.c:584:75: warning: 'params.ndiv' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/clk/st/clkgen-fsyn.c:574:16: note: 'params.ndiv' was declared here

This changes the error handling so we bail for invalid arguments rather
than continuing with uninitialized data.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clk/st/clkgen-fsyn.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/st/clkgen-fsyn.c b/drivers/clk/st/clkgen-fsyn.c
index ccb324d97160..dec4eaaecc00 100644
--- a/drivers/clk/st/clkgen-fsyn.c
+++ b/drivers/clk/st/clkgen-fsyn.c
@@ -574,12 +574,16 @@ static int quadfs_pll_fs660c32_set_rate(struct clk_hw *hw, unsigned long rate,
 	struct stm_fs params;
 	long hwrate = 0;
 	unsigned long flags = 0;
+	int ret;
 
 	if (!rate || !parent_rate)
 		return -EINVAL;
 
-	if (!clk_fs660c32_vco_get_params(parent_rate, rate, &params))
-		clk_fs660c32_vco_get_rate(parent_rate, &params, &hwrate);
+	ret = clk_fs660c32_vco_get_params(parent_rate, rate, &params);
+	if (ret)
+		return ret;
+
+	clk_fs660c32_vco_get_rate(parent_rate, &params, &hwrate);
 
 	pr_debug("%s: %s new rate %ld [ndiv=0x%x]\n",
 		 __func__, clk_hw_get_name(hw),
-- 
2.7.0
