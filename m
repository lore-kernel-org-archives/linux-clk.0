Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 2/9] clk: at91: Remove impossible checks for of_clk_get_parent_count()
Date: Mon, 22 Feb 2016 12:54:40 -0800
Message-Id: <1456174487-28397-3-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456174487-28397-1-git-send-email-sboyd@codeaurora.org>
References: <1456174487-28397-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

These checks for < 0 are impossible now that
of_clk_get_parent_count() returns an unsigned int. Change the
checks for == 0 and update the type.

Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/at91/clk-generated.c    | 4 ++--
 drivers/clk/at91/clk-main.c         | 4 ++--
 drivers/clk/at91/clk-master.c       | 4 ++--
 drivers/clk/at91/clk-programmable.c | 4 ++--
 drivers/clk/at91/clk-slow.c         | 6 +++---
 drivers/clk/at91/clk-smd.c          | 4 ++--
 drivers/clk/at91/clk-usb.c          | 4 ++--
 7 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/at91/clk-generated.c b/drivers/clk/at91/clk-generated.c
index abc80949e1dd..f82b16a65dee 100644
--- a/drivers/clk/at91/clk-generated.c
+++ b/drivers/clk/at91/clk-generated.c
@@ -268,13 +268,13 @@ void __init of_sama5d2_clk_generated_setup(struct device_node *np,
 	u32 id;
 	const char *name;
 	struct clk *clk;
-	int num_parents;
+	unsigned int num_parents;
 	const char *parent_names[GENERATED_SOURCE_MAX];
 	struct device_node *gcknp;
 	struct clk_range range = CLK_RANGE(0, 0);
 
 	num_parents = of_clk_get_parent_count(np);
-	if (num_parents <= 0 || num_parents > GENERATED_SOURCE_MAX)
+	if (num_parents == 0 || num_parents > GENERATED_SOURCE_MAX)
 		return;
 
 	of_clk_parent_fill(np, parent_names, num_parents);
diff --git a/drivers/clk/at91/clk-main.c b/drivers/clk/at91/clk-main.c
index fd7247deabdc..b85f43529396 100644
--- a/drivers/clk/at91/clk-main.c
+++ b/drivers/clk/at91/clk-main.c
@@ -611,12 +611,12 @@ void __init of_at91sam9x5_clk_main_setup(struct device_node *np,
 {
 	struct clk *clk;
 	const char *parent_names[2];
-	int num_parents;
+	unsigned int num_parents;
 	unsigned int irq;
 	const char *name = np->name;
 
 	num_parents = of_clk_get_parent_count(np);
-	if (num_parents <= 0 || num_parents > 2)
+	if (num_parents == 0 || num_parents > 2)
 		return;
 
 	of_clk_parent_fill(np, parent_names, num_parents);
diff --git a/drivers/clk/at91/clk-master.c b/drivers/clk/at91/clk-master.c
index 620ea323356b..016fe110b5ba 100644
--- a/drivers/clk/at91/clk-master.c
+++ b/drivers/clk/at91/clk-master.c
@@ -221,14 +221,14 @@ of_at91_clk_master_setup(struct device_node *np, struct at91_pmc *pmc,
 			 const struct clk_master_layout *layout)
 {
 	struct clk *clk;
-	int num_parents;
+	unsigned int num_parents;
 	unsigned int irq;
 	const char *parent_names[MASTER_SOURCE_MAX];
 	const char *name = np->name;
 	struct clk_master_characteristics *characteristics;
 
 	num_parents = of_clk_get_parent_count(np);
-	if (num_parents <= 0 || num_parents > MASTER_SOURCE_MAX)
+	if (num_parents == 0 || num_parents > MASTER_SOURCE_MAX)
 		return;
 
 	of_clk_parent_fill(np, parent_names, num_parents);
diff --git a/drivers/clk/at91/clk-programmable.c b/drivers/clk/at91/clk-programmable.c
index 14b270b85fec..b955fb81876f 100644
--- a/drivers/clk/at91/clk-programmable.c
+++ b/drivers/clk/at91/clk-programmable.c
@@ -232,13 +232,13 @@ of_at91_clk_prog_setup(struct device_node *np, struct at91_pmc *pmc,
 	int num;
 	u32 id;
 	struct clk *clk;
-	int num_parents;
+	unsigned int num_parents;
 	const char *parent_names[PROG_SOURCE_MAX];
 	const char *name;
 	struct device_node *progclknp;
 
 	num_parents = of_clk_get_parent_count(np);
-	if (num_parents <= 0 || num_parents > PROG_SOURCE_MAX)
+	if (num_parents == 0 || num_parents > PROG_SOURCE_MAX)
 		return;
 
 	of_clk_parent_fill(np, parent_names, num_parents);
diff --git a/drivers/clk/at91/clk-slow.c b/drivers/clk/at91/clk-slow.c
index 6f99a530ead6..67b304726d06 100644
--- a/drivers/clk/at91/clk-slow.c
+++ b/drivers/clk/at91/clk-slow.c
@@ -366,11 +366,11 @@ void __init of_at91sam9x5_clk_slow_setup(struct device_node *np,
 {
 	struct clk *clk;
 	const char *parent_names[2];
-	int num_parents;
+	unsigned int num_parents;
 	const char *name = np->name;
 
 	num_parents = of_clk_get_parent_count(np);
-	if (num_parents <= 0 || num_parents > 2)
+	if (num_parents == 0 || num_parents > 2)
 		return;
 
 	of_clk_parent_fill(np, parent_names, num_parents);
@@ -437,7 +437,7 @@ void __init of_at91sam9260_clk_slow_setup(struct device_node *np,
 {
 	struct clk *clk;
 	const char *parent_names[2];
-	int num_parents;
+	unsigned int num_parents;
 	const char *name = np->name;
 
 	num_parents = of_clk_get_parent_count(np);
diff --git a/drivers/clk/at91/clk-smd.c b/drivers/clk/at91/clk-smd.c
index a7f8501cfa05..f525830ed5a1 100644
--- a/drivers/clk/at91/clk-smd.c
+++ b/drivers/clk/at91/clk-smd.c
@@ -145,12 +145,12 @@ void __init of_at91sam9x5_clk_smd_setup(struct device_node *np,
 					struct at91_pmc *pmc)
 {
 	struct clk *clk;
-	int num_parents;
+	unsigned int num_parents;
 	const char *parent_names[SMD_SOURCE_MAX];
 	const char *name = np->name;
 
 	num_parents = of_clk_get_parent_count(np);
-	if (num_parents <= 0 || num_parents > SMD_SOURCE_MAX)
+	if (num_parents == 0 || num_parents > SMD_SOURCE_MAX)
 		return;
 
 	of_clk_parent_fill(np, parent_names, num_parents);
diff --git a/drivers/clk/at91/clk-usb.c b/drivers/clk/at91/clk-usb.c
index 8ab8502778a2..be1c7f531837 100644
--- a/drivers/clk/at91/clk-usb.c
+++ b/drivers/clk/at91/clk-usb.c
@@ -373,12 +373,12 @@ void __init of_at91sam9x5_clk_usb_setup(struct device_node *np,
 					struct at91_pmc *pmc)
 {
 	struct clk *clk;
-	int num_parents;
+	unsigned int num_parents;
 	const char *parent_names[USB_SOURCE_MAX];
 	const char *name = np->name;
 
 	num_parents = of_clk_get_parent_count(np);
-	if (num_parents <= 0 || num_parents > USB_SOURCE_MAX)
+	if (num_parents == 0 || num_parents > USB_SOURCE_MAX)
 		return;
 
 	of_clk_parent_fill(np, parent_names, num_parents);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
