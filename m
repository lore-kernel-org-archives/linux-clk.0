Return-Path: <pure.logic@nexus-software.ie>
Return-Path: <pure.logic@nexus-software.ie>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: pure.logic@nexus-software.ie,
	Jun Nie <jun.nie@linaro.org>,
	Baoyou Xie <baoyou.xie@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 28/33] clk: zte: change zx_audio_round_rate() return logic
Date: Sat, 30 Dec 2017 01:13:07 +0000
Message-Id: <1514596392-22270-29-git-send-email-pure.logic@nexus-software.ie>
In-Reply-To: <1514596392-22270-1-git-send-email-pure.logic@nexus-software.ie>
References: <1514596392-22270-1-git-send-email-pure.logic@nexus-software.ie>
List-ID: <linux-clk.vger.kernel.org>

This patch updates the round_rate() logic here to return zero instead of a
negative number on error.

In conjunction with higher-level changes associated with acting on the
return value of clk_ops->round_rate() it is then possible to have
clk_ops->round_rate() return values from 1 Hz to ULONG_MAX Hz instead of
the current limitation of 1 Hz to LONG_MAX Hz.

Signed-off-by: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc: Jun Nie <jun.nie@linaro.org>
Cc: Baoyou Xie <baoyou.xie@linaro.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/zte/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/zte/clk.c b/drivers/clk/zte/clk.c
index df91842..6afdc4a 100644
--- a/drivers/clk/zte/clk.c
+++ b/drivers/clk/zte/clk.c
@@ -247,7 +247,7 @@ static unsigned long zx_audio_round_rate(struct clk_hw *hw, unsigned long rate,
 	u32 reg;
 
 	if (rate * 2 > *prate)
-		return -EINVAL;
+		return 0;
 
 	reg = calc_reg(*prate, rate);
 	return calc_rate(reg, *prate);
-- 
2.7.4
