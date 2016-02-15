Return-Path: <shawn.lin@rock-chips.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 1/6] clk: rockchip: handle alt_parent in err cases when registering cpuclk
Date: Mon, 15 Feb 2016 11:33:15 +0800
Message-Id: <1455507195-12955-1-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1455507153-12914-1-git-send-email-shawn.lin@rock-chips.com>
References: <1455507153-12914-1-git-send-email-shawn.lin@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

Add clk_disable_unprepare to handle cpuclk->alt_parent if
rockchip_clk_register_cpuclk fails.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

---

 drivers/clk/rockchip/clk-cpu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-cpu.c b/drivers/clk/rockchip/clk-cpu.c
index d07374f..68a2a87 100644
--- a/drivers/clk/rockchip/clk-cpu.c
+++ b/drivers/clk/rockchip/clk-cpu.c
@@ -290,14 +290,14 @@ struct clk *rockchip_clk_register_cpuclk(const char *name,
 		pr_err("%s: could not lookup parent clock %s\n",
 		       __func__, parent_names[0]);
 		ret = -EINVAL;
-		goto free_cpuclk;
+		goto free_alt_parent;
 	}
 
 	ret = clk_notifier_register(clk, &cpuclk->clk_nb);
 	if (ret) {
 		pr_err("%s: failed to register clock notifier for %s\n",
 				__func__, name);
-		goto free_cpuclk;
+		goto free_alt_parent;
 	}
 
 	if (nrates > 0) {
@@ -326,6 +326,8 @@ free_rate_table:
 	kfree(cpuclk->rate_table);
 unregister_notifier:
 	clk_notifier_unregister(clk, &cpuclk->clk_nb);
+free_alt_parent:
+	clk_disable_unprepare(cpuclk->alt_parent);
 free_cpuclk:
 	kfree(cpuclk);
 	return ERR_PTR(ret);
-- 
2.3.7
