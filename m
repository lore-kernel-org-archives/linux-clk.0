Return-Path: <maxime.ripard@free-electrons.com>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Emilio Lopez <emilio@elopez.com.ar>
Cc: linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wens@csie.org>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-clk@vger.kernel.org,
	linux-sunxi@googlegroups.com,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v4 4/5] clk: sunxi: codec clock support
Date: Mon, 12 Oct 2015 22:43:29 +0200
Message-Id: <1444682610-21482-5-git-send-email-maxime.ripard@free-electrons.com>
In-Reply-To: <1444682610-21482-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1444682610-21482-1-git-send-email-maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

From: Emilio López <emilio@elopez.com.ar>

The codec clock on sun4i, sun5i and sun7i is a simple gate with PLL2 as
parent. Add a driver for such a clock.

Signed-off-by: Emilio López <emilio@elopez.com.ar>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi/Makefile        |  1 +
 drivers/clk/sunxi/clk-a10-codec.c | 44 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 drivers/clk/sunxi/clk-a10-codec.c

diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
index c658a18ba7cb..70a449a419e6 100644
--- a/drivers/clk/sunxi/Makefile
+++ b/drivers/clk/sunxi/Makefile
@@ -3,6 +3,7 @@
 #
 
 obj-y += clk-sunxi.o clk-factors.o
+obj-y += clk-a10-codec.o
 obj-y += clk-a10-hosc.o
 obj-y += clk-a10-pll2.o
 obj-y += clk-a20-gmac.o
diff --git a/drivers/clk/sunxi/clk-a10-codec.c b/drivers/clk/sunxi/clk-a10-codec.c
new file mode 100644
index 000000000000..ac321d6a0df5
--- /dev/null
+++ b/drivers/clk/sunxi/clk-a10-codec.c
@@ -0,0 +1,44 @@
+/*
+ * Copyright 2013 Emilio López
+ *
+ * Emilio López <emilio@elopez.com.ar>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+
+#define SUN4I_CODEC_GATE	31
+
+static void __init sun4i_codec_clk_setup(struct device_node *node)
+{
+	struct clk *clk;
+	const char *clk_name = node->name, *parent_name;
+	void __iomem *reg;
+
+	reg = of_io_request_and_map(node, 0, of_node_full_name(node));
+	if (IS_ERR(reg))
+		return;
+
+	of_property_read_string(node, "clock-output-names", &clk_name);
+	parent_name = of_clk_get_parent_name(node, 0);
+
+	clk = clk_register_gate(NULL, clk_name, parent_name,
+				CLK_SET_RATE_PARENT, reg,
+				SUN4I_CODEC_GATE, 0, NULL);
+
+	if (!IS_ERR(clk))
+		of_clk_add_provider(node, of_clk_src_simple_get, clk);
+}
+CLK_OF_DECLARE(sun4i_codec, "allwinner,sun4i-a10-codec-clk",
+	       sun4i_codec_clk_setup);
-- 
2.5.3
