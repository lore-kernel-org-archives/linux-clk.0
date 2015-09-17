Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Javier Martinez Canillas <javier@osg.samsung.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Gregory CLEMENT <gregory.clement@free-electrons.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Jason Cooper <jason@lakedaemon.net>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	linux-clk@vger.kernel.org, Leo Yan <leo.yan@linaro.org>
Subject: [PATCH] clk: Remove unneeded semicolons
Date: Thu, 17 Sep 2015 15:49:29 +0200
Message-Id: <1442497769-7721-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

There are cleary typo errors so can be removed.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

 drivers/clk/clk.c                       | 2 +-
 drivers/clk/hisilicon/clk-hi6220-stub.c | 2 +-
 drivers/clk/mvebu/common.c              | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 43e2c3ad6c31..a66a6d433b1f 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1685,7 +1685,7 @@ static struct clk_core *__clk_init_parent(struct clk_core *core)
 			"%s: multi-parent clocks must implement .get_parent\n",
 			__func__);
 		goto out;
-	};
+	}
 
 	/*
 	 * Do our best to cache parent clocks in core->parents.  This prevents
diff --git a/drivers/clk/hisilicon/clk-hi6220-stub.c b/drivers/clk/hisilicon/clk-hi6220-stub.c
index 2c4add11c1ca..8afb40ef40ce 100644
--- a/drivers/clk/hisilicon/clk-hi6220-stub.c
+++ b/drivers/clk/hisilicon/clk-hi6220-stub.c
@@ -230,7 +230,7 @@ static int hi6220_stub_clk_probe(struct platform_device *pdev)
 	if (IS_ERR(stub_clk->mbox)) {
 		dev_err(dev, "failed get mailbox channel\n");
 		return PTR_ERR(stub_clk->mbox);
-	};
+	}
 
 	init.name = "acpu0";
 	init.ops = &hi6220_stub_clk_ops;
diff --git a/drivers/clk/mvebu/common.c b/drivers/clk/mvebu/common.c
index 4a22429cd7a2..28aac67e7b92 100644
--- a/drivers/clk/mvebu/common.c
+++ b/drivers/clk/mvebu/common.c
@@ -165,7 +165,7 @@ void __init mvebu_coreclk_setup(struct device_node *np,
 		clk_data.clks[2+n] = clk_register_fixed_factor(NULL, rclk_name,
 				       cpuclk_name, 0, mult, div);
 		WARN_ON(IS_ERR(clk_data.clks[2+n]));
-	};
+	}
 
 	/* Register optional refclk */
 	if (desc->get_refclk_freq) {
-- 
2.4.3

