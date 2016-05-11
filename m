Return-Path: <serveralex@gmail.com>
Return-Path: <serveralex@gmail.com>
From: =?UTF-8?q?Alexander=20M=C3=BCller?= <serveralex@gmail.com>
To: mturquette@baylibre.com,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/2] ARM: clk: Amlogic: Add support for clock gates
Date: Wed, 11 May 2016 20:21:04 +0200
Message-Id: <1462990865-22651-2-git-send-email-serveralex@gmail.com>
In-Reply-To: <1462990865-22651-1-git-send-email-serveralex@gmail.com>
References: <1462990865-22651-1-git-send-email-serveralex@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Adds support to register clock gates required to enable SoC components that
are disabled by default.

Signed-off-by: Alexander Müller <serveralex@gmail.com>
---
 drivers/clk/meson/clkc.c | 18 ++++++++++++++++++
 drivers/clk/meson/clkc.h | 18 ++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/clk/meson/clkc.c b/drivers/clk/meson/clkc.c
index d920d41..a7a14a2 100644
--- a/drivers/clk/meson/clkc.c
+++ b/drivers/clk/meson/clkc.c
@@ -197,6 +197,20 @@ meson_clk_register_fixed_rate(const struct clk_conf *clk_conf,
 	return clk;
 }
 
+static struct clk * __init
+meson_clk_register_gate(const struct clk_conf *clk_conf,
+			      void __iomem *clk_base, spinlock_t *lock)
+{
+	return clk_register_gate(NULL, clk_conf->clk_name,
+			clk_conf->num_parents
+				? clk_conf->clks_parent[0] : NULL,
+			clk_conf->flags,
+			clk_base + clk_conf->reg_off,
+			clk_conf->conf.gate.bit_idx,
+			0,
+			lock);
+}
+
 void __init meson_clk_register_clks(const struct clk_conf *clk_confs,
 				    unsigned int nr_confs,
 				    void __iomem *clk_base)
@@ -228,6 +242,10 @@ void __init meson_clk_register_clks(const struct clk_conf *clk_confs,
 			clk = meson_clk_register_pll(clk_conf, clk_base,
 						     &clk_lock);
 			break;
+		case CLK_GATE:
+			clk = meson_clk_register_gate(clk_conf, clk_base,
+							 &clk_lock);
+			break;
 		default:
 			clk = NULL;
 		}
diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
index 609ae92..944a50b 100644
--- a/drivers/clk/meson/clkc.h
+++ b/drivers/clk/meson/clkc.h
@@ -85,6 +85,10 @@ struct composite_conf {
 	u8			gate_flags;
 };
 
+struct gate_conf {
+	u8			bit_idx;
+};
+
 #define PNAME(x) static const char *x[]
 
 enum clk_type {
@@ -93,6 +97,7 @@ enum clk_type {
 	CLK_COMPOSITE,
 	CLK_CPU,
 	CLK_PLL,
+	CLK_GATE,
 };
 
 struct clk_conf {
@@ -109,6 +114,7 @@ struct clk_conf {
 		const struct composite_conf		*composite;
 		struct pll_conf			*pll;
 		const struct clk_div_table	*div_table;
+		const struct gate_conf		gate;
 	} conf;
 };
 
@@ -176,6 +182,18 @@ struct clk_conf {
 		.conf.composite			= (_c),			\
 	}								\
 
+#define GATE(_ro, _ci, _cn, _cp, _f, _bi)				\
+	{								\
+		.reg_off			= (_ro),		\
+		.clk_type			= CLK_GATE,		\
+		.clk_id				= (_ci),		\
+		.clk_name			= (_cn),		\
+		.clks_parent			= (_cp),		\
+		.num_parents			= ARRAY_SIZE(_cp),	\
+		.flags				= (_f),			\
+		.conf.gate.bit_idx		= (_bi),		\
+	}								\
+
 struct clk **meson_clk_init(struct device_node *np, unsigned long nr_clks);
 void meson_clk_register_clks(const struct clk_conf *clk_confs,
 			     unsigned int nr_confs, void __iomem *clk_base);
-- 
2.5.0
