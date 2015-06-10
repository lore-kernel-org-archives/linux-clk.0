Return-Path: <dinguyen@opensource.altera.com>
From: <dinguyen@opensource.altera.com>
To: <sboyd@codeaurora.org>, <mturquette@linaro.org>
CC: <dinh.linux@gmail.com>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: [PATCH 2/6] clk: qoriq: make use of of_clk_parent_fill helper function
Date: Wed, 10 Jun 2015 16:49:21 -0500
Message-ID: <1433972965-24974-3-git-send-email-dinguyen@opensource.altera.com>
In-Reply-To: <1433972965-24974-1-git-send-email-dinguyen@opensource.altera.com>
References: <1433972965-24974-1-git-send-email-dinguyen@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: dinguyen@opensource.altera.com
List-ID: <linux-clk.vger.kernel.org>

From: Dinh Nguyen <dinguyen@opensource.altera.com>

Use of_clk_parent_fill to fill in the parent clock names' array.

Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
---
 drivers/clk/clk-qoriq.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-qoriq.c b/drivers/clk/clk-qoriq.c
index cda90a9..d3f4570 100644
--- a/drivers/clk/clk-qoriq.c
+++ b/drivers/clk/clk-qoriq.c
@@ -70,7 +70,7 @@ static void __init core_mux_init(struct device_node *np)
 	struct clk_init_data init;
 	struct cmux_clk *cmux_clk;
 	struct device_node *node;
-	int rc, count, i;
+	int rc, count;
 	u32	offset;
 	const char *clk_name;
 	const char **parent_names;
@@ -92,8 +92,7 @@ static void __init core_mux_init(struct device_node *np)
 	if (!parent_names)
 		return;
 
-	for (i = 0; i < count; i++)
-		parent_names[i] = of_clk_get_parent_name(np, i);
+	of_clk_parent_fill(np, parent_names, count);
 
 	cmux_clk = kzalloc(sizeof(*cmux_clk), GFP_KERNEL);
 	if (!cmux_clk)
-- 
2.2.1
