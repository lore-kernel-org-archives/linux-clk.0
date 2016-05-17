Return-Path: <jun.nie@linaro.org>
Return-Path: <jun.nie@linaro.org>
From: Jun Nie <jun.nie@linaro.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com,
	linux-clk@vger.kernel.org
Cc: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v2] clk: Add is_enabled sanity check
Date: Tue, 17 May 2016 10:03:42 +0800
Message-Id: <1463450622-13960-1-git-send-email-jun.nie@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

If .enable and .disable is implemented, we must implement .is_enabled
per document. Otherwise, clk_disable_unused_subtree will not disable
the unused clock if the .is_enabled is not implemented, unecessary
power consumption happens on the clock as a result.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/clk/clk.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index fb74dc1..55f5c44 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2305,6 +2305,10 @@ static int __clk_core_init(struct clk_core *core)
 		goto out;
 	}
 
+	if (core->ops->enable && !core->ops->is_enabled)
+		pr_warn("Warning: %s %s must implement .is_enabled\n",
+			__func__, core->name);
+
 	/* throw a WARN if any entries in parent_names are NULL */
 	for (i = 0; i < core->num_parents; i++)
 		WARN(!core->parent_names[i],
-- 
2.7.4
