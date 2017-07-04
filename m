Return-Path: <robdclark@gmail.com>
Return-Path: <robdclark@gmail.com>
From: Rob Clark <robdclark@gmail.com>
To: linux-clk@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Stephen Boyd <sboyd@codeaurora.org>,
	Archit Taneja <architt@codeaurora.org>,
	Mike Turquette <mturquette@baylibre.com>,
	rnayak@codeaurora.org,
	Rob Clark <robdclark@gmail.com>
Subject: [RFC] clk: inherit display clocks enabled by bootloader
Date: Tue,  4 Jul 2017 13:51:17 -0400
Message-Id: <20170704175117.8636-1-robdclark@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

The goal here is to support inheriting a display setup by bootloader,
although there may also be some non-display related use-cases.

Rough idea is to add a flag for clks and power domains that might
already be enabled when kernel starts, and make corresponding fixups
to clk enable/prepare_count and power-domain state so that these are
not automatically disabled late in boot.

If bootloader is enabling display, and kernel is using efifb before
real display driver is loaded (potentially from kernel module after
userspace starts, in a typical distro kernel), we don't want to kill
the clocks and power domains that are used by the display before
userspace starts.

Second part will be (*waves hands*) for drm/msm to check if display
related clocks are enabled when it is loaded, and if so use drm
atomic framework's hooks to read back hw state to sync existing
display state w/ software state, and skip the initial clk_enable.
Therefore inheriting the enable done by bootloader.

Obviously this should be split up into multiple patches and many
TODOs addressed.  But I guess this is enough for now to start
discussing the approach, and in particular how drm and clock/pd
drivers work together to handle handover from bootloader.

The CLK_INHERIT_BOOTLOADER and related gsdc flag should only be set
on leaf nodes.
---
A bit hacky right now, but display survives clk_disable_unused()
and genpd_power_off_unused().  It hangs just after that late in
boot, which I'm still debugging (might be unrelated shenanigans).
And haven't started on the drm/msm side of this.  But I figured
it was half baked enough to send out for comments/ideas, or to
see if anyone had some different idea about how to solve this.

 drivers/clk/clk.c              | 18 ++++++++++++++++++
 drivers/clk/qcom/common.c      | 28 ++++++++++++++++++++++++++++
 drivers/clk/qcom/gcc-msm8916.c | 15 ++++++++-------
 drivers/clk/qcom/gdsc.c        |  9 +++++++++
 drivers/clk/qcom/gdsc.h        |  1 +
 include/linux/clk-provider.h   |  1 +
 include/linux/clk.h            |  9 +++++++++
 7 files changed, 74 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index fc58c52..7c84e8d 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -796,6 +796,24 @@ static void clk_disable_unused_subtree(struct clk_core *core)
 		clk_core_disable_unprepare(core->parent);
 }
 
+/* clock and it's parents are already prepared/enabled from bootloader,
+ * so simply record the fact.
+ */
+static void __clk_inherit_enabled(struct clk_core *core)
+{
+	core->enable_count++;
+	core->prepare_count++;
+if (core->hw->init->name) // XXX hack.. something funny with xo/xo_board..
+	if (core->parent)
+		__clk_inherit_enabled(core->parent);
+}
+
+void clk_inherit_enabled(struct clk *clk)
+{
+	__clk_inherit_enabled(clk->core);
+}
+EXPORT_SYMBOL_GPL(clk_inherit_enabled);
+
 static bool clk_ignore_unused;
 static int __init clk_ignore_unused_setup(char *__unused)
 {
diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index d523991..90b698c 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -11,6 +11,7 @@
  * GNU General Public License for more details.
  */
 
+#include <linux/clk.h>
 #include <linux/export.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
@@ -258,6 +259,33 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 	if (ret)
 		return ret;
 
+	/* Check which of clocks that we inherit state from bootloader
+	 * are enabled, and fixup enable/prepare state (as well as that
+	 * of it's parents).
+	 *
+	 * TODO can we assume that parents coming from another clk
+	 * driver are already registered?
+	 */
+	for (i = 0; i < num_clks; i++) {
+		struct clk_hw *hw;
+
+		if (!rclks[i])
+			continue;
+
+		hw = &rclks[i]->hw;
+
+		if (!(hw->init->flags & CLK_INHERIT_BOOTLOADER))
+			continue;
+
+		if (!clk_is_enabled_regmap(hw))
+			continue;
+
+		dev_dbg(dev, "%s is enabled from bootloader!\n",
+			  hw->init->name);
+
+		clk_inherit_enabled(hw->clk);
+	}
+
 	reset = &cc->reset;
 	reset->rcdev.of_node = dev->of_node;
 	reset->rcdev.ops = &qcom_reset_ops;
diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index 628e6ca..eca64f7 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -2467,7 +2467,7 @@ static struct clk_branch gcc_mdss_ahb_clk = {
 				"pcnoc_bfdcd_clk_src",
 			},
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
+			.flags = CLK_SET_RATE_PARENT | CLK_INHERIT_BOOTLOADER,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2484,7 +2484,7 @@ static struct clk_branch gcc_mdss_axi_clk = {
 				"system_noc_bfdcd_clk_src",
 			},
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
+			.flags = CLK_SET_RATE_PARENT | CLK_INHERIT_BOOTLOADER,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2501,7 +2501,7 @@ static struct clk_branch gcc_mdss_byte0_clk = {
 				"byte0_clk_src",
 			},
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
+			.flags = CLK_SET_RATE_PARENT | CLK_INHERIT_BOOTLOADER,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2518,7 +2518,7 @@ static struct clk_branch gcc_mdss_esc0_clk = {
 				"esc0_clk_src",
 			},
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
+			.flags = CLK_SET_RATE_PARENT | CLK_INHERIT_BOOTLOADER,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2535,7 +2535,7 @@ static struct clk_branch gcc_mdss_mdp_clk = {
 				"mdp_clk_src",
 			},
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
+			.flags = CLK_SET_RATE_PARENT | CLK_INHERIT_BOOTLOADER,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2552,7 +2552,7 @@ static struct clk_branch gcc_mdss_pclk0_clk = {
 				"pclk0_clk_src",
 			},
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
+			.flags = CLK_SET_RATE_PARENT | CLK_INHERIT_BOOTLOADER,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2569,7 +2569,7 @@ static struct clk_branch gcc_mdss_vsync_clk = {
 				"vsync_clk_src",
 			},
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
+			.flags = CLK_SET_RATE_PARENT | CLK_INHERIT_BOOTLOADER,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -3059,6 +3059,7 @@ static struct gdsc mdss_gdsc = {
 		.name = "mdss",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = INHERIT_BL,
 };
 
 static struct gdsc jpeg_gdsc = {
diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index a4f3580..a1cf482 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -331,6 +331,15 @@ int gdsc_register(struct gdsc_desc *desc,
 		if (ret)
 			return ret;
 		data->domains[i] = &scs[i]->pd;
+
+		// TODO how do we tell if it is actually active?  If it is not
+		// really active and we do this, it won't be enabled when
+		// driver wants it!
+		//
+		// TODO figure out how powerdomain state is refcnted so we
+		// can properly tell genpd that the domain is in use.
+		if (scs[i]->flags & INHERIT_BL)
+			data->domains[i]->flags |= GENPD_FLAG_ALWAYS_ON;
 	}
 
 	/* Add subdomains */
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index 3964834..3b5e64b 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -53,6 +53,7 @@ struct gdsc {
 #define VOTABLE		BIT(0)
 #define CLAMP_IO	BIT(1)
 #define HW_CTRL		BIT(2)
+#define INHERIT_BL	BIT(3)
 	struct reset_controller_dev	*rcdev;
 	unsigned int			*resets;
 	unsigned int			reset_count;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index a428aec..7790382 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -35,6 +35,7 @@
 #define CLK_IS_CRITICAL		BIT(11) /* do not gate, ever */
 /* parents need enable during gate/ungate, set rate and re-parent */
 #define CLK_OPS_PARENT_ENABLE	BIT(12)
+#define CLK_INHERIT_BOOTLOADER	BIT(13) /* clk may be enabled from bootloader */
 
 struct clk;
 struct clk_hw;
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 024cd07..43003e9 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -295,6 +295,15 @@ int clk_enable(struct clk *clk);
 void clk_disable(struct clk *clk);
 
 /**
+ * clk_inherit_enabled - update the enable/prepare count of a clock and it's
+ * parents for clock enabled by bootloader.
+ *
+ * Intended to be used by clock drivers to inform the clk core of a clock
+ * that is already running.
+ */
+void clk_inherit_enabled(struct clk *clk);
+
+/**
  * clk_get_rate - obtain the current clock rate (in Hz) for a clock source.
  *		  This is only valid once the clock source has been enabled.
  * @clk: clock source
-- 
2.9.4
