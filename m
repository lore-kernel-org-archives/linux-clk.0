Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: [PATCH 06/19] clk: berlin: Silence sparse warning
Date: Wed,  6 May 2015 00:39:43 -0700
Message-Id: <1430897996-11597-7-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
References: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

drivers/clk/berlin/berlin2-pll.c:94:12: warning: symbol 'berlin2_pll_register' was not declared. Should it be static?

Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/berlin/berlin2-pll.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/clk/berlin/berlin2-pll.c b/drivers/clk/berlin/berlin2-pll.c
index bdc506b03824..f4b8d324b083 100644
--- a/drivers/clk/berlin/berlin2-pll.c
+++ b/drivers/clk/berlin/berlin2-pll.c
@@ -25,14 +25,7 @@
 #include <asm/div64.h>
 
 #include "berlin2-div.h"
-
-struct berlin2_pll_map {
-	const u8 vcodiv[16];
-	u8 mult;
-	u8 fbdiv_shift;
-	u8 rfdiv_shift;
-	u8 divsel_shift;
-};
+#include "berlin2-pll.h"
 
 struct berlin2_pll {
 	struct clk_hw hw;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
