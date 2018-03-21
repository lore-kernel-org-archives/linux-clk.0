Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.135]:47607 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751481AbeCUCqP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Mar 2018 22:46:15 -0400
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 3/3] clk: rockchip: Correct the behaviour of restoring cached phase
Date: Wed, 21 Mar 2018 10:39:20 +0800
Message-Id: <1521599960-34381-3-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1521599960-34381-1-git-send-email-shawn.lin@rock-chips.com>
References: <1521599960-34381-1-git-send-email-shawn.lin@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

We can't restore every phase, for instance the invalid phase and
the phase for coming rate which is out of the scope of boards'
ability. And this patch also corrects the error path to return
invalid pointer to clk if clk_notifier_register failed introduced
by the same offending commit.

Fixes: 60cf09e45fbc ("clk: rockchip: Restore the clock phase after the rate was changed")
Reported-by: wlq <wlq@rock-chips.com>
Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
Tested-by: wlq <wlq@rock-chips.com>
---

 drivers/clk/rockchip/clk-mmc-phase.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/rockchip/clk-mmc-phase.c b/drivers/clk/rockchip/clk-mmc-phase.c
index dc4c227..026a26b 100644
--- a/drivers/clk/rockchip/clk-mmc-phase.c
+++ b/drivers/clk/rockchip/clk-mmc-phase.c
@@ -170,18 +170,30 @@ static int rockchip_mmc_clk_rate_notify(struct notifier_block *nb,
 					unsigned long event, void *data)
 {
 	struct rockchip_mmc_clock *mmc_clock = to_rockchip_mmc_clock(nb);
+	struct clk_notifier_data *ndata = data;
 
 	/*
 	 * rockchip_mmc_clk is mostly used by mmc controllers to sample
 	 * the intput data, which expects the fixed phase after the tuning
 	 * process. However if the clock rate is changed, the phase is stale
 	 * and may break the data sampling. So here we try to restore the phase
-	 * for that case.
+	 * for that case, except that
+	 * (1) cached_phase is invaild since we inevitably cached it when the
+	 * clock provider be reparented from orphan to its real parent in the
+	 * first place. Otherwise we may mess up the initialization of MMC cards
+	 * since we only set the default sample phase and drive phase later on.
+	 * (2) the new coming rate is higher than the older one since mmc driver
+	 * set the max-frequency to match the boards' ability but we can't go
+	 * over the heads of that, otherwise the tests smoke out the issue.
 	 */
+	if (ndata->old_rate <= ndata->new_rate)
+		return NOTIFY_DONE;
+
 	if (event == PRE_RATE_CHANGE)
 		mmc_clock->cached_phase =
 			rockchip_mmc_get_phase(&mmc_clock->hw);
-	else if (event == POST_RATE_CHANGE)
+	else if (mmc_clock->cached_phase != -EINVAL &&
+		 event == POST_RATE_CHANGE)
 		rockchip_mmc_set_phase(&mmc_clock->hw, mmc_clock->cached_phase);
 
 	return NOTIFY_DONE;
@@ -211,8 +223,10 @@ struct clk *rockchip_clk_register_mmc(const char *name,
 	mmc_clock->shift = shift;
 
 	clk = clk_register(NULL, &mmc_clock->hw);
-	if (IS_ERR(clk))
+	if (IS_ERR(clk)) {
+		ret = PTR_ERR(clk);
 		goto err_register;
+	}
 
 	mmc_clock->clk_rate_change_nb.notifier_call =
 				&rockchip_mmc_clk_rate_notify;
@@ -225,5 +239,5 @@ struct clk *rockchip_clk_register_mmc(const char *name,
 	clk_unregister(clk);
 err_register:
 	kfree(mmc_clock);
-	return clk;
+	return ERR_PTR(ret);
 }
-- 
1.9.1


