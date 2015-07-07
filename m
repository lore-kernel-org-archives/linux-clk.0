Return-Path: <dinguyen@opensource.altera.com>
From: <dinguyen@opensource.altera.com>
To: <sboyd@codeaurora.org>, <mturquette@linaro.org>
CC: <dinh.linux@gmail.com>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@opensource.altera.com>,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCHv2 1/6] clk: at91: make use of of_clk_parent_fill helper function
Date: Mon, 6 Jul 2015 22:59:01 -0500
Message-ID: <1436241546-16731-2-git-send-email-dinguyen@opensource.altera.com>
In-Reply-To: <1436241546-16731-1-git-send-email-dinguyen@opensource.altera.com>
References: <1436241546-16731-1-git-send-email-dinguyen@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: dinguyen@opensource.altera.com
List-ID: <linux-clk.vger.kernel.org>

From: Dinh Nguyen <dinguyen@opensource.altera.com>

Use of_clk_parent_fill to fill in the parent clock names' array.

Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/clk/at91/clk-main.c         |    7 +------
 drivers/clk/at91/clk-master.c       |    7 +------
 drivers/clk/at91/clk-programmable.c |    7 +------
 drivers/clk/at91/clk-slow.c         |   14 ++------------
 drivers/clk/at91/clk-smd.c          |    7 +------
 drivers/clk/at91/clk-usb.c          |    7 +------
 6 files changed, 7 insertions(+), 42 deletions(-)

diff --git a/drivers/clk/at91/clk-main.c b/drivers/clk/at91/clk-main.c
index c240045..13f481b 100644
--- a/drivers/clk/at91/clk-main.c
+++ b/drivers/clk/at91/clk-main.c
@@ -612,17 +612,12 @@ void __init of_at91sam9x5_clk_main_setup(struct device_node *np,
 	int num_parents;
 	unsigned int irq;
 	const char *name = np->name;
-	int i;
 
 	num_parents = of_clk_get_parent_count(np);
 	if (num_parents <= 0 || num_parents > 2)
 		return;
 
-	for (i = 0; i < num_parents; ++i) {
-		parent_names[i] = of_clk_get_parent_name(np, i);
-		if (!parent_names[i])
-			return;
-	}
+	of_clk_parent_fill(np, parent_names, num_parents);
 
 	of_property_read_string(np, "clock-output-names", &name);
 
diff --git a/drivers/clk/at91/clk-master.c b/drivers/clk/at91/clk-master.c
index f98eafe..38f646d 100644
--- a/drivers/clk/at91/clk-master.c
+++ b/drivers/clk/at91/clk-master.c
@@ -218,7 +218,6 @@ of_at91_clk_master_setup(struct device_node *np, struct at91_pmc *pmc,
 {
 	struct clk *clk;
 	int num_parents;
-	int i;
 	unsigned int irq;
 	const char *parent_names[MASTER_SOURCE_MAX];
 	const char *name = np->name;
@@ -228,11 +227,7 @@ of_at91_clk_master_setup(struct device_node *np, struct at91_pmc *pmc,
 	if (num_parents <= 0 || num_parents > MASTER_SOURCE_MAX)
 		return;
 
-	for (i = 0; i < num_parents; ++i) {
-		parent_names[i] = of_clk_get_parent_name(np, i);
-		if (!parent_names[i])
-			return;
-	}
+	of_clk_parent_fill(np, parent_names, num_parents);
 
 	of_property_read_string(np, "clock-output-names", &name);
 
diff --git a/drivers/clk/at91/clk-programmable.c b/drivers/clk/at91/clk-programmable.c
index 8c86c0f..21492ac 100644
--- a/drivers/clk/at91/clk-programmable.c
+++ b/drivers/clk/at91/clk-programmable.c
@@ -230,7 +230,6 @@ of_at91_clk_prog_setup(struct device_node *np, struct at91_pmc *pmc,
 {
 	int num;
 	u32 id;
-	int i;
 	struct clk *clk;
 	int num_parents;
 	const char *parent_names[PROG_SOURCE_MAX];
@@ -241,11 +240,7 @@ of_at91_clk_prog_setup(struct device_node *np, struct at91_pmc *pmc,
 	if (num_parents <= 0 || num_parents > PROG_SOURCE_MAX)
 		return;
 
-	for (i = 0; i < num_parents; ++i) {
-		parent_names[i] = of_clk_get_parent_name(np, i);
-		if (!parent_names[i])
-			return;
-	}
+	of_clk_parent_fill(np, parent_names, num_parents);
 
 	num = of_get_child_count(np);
 	if (!num || num > (PROG_ID_MAX + 1))
diff --git a/drivers/clk/at91/clk-slow.c b/drivers/clk/at91/clk-slow.c
index 98a84a8..84c19d7 100644
--- a/drivers/clk/at91/clk-slow.c
+++ b/drivers/clk/at91/clk-slow.c
@@ -371,17 +371,12 @@ void __init of_at91sam9x5_clk_slow_setup(struct device_node *np,
 	const char *parent_names[2];
 	int num_parents;
 	const char *name = np->name;
-	int i;
 
 	num_parents = of_clk_get_parent_count(np);
 	if (num_parents <= 0 || num_parents > 2)
 		return;
 
-	for (i = 0; i < num_parents; ++i) {
-		parent_names[i] = of_clk_get_parent_name(np, i);
-		if (!parent_names[i])
-			return;
-	}
+	of_clk_parent_fill(np, parent_names, num_parents);
 
 	of_property_read_string(np, "clock-output-names", &name);
 
@@ -449,17 +444,12 @@ void __init of_at91sam9260_clk_slow_setup(struct device_node *np,
 	const char *parent_names[2];
 	int num_parents;
 	const char *name = np->name;
-	int i;
 
 	num_parents = of_clk_get_parent_count(np);
 	if (num_parents != 2)
 		return;
 
-	for (i = 0; i < num_parents; ++i) {
-		parent_names[i] = of_clk_get_parent_name(np, i);
-		if (!parent_names[i])
-			return;
-	}
+	of_clk_parent_fill(np, parent_names, num_parents);
 
 	of_property_read_string(np, "clock-output-names", &name);
 
diff --git a/drivers/clk/at91/clk-smd.c b/drivers/clk/at91/clk-smd.c
index 3817ea8..a7f8501 100644
--- a/drivers/clk/at91/clk-smd.c
+++ b/drivers/clk/at91/clk-smd.c
@@ -145,7 +145,6 @@ void __init of_at91sam9x5_clk_smd_setup(struct device_node *np,
 					struct at91_pmc *pmc)
 {
 	struct clk *clk;
-	int i;
 	int num_parents;
 	const char *parent_names[SMD_SOURCE_MAX];
 	const char *name = np->name;
@@ -154,11 +153,7 @@ void __init of_at91sam9x5_clk_smd_setup(struct device_node *np,
 	if (num_parents <= 0 || num_parents > SMD_SOURCE_MAX)
 		return;
 
-	for (i = 0; i < num_parents; i++) {
-		parent_names[i] = of_clk_get_parent_name(np, i);
-		if (!parent_names[i])
-			return;
-	}
+	of_clk_parent_fill(np, parent_names, num_parents);
 
 	of_property_read_string(np, "clock-output-names", &name);
 
diff --git a/drivers/clk/at91/clk-usb.c b/drivers/clk/at91/clk-usb.c
index b0cbd2b..b3cbf45 100644
--- a/drivers/clk/at91/clk-usb.c
+++ b/drivers/clk/at91/clk-usb.c
@@ -373,7 +373,6 @@ void __init of_at91sam9x5_clk_usb_setup(struct device_node *np,
 					struct at91_pmc *pmc)
 {
 	struct clk *clk;
-	int i;
 	int num_parents;
 	const char *parent_names[USB_SOURCE_MAX];
 	const char *name = np->name;
@@ -382,11 +381,7 @@ void __init of_at91sam9x5_clk_usb_setup(struct device_node *np,
 	if (num_parents <= 0 || num_parents > USB_SOURCE_MAX)
 		return;
 
-	for (i = 0; i < num_parents; i++) {
-		parent_names[i] = of_clk_get_parent_name(np, i);
-		if (!parent_names[i])
-			return;
-	}
+	of_clk_parent_fill(np, parent_names, num_parents);
 
 	of_property_read_string(np, "clock-output-names", &name);
 
-- 
1.7.9.5
