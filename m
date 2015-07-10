Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	James Liao <jamesjj.liao@mediatek.com>,
	Henry Chen <henryc.chen@mediatek.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 15/45] clk: mediatek: Properly include clk.h
Date: Fri, 10 Jul 2015 16:33:13 -0700
Message-Id: <1436571223-10959-16-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

We don't need to include clk.h in header files, just forward
declare struct clk here. This leads us to a few places where the
include of clk.h was missing in C files. Add them.

Cc: James Liao <jamesjj.liao@mediatek.com>
Cc: Henry Chen <henryc.chen@mediatek.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/mediatek/clk-gate.h   | 3 ++-
 drivers/clk/mediatek/clk-mt8135.c | 1 +
 drivers/clk/mediatek/clk-mt8173.c | 1 +
 drivers/clk/mediatek/clk-mtk.h    | 3 ++-
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-gate.h b/drivers/clk/mediatek/clk-gate.h
index 6b6780b1e9c5..11e25c992948 100644
--- a/drivers/clk/mediatek/clk-gate.h
+++ b/drivers/clk/mediatek/clk-gate.h
@@ -16,9 +16,10 @@
 #define __DRV_CLK_GATE_H
 
 #include <linux/regmap.h>
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 
+struct clk;
+
 struct mtk_clk_gate {
 	struct clk_hw	hw;
 	struct regmap	*regmap;
diff --git a/drivers/clk/mediatek/clk-mt8135.c b/drivers/clk/mediatek/clk-mt8135.c
index 08b4b849b491..07c21e44b4b3 100644
--- a/drivers/clk/mediatek/clk-mt8135.c
+++ b/drivers/clk/mediatek/clk-mt8135.c
@@ -12,6 +12,7 @@
  * GNU General Public License for more details.
  */
 
+#include <linux/clk.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/slab.h>
diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
index 4b9e04cdf7e8..2e0f17be9ea0 100644
--- a/drivers/clk/mediatek/clk-mt8173.c
+++ b/drivers/clk/mediatek/clk-mt8173.c
@@ -12,6 +12,7 @@
  * GNU General Public License for more details.
  */
 
+#include <linux/clk.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/slab.h>
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 9dda9d8ad10b..624716c4776b 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -17,9 +17,10 @@
 
 #include <linux/regmap.h>
 #include <linux/bitops.h>
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 
+struct clk;
+
 #define MAX_MUX_GATE_BIT	31
 #define INVALID_MUX_GATE_BIT	(MAX_MUX_GATE_BIT + 1)
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
