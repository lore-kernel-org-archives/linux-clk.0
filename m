Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	zhengxing@rock-chips.com,
	zhangqing@rock-chips.com,
	wxt@rock-chips.com,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 2/3] clk: rockchip: add a factor clock type
Date: Thu, 28 Jan 2016 01:01:45 +0100
Message-Id: <1453939306-984-3-git-send-email-heiko@sntech.de>
In-Reply-To: <1453939306-984-1-git-send-email-heiko@sntech.de>
References: <1453939306-984-1-git-send-email-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

Add a clock type for fixed factor clocks. This allows us to define fixed
factor clocks where they appear in the clock hierarchy instead of in the
init function.

The additional factor_gate type, finally allows us to model some last
parts of the clock tree correctly.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk.c | 53 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/rockchip/clk.h | 28 ++++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index d9a0b5d..f66e277 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -260,6 +260,49 @@ static struct clk *rockchip_clk_register_frac_branch(const char *name,
 	return clk;
 }
 
+static struct clk *rockchip_clk_register_factor_branch(const char *name,
+		const char *const *parent_names, u8 num_parents,
+		void __iomem *base, unsigned int mult, unsigned int div,
+		int gate_offset, u8 gate_shift, u8 gate_flags,
+		unsigned long flags, spinlock_t *lock)
+{
+	struct clk *clk;
+	struct clk_gate *gate = NULL;
+	struct clk_fixed_factor *fix = NULL;
+
+	/* without gate, register a simple factor clock */
+	if (gate_offset == 0) {
+		return clk_register_fixed_factor(NULL, name,
+				parent_names[0], flags, mult,
+				div);
+	}
+
+	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
+	if (!gate)
+		return ERR_PTR(-ENOMEM);
+
+	gate->flags = gate_flags;
+	gate->reg = base + gate_offset;
+	gate->bit_idx = gate_shift;
+	gate->lock = lock;
+
+	fix = kzalloc(sizeof(*fix), GFP_KERNEL);
+	if (!fix) {
+		kfree(gate);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	fix->mult = mult;
+	fix->div = div;
+
+	clk = clk_register_composite(NULL, name, parent_names, num_parents,
+				     NULL, NULL,
+				     &fix->hw, &clk_fixed_factor_ops,
+				     &gate->hw, &clk_gate_ops, flags);
+
+	return clk;
+}
+
 static DEFINE_SPINLOCK(clk_lock);
 static struct clk **clk_table;
 static void __iomem *reg_base;
@@ -395,6 +438,16 @@ void __init rockchip_clk_register_branches(
 				reg_base + list->muxdiv_offset,
 				list->div_shift, list->div_flags, &clk_lock);
 			break;
+		case branch_factor:
+			flags |= CLK_SET_RATE_PARENT;
+
+			clk = rockchip_clk_register_factor_branch(
+				list->name, list->parent_names,
+				list->num_parents, reg_base,
+				list->div_shift, list->div_width,
+				list->gate_offset, list->gate_shift,
+				list->gate_flags, flags, &clk_lock);
+			break;
 		}
 
 		/* none of the cases above matched */
diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index ff8bd23..39c198b 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -254,6 +254,7 @@ enum rockchip_clk_branch_type {
 	branch_gate,
 	branch_mmc,
 	branch_inverter,
+	branch_factor,
 };
 
 struct rockchip_clk_branch {
@@ -508,6 +509,33 @@ struct rockchip_clk_branch {
 		.div_flags	= if,				\
 	}
 
+#define FACTOR(_id, cname, pname,  f, fm, fd)			\
+	{							\
+		.id		= _id,				\
+		.branch_type	= branch_factor,		\
+		.name		= cname,			\
+		.parent_names	= (const char *[]){ pname },	\
+		.num_parents	= 1,				\
+		.flags		= f,				\
+		.div_shift	= fm,				\
+		.div_width	= fd,				\
+	}
+
+#define FACTOR_GATE(_id, cname, pname,  f, fm, fd, go, gb, gf)	\
+	{							\
+		.id		= _id,				\
+		.branch_type	= branch_factor,		\
+		.name		= cname,			\
+		.parent_names	= (const char *[]){ pname },	\
+		.num_parents	= 1,				\
+		.flags		= f,				\
+		.div_shift	= fm,				\
+		.div_width	= fd,				\
+		.gate_offset	= go,				\
+		.gate_shift	= gb,				\
+		.gate_flags	= gf,				\
+	}
+
 void rockchip_clk_init(struct device_node *np, void __iomem *base,
 		       unsigned long nr_clks);
 struct regmap *rockchip_clk_get_grf(void);
-- 
2.6.4
