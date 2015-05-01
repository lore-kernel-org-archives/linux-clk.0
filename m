Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 4/6] clk: Remove impossible if condition in clk_core_get_phase()
Date: Thu, 30 Apr 2015 17:14:19 -0700
Message-Id: <1430439261-10291-5-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1430439261-10291-1-git-send-email-sboyd@codeaurora.org>
References: <1430439261-10291-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This condition can't ever be true because this function is static
and it's always called with a non-NULL pointer.

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 8d36100c00ce..3e58b7453076 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2182,16 +2182,12 @@ EXPORT_SYMBOL_GPL(clk_set_phase);
 
 static int clk_core_get_phase(struct clk_core *core)
 {
-	int ret = 0;
-
-	if (!core)
-		goto out;
+	int ret;
 
 	clk_prepare_lock();
 	ret = core->phase;
 	clk_prepare_unlock();
 
-out:
 	return ret;
 }
 EXPORT_SYMBOL_GPL(clk_get_phase);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
