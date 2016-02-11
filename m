Return-Path: <mturquette@baylibre.com>
From: Michael Turquette <mturquette@baylibre.com>
To: linux-clk@vger.kernel.org
Cc: lee.jones@linaro.org,
	sboyd@codeaurora.org,
	maxime.ripard@free-electrons.com,
	maxime.coquelin@st.com,
	geert@linux-m68k.org,
	heiko@sntech.de,
	andre.przywara@arm.com,
	rklein@nvidia.com,
	linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v42 4/6] clk: per-user clk prepare & enable ref counts
Date: Thu, 11 Feb 2016 13:19:12 -0800
Message-Id: <1455225554-13267-5-git-send-email-mturquette@baylibre.com>
In-Reply-To: <1455225554-13267-1-git-send-email-mturquette@baylibre.com>
References: <1455225554-13267-1-git-send-email-mturquette@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

This patch adds prepare and enable reference counts for the per-user
handles that clock consumers have for a clock node. This patch warns if
an imbalance occurs while trying to disable or unprepare a clock and
aborts, leaving the hardware unaffected.

Signed-off-by: Michael Turquette <mturquette@baylibre.com>
---
Changed in v2ish:
  * Fixed locking bug (Thanks Maxime!)

 drivers/clk/clk.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 5181a15..01183e3 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -85,6 +85,8 @@ struct clk {
 	unsigned long min_rate;
 	unsigned long max_rate;
 	struct hlist_node clks_node;
+	unsigned int enable_count;
+	unsigned int prepare_count;
 };
 
 /***           locking             ***/
@@ -609,7 +611,11 @@ void clk_unprepare(struct clk *clk)
 		return;
 
 	clk_prepare_lock();
+	if (WARN_ON(clk->prepare_count == 0))
+		goto out;
+	clk->prepare_count--;
 	clk_core_unprepare(clk->core);
+out:
 	clk_prepare_unlock();
 }
 EXPORT_SYMBOL_GPL(clk_unprepare);
@@ -666,6 +672,7 @@ int clk_prepare(struct clk *clk)
 		return 0;
 
 	clk_prepare_lock();
+	clk->prepare_count++;
 	ret = clk_core_prepare(clk->core);
 	clk_prepare_unlock();
 
@@ -719,7 +726,11 @@ void clk_disable(struct clk *clk)
 		return;
 
 	flags = clk_enable_lock();
+	if (WARN_ON(clk->enable_count == 0))
+		goto out;
+	clk->enable_count--;
 	clk_core_disable(clk->core);
+out:
 	clk_enable_unlock(flags);
 }
 EXPORT_SYMBOL_GPL(clk_disable);
@@ -781,6 +792,7 @@ int clk_enable(struct clk *clk)
 		return 0;
 
 	flags = clk_enable_lock();
+	clk->enable_count++;
 	ret = clk_core_enable(clk->core);
 	clk_enable_unlock(flags);
 
-- 
2.1.4
