Return-Path: <mopsfelder@gmail.com>
Return-Path: <mopsfelder@gmail.com>
From: Murilo Opsfelder Araujo <mopsfelder@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-clk@vger.kernel.org,
	Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@linaro.org>,
	Murilo Opsfelder Araujo <mopsfelder@gmail.com>
Subject: [PATCH 2/2] drivers: clk: clk.c: Make clk_is_orphan() dependent of CONFIG_OF
Date: Wed,  6 May 2015 21:51:01 -0300
Message-Id: <1430959861-14925-3-git-send-email-mopsfelder@gmail.com>
In-Reply-To: <1430959861-14925-1-git-send-email-mopsfelder@gmail.com>
References: <1430959861-14925-1-git-send-email-mopsfelder@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

The function clk_is_orphan() is called only by
__of_clk_get_from_provider(), which depends on CONFIG_OF, so it does
make sense the move.

This change also gets rid of the following build message when CONFIG_OF
is not set:

drivers/clk/clk.c:2231:13: warning: ‘clk_is_orphan’ defined but not used [-Wunused-function]

Signed-off-by: Murilo Opsfelder Araujo <mopsfelder@gmail.com>
---
 drivers/clk/clk.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index a961eb6..d748aa2 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2228,14 +2228,6 @@ static inline void clk_debug_unregister(struct clk_core *core)
 }
 #endif /* CONFIG_DEBUG_FS */
 
-static bool clk_is_orphan(const struct clk *clk)
-{
-	if (!clk)
-		return false;
-
-	return clk->core->orphan;
-}
-
 /**
  * __clk_init - initialize the data structures in a struct clk
  * @dev:	device initializing this clk, placeholder for now
@@ -2950,6 +2942,14 @@ void of_clk_del_provider(struct device_node *np)
 }
 EXPORT_SYMBOL_GPL(of_clk_del_provider);
 
+static bool clk_is_orphan(const struct clk *clk)
+{
+	if (!clk)
+		return false;
+
+	return clk->core->orphan;
+}
+
 struct clk *__of_clk_get_from_provider(struct of_phandle_args *clkspec,
 				       const char *dev_id, const char *con_id)
 {
-- 
2.1.4
