Return-Path: <pure.logic@nexus-software.ie>
Return-Path: <pure.logic@nexus-software.ie>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Bryan O'Donoghue <pure.logic@nexus-software.ie>,
	Tony Prisk <linux@prisktech.co.nz>
Subject: [PATCH v2 17/34] clk: vt8500: match temp holder variable to fn return type
Date: Mon,  1 Jan 2018 19:34:43 +0000
Message-Id: <1514835300-381-3-git-send-email-pure.logic@nexus-software.ie>
In-Reply-To: <1514835300-381-1-git-send-email-pure.logic@nexus-software.ie>
References: <1514835300-381-1-git-send-email-pure.logic@nexus-software.ie>
List-ID: <linux-clk.vger.kernel.org>

vtwm_pll_round_rate() returns an unsigned long. This patch changes the
internal holder variable from signed to unsigned long for the sake of
completeness and neatness.

Signed-off-by: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Tony Prisk <linux@prisktech.co.nz>
---
 drivers/clk/clk-vt8500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-vt8500.c b/drivers/clk/clk-vt8500.c
index 750c087..a4aa0bf 100644
--- a/drivers/clk/clk-vt8500.c
+++ b/drivers/clk/clk-vt8500.c
@@ -609,7 +609,7 @@ static unsigned long vtwm_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct clk_pll *pll = to_clk_pll(hw);
 	u32 filter, mul, div1, div2;
-	long round_rate;
+	unsigned long round_rate;
 	int ret = 1;
 
 	switch (pll->type) {
-- 
2.7.4
