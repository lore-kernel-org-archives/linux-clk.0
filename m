Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.135]:38696 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751113AbeCIB5T (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Mar 2018 20:57:19 -0500
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Heiko Stuebner <heiko@sntech.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH] clk: rockchip: Restore the clock phase after the rate was changed
Date: Fri,  9 Mar 2018 09:51:03 +0800
Message-Id: <1520560263-123065-1-git-send-email-shawn.lin@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

There are many factors affecting the clock phase, including clock
rate, temperature, logic voltage and silicon process, etc. But clock
rate is the most significant one here, and the driver should be aware
of the change of the clock rate. As mmc controller need a fixed phase
after tuning was completed, at least before explicitly doing re-tune,
so this patch try to restore the clock phase by monitoring the event
of rate change.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/clk/rockchip/clk-mmc-phase.c | 39 +++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-mmc-phase.c b/drivers/clk/rockchip/clk-mmc-phase.c
index fe7d9ed..dc4c227 100644
--- a/drivers/clk/rockchip/clk-mmc-phase.c
+++ b/drivers/clk/rockchip/clk-mmc-phase.c
@@ -25,6 +25,8 @@ struct rockchip_mmc_clock {
 	void __iomem	*reg;
 	int		id;
 	int		shift;
+	int		cached_phase;
+	struct notifier_block clk_rate_change_nb;
 };
 
 #define to_mmc_clock(_hw) container_of(_hw, struct rockchip_mmc_clock, hw)
@@ -162,6 +164,29 @@ static int rockchip_mmc_set_phase(struct clk_hw *hw, int degrees)
 	.set_phase	= rockchip_mmc_set_phase,
 };
 
+#define to_rockchip_mmc_clock(x) \
+	container_of(x, struct rockchip_mmc_clock, clk_rate_change_nb)
+static int rockchip_mmc_clk_rate_notify(struct notifier_block *nb,
+					unsigned long event, void *data)
+{
+	struct rockchip_mmc_clock *mmc_clock = to_rockchip_mmc_clock(nb);
+
+	/*
+	 * rockchip_mmc_clk is mostly used by mmc controllers to sample
+	 * the intput data, which expects the fixed phase after the tuning
+	 * process. However if the clock rate is changed, the phase is stale
+	 * and may break the data sampling. So here we try to restore the phase
+	 * for that case.
+	 */
+	if (event == PRE_RATE_CHANGE)
+		mmc_clock->cached_phase =
+			rockchip_mmc_get_phase(&mmc_clock->hw);
+	else if (event == POST_RATE_CHANGE)
+		rockchip_mmc_set_phase(&mmc_clock->hw, mmc_clock->cached_phase);
+
+	return NOTIFY_DONE;
+}
+
 struct clk *rockchip_clk_register_mmc(const char *name,
 				const char *const *parent_names, u8 num_parents,
 				void __iomem *reg, int shift)
@@ -169,6 +194,7 @@ struct clk *rockchip_clk_register_mmc(const char *name,
 	struct clk_init_data init;
 	struct rockchip_mmc_clock *mmc_clock;
 	struct clk *clk;
+	int ret;
 
 	mmc_clock = kmalloc(sizeof(*mmc_clock), GFP_KERNEL);
 	if (!mmc_clock)
@@ -186,7 +212,18 @@ struct clk *rockchip_clk_register_mmc(const char *name,
 
 	clk = clk_register(NULL, &mmc_clock->hw);
 	if (IS_ERR(clk))
-		kfree(mmc_clock);
+		goto err_register;
 
+	mmc_clock->clk_rate_change_nb.notifier_call =
+				&rockchip_mmc_clk_rate_notify;
+	ret = clk_notifier_register(clk, &mmc_clock->clk_rate_change_nb);
+	if (ret)
+		goto err_notifier;
+
+	return clk;
+err_notifier:
+	clk_unregister(clk);
+err_register:
+	kfree(mmc_clock);
 	return clk;
 }
-- 
1.9.1


