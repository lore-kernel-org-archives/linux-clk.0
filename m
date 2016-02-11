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
Subject: [PATCH v42 5/6] clk: clk_put WARNs if user has not disabled clk
Date: Thu, 11 Feb 2016 13:19:13 -0800
Message-Id: <1455225554-13267-6-git-send-email-mturquette@baylibre.com>
In-Reply-To: <1455225554-13267-1-git-send-email-mturquette@baylibre.com>
References: <1455225554-13267-1-git-send-email-mturquette@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

>From the clk_put kerneldoc in include/linux/clk.h:

"""
Note: drivers must ensure that all clk_enable calls made on this clock
source are balanced by clk_disable calls prior to calling this function.
"""

The common clock framework implementation of the clk.h api has per-user
reference counts for calls to clk_prepare and clk_disable. As such it
can enforce the requirement to properly call clk_disable and
clk_unprepare before calling clk_put.

Because this requirement is probably violated in many places, this patch
starts with a simple warning. Once offending code has been fixed this
check could additionally release the reference counts automatically.

Signed-off-by: Michael Turquette <mturquette@baylibre.com>
---
Changed in v2ish:
  * s/WARN_ON/WARN_ON_ONCE/ to reduce noise for pm-clocks

 drivers/clk/clk.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 01183e3..d81f970 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2824,6 +2824,14 @@ void __clk_put(struct clk *clk)
 	    clk->max_rate < clk->core->req_rate)
 		clk_core_set_rate_nolock(clk->core, clk->core->req_rate);
 
+	/*
+	 * before calling clk_put, all calls to clk_prepare and clk_enable from
+	 * a given user must be balanced with calls to clk_disable and
+	 * clk_unprepare by that same user
+	 */
+	WARN_ON_ONCE(clk->prepare_count);
+	WARN_ON_ONCE(clk->enable_count);
+
 	owner = clk->core->owner;
 	kref_put(&clk->core->ref, __clk_release);
 
-- 
2.1.4
