Return-Path: <dianders@chromium.org>
Return-Path: <dianders@chromium.org>
From: Douglas Anderson <dianders@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Taniya Das <tdas@codeaurora.org>
Cc: Douglas Anderson <dianders@chromium.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: qcom: Allocate space for NULL terimation in DFS table
Date: Thu, 30 Aug 2018 10:34:37 -0700
Message-Id: <20180830173437.63601-1-dianders@chromium.org>
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

The table allocated in clk_rcg2_dfs_populate_freq_table() is
eventually iterated over by qcom_find_freq() which assumes that the
table is NULL terminated.  Allocate one extra space in the array for
the NULL termination.  Initting of the NULL termination is implicit
due to kcalloc().

Fixes: cc4f6944d0e3 ("clk: qcom: Add support for RCG to register for DFS")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/clk/qcom/clk-rcg2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index d5d77f9ad170..6e3bd195d012 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -993,7 +993,8 @@ static int clk_rcg2_dfs_populate_freq_table(struct clk_rcg2 *rcg)
 	struct freq_tbl *freq_tbl;
 	int i;
 
-	freq_tbl = kcalloc(MAX_PERF_LEVEL, sizeof(*freq_tbl), GFP_KERNEL);
+	/* Allocate space for 1 extra since table is NULL terminated */
+	freq_tbl = kcalloc(MAX_PERF_LEVEL + 1, sizeof(*freq_tbl), GFP_KERNEL);
 	if (!freq_tbl)
 		return -ENOMEM;
 	rcg->freq_tbl = freq_tbl;
-- 
2.19.0.rc0.228.g281dcd1b4d0-goog
