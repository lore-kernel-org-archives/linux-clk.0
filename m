Return-Path: <mopsfelder@gmail.com>
Return-Path: <mopsfelder@gmail.com>
From: Murilo Opsfelder Araujo <mopsfelder@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-clk@vger.kernel.org,
	Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@linaro.org>,
	Murilo Opsfelder Araujo <mopsfelder@gmail.com>
Subject: [PATCH 1/2] drivers: clk: clk.c: Add comments indicating the matching #ifdef blocks
Date: Wed,  6 May 2015 21:51:00 -0300
Message-Id: <1430959861-14925-2-git-send-email-mopsfelder@gmail.com>
In-Reply-To: <1430959861-14925-1-git-send-email-mopsfelder@gmail.com>
References: <1430959861-14925-1-git-send-email-mopsfelder@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Murilo Opsfelder Araujo <mopsfelder@gmail.com>
---
 drivers/clk/clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 087a092..a961eb6 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2226,7 +2226,7 @@ static inline void clk_debug_reparent(struct clk_core *core,
 static inline void clk_debug_unregister(struct clk_core *core)
 {
 }
-#endif
+#endif /* CONFIG_DEBUG_FS */
 
 static bool clk_is_orphan(const struct clk *clk)
 {
@@ -3144,4 +3144,4 @@ void __init of_clk_init(const struct of_device_id *matches)
 			force = true;
 	}
 }
-#endif
+#endif /* CONFIG_OF */
-- 
2.1.4
