Return-Path: <maxime.ripard@free-electrons.com>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 3/8] clk: sunxi-ng: mult: Fix minimum in round rate
Date: Sat, 21 Jan 2017 23:50:52 +0100
Message-Id: <cad6b82633303e0fe3b231dce364629bc723a808.1485039043.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.04f797fe015b05f19b1d69d0650680baffb27055.1485039043.git-series.maxime.ripard@free-electrons.com>
References: <cover.04f797fe015b05f19b1d69d0650680baffb27055.1485039043.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.04f797fe015b05f19b1d69d0650680baffb27055.1485039043.git-series.maxime.ripard@free-electrons.com>
References: <cover.04f797fe015b05f19b1d69d0650680baffb27055.1485039043.git-series.maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

The previous code was always taking 1 as the minimum in it's round_rate
function, ignoring entirely what was set as minimum in the clock
definition.

Make sure that's not the case anymore.

Fixes: 2beaa601c849 ("clk: sunxi-ng: Implement minimum for multipliers")
Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 drivers/clk/sunxi-ng/ccu_mult.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu_mult.c b/drivers/clk/sunxi-ng/ccu_mult.c
index 8b7ee7baa85b..a52162195e07 100644
--- a/drivers/clk/sunxi-ng/ccu_mult.c
+++ b/drivers/clk/sunxi-ng/ccu_mult.c
@@ -40,7 +40,7 @@ static unsigned long ccu_mult_round_rate(struct ccu_mux_internal *mux,
 	struct ccu_mult *cm = data;
 	struct _ccu_mult _cm;
 
-	_cm.min = 1;
+	_cm.min = cm->mult.min;
 	_cm.max = 1 << cm->mult.width;
 	ccu_mult_find_best(parent_rate, rate, &_cm);
 
-- 
git-series 0.8.11
