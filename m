Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH] clk: Add stubs for of_clk_*() APIs when CONFIG_OF=n
Date: Mon, 26 Oct 2015 11:58:47 -0700
Message-Id: <1445885927-17247-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Compiling the versatile clock driver with COMPILE_TEST=y and CONFIG_OF=n
leads to the following error:

   drivers/clk/versatile/clk-sp810.c: In function 'clk_sp810_of_setup':
   drivers/clk/versatile/clk-sp810.c:103:6: error: implicit declaration of
function 'of_clk_parent_fill' [-Werror=implicit-function-declaration]

Silence it by providing stubs APIs for of_clk_parent_fill().
Throw in a stub for of_clk_get_parent_count() too because we're
in the area.

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 include/linux/clk-provider.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 837cd7c7c8a7..ff7284fb37b2 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -726,6 +726,15 @@ static inline struct clk *of_clk_src_onecell_get(
 {
 	return ERR_PTR(-ENOENT);
 }
+static inline int of_clk_get_parent_count(struct device_node *np)
+{
+	return 0;
+}
+static inline int of_clk_parent_fill(struct device_node *np,
+				     const char **parents, unsigned int size)
+{
+	return 0;
+}
 static inline const char *of_clk_get_parent_name(struct device_node *np,
 						 int index)
 {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
