Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E056499F2C;
	Thu, 17 Sep 2026 22:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789684785; cv=none; b=WOPe47HdyTad4GvjOXSQiPbcAThujX/1apRzISr8UwjI+vGT2Q0qlKi+uPjGJcAUhBb3k1vlwL5Y0q5WfDulNrr9xebrfOLV2viIRTJtaxaPVmgTrh9BxmIwzjcDpAk0QxqVqP24BBpJbrkwS7beJ4fJFmyoJinwLBmXeYgYPow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789684785; c=relaxed/simple;
	bh=PjvSF8aX3C2Twhue0G9DaSLMVFuVnydfa5TcvRKlEyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hFuOlQiQbEDhhVaaUCout+8/h1XAI52ALPn2z0nN2AZH279SGluQj2GTtHz1+x2GkMPppvqqeIkUFnnlyp64a54H7nPP0R8zmcQ4SzxBFe0Ea9B7TEPePxtZOvpDQN7c8K0BeLn96aVOJjXWlL5+xMkl8VfxOe7j1oCn4an4YZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mLcf7BnW; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mLcf7BnW"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24D352008;
	Thu, 17 Sep 2026 15:39:38 -0700 (PDT)
Received: from e142021.. (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 089AC3F86F;
	Thu, 17 Sep 2026 15:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789684781; bh=PjvSF8aX3C2Twhue0G9DaSLMVFuVnydfa5TcvRKlEyE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mLcf7BnWwgVSw3OCrrURu5scPj/RVTYmVLkmv3KBBDHy9VgPGaDXnbRRYWMKH11lO
	 gGSKlMXVEOhETQhMjFwYsLDlgwe37x+G5f7UFldrqy+7Qf+9fDFPvi4fAACA53TMu/
	 ZyFN+eL0l24uishMngM4/uu5kLOhOGRouplZqcgs=
From: Andre Przywara <andre.przywara@arm.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 4/5] clk: sunxi-ng: add support for the A523/T527 CPU CCU
Date: Fri, 18 Sep 2026 00:39:12 +0200
Message-ID: <20260917223913.1855301-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917223913.1855301-1-andre.przywara@arm.com>
References: <20260917223913.1855301-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A523 contains a separate CCU block for the CPU PLLs. This includes
one CPU clock per cluster, plus the DSU PLL, which clocks the part that
connects the two clusters. There is also a "backup" PLL, which can be used
to clock the cores when the main PLLs are reprogrammed.
Those PLLs are then connected via MUXes to the two clusters and the DSU.

Describe those clocks and their relationship, to allow the kernel to
adjust the core frequency.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/clk/sunxi-ng/Kconfig               |   5 +
 drivers/clk/sunxi-ng/Makefile              |   2 +
 drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.c | 340 +++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.h |  24 ++
 4 files changed, 371 insertions(+)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.h

diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
index 6af2d020e03e9..c34af60139124 100644
--- a/drivers/clk/sunxi-ng/Kconfig
+++ b/drivers/clk/sunxi-ng/Kconfig
@@ -67,6 +67,11 @@ config SUN55I_A523_R_CCU
 	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
+config SUN55I_A523_CPU_CCU
+	tristate "Support for the Allwinner A523/T527 CPU CCU"
+	default y
+	depends on ARM64 || COMPILE_TEST
+
 config SUN4I_A10_CCU
 	tristate "Support for the Allwinner A10/A20 CCU"
 	default ARCH_SUNXI
diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makefile
index a1c4087d72417..309ff5a089ecf 100644
--- a/drivers/clk/sunxi-ng/Makefile
+++ b/drivers/clk/sunxi-ng/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_SUN50I_H616_CCU)	+= sun50i-h616-ccu.o
 obj-$(CONFIG_SUN55I_A523_CCU)	+= sun55i-a523-ccu.o
 obj-$(CONFIG_SUN55I_A523_MCU_CCU)	+= sun55i-a523-mcu-ccu.o
 obj-$(CONFIG_SUN55I_A523_R_CCU)	+= sun55i-a523-r-ccu.o
+obj-$(CONFIG_SUN55I_A523_CPU_CCU)	+= sun55i-a523-cpu-ccu.o
 obj-$(CONFIG_SUN4I_A10_CCU)	+= sun4i-a10-ccu.o
 obj-$(CONFIG_SUN5I_CCU)		+= sun5i-ccu.o
 obj-$(CONFIG_SUN6I_A31_CCU)	+= sun6i-a31-ccu.o
@@ -64,6 +65,7 @@ sun50i-h616-ccu-y		+= ccu-sun50i-h616.o
 sun55i-a523-ccu-y		+= ccu-sun55i-a523.o
 sun55i-a523-mcu-ccu-y		+= ccu-sun55i-a523-mcu.o
 sun55i-a523-r-ccu-y		+= ccu-sun55i-a523-r.o
+sun55i-a523-cpu-ccu-y		+= ccu-sun55i-a523-cpu.o
 sun4i-a10-ccu-y			+= ccu-sun4i-a10.o
 sun5i-ccu-y			+= ccu-sun5i.o
 sun6i-a31-ccu-y			+= ccu-sun6i-a31.o
diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.c
new file mode 100644
index 0000000000000..e505aefc92370
--- /dev/null
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.c
@@ -0,0 +1,340 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023-2025 Arm Ltd.
+ *
+ * There are four PLLs: one for the little cluster (cores 0-3: PLL1), one for
+ * the "big" cluster (cores 4-7: PLL3), one for the DSU interconnect (probably
+ * its SCLK, driving the L3 cache: PLL2), and one undocumented "backup" PLL0,
+ * which can be used to drive either or both clusters, while the original PLLs
+ * are re-programmed (and re-lock).
+ * PLL[123] are the same, with a multiplier, a predivider, and two separate
+ * divider fields. For PLL1 and PLL3 there is an additional shift field, in
+ * the mux clock - although that applies only to the PLL, not the other sources.
+ * The two clusters and the DSU are connected to a mux clock each, selecting
+ * from various sources, including the PLL-PERIPH0-600M clock, again useful
+ * during DVFS operations:
+ *
+ *                           PLL-PERI0-600M (from the main CCU)
+ *                               |
+ *                       +-------+-----------+
+ *                      /         \           \
+ *            +------+ /  +------+ \  +------+ \  +------+
+ *            | PLL1 | |  | PLL0 | |  | PLL3 | |  | PLL2 |
+ *            +------+ |  +------+ |  +------+ |  +------+
+ *                \    |     ^     |    /      |     /
+ *                DIV  |    / \    |  DIV      |    /       (plus 24MHz,
+ *                  \  |   /   \   |  /        |   |              32KHz,
+ *                +---------+ +---------+   +---------+           16MHz,
+ *                 \ CPU-L /   \ CPU-B /     \  DSU  /       for each mux)
+ *                  \     /     \     /       \     /
+ *                   +---+       +---+         +---+
+ *                     |           |             |
+ *             +-------+-----------+-----DSU-----+----+
+ *             |   +---+---+   +---+---+              |
+ *             |   | cores |   | cores |              |
+ *             |   |  0-3  |   |  4-7  | +------------+
+ *             |   +-------+   +-------+ |  L3 cache  |
+ *             +-------------------------+------------+
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+
+#include "ccu_common.h"
+#include "ccu_reset.h"
+
+#include "ccu_div.h"
+#include "ccu_gate.h"
+#include "ccu_mp.h"
+#include "ccu_nm.h"
+#include "ccu_mult.h"
+
+#include <dt-bindings/clock/sun55i-a523-cpu-ccu.h>
+#include "ccu-sun55i-a523-cpu.h"
+
+/*
+ * The 24 MHz oscillator, the root of most of the clock tree.
+ * .fw_name is the string used in the DT "clock-names" property, used to
+ * identify the corresponding clock in the "clocks" property.
+ */
+static const struct clk_parent_data osc24M[] = {
+	{ .fw_name = "hosc" }
+};
+
+/*
+ * Undocumented PLL, mux-able to both clusters, usable as an interim PLL
+ * during DVFS clock rate changes. Bits [23:16] and [4:2] are RAZ/WI, which
+ * looks like the DDR or VIDEO PLLs, and not like the other CPU PLLs.
+ * Bits [1:0] are not dividers, as they don't have any effect on the frequency.
+ */
+#define SUN55I_A523_PLL_CPU_0_REG		0x00
+
+static struct ccu_mult pll_cpu_0_clk = {
+	.enable	= BIT(27),
+	.lock	= BIT(28),
+	.mult	= _SUNXI_CCU_MULT(8, 8),
+	.common	= {
+		.reg		= 0x00,
+		.hw.init	= CLK_HW_INIT_PARENTS_DATA("pll-cpu-0", osc24M,
+							   &ccu_mult_ops,
+							   CLK_SET_RATE_UNGATE),
+	},
+};
+static const struct clk_parent_data pll_cpu_0_hws[] = {
+	{ .hw = &pll_cpu_0_clk.common.hw },
+};
+
+/*
+ * The PLLs are input * N / P / (M0 * M1). Model them as NM, by ignoring the
+ * predivider P and the only 2-bit wide M0, and fixing them to 1 in probe().
+ * Using NKMP wouldn't be better, because the "P" in there is a shift.
+ * The actual enable bit is bit 31, which we set once in probe, along with
+ * some other control bits, as the manual recommends to not touch them
+ * during runtime.
+ */
+#define SUN55I_A523_PLL_CPU_L_REG		0x04
+static struct ccu_nm pll_cpu_l_clk = {
+	.enable		= BIT(27),
+	.lock		= BIT(28),
+	.n		= _SUNXI_CCU_MULT_OFFSET_MIN_MAX(8, 8, 0, 20, 108),
+	.m		= _SUNXI_CCU_DIV(0, 3),		/* M1 */
+	.common		= {
+		.reg		= 0x04,
+		.update_bits	= BIT(26),
+		.hw.init	= CLK_HW_INIT_PARENTS_DATA("pll-cpu-l", osc24M,
+							   &ccu_nm_ops,
+							   CLK_SET_RATE_UNGATE |
+							   CLK_IS_CRITICAL),
+	},
+};
+static const struct clk_parent_data pll_cpu_l_hws[] = {
+	{ .hw = &pll_cpu_l_clk.common.hw },
+};
+
+#define SUN55I_A523_PLL_CPU_DSU_REG		0x08
+static struct ccu_nm pll_cpu_dsu_clk = {
+	.enable		= BIT(27),
+	.lock		= BIT(28),
+	.n		= _SUNXI_CCU_MULT_OFFSET_MIN_MAX(8, 8, 0, 20, 108),
+	.m		= _SUNXI_CCU_DIV(0, 3),		/* M1 */
+	.common		= {
+		.reg		= 0x08,
+		.update_bits	= BIT(26),
+		.hw.init	= CLK_HW_INIT_PARENTS_DATA("pll-cpu-dsu", osc24M,
+							   &ccu_nm_ops,
+							   CLK_SET_RATE_UNGATE |
+							   CLK_IS_CRITICAL),
+	},
+};
+static const struct clk_parent_data pll_cpu_dsu_hws[] = {
+	{ .hw = &pll_cpu_dsu_clk.common.hw },
+};
+
+#define SUN55I_A523_PLL_CPU_B_REG		0x0c
+static struct ccu_nm pll_cpu_b_clk = {
+	.enable		= BIT(27),
+	.lock		= BIT(28),
+	.n		= _SUNXI_CCU_MULT_OFFSET_MIN_MAX(8, 8, 0, 20, 108),
+	.m		= _SUNXI_CCU_DIV(0, 3),		/* M1 */
+	.common		= {
+		.reg		= 0x0c,
+		.update_bits	= BIT(26),
+		.hw.init	= CLK_HW_INIT_PARENTS_DATA("pll-cpu-b", osc24M,
+							   &ccu_nm_ops,
+							   CLK_SET_RATE_UNGATE |
+							   CLK_IS_CRITICAL),
+	},
+};
+static const struct clk_parent_data pll_cpu_b_hws[] = {
+	{ .hw = &pll_cpu_b_clk.common.hw },
+};
+
+static SUNXI_CCU_MP_DATA_WITH_MUX(pll_cpu_l_div_clk, "pll-cpu-l-div",
+				  pll_cpu_l_hws, 0x060,
+				  0, 0,		/* no M */
+				  16, 2,	/* P */
+				  0, 0,		/* no mux */
+				  CLK_SET_RATE_PARENT);		/* flags */
+static SUNXI_CCU_MP_DATA_WITH_MUX(pll_cpu_b_div_clk, "pll-cpu-b-div",
+				  pll_cpu_b_hws, 0x064,
+				  0, 0,		/* no M */
+				  16, 2,	/* P */
+				  0, 0,		/* no mux */
+				  CLK_SET_RATE_PARENT);		/* flags */
+static SUNXI_CCU_MP_DATA_WITH_MUX(pll_cpu_dsu_div_clk, "pll-cpu-dsu-div",
+				  pll_cpu_dsu_hws, 0x06c,
+				  0, 0,		/* no M */
+				  16, 2,	/* P */
+				  0, 0,		/* no mux */
+				  CLK_SET_RATE_PARENT);		/* flags */
+
+static const struct clk_parent_data cpu_l_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .fw_name = "losc" },
+	{ .fw_name = "iosc" },
+	{ .hw = &pll_cpu_l_div_clk.common.hw },
+	{ .fw_name = "pll-periph0-600M" },
+	{ .hw = &pll_cpu_0_clk.common.hw },
+};
+
+static SUNXI_CCU_MUX_DATA(cpu_l_clk, "cpu-l", cpu_l_parents, 0x60,
+			  24, 3,		/* mux */
+			  CLK_SET_RATE_PARENT | CLK_IS_CRITICAL);
+
+static const struct clk_parent_data cpu_b_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .fw_name = "losc" },
+	{ .fw_name = "iosc" },
+	{ .hw = &pll_cpu_b_div_clk.common.hw },
+	{ .fw_name = "pll-periph0-600M" },
+	{ .hw = &pll_cpu_0_clk.common.hw },
+};
+
+static SUNXI_CCU_MUX_DATA(cpu_b_clk, "cpu-b", cpu_b_parents, 0x64,
+			  24, 3,		/* mux */
+			  CLK_SET_RATE_PARENT | CLK_IS_CRITICAL);
+
+/*
+ * Register 0x68 holds gate bits for the two cluster clocks and the DSU.
+ * We leave them alone in the kernel, that's something for TF-A or the SCP.
+ */
+
+static const struct clk_parent_data cpu_dsu_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .fw_name = "losc" },
+	{ .fw_name = "iosc" },
+	{ .hw = &pll_cpu_dsu_div_clk.common.hw },
+	{ .fw_name = "pll-periph0-2x" },
+	{ .fw_name = "pll-periph0-600M" },
+};
+
+static SUNXI_CCU_MUX_DATA(cpu_dsu_clk, "cpu-dsu", cpu_dsu_parents, 0x6c,
+			  24, 3,		/* mux */
+			  CLK_SET_RATE_PARENT | CLK_IS_CRITICAL);
+
+static struct ccu_common *sun55i_a523_cpu_ccu_clks[] = {
+	&pll_cpu_0_clk.common,
+	&pll_cpu_l_clk.common,
+	&pll_cpu_b_clk.common,
+	&pll_cpu_dsu_clk.common,
+	&pll_cpu_l_div_clk.common,
+	&pll_cpu_b_div_clk.common,
+	&pll_cpu_dsu_div_clk.common,
+	&cpu_l_clk.common,
+	&cpu_b_clk.common,
+	&cpu_dsu_clk.common,
+};
+
+static struct clk_hw_onecell_data sun55i_a523_cpu_hw_clks = {
+	.hws	= {
+		[CLK_PLL_CPU_0]		= &pll_cpu_0_clk.common.hw,
+		[CLK_PLL_CPU_L]		= &pll_cpu_l_clk.common.hw,
+		[CLK_PLL_CPU_DSU]	= &pll_cpu_dsu_clk.common.hw,
+		[CLK_PLL_CPU_B]		= &pll_cpu_b_clk.common.hw,
+		[CLK_DIV_CPU_L]		= &pll_cpu_l_div_clk.common.hw,
+		[CLK_DIV_CPU_DSU]	= &pll_cpu_dsu_div_clk.common.hw,
+		[CLK_DIV_CPU_B]		= &pll_cpu_b_div_clk.common.hw,
+		[CLK_CPU_L]		= &cpu_l_clk.common.hw,
+		[CLK_CPU_DSU]		= &cpu_dsu_clk.common.hw,
+		[CLK_CPU_B]		= &cpu_b_clk.common.hw,
+	},
+	.num	= CLK_NUMBER,
+};
+
+static const struct sunxi_ccu_desc sun55i_a523_cpu_ccu_desc = {
+	.ccu_clks	= sun55i_a523_cpu_ccu_clks,
+	.num_ccu_clks	= ARRAY_SIZE(sun55i_a523_cpu_ccu_clks),
+
+	.hw_clks	= &sun55i_a523_cpu_hw_clks,
+};
+
+static const u32 pll_regs[] = {
+	SUN55I_A523_PLL_CPU_0_REG,
+	SUN55I_A523_PLL_CPU_L_REG,
+	SUN55I_A523_PLL_CPU_DSU_REG,
+	SUN55I_A523_PLL_CPU_B_REG,
+};
+
+static struct ccu_mux_nb sun55i_a523_cpu_l_nb = {
+	.common		= &cpu_l_clk.common,
+	.cm		= &cpu_l_clk.mux,
+	.delay_us	= 1, /* manual doesn't really say */
+	.bypass_index	= 4, /* PLL_PERI0@600MHz, as recommended by manual */
+};
+static struct ccu_mux_nb sun55i_a523_cpu_b_nb = {
+	.common		= &cpu_b_clk.common,
+	.cm		= &cpu_b_clk.mux,
+	.delay_us	= 1, /* manual doesn't really say */
+	.bypass_index	= 4, /* PLL_PERI0@600MHz, as recommended by manual */
+};
+
+static int sun55i_a523_cpu_ccu_probe(struct platform_device *pdev)
+{
+	const struct sunxi_ccu_desc *desc;
+	void __iomem *reg;
+	int i, ret;
+	u32 val;
+
+	desc = of_device_get_match_data(&pdev->dev);
+	if (!desc)
+		return -EINVAL;
+
+	reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(reg))
+		return PTR_ERR(reg);
+
+	/*
+	 * The user manual recommends to keep the PLLs running, and just
+	 * gate their output if they are not needed, to avoid interference
+	 * with other PLLs, since they share a power domain.
+	 * To comply with this, we use this output gate as the CCF enable bit,
+	 * so we need to enable all PLLs here. Chances are the bootloader has
+	 * already enabled at least one PLL, so check if it's already running
+	 * and locked, before touching it.
+	 * We set the enable, the LDO and the lock bits, and clear dividers.
+	 */
+	for (i = 0; i < ARRAY_SIZE(pll_regs); i++) {
+		val = readl(reg + pll_regs[i]);
+		if ((val & GENMASK(31, 28)) != GENMASK(31, 28)) {
+			val |= BIT(31) | BIT(30) | BIT(29) | BIT(26);
+			val &= ~GENMASK(21, 16); /* covering PLL_P and PLL_M0 */
+			writel(val, reg + pll_regs[i]);
+		}
+	}
+
+	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, desc);
+	if (ret)
+		return ret;
+
+	/* Reparent CPU during CPU PLL rate changes */
+	ccu_mux_notifier_register(pll_cpu_l_clk.common.hw.clk,
+				  &sun55i_a523_cpu_l_nb);
+	ccu_mux_notifier_register(pll_cpu_b_clk.common.hw.clk,
+				  &sun55i_a523_cpu_b_nb);
+
+	return ret;
+}
+
+static const struct of_device_id sun55i_a523_cpu_ccu_ids[] = {
+	{
+		.compatible = "allwinner,sun55i-a523-cpu-ccu",
+		.data = &sun55i_a523_cpu_ccu_desc,
+	},
+	{ }
+};
+
+static struct platform_driver sun55i_a523_cpu_ccu_driver = {
+	.probe	= sun55i_a523_cpu_ccu_probe,
+	.driver	= {
+		.name			= "sun55i-a523-cpu-ccu",
+		.suppress_bind_attrs	= true,
+		.of_match_table		= sun55i_a523_cpu_ccu_ids,
+	},
+};
+module_platform_driver(sun55i_a523_cpu_ccu_driver);
+
+MODULE_IMPORT_NS("SUNXI_CCU");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.h b/drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.h
new file mode 100644
index 0000000000000..484343b2c4fa6
--- /dev/null
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2025 Arm Ltd.
+ */
+
+#ifndef _CCU_SUN55I_A523_CPU_H
+#define _CCU_SUN55I_A523_CPU_H
+
+#include <dt-bindings/clock/sun55i-a523-cpu-ccu.h>
+
+/* The PLL clocks itself and the pure divider clocks are not exported. */
+
+#define CLK_PLL_CPU_0		0
+#define CLK_PLL_CPU_L		1
+#define CLK_PLL_CPU_DSU		2
+#define CLK_PLL_CPU_B		3
+
+#define CLK_DIV_CPU_L		4
+#define CLK_DIV_CPU_DSU		5
+#define CLK_DIV_CPU_B		6
+
+#define CLK_NUMBER	(CLK_CPU_B + 1)
+
+#endif /* _CCU_SUN55I_A523_CPU_H */
-- 
2.43.0

