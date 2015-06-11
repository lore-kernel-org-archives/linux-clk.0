Return-Path: <dan.carpenter@oracle.com>
Date: Thu, 11 Jun 2015 18:20:46 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Mike Turquette <mturquette@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Carlo Caione <carlo@endlessm.com>,
        linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [patch] clk: meson: add some error handling in
 meson_clk_register_cpu()
Message-ID: <20150611152046.GG12192@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-clk.vger.kernel.org>

This error handling hopefully isn't needed but it make the static
checkers happy.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/clk/meson/clk-cpu.c b/drivers/clk/meson/clk-cpu.c
index 148e99f..71ad493 100644
--- a/drivers/clk/meson/clk-cpu.c
+++ b/drivers/clk/meson/clk-cpu.c
@@ -213,22 +213,30 @@ struct clk *meson_clk_register_cpu(const struct clk_conf *clk_conf,
 	if (!pclk) {
 		pr_err("%s: could not lookup parent clock %s\n",
 				__func__, clk_conf->clks_parent[0]);
-		return ERR_PTR(-EINVAL);
+		ret = -EINVAL;
+		goto free_clk;
 	}
 
 	ret = clk_notifier_register(pclk, &clk_cpu->clk_nb);
 	if (ret) {
 		pr_err("%s: failed to register clock notifier for %s\n",
 				__func__, clk_conf->clk_name);
-		return ERR_PTR(-EINVAL);
+		goto free_clk;
 	}
 
 	clk = clk_register(NULL, &clk_cpu->hw);
 	if (IS_ERR(clk)) {
-		clk_notifier_unregister(pclk, &clk_cpu->clk_nb);
-		kfree(clk_cpu);
+		ret = PTR_ERR(clk);
+		goto unregister_clk_nb;
 	}
 
 	return clk;
+
+unregister_clk_nb:
+	clk_notifier_unregister(pclk, &clk_cpu->clk_nb);
+free_clk:
+	kfree(clk_cpu);
+
+	return ERR_PTR(ret);
 }
 
