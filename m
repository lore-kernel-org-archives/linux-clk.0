Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Takashi Yoshii <takasi-y@ops.dti.ne.jp>,
	Magnus Damm <damm@opensource.se>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 09/19] clk: emev2: Silence sparse warnings
Date: Wed,  6 May 2015 00:39:46 -0700
Message-Id: <1430897996-11597-10-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
References: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

drivers/clk/shmobile/clk-emev2.c:37:14: warning: symbol 'smu_base' was not declared. Should it be static?

Cc: Takashi Yoshii <takasi-y@ops.dti.ne.jp>
Cc: Magnus Damm <damm@opensource.se>
Cc: Simon Horman <horms+renesas@verge.net.au>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/shmobile/clk-emev2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/shmobile/clk-emev2.c b/drivers/clk/shmobile/clk-emev2.c
index 6c7c929c7765..5b60beb7d0eb 100644
--- a/drivers/clk/shmobile/clk-emev2.c
+++ b/drivers/clk/shmobile/clk-emev2.c
@@ -34,7 +34,7 @@
 static DEFINE_SPINLOCK(lock);
 
 /* not pretty, but hey */
-void __iomem *smu_base;
+static void __iomem *smu_base;
 
 static void __init emev2_smu_write(unsigned long value, int offs)
 {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
