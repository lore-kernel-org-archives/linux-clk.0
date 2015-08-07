Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Michael Turquette <mturquette@baylibre.com>
To: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: sboyd@codeaurora.org, lee.jones@linaro.org,
	maxime.ripard@free-electrons.com, s.hauer@pengutronix.de,
	geert@linux-m68k.org, Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH RFC RFT 2/3] clk: clk_put WARNs if user has not disabled clk
Date: Fri,  7 Aug 2015 12:09:29 -0700
Message-Id: <1438974570-20812-3-git-send-email-mturquette@baylibre.com>
In-Reply-To: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
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
 drivers/clk/clk.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 72feee9..6ec0f77 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2764,6 +2764,14 @@ void __clk_put(struct clk *clk)
 	    clk->max_rate < clk->core->req_rate)
 		clk_core_set_rate_nolock(clk->core, clk->core->req_rate);
 
+	/*
+	 * before calling clk_put, all calls to clk_prepare and clk_enable from
+	 * a given user must be balanced with calls to clk_disable and
+	 * clk_unprepare by that same user
+	 */
+	WARN_ON(clk->prepare_count);
+	WARN_ON(clk->enable_count);
+
 	owner = clk->core->owner;
 	kref_put(&clk->core->ref, __clk_release);
 
-- 
1.9.1

