Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Alex Elder <elder@linaro.org>,
	Tim Kryger <tim.kryger@linaro.org>
Subject: [PATCH 05/19] clk: bcm/kona: Remove ccu_list
Date: Wed,  6 May 2015 00:39:42 -0700
Message-Id: <1430897996-11597-6-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
References: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This list doesn't look to be used. Let's remove it and any
associated code that would be manipulating this list. This also
silences this error:

drivers/clk/bcm/clk-kona-setup.c:24:1: warning: symbol 'ccu_list' was not declared. Should it be static?

Cc: Alex Elder <elder@linaro.org>
Cc: Tim Kryger <tim.kryger@linaro.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/bcm/clk-kona-setup.c | 4 ----
 drivers/clk/bcm/clk-kona.h       | 2 --
 2 files changed, 6 deletions(-)

diff --git a/drivers/clk/bcm/clk-kona-setup.c b/drivers/clk/bcm/clk-kona-setup.c
index e5aededdd322..deaa7f962b84 100644
--- a/drivers/clk/bcm/clk-kona-setup.c
+++ b/drivers/clk/bcm/clk-kona-setup.c
@@ -21,8 +21,6 @@
 #define selector_clear_exists(sel)	((sel)->width = 0)
 #define trigger_clear_exists(trig)	FLAG_CLEAR(trig, TRIG, EXISTS)
 
-LIST_HEAD(ccu_list);	/* The list of set up CCUs */
-
 /* Validity checking */
 
 static bool ccu_data_offsets_valid(struct ccu_data *ccu)
@@ -773,7 +771,6 @@ static void kona_ccu_teardown(struct ccu_data *ccu)
 
 	of_clk_del_provider(ccu->node);	/* safe if never added */
 	ccu_clks_teardown(ccu);
-	list_del(&ccu->links);
 	of_node_put(ccu->node);
 	ccu->node = NULL;
 	iounmap(ccu->base);
@@ -847,7 +844,6 @@ void __init kona_dt_ccu_setup(struct ccu_data *ccu,
 		goto out_err;
 	}
 	ccu->node = of_node_get(node);
-	list_add_tail(&ccu->links, &ccu_list);
 
 	/*
 	 * Set up each defined kona clock and save the result in
diff --git a/drivers/clk/bcm/clk-kona.h b/drivers/clk/bcm/clk-kona.h
index 6849a64baf6d..906576ec97b6 100644
--- a/drivers/clk/bcm/clk-kona.h
+++ b/drivers/clk/bcm/clk-kona.h
@@ -480,7 +480,6 @@ struct ccu_data {
 	spinlock_t lock;	/* serialization lock */
 	bool write_enabled;	/* write access is currently enabled */
 	struct ccu_policy policy;
-	struct list_head links;	/* for ccu_list */
 	struct device_node *node;
 	struct clk_onecell_data clk_data;
 	const char *name;
@@ -492,7 +491,6 @@ struct ccu_data {
 #define KONA_CCU_COMMON(_prefix, _name, _ccuname)			    \
 	.name		= #_name "_ccu",				    \
 	.lock		= __SPIN_LOCK_UNLOCKED(_name ## _ccu_data.lock),    \
-	.links		= LIST_HEAD_INIT(_name ## _ccu_data.links),	    \
 	.clk_data	= {						    \
 		.clk_num = _prefix ## _ ## _ccuname ## _CCU_CLOCK_COUNT,    \
 	}
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
