Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Jisheng Zhang <jszhang@marvell.com>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stephen Boyd <stephen.boyd@linaro.org>
Subject: [PATCH] clk: berlin: Pass correct type to hw provider registration
Date: Wed, 16 Nov 2016 11:08:47 -0800
Message-Id: <20161116190847.21417-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Dan Carpenter reports that we're passing a pointer to a pointer
here when we should just be passing a pointer. Pass the right
pointer so that the of_clk_hw_onecell_get() sees the appropriate
data pointer on its end.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jisheng Zhang <jszhang@marvell.com>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Stephen Boyd <stephen.boyd@linaro.org>
Fixes: f6475e298297 ("clk: berlin: Migrate to clk_hw based registration and OF APIs")
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/berlin/bg2.c  | 2 +-
 drivers/clk/berlin/bg2q.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/berlin/bg2.c b/drivers/clk/berlin/bg2.c
index edf3b96b3b73..1d99292e2039 100644
--- a/drivers/clk/berlin/bg2.c
+++ b/drivers/clk/berlin/bg2.c
@@ -685,7 +685,7 @@ static void __init berlin2_clock_setup(struct device_node *np)
 	}
 
 	/* register clk-provider */
-	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data);
+	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data);
 
 	return;
 
diff --git a/drivers/clk/berlin/bg2q.c b/drivers/clk/berlin/bg2q.c
index 0718e831475f..3b784b593afd 100644
--- a/drivers/clk/berlin/bg2q.c
+++ b/drivers/clk/berlin/bg2q.c
@@ -382,7 +382,7 @@ static void __init berlin2q_clock_setup(struct device_node *np)
 	}
 
 	/* register clk-provider */
-	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data);
+	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data);
 
 	return;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
