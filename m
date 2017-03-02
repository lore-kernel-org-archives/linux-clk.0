Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC 2/2] clk: use enable_count to check if clk is busy
Date: Thu,  2 Mar 2017 18:38:35 +0100
Message-Id: <20170302173835.18313-3-jbrunet@baylibre.com>
In-Reply-To: <20170302173835.18313-1-jbrunet@baylibre.com>
References: <20170302173835.18313-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

When CLK_SET_RATE_GATE is set, we use the prepare_count to determine if a
clock is busy. A consumer could have just prepared his clock and not be
able to set it, eventhough the clock is still disabled (gated).

Might be the expected behavior, but the wording seems a bit misleading

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 6fe2ea81a9af..602f369bd1eb 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -174,7 +174,7 @@ static bool clk_core_is_enabled(struct clk_core *core)
 
 static bool clk_core_rate_can_change(struct clk_core *core)
 {
-	if ((core->flags & CLK_SET_RATE_GATE) && core->prepare_count)
+	if ((core->flags & CLK_SET_RATE_GATE) && core->enable_count)
 		return false;
 
 	return true;
-- 
2.9.3
