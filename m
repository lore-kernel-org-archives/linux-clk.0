Return-Path: <pure.logic@nexus-software.ie>
Return-Path: <pure.logic@nexus-software.ie>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Bryan O'Donoghue <pure.logic@nexus-software.ie>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Quentin Schulz <quentin.schulz@free-electrons.com>
Subject: [PATCH v3 31/34] clk: at91: change round_rate() return logic
Date: Mon,  1 Jan 2018 19:43:10 +0000
Message-Id: <1514835793-1104-32-git-send-email-pure.logic@nexus-software.ie>
In-Reply-To: <1514835793-1104-1-git-send-email-pure.logic@nexus-software.ie>
References: <1514835793-1104-1-git-send-email-pure.logic@nexus-software.ie>
List-ID: <linux-clk.vger.kernel.org>

This patch updates the round_rate() logic here to return zero instead of a
negative number on error.

In conjunction with higher-level changes associated with acting on the
return value of clk_ops->round_rate() it is then possible to have
clk_ops->round_rate() return values from 1 Hz to ULONG_MAX Hz instead of
the current limitation of 1 Hz to LONG_MAX Hz.

Signed-off-by: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Quentin Schulz <quentin.schulz@free-electrons.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/at91/clk-audio-pll.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/at91/clk-audio-pll.c b/drivers/clk/at91/clk-audio-pll.c
index 56227cb..48231e3 100644
--- a/drivers/clk/at91/clk-audio-pll.c
+++ b/drivers/clk/at91/clk-audio-pll.c
@@ -278,7 +278,7 @@ static unsigned long clk_audio_pll_pad_round_rate(struct clk_hw *hw,
 						  unsigned long *parent_rate)
 {
 	struct clk_hw *pclk = clk_hw_get_parent(hw);
-	long best_rate = -EINVAL;
+	unsigned long best_rate = 0;
 	unsigned long best_parent_rate;
 	unsigned long tmp_qd;
 	u32 div;
@@ -330,7 +330,7 @@ static unsigned long clk_audio_pll_pmc_round_rate(struct clk_hw *hw,
 						  unsigned long *parent_rate)
 {
 	struct clk_hw *pclk = clk_hw_get_parent(hw);
-	long best_rate = -EINVAL;
+	unsigned long best_rate = 0;
 	unsigned long best_parent_rate = 0;
 	u32 tmp_qd = 0, div;
 	long tmp_rate;
-- 
2.7.4
