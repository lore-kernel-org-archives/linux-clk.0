Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: check ops pointer on clock register
Date: Mon, 18 Dec 2017 18:00:07 +0100
Message-Id: <20171218170007.28042-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Nothing really prevents a provider from (trying to) register a clock
without providing the clock ops structure.

We do check the individual fields before using them, but not the
structure pointer itself. This may have the usual nasty consequences when
the pointer is dereferenced, mostly likely when checking one the field
during the initialization.

This is fixed by returning an error on clock register if the ops pointer
is NULL

Fixes: b2476490ef11 ("clk: introduce the common clock framework")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

Mike, Stephen,

I'm not really sure what the Fixes tag should here. From what I could
see, we never checked the ops pointer before using it since the
beginning of CCF.

Regards
Jerome

 drivers/clk/clk.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 8a1860a36c77..275b45664227 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2683,7 +2683,13 @@ struct clk *clk_register(struct device *dev, struct clk_hw *hw)
 		ret = -ENOMEM;
 		goto fail_name;
 	}
+
+	if (!hw->init->ops) {
+		ret = -EINVAL;
+		goto fail_ops;
+	}
 	core->ops = hw->init->ops;
+
 	if (dev && pm_runtime_enabled(dev))
 		core->dev = dev;
 	if (dev && dev->driver)
@@ -2745,6 +2751,7 @@ struct clk *clk_register(struct device *dev, struct clk_hw *hw)
 		kfree_const(core->parent_names[i]);
 	kfree(core->parent_names);
 fail_parent_names:
+fail_ops:
 	kfree_const(core->name);
 fail_name:
 	kfree(core);
-- 
2.14.3
