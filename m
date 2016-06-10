Return-Path: <mturquette@baylibre.com>
From: Michael Turquette <mturquette@baylibre.com>
To: linux-clk@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com,
	carlo@endlessm.com,
	victor.wan@amlogic.com,
	jerry.cao@amlogic.com,
	xing.xu@amlogic.com
Subject: [PATCH 5/7] clk: gxbb: add AmLogic GXBB clk controller driver
Date: Thu,  9 Jun 2016 17:32:52 -0700
Message-Id: <1465518774-26924-6-git-send-email-mturquette@baylibre.com>
In-Reply-To: <1465518774-26924-1-git-send-email-mturquette@baylibre.com>
References: <1465518774-26924-1-git-send-email-mturquette@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Michael Turquette <mturquette@baylibre.com>
---
 drivers/clk/meson/Kconfig             |   7 +
 drivers/clk/meson/Makefile            |   1 +
 drivers/clk/meson/gxbb.c              | 954 ++++++++++++++++++++++++++++++++++
 drivers/clk/meson/gxbb.h              | 271 ++++++++++
 include/dt-bindings/clock/gxbb-clkc.h |  12 +
 5 files changed, 1245 insertions(+)
 create mode 100644 drivers/clk/meson/gxbb.c
 create mode 100644 drivers/clk/meson/gxbb.h
 create mode 100644 include/dt-bindings/clock/gxbb-clkc.h

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index 7bb19ad..19480bc 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -10,3 +10,10 @@ config COMMON_CLK_MESON8B
 	  Support for the clock controller on AmLogic S805 devices, aka
 	  meson8b. Say Y if you want peripherals and CPU frequency scaling to
 	  work.
+
+config COMMON_CLK_GXBB
+	bool
+	depends on COMMON_CLK_AMLOGIC
+	help
+	  Support for the clock controller on AmLogic S905 devices, aka gxbb.
+	  Say Y if you want peripherals and CPU frequency scaling to work.
diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
index 7667218..197e401 100644
--- a/drivers/clk/meson/Makefile
+++ b/drivers/clk/meson/Makefile
@@ -4,3 +4,4 @@
 
 obj-$(CONFIG_COMMON_CLK_AMLOGIC) += clk-pll.o clk-cpu.o clk-mpll.o
 obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b-clkc.o
+obj-$(CONFIG_COMMON_CLK_GXBB)	 += gxbb.o
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
new file mode 100644
index 0000000..26c78a2
--- /dev/null
+++ b/drivers/clk/meson/gxbb.c
@@ -0,0 +1,954 @@
+/*
+ * Copyright (c) 2016 AmLogic, Inc.
+ * Michael Turquette <mturquette@baylibre.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/module.h>
+
+#include "clkc.h"
+#include "gxbb.h"
+
+static DEFINE_SPINLOCK(clk_lock);
+
+static const struct pll_rate_table sys_pll_rate_table[] = {
+	PLL_RATE(24000000, 56, 1, 2),
+	PLL_RATE(48000000, 64, 1, 2),
+	PLL_RATE(72000000, 72, 1, 2),
+	PLL_RATE(96000000, 64, 1, 2),
+	PLL_RATE(120000000, 80, 1, 2),
+	PLL_RATE(144000000, 96, 1, 2),
+	PLL_RATE(168000000, 56, 1, 1),
+	PLL_RATE(192000000, 64, 1, 1),
+	PLL_RATE(216000000, 72, 1, 1),
+	PLL_RATE(240000000, 80, 1, 1),
+	PLL_RATE(264000000, 88, 1, 1),
+	PLL_RATE(288000000, 96, 1, 1),
+	PLL_RATE(312000000, 52, 1, 2),
+	PLL_RATE(336000000, 56, 1, 2),
+	PLL_RATE(360000000, 60, 1, 2),
+	PLL_RATE(384000000, 64, 1, 2),
+	PLL_RATE(408000000, 68, 1, 2),
+	PLL_RATE(432000000, 72, 1, 2),
+	PLL_RATE(456000000, 76, 1, 2),
+	PLL_RATE(480000000, 80, 1, 2),
+	PLL_RATE(504000000, 84, 1, 2),
+	PLL_RATE(528000000, 88, 1, 2),
+	PLL_RATE(552000000, 92, 1, 2),
+	PLL_RATE(576000000, 96, 1, 2),
+	PLL_RATE(600000000, 50, 1, 1),
+	PLL_RATE(624000000, 52, 1, 1),
+	PLL_RATE(648000000, 54, 1, 1),
+	PLL_RATE(672000000, 56, 1, 1),
+	PLL_RATE(696000000, 58, 1, 1),
+	PLL_RATE(720000000, 60, 1, 1),
+	PLL_RATE(744000000, 62, 1, 1),
+	PLL_RATE(768000000, 64, 1, 1),
+	PLL_RATE(792000000, 66, 1, 1),
+	PLL_RATE(816000000, 68, 1, 1),
+	PLL_RATE(840000000, 70, 1, 1),
+	PLL_RATE(864000000, 72, 1, 1),
+	PLL_RATE(888000000, 74, 1, 1),
+	PLL_RATE(912000000, 76, 1, 1),
+	PLL_RATE(936000000, 78, 1, 1),
+	PLL_RATE(960000000, 80, 1, 1),
+	PLL_RATE(984000000, 82, 1, 1),
+	PLL_RATE(1008000000, 84, 1, 1),
+	PLL_RATE(1032000000, 86, 1, 1),
+	PLL_RATE(1056000000, 88, 1, 1),
+	PLL_RATE(1080000000, 90, 1, 1),
+	PLL_RATE(1104000000, 92, 1, 1),
+	PLL_RATE(1128000000, 94, 1, 1),
+	PLL_RATE(1152000000, 96, 1, 1),
+	PLL_RATE(1176000000, 98, 1, 1),
+	PLL_RATE(1200000000, 50, 1, 0),
+	PLL_RATE(1224000000, 51, 1, 0),
+	PLL_RATE(1248000000, 52, 1, 0),
+	PLL_RATE(1272000000, 53, 1, 0),
+	PLL_RATE(1296000000, 54, 1, 0),
+	PLL_RATE(1320000000, 55, 1, 0),
+	PLL_RATE(1344000000, 56, 1, 0),
+	PLL_RATE(1368000000, 57, 1, 0),
+	PLL_RATE(1392000000, 58, 1, 0),
+	PLL_RATE(1416000000, 59, 1, 0),
+	PLL_RATE(1440000000, 60, 1, 0),
+	PLL_RATE(1464000000, 61, 1, 0),
+	PLL_RATE(1488000000, 62, 1, 0),
+	PLL_RATE(1512000000, 63, 1, 0),
+	PLL_RATE(1536000000, 64, 1, 0),
+	PLL_RATE(1560000000, 65, 1, 0),
+	PLL_RATE(1584000000, 66, 1, 0),
+	PLL_RATE(1608000000, 67, 1, 0),
+	PLL_RATE(1632000000, 68, 1, 0),
+	PLL_RATE(1656000000, 68, 1, 0),
+	PLL_RATE(1680000000, 68, 1, 0),
+	PLL_RATE(1704000000, 68, 1, 0),
+	PLL_RATE(1728000000, 69, 1, 0),
+	PLL_RATE(1752000000, 69, 1, 0),
+	PLL_RATE(1776000000, 69, 1, 0),
+	PLL_RATE(1800000000, 69, 1, 0),
+	PLL_RATE(1824000000, 70, 1, 0),
+	PLL_RATE(1848000000, 70, 1, 0),
+	PLL_RATE(1872000000, 70, 1, 0),
+	PLL_RATE(1896000000, 70, 1, 0),
+	PLL_RATE(1920000000, 71, 1, 0),
+	PLL_RATE(1944000000, 71, 1, 0),
+	PLL_RATE(1968000000, 71, 1, 0),
+	PLL_RATE(1992000000, 71, 1, 0),
+	PLL_RATE(2016000000, 72, 1, 0),
+	PLL_RATE(2040000000, 72, 1, 0),
+	PLL_RATE(2064000000, 72, 1, 0),
+	PLL_RATE(2088000000, 72, 1, 0),
+	PLL_RATE(2112000000, 73, 1, 0),
+	{ /* sentinel */ },
+};
+
+static const struct pll_rate_table gp0_pll_rate_table[] = {
+	PLL_RATE(96000000, 32, 1, 3),
+	PLL_RATE(99000000, 33, 1, 3),
+	PLL_RATE(102000000, 34, 1, 3),
+	PLL_RATE(105000000, 35, 1, 3),
+	PLL_RATE(108000000, 36, 1, 3),
+	PLL_RATE(111000000, 37, 1, 3),
+	PLL_RATE(114000000, 38, 1, 3),
+	PLL_RATE(117000000, 39, 1, 3),
+	PLL_RATE(120000000, 40, 1, 3),
+	PLL_RATE(123000000, 41, 1, 3),
+	PLL_RATE(126000000, 42, 1, 3),
+	PLL_RATE(129000000, 43, 1, 3),
+	PLL_RATE(132000000, 44, 1, 3),
+	PLL_RATE(135000000, 45, 1, 3),
+	PLL_RATE(138000000, 46, 1, 3),
+	PLL_RATE(141000000, 47, 1, 3),
+	PLL_RATE(144000000, 48, 1, 3),
+	PLL_RATE(147000000, 49, 1, 3),
+	PLL_RATE(150000000, 50, 1, 3),
+	PLL_RATE(153000000, 51, 1, 3),
+	PLL_RATE(156000000, 52, 1, 3),
+	PLL_RATE(159000000, 53, 1, 3),
+	PLL_RATE(162000000, 54, 1, 3),
+	PLL_RATE(165000000, 55, 1, 3),
+	PLL_RATE(168000000, 56, 1, 3),
+	PLL_RATE(171000000, 57, 1, 3),
+	PLL_RATE(174000000, 58, 1, 3),
+	PLL_RATE(177000000, 59, 1, 3),
+	PLL_RATE(180000000, 60, 1, 3),
+	PLL_RATE(183000000, 61, 1, 3),
+	PLL_RATE(186000000, 62, 1, 3),
+	PLL_RATE(192000000, 32, 1, 2),
+	PLL_RATE(198000000, 33, 1, 2),
+	PLL_RATE(204000000, 34, 1, 2),
+	PLL_RATE(210000000, 35, 1, 2),
+	PLL_RATE(216000000, 36, 1, 2),
+	PLL_RATE(222000000, 37, 1, 2),
+	PLL_RATE(228000000, 38, 1, 2),
+	PLL_RATE(234000000, 39, 1, 2),
+	PLL_RATE(240000000, 40, 1, 2),
+	PLL_RATE(246000000, 41, 1, 2),
+	PLL_RATE(252000000, 42, 1, 2),
+	PLL_RATE(258000000, 43, 1, 2),
+	PLL_RATE(264000000, 44, 1, 2),
+	PLL_RATE(270000000, 45, 1, 2),
+	PLL_RATE(276000000, 46, 1, 2),
+	PLL_RATE(282000000, 47, 1, 2),
+	PLL_RATE(288000000, 48, 1, 2),
+	PLL_RATE(294000000, 49, 1, 2),
+	PLL_RATE(300000000, 50, 1, 2),
+	PLL_RATE(306000000, 51, 1, 2),
+	PLL_RATE(312000000, 52, 1, 2),
+	PLL_RATE(318000000, 53, 1, 2),
+	PLL_RATE(324000000, 54, 1, 2),
+	PLL_RATE(330000000, 55, 1, 2),
+	PLL_RATE(336000000, 56, 1, 2),
+	PLL_RATE(342000000, 57, 1, 2),
+	PLL_RATE(348000000, 58, 1, 2),
+	PLL_RATE(354000000, 59, 1, 2),
+	PLL_RATE(360000000, 60, 1, 2),
+	PLL_RATE(366000000, 61, 1, 2),
+	PLL_RATE(372000000, 62, 1, 2),
+	PLL_RATE(384000000, 32, 1, 1),
+	PLL_RATE(396000000, 33, 1, 1),
+	PLL_RATE(408000000, 34, 1, 1),
+	PLL_RATE(420000000, 35, 1, 1),
+	PLL_RATE(432000000, 36, 1, 1),
+	PLL_RATE(444000000, 37, 1, 1),
+	PLL_RATE(456000000, 38, 1, 1),
+	PLL_RATE(468000000, 39, 1, 1),
+	PLL_RATE(480000000, 40, 1, 1),
+	PLL_RATE(492000000, 41, 1, 1),
+	PLL_RATE(504000000, 42, 1, 1),
+	PLL_RATE(516000000, 43, 1, 1),
+	PLL_RATE(528000000, 44, 1, 1),
+	PLL_RATE(540000000, 45, 1, 1),
+	PLL_RATE(552000000, 46, 1, 1),
+	PLL_RATE(564000000, 47, 1, 1),
+	PLL_RATE(576000000, 48, 1, 1),
+	PLL_RATE(588000000, 49, 1, 1),
+	PLL_RATE(600000000, 50, 1, 1),
+	PLL_RATE(612000000, 51, 1, 1),
+	PLL_RATE(624000000, 52, 1, 1),
+	PLL_RATE(636000000, 53, 1, 1),
+	PLL_RATE(648000000, 54, 1, 1),
+	PLL_RATE(660000000, 55, 1, 1),
+	PLL_RATE(672000000, 56, 1, 1),
+	PLL_RATE(684000000, 57, 1, 1),
+	PLL_RATE(696000000, 58, 1, 1),
+	PLL_RATE(708000000, 59, 1, 1),
+	PLL_RATE(720000000, 60, 1, 1),
+	PLL_RATE(732000000, 61, 1, 1),
+	PLL_RATE(744000000, 62, 1, 1),
+	PLL_RATE(768000000, 32, 1, 0),
+	PLL_RATE(792000000, 33, 1, 0),
+	PLL_RATE(816000000, 34, 1, 0),
+	PLL_RATE(840000000, 35, 1, 0),
+	PLL_RATE(864000000, 36, 1, 0),
+	PLL_RATE(888000000, 37, 1, 0),
+	PLL_RATE(912000000, 38, 1, 0),
+	PLL_RATE(936000000, 39, 1, 0),
+	PLL_RATE(960000000, 40, 1, 0),
+	PLL_RATE(984000000, 41, 1, 0),
+	PLL_RATE(1008000000, 42, 1, 0),
+	PLL_RATE(1032000000, 43, 1, 0),
+	PLL_RATE(1056000000, 44, 1, 0),
+	PLL_RATE(1080000000, 45, 1, 0),
+	PLL_RATE(1104000000, 46, 1, 0),
+	PLL_RATE(1128000000, 47, 1, 0),
+	PLL_RATE(1152000000, 48, 1, 0),
+	PLL_RATE(1176000000, 49, 1, 0),
+	PLL_RATE(1200000000, 50, 1, 0),
+	PLL_RATE(1224000000, 51, 1, 0),
+	PLL_RATE(1248000000, 52, 1, 0),
+	PLL_RATE(1272000000, 53, 1, 0),
+	PLL_RATE(1296000000, 54, 1, 0),
+	PLL_RATE(1320000000, 55, 1, 0),
+	PLL_RATE(1344000000, 56, 1, 0),
+	PLL_RATE(1368000000, 57, 1, 0),
+	PLL_RATE(1392000000, 58, 1, 0),
+	PLL_RATE(1416000000, 59, 1, 0),
+	PLL_RATE(1440000000, 60, 1, 0),
+	PLL_RATE(1464000000, 61, 1, 0),
+	PLL_RATE(1488000000, 62, 1, 0),
+	{ /* sentinel */ },
+};
+
+static const struct clk_div_table cpu_div_table[] = {
+	{ .val = 1, .div = 1 },
+	{ .val = 2, .div = 2 },
+	{ .val = 3, .div = 3 },
+	{ .val = 2, .div = 4 },
+	{ .val = 3, .div = 6 },
+	{ .val = 4, .div = 8 },
+	{ .val = 5, .div = 10 },
+	{ .val = 6, .div = 12 },
+	{ .val = 7, .div = 14 },
+	{ .val = 8, .div = 16 },
+	{ /* sentinel */ },
+};
+
+static struct meson_clk_pll gxbb_fixed_pll = {
+	.m = {
+		.reg_off = HHI_MPLL_CNTL,
+		.shift   = 0,
+		.width   = 9,
+	},
+	.n = {
+		.reg_off = HHI_MPLL_CNTL,
+		.shift   = 9,
+		.width   = 5,
+	},
+	.od = {
+		.reg_off = HHI_MPLL_CNTL,
+		.shift   = 16,
+		.width   = 2,
+	},
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "fixed_pll",
+		.ops = &meson_clk_pll_ro_ops,
+		.parent_names = (const char *[]){ "xtal" },
+		.num_parents = 1,
+		.flags = CLK_GET_RATE_NOCACHE,
+	},
+};
+
+static struct meson_clk_pll gxbb_hdmi_pll = {
+	.m = {
+		.reg_off = HHI_HDMI_PLL_CNTL,
+		.shift   = 0,
+		.width   = 9,
+	},
+	.n = {
+		.reg_off = HHI_HDMI_PLL_CNTL,
+		.shift   = 9,
+		.width   = 5,
+	},
+	.frac = {
+		.reg_off = HHI_HDMI_PLL_CNTL2,
+		.shift   = 0,
+		.width   = 12,
+	},
+	.od = {
+		.reg_off = HHI_HDMI_PLL_CNTL2,
+		.shift   = 16,
+		.width   = 2,
+	},
+	.od2 = {
+		.reg_off = HHI_HDMI_PLL_CNTL2,
+		.shift   = 22,
+		.width   = 2,
+	},
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "hdmi_pll",
+		.ops = &meson_clk_pll_ro_ops,
+		.parent_names = (const char *[]){ "xtal" },
+		.num_parents = 1,
+		.flags = CLK_GET_RATE_NOCACHE,
+	},
+};
+
+static struct meson_clk_pll gxbb_sys_pll = {
+	.m = {
+		.reg_off = HHI_SYS_PLL_CNTL,
+		.shift   = 0,
+		.width   = 9,
+	},
+	.n = {
+		.reg_off = HHI_SYS_PLL_CNTL,
+		.shift   = 9,
+		.width   = 5,
+	},
+	.od = {
+		.reg_off = HHI_SYS_PLL_CNTL,
+		.shift   = 10,
+		.width   = 2,
+	},
+	.rate_table = sys_pll_rate_table,
+	.rate_count = ARRAY_SIZE(sys_pll_rate_table),
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "sys_pll",
+		.ops = &meson_clk_pll_ro_ops,
+		.parent_names = (const char *[]){ "xtal" },
+		.num_parents = 1,
+		.flags = CLK_GET_RATE_NOCACHE,
+	},
+};
+
+static struct meson_clk_pll gxbb_gp0_pll = {
+	.m = {
+		.reg_off = HHI_GP0_PLL_CNTL,
+		.shift   = 0,
+		.width   = 9,
+	},
+	.n = {
+		.reg_off = HHI_GP0_PLL_CNTL,
+		.shift   = 9,
+		.width   = 5,
+	},
+	.od = {
+		.reg_off = HHI_GP0_PLL_CNTL,
+		.shift   = 16,
+		.width   = 2,
+	},
+	.rate_table = gp0_pll_rate_table,
+	.rate_count = ARRAY_SIZE(gp0_pll_rate_table),
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "gp0_pll",
+		.ops = &meson_clk_pll_ops,
+		.parent_names = (const char *[]){ "xtal" },
+		.num_parents = 1,
+		.flags = CLK_GET_RATE_NOCACHE,
+	},
+};
+
+static struct clk_fixed_factor gxbb_fclk_div2 = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data){
+		.name = "fclk_div2",
+		.ops = &clk_fixed_factor_ops,
+		.parent_names = (const char *[]){ "fixed_pll" },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_fixed_factor gxbb_fclk_div3 = {
+	.mult = 1,
+	.div = 3,
+	.hw.init = &(struct clk_init_data){
+		.name = "fclk_div3",
+		.ops = &clk_fixed_factor_ops,
+		.parent_names = (const char *[]){ "fixed_pll" },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_fixed_factor gxbb_fclk_div4 = {
+	.mult = 1,
+	.div = 4,
+	.hw.init = &(struct clk_init_data){
+		.name = "fclk_div4",
+		.ops = &clk_fixed_factor_ops,
+		.parent_names = (const char *[]){ "fixed_pll" },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_fixed_factor gxbb_fclk_div5 = {
+	.mult = 1,
+	.div = 5,
+	.hw.init = &(struct clk_init_data){
+		.name = "fclk_div5",
+		.ops = &clk_fixed_factor_ops,
+		.parent_names = (const char *[]){ "fixed_pll" },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_fixed_factor gxbb_fclk_div7 = {
+	.mult = 1,
+	.div = 7,
+	.hw.init = &(struct clk_init_data){
+		.name = "fclk_div7",
+		.ops = &clk_fixed_factor_ops,
+		.parent_names = (const char *[]){ "fixed_pll" },
+		.num_parents = 1,
+	},
+};
+
+static struct meson_clk_mpll gxbb_mpll0 = {
+	.sdm = {
+		.reg_off = HHI_MPLL_CNTL7,
+		.shift   = 0,
+		.width   = 14,
+	},
+	.n2 = {
+		.reg_off = HHI_MPLL_CNTL7,
+		.shift   = 16,
+		.width   = 9,
+	},
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "mpll0",
+		.ops = &meson_clk_mpll_ro_ops,
+		.parent_names = (const char *[]){ "fixed_pll" },
+		.num_parents = 1,
+	},
+};
+
+static struct meson_clk_mpll gxbb_mpll1 = {
+	.sdm = {
+		.reg_off = HHI_MPLL_CNTL8,
+		.shift   = 0,
+		.width   = 14,
+	},
+	.n2 = {
+		.reg_off = HHI_MPLL_CNTL8,
+		.shift   = 16,
+		.width   = 9,
+	},
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "mpll1",
+		.ops = &meson_clk_mpll_ro_ops,
+		.parent_names = (const char *[]){ "fixed_pll" },
+		.num_parents = 1,
+	},
+};
+
+static struct meson_clk_mpll gxbb_mpll2 = {
+	.sdm = {
+		.reg_off = HHI_MPLL_CNTL9,
+		.shift   = 0,
+		.width   = 14,
+	},
+	.n2 = {
+		.reg_off = HHI_MPLL_CNTL9,
+		.shift   = 16,
+		.width   = 9,
+	},
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "mpll2",
+		.ops = &meson_clk_mpll_ro_ops,
+		.parent_names = (const char *[]){ "fixed_pll" },
+		.num_parents = 1,
+	},
+};
+
+/*
+ * FIXME cpu clocks and the legacy composite clocks (e.g. clk81) are both PLL
+ * post-dividers and should be modeled with their respective PLLs via the
+ * forthcoming coordinated clock rates feature
+ */
+static struct meson_clk_cpu gxbb_cpu_clk = {
+	.reg_off = HHI_SYS_CPU_CLK_CNTL1,
+	.div_table = cpu_div_table,
+	.clk_nb.notifier_call = meson_clk_cpu_notifier_cb,
+	.hw.init = &(struct clk_init_data){
+		.name = "cpu_clk",
+		.ops = &meson_clk_cpu_ops,
+		.parent_names = (const char *[]){ "sys_pll" },
+		.num_parents = 1,
+	},
+};
+
+static u32 mux_table_clk81[]	= { 6, 5, 7 };
+
+static struct clk_mux gxbb_mpeg_clk_sel = {
+	.reg = (void *)HHI_MPEG_CLK_CNTL,
+	.mask = 0x7,
+	.shift = 12,
+	.flags = CLK_MUX_READ_ONLY,
+	.table = mux_table_clk81,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "mpeg_clk_sel",
+		.ops = &clk_mux_ro_ops,
+		/*
+		 * FIXME bits 14:12 selects from 8 possible parents:
+		 * xtal, 1'b0 (wtf), fclk_div7, mpll_clkout1, mpll_clkout2,
+		 * fclk_div4, fclk_div3, fclk_div5
+		 */
+		.parent_names = (const char *[]){ "fclk_div3", "fclk_div4",
+			"fclk_div5" },
+		.num_parents = 3,
+		.flags = (CLK_SET_RATE_NO_REPARENT | CLK_IGNORE_UNUSED),
+	},
+};
+
+static struct clk_divider gxbb_mpeg_clk_div = {
+	.reg = (void *)HHI_MPEG_CLK_CNTL,
+	.shift = 0,
+	.width = 7,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "mpeg_clk_div",
+		.ops = &clk_divider_ops,
+		.parent_names = (const char *[]){ "mpeg_clk_sel" },
+		.num_parents = 1,
+		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),
+	},
+};
+
+/* the mother of dragons^W gates */
+static struct clk_gate gxbb_clk81 = {
+	.reg = (void *)HHI_MPEG_CLK_CNTL,
+	.bit_idx = 7,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "clk81",
+		.ops = &clk_gate_ops,
+		.parent_names = (const char *[]){ "mpeg_clk_div" },
+		.num_parents = 1,
+		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),
+	},
+};
+
+/* Everything Else (EE) domain gates */
+static MESON_GATE(ddr, HHI_GCLK_MPEG0, 0);
+static MESON_GATE(dos, HHI_GCLK_MPEG0, 1);
+static MESON_GATE(isa, HHI_GCLK_MPEG0, 5);
+static MESON_GATE(pl301, HHI_GCLK_MPEG0, 6);
+static MESON_GATE(periphs, HHI_GCLK_MPEG0, 7);
+static MESON_GATE(spicc, HHI_GCLK_MPEG0, 8);
+static MESON_GATE(i2c, HHI_GCLK_MPEG0, 9);
+static MESON_GATE(sar_adc, HHI_GCLK_MPEG0, 10);
+static MESON_GATE(smart_card, HHI_GCLK_MPEG0, 11);
+static MESON_GATE(rng0, HHI_GCLK_MPEG0, 12);
+static MESON_GATE(uart0, HHI_GCLK_MPEG0, 13);
+static MESON_GATE(sdhc, HHI_GCLK_MPEG0, 14);
+static MESON_GATE(stream, HHI_GCLK_MPEG0, 15);
+static MESON_GATE(async_fifo, HHI_GCLK_MPEG0, 16);
+static MESON_GATE(sdio, HHI_GCLK_MPEG0, 17);
+static MESON_GATE(abuf, HHI_GCLK_MPEG0, 18);
+static MESON_GATE(hiu_iface, HHI_GCLK_MPEG0, 19);
+static MESON_GATE(assist_misc, HHI_GCLK_MPEG0, 23);
+static MESON_GATE(spi, HHI_GCLK_MPEG0, 30);
+
+static MESON_GATE(i2s_spdif, HHI_GCLK_MPEG1, 2);
+static MESON_GATE(eth, HHI_GCLK_MPEG1, 3);
+static MESON_GATE(demux, HHI_GCLK_MPEG1, 4);
+static MESON_GATE(aiu_glue, HHI_GCLK_MPEG1, 6);
+static MESON_GATE(iec958, HHI_GCLK_MPEG1, 7);
+static MESON_GATE(i2s_out, HHI_GCLK_MPEG1, 8);
+static MESON_GATE(amclk, HHI_GCLK_MPEG1, 9);
+static MESON_GATE(aififo2, HHI_GCLK_MPEG1, 10);
+static MESON_GATE(mixer, HHI_GCLK_MPEG1, 11);
+static MESON_GATE(mixer_iface, HHI_GCLK_MPEG1, 12);
+static MESON_GATE(adc, HHI_GCLK_MPEG1, 13);
+static MESON_GATE(blkmv, HHI_GCLK_MPEG1, 14);
+static MESON_GATE(aiu, HHI_GCLK_MPEG1, 15);
+static MESON_GATE(uart1, HHI_GCLK_MPEG1, 16);
+static MESON_GATE(g2d, HHI_GCLK_MPEG1, 20);
+static MESON_GATE(usb0, HHI_GCLK_MPEG1, 21);
+static MESON_GATE(usb1, HHI_GCLK_MPEG1, 22);
+static MESON_GATE(reset, HHI_GCLK_MPEG1, 23);
+static MESON_GATE(nand, HHI_GCLK_MPEG1, 24);
+static MESON_GATE(dos_parser, HHI_GCLK_MPEG1, 25);
+static MESON_GATE(usb, HHI_GCLK_MPEG1, 26);
+static MESON_GATE(vdin1, HHI_GCLK_MPEG1, 28);
+static MESON_GATE(ahb_arb0, HHI_GCLK_MPEG1, 29);
+static MESON_GATE(efuse, HHI_GCLK_MPEG1, 30);
+static MESON_GATE(boot_rom, HHI_GCLK_MPEG1, 31);
+
+static MESON_GATE(ahb_data_bus, HHI_GCLK_MPEG2, 1);
+static MESON_GATE(ahb_ctrl_bus, HHI_GCLK_MPEG2, 2);
+static MESON_GATE(hdmi_intr_sync, HHI_GCLK_MPEG2, 3);
+static MESON_GATE(hdmi_pclk, HHI_GCLK_MPEG2, 4);
+static MESON_GATE(usb1_ddr_bridge, HHI_GCLK_MPEG2, 8);
+static MESON_GATE(usb0_ddr_bridge, HHI_GCLK_MPEG2, 9);
+static MESON_GATE(mmc_pclk, HHI_GCLK_MPEG2, 11);
+static MESON_GATE(dvin, HHI_GCLK_MPEG2, 12);
+static MESON_GATE(uart2, HHI_GCLK_MPEG2, 15);
+static MESON_GATE(sana, HHI_GCLK_MPEG2, 22);
+static MESON_GATE(vpu_intr, HHI_GCLK_MPEG2, 25);
+static MESON_GATE(sec_ahb_ahb3_bridge, HHI_GCLK_MPEG2, 26);
+static MESON_GATE(clk81_a53, HHI_GCLK_MPEG2, 29);
+
+static MESON_GATE(vclk2_venci0, HHI_GCLK_OTHER, 1);
+static MESON_GATE(vclk2_venci1, HHI_GCLK_OTHER, 2);
+static MESON_GATE(vclk2_vencp0, HHI_GCLK_OTHER, 3);
+static MESON_GATE(vclk2_vencp1, HHI_GCLK_OTHER, 4);
+static MESON_GATE(gclk_venci_int0, HHI_GCLK_OTHER, 8);
+static MESON_GATE(gclk_vencp_int, HHI_GCLK_OTHER, 9);
+static MESON_GATE(dac_clk, HHI_GCLK_OTHER, 10);
+static MESON_GATE(aoclk_gate, HHI_GCLK_OTHER, 14);
+static MESON_GATE(iec958_gate, HHI_GCLK_OTHER, 16);
+static MESON_GATE(enc480p, HHI_GCLK_OTHER, 20);
+static MESON_GATE(rng1, HHI_GCLK_OTHER, 21);
+static MESON_GATE(gclk_venci_int1, HHI_GCLK_OTHER, 22);
+static MESON_GATE(vclk2_venclmcc, HHI_GCLK_OTHER, 24);
+static MESON_GATE(vclk2_vencl, HHI_GCLK_OTHER, 25);
+static MESON_GATE(vclk_other, HHI_GCLK_OTHER, 26);
+static MESON_GATE(edp, HHI_GCLK_OTHER, 31);
+
+/* Always On (AO) domain gates */
+
+static MESON_GATE(ao_media_cpu, HHI_GCLK_AO, 0);
+static MESON_GATE(ao_ahb_sram, HHI_GCLK_AO, 1);
+static MESON_GATE(ao_ahb_bus, HHI_GCLK_AO, 2);
+static MESON_GATE(ao_iface, HHI_GCLK_AO, 3);
+static MESON_GATE(ao_i2c, HHI_GCLK_AO, 4);
+
+/* Array of all clocks provided by this provider */
+
+static struct clk_hw_onecell_data gxbb_hw_onecell_data = {
+	.hws = {
+		[CLKID_SYS_PLL]		    = &gxbb_sys_pll.hw,
+		[CLKID_CPUCLK]		    = &gxbb_cpu_clk.hw,
+		[CLKID_HDMI_PLL]	    = &gxbb_hdmi_pll.hw,
+		[CLKID_FIXED_PLL]	    = &gxbb_fixed_pll.hw,
+		[CLKID_FCLK_DIV2]	    = &gxbb_fclk_div2.hw,
+		[CLKID_FCLK_DIV3]	    = &gxbb_fclk_div3.hw,
+		[CLKID_FCLK_DIV4]	    = &gxbb_fclk_div4.hw,
+		[CLKID_FCLK_DIV5]	    = &gxbb_fclk_div5.hw,
+		[CLKID_FCLK_DIV7]	    = &gxbb_fclk_div7.hw,
+		[CLKID_GP0_PLL]		    = &gxbb_gp0_pll.hw,
+		[CLKID_MPEG_SEL]	    = &gxbb_mpeg_clk_sel.hw,
+		[CLKID_MPEG_DIV]	    = &gxbb_mpeg_clk_div.hw,
+		[CLKID_CLK81]		    = &gxbb_clk81.hw,
+		[CLKID_MPLL0]		    = &gxbb_mpll0.hw,
+		[CLKID_MPLL1]		    = &gxbb_mpll1.hw,
+		[CLKID_MPLL2]		    = &gxbb_mpll2.hw,
+		[CLKID_DDR]		    = &gxbb_ddr.hw,
+		[CLKID_DOS]		    = &gxbb_dos.hw,
+		[CLKID_ISA]		    = &gxbb_isa.hw,
+		[CLKID_PL301]		    = &gxbb_pl301.hw,
+		[CLKID_PERIPHS]		    = &gxbb_periphs.hw,
+		[CLKID_SPICC]		    = &gxbb_spicc.hw,
+		[CLKID_I2C]		    = &gxbb_i2c.hw,
+		[CLKID_SAR_ADC]		    = &gxbb_sar_adc.hw,
+		[CLKID_SMART_CARD]	    = &gxbb_smart_card.hw,
+		[CLKID_RNG0]		    = &gxbb_rng0.hw,
+		[CLKID_UART0]		    = &gxbb_uart0.hw,
+		[CLKID_SDHC]		    = &gxbb_sdhc.hw,
+		[CLKID_STREAM]		    = &gxbb_stream.hw,
+		[CLKID_ASYNC_FIFO]	    = &gxbb_async_fifo.hw,
+		[CLKID_SDIO]		    = &gxbb_sdio.hw,
+		[CLKID_ABUF]		    = &gxbb_abuf.hw,
+		[CLKID_HIU_IFACE]	    = &gxbb_hiu_iface.hw,
+		[CLKID_ASSIST_MISC]	    = &gxbb_assist_misc.hw,
+		[CLKID_SPI]		    = &gxbb_spi.hw,
+		[CLKID_I2S_SPDIF]	    = &gxbb_i2s_spdif.hw,
+		[CLKID_ETH]		    = &gxbb_eth.hw,
+		[CLKID_DEMUX]		    = &gxbb_demux.hw,
+		[CLKID_AIU_GLUE]	    = &gxbb_aiu_glue.hw,
+		[CLKID_IEC958]		    = &gxbb_iec958.hw,
+		[CLKID_I2S_OUT]		    = &gxbb_i2s_out.hw,
+		[CLKID_AMCLK]		    = &gxbb_amclk.hw,
+		[CLKID_AIFIFO2]		    = &gxbb_aififo2.hw,
+		[CLKID_MIXER]		    = &gxbb_mixer.hw,
+		[CLKID_MIXER_IFACE]	    = &gxbb_mixer_iface.hw,
+		[CLKID_ADC]		    = &gxbb_adc.hw,
+		[CLKID_BLKMV]		    = &gxbb_blkmv.hw,
+		[CLKID_AIU]		    = &gxbb_aiu.hw,
+		[CLKID_UART1]		    = &gxbb_uart1.hw,
+		[CLKID_G2D]		    = &gxbb_g2d.hw,
+		[CLKID_USB0]		    = &gxbb_usb0.hw,
+		[CLKID_USB1]		    = &gxbb_usb1.hw,
+		[CLKID_RESET]		    = &gxbb_reset.hw,
+		[CLKID_NAND]		    = &gxbb_nand.hw,
+		[CLKID_DOS_PARSER]	    = &gxbb_dos_parser.hw,
+		[CLKID_USB]		    = &gxbb_usb.hw,
+		[CLKID_VDIN1]		    = &gxbb_vdin1.hw,
+		[CLKID_AHB_ARB0]	    = &gxbb_ahb_arb0.hw,
+		[CLKID_EFUSE]		    = &gxbb_efuse.hw,
+		[CLKID_BOOT_ROM]	    = &gxbb_boot_rom.hw,
+		[CLKID_AHB_DATA_BUS]	    = &gxbb_ahb_data_bus.hw,
+		[CLKID_AHB_CTRL_BUS]	    = &gxbb_ahb_ctrl_bus.hw,
+		[CLKID_HDMI_INTR_SYNC]	    = &gxbb_hdmi_intr_sync.hw,
+		[CLKID_HDMI_PCLK]	    = &gxbb_hdmi_pclk.hw,
+		[CLKID_USB1_DDR_BRIDGE]	    = &gxbb_usb1_ddr_bridge.hw,
+		[CLKID_USB0_DDR_BRIDGE]	    = &gxbb_usb0_ddr_bridge.hw,
+		[CLKID_MMC_PCLK]	    = &gxbb_mmc_pclk.hw,
+		[CLKID_DVIN]		    = &gxbb_dvin.hw,
+		[CLKID_UART2]		    = &gxbb_uart2.hw,
+		[CLKID_SANA]		    = &gxbb_sana.hw,
+		[CLKID_VPU_INTR]	    = &gxbb_vpu_intr.hw,
+		[CLKID_SEC_AHB_AHB3_BRIDGE] = &gxbb_sec_ahb_ahb3_bridge.hw,
+		[CLKID_CLK81_A53]	    = &gxbb_clk81_a53.hw,
+		[CLKID_VCLK2_VENCI0]	    = &gxbb_vclk2_venci0.hw,
+		[CLKID_VCLK2_VENCI1]	    = &gxbb_vclk2_venci1.hw,
+		[CLKID_VCLK2_VENCP0]	    = &gxbb_vclk2_vencp0.hw,
+		[CLKID_VCLK2_VENCP1]	    = &gxbb_vclk2_vencp1.hw,
+		[CLKID_GCLK_VENCI_INT0]	    = &gxbb_gclk_venci_int0.hw,
+		[CLKID_GCLK_VENCI_INT]	    = &gxbb_gclk_vencp_int.hw,
+		[CLKID_DAC_CLK]		    = &gxbb_dac_clk.hw,
+		[CLKID_AOCLK_GATE]	    = &gxbb_aoclk_gate.hw,
+		[CLKID_IEC958_GATE]	    = &gxbb_iec958_gate.hw,
+		[CLKID_ENC480P]		    = &gxbb_enc480p.hw,
+		[CLKID_RNG1]		    = &gxbb_rng1.hw,
+		[CLKID_GCLK_VENCI_INT1]	    = &gxbb_gclk_venci_int1.hw,
+		[CLKID_VCLK2_VENCLMCC]	    = &gxbb_vclk2_venclmcc.hw,
+		[CLKID_VCLK2_VENCL]	    = &gxbb_vclk2_vencl.hw,
+		[CLKID_VCLK_OTHER]	    = &gxbb_vclk_other.hw,
+		[CLKID_EDP]		    = &gxbb_edp.hw,
+		[CLKID_AO_MEDIA_CPU]	    = &gxbb_ao_media_cpu.hw,
+		[CLKID_AO_AHB_SRAM]	    = &gxbb_ao_ahb_sram.hw,
+		[CLKID_AO_AHB_BUS]	    = &gxbb_ao_ahb_bus.hw,
+		[CLKID_AO_IFACE]	    = &gxbb_ao_iface.hw,
+		[CLKID_AO_I2C]		    = &gxbb_ao_i2c.hw,
+	},
+	.num = NR_CLKS,
+};
+
+/* Convenience tables to populate base addresses in .probe */
+
+static struct meson_clk_pll *const gxbb_clk_plls[] = {
+	&gxbb_fixed_pll,
+	&gxbb_hdmi_pll,
+	&gxbb_sys_pll,
+	&gxbb_gp0_pll,
+};
+
+static struct meson_clk_mpll *const gxbb_clk_mplls[] = {
+	&gxbb_mpll0,
+	&gxbb_mpll1,
+	&gxbb_mpll2,
+};
+
+static struct clk_gate *gxbb_clk_gates[] = {
+	&gxbb_clk81,
+	&gxbb_ddr,
+	&gxbb_dos,
+	&gxbb_isa,
+	&gxbb_pl301,
+	&gxbb_periphs,
+	&gxbb_spicc,
+	&gxbb_i2c,
+	&gxbb_sar_adc,
+	&gxbb_smart_card,
+	&gxbb_rng0,
+	&gxbb_uart0,
+	&gxbb_sdhc,
+	&gxbb_stream,
+	&gxbb_async_fifo,
+	&gxbb_sdio,
+	&gxbb_abuf,
+	&gxbb_hiu_iface,
+	&gxbb_assist_misc,
+	&gxbb_spi,
+	&gxbb_i2s_spdif,
+	&gxbb_eth,
+	&gxbb_demux,
+	&gxbb_aiu_glue,
+	&gxbb_iec958,
+	&gxbb_i2s_out,
+	&gxbb_amclk,
+	&gxbb_aififo2,
+	&gxbb_mixer,
+	&gxbb_mixer_iface,
+	&gxbb_adc,
+	&gxbb_blkmv,
+	&gxbb_aiu,
+	&gxbb_uart1,
+	&gxbb_g2d,
+	&gxbb_usb0,
+	&gxbb_usb1,
+	&gxbb_reset,
+	&gxbb_nand,
+	&gxbb_dos_parser,
+	&gxbb_usb,
+	&gxbb_vdin1,
+	&gxbb_ahb_arb0,
+	&gxbb_efuse,
+	&gxbb_boot_rom,
+	&gxbb_ahb_data_bus,
+	&gxbb_ahb_ctrl_bus,
+	&gxbb_hdmi_intr_sync,
+	&gxbb_hdmi_pclk,
+	&gxbb_usb1_ddr_bridge,
+	&gxbb_usb0_ddr_bridge,
+	&gxbb_mmc_pclk,
+	&gxbb_dvin,
+	&gxbb_uart2,
+	&gxbb_sana,
+	&gxbb_vpu_intr,
+	&gxbb_sec_ahb_ahb3_bridge,
+	&gxbb_clk81_a53,
+	&gxbb_vclk2_venci0,
+	&gxbb_vclk2_venci1,
+	&gxbb_vclk2_vencp0,
+	&gxbb_vclk2_vencp1,
+	&gxbb_gclk_venci_int0,
+	&gxbb_gclk_vencp_int,
+	&gxbb_dac_clk,
+	&gxbb_aoclk_gate,
+	&gxbb_iec958_gate,
+	&gxbb_enc480p,
+	&gxbb_rng1,
+	&gxbb_gclk_venci_int1,
+	&gxbb_vclk2_venclmcc,
+	&gxbb_vclk2_vencl,
+	&gxbb_vclk_other,
+	&gxbb_edp,
+	&gxbb_ao_media_cpu,
+	&gxbb_ao_ahb_sram,
+	&gxbb_ao_ahb_bus,
+	&gxbb_ao_iface,
+	&gxbb_ao_i2c,
+};
+
+static int gxbb_clkc_probe(struct platform_device *pdev)
+{
+	void __iomem *clk_base;
+	int ret, clkid, i;
+	struct clk_hw *parent_hw;
+	struct clk *parent_clk;
+	struct device *dev = &pdev->dev;
+
+	/*  Generic clocks and PLLs */
+	clk_base = of_iomap(dev->of_node, 0);
+	if (!clk_base) {
+		pr_err("%s: Unable to map clk base\n", __func__);
+		return -ENXIO;
+	}
+
+	/* Populate base address for PLLs */
+	for (i = 0; i < ARRAY_SIZE(gxbb_clk_plls); i++)
+		gxbb_clk_plls[i]->base = clk_base;
+
+	/* Populate base address for MPLLs */
+	for (i = 0; i < ARRAY_SIZE(gxbb_clk_mplls); i++)
+		gxbb_clk_mplls[i]->base = clk_base;
+
+	/* Populate the base address for CPU clk */
+	gxbb_cpu_clk.base = clk_base;
+
+	/* Populate the base address for the MPEG clks */
+	gxbb_mpeg_clk_sel.reg = clk_base + (u64)gxbb_mpeg_clk_sel.reg;
+	gxbb_mpeg_clk_div.reg = clk_base + (u64)gxbb_mpeg_clk_div.reg;
+
+	/* Populate base address for gates */
+	for (i = 0; i < ARRAY_SIZE(gxbb_clk_gates); i++)
+		gxbb_clk_gates[i]->reg = clk_base +
+			(u64)gxbb_clk_gates[i]->reg;
+
+	/*
+	 * register all clks
+	 */
+	for (clkid = 0; clkid < NR_CLKS; clkid++) {
+		ret = devm_clk_hw_register(dev, gxbb_hw_onecell_data.hws[clkid]);
+		if (ret)
+			goto iounmap;
+	}
+
+	/*
+	 * Register CPU clk notifier
+	 *
+	 * FIXME this is wrong for a lot of reasons. First, the muxes should be
+	 * struct clk_hw objects. Second, we shouldn't program the muxes in
+	 * notifier handlers. The tricky programming sequence will be handled
+	 * by the forthcoming coordinated clock rates mechanism once that
+	 * feature is released.
+	 *
+	 * Furthermore, looking up the parent this way is terrible. At some
+	 * point we will stop allocating a default struct clk when registering
+	 * a new clk_hw, and this hack will no longer work. Releasing the ccr
+	 * feature before that time solves the problem :-)
+	 */
+	parent_hw = clk_hw_get_parent(&gxbb_cpu_clk.hw);
+	parent_clk = parent_hw->clk;
+	ret = clk_notifier_register(parent_clk, &gxbb_cpu_clk.clk_nb);
+	if (ret) {
+		pr_err("%s: failed to register clock notifier for cpu_clk\n",
+				__func__);
+		goto iounmap;
+	}
+
+	return of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
+			&gxbb_hw_onecell_data);
+
+iounmap:
+	iounmap(clk_base);
+	return ret;
+}
+
+static const struct of_device_id gxbb_clkc_match_table[] = {
+	{ .compatible = "amlogic,gxbb-clkc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gxbb_match_table);
+
+static struct platform_driver gxbb_driver = {
+	.probe		= gxbb_clkc_probe,
+	.driver		= {
+		.name	= "gxbb-clkc",
+		.of_match_table = gxbb_clkc_match_table,
+	},
+};
+
+static int __init gxbb_clkc_init(void)
+{
+	return platform_driver_register(&gxbb_driver);
+}
+module_init(gxbb_clkc_init);
+
+static void __exit gxbb_clkc_exit(void)
+{
+	platform_driver_unregister(&gxbb_driver);
+}
+module_exit(gxbb_clkc_exit);
+
+MODULE_DESCRIPTION("AmLogic S905 / GXBB Clock Controller Driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:gxbb-clkc");
+MODULE_AUTHOR("Michael Turquette <mturquette@baylibre.com>");
diff --git a/drivers/clk/meson/gxbb.h b/drivers/clk/meson/gxbb.h
new file mode 100644
index 0000000..a2adf34
--- /dev/null
+++ b/drivers/clk/meson/gxbb.h
@@ -0,0 +1,271 @@
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * GPL LICENSE SUMMARY
+ *
+ * Copyright (c) 2016 AmLogic, Inc.
+ * Author: Michael Turquette <mturquette@baylibre.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of version 2 of the GNU General Public License as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin St - Fifth Floor, Boston, MA 02110-1301 USA.
+ * The full GNU General Public License is included in this distribution
+ * in the file called COPYING
+ *
+ * BSD LICENSE
+ *
+ * Copyright (c) 2016 BayLibre, Inc.
+ * Author: Michael Turquette <mturquette@baylibre.com>
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ *   * Redistributions of source code must retain the above copyright
+ *     notice, this list of conditions and the following disclaimer.
+ *   * Redistributions in binary form must reproduce the above copyright
+ *     notice, this list of conditions and the following disclaimer in
+ *     the documentation and/or other materials provided with the
+ *     distribution.
+ *   * Neither the name of Intel Corporation nor the names of its
+ *     contributors may be used to endorse or promote products derived
+ *     from this software without specific prior written permission.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#ifndef __GXBB_H
+#define __GXBB_H
+
+/*
+ * Clock controller register offsets
+ *
+ * Register offsets from the data sheet are listed in comment blocks below.
+ * Those offsets must be multiplied by 4 before adding them to the base address
+ * to get the right value
+ */
+#define SCR				0x2C /* 0x0b offset in data sheet */
+#define TIMEOUT_VALUE			0x3c /* 0x0f offset in data sheet */
+
+#define HHI_GP0_PLL_CNTL		0x40 /* 0x10 offset in data sheet */
+#define HHI_GP0_PLL_CNTL2		0x44 /* 0x11 offset in data sheet */
+#define HHI_GP0_PLL_CNTL3		0x48 /* 0x12 offset in data sheet */
+#define HHI_GP0_PLL_CNTL4		0x4c /* 0x13 offset in data sheet */
+
+#define HHI_XTAL_DIVN_CNTL		0xbc /* 0x2f offset in data sheet */
+#define HHI_TIMER90K			0xec /* 0x3b offset in data sheet */
+
+#define HHI_MEM_PD_REG0			0x100 /* 0x40 offset in data sheet */
+#define HHI_MEM_PD_REG1			0x104 /* 0x41 offset in data sheet */
+#define HHI_VPU_MEM_PD_REG1		0x108 /* 0x42 offset in data sheet */
+#define HHI_VIID_CLK_DIV		0x128 /* 0x4a offset in data sheet */
+#define HHI_VIID_CLK_CNTL		0x12c /* 0x4b offset in data sheet */
+
+#define HHI_GCLK_MPEG0			0x140 /* 0x50 offset in data sheet */
+#define HHI_GCLK_MPEG1			0x144 /* 0x51 offset in data sheet */
+#define HHI_GCLK_MPEG2			0x148 /* 0x52 offset in data sheet */
+#define HHI_GCLK_OTHER			0x150 /* 0x54 offset in data sheet */
+#define HHI_GCLK_AO			0x154 /* 0x55 offset in data sheet */
+#define HHI_SYS_OSCIN_CNTL		0x158 /* 0x56 offset in data sheet */
+#define HHI_SYS_CPU_CLK_CNTL1		0x15c /* 0x57 offset in data sheet */
+#define HHI_SYS_CPU_RESET_CNTL		0x160 /* 0x58 offset in data sheet */
+#define HHI_VID_CLK_DIV			0x164 /* 0x59 offset in data sheet */
+
+#define HHI_MPEG_CLK_CNTL		0x174 /* 0x5d offset in data sheet */
+#define HHI_AUD_CLK_CNTL		0x178 /* 0x5e offset in data sheet */
+#define HHI_VID_CLK_CNTL		0x17c /* 0x5f offset in data sheet */
+#define HHI_AUD_CLK_CNTL2		0x190 /* 0x64 offset in data sheet */
+#define HHI_VID_CLK_CNTL2		0x194 /* 0x65 offset in data sheet */
+#define HHI_SYS_CPU_CLK_CNTL0		0x19c /* 0x67 offset in data sheet */
+#define HHI_VID_PLL_CLK_DIV		0x1a0 /* 0x68 offset in data sheet */
+#define HHI_AUD_CLK_CNTL3		0x1a4 /* 0x69 offset in data sheet */
+#define HHI_MALI_CLK_CNTL		0x1b0 /* 0x6c offset in data sheet */
+#define HHI_VPU_CLK_CNTL		0x1bC /* 0x6f offset in data sheet */
+
+#define HHI_HDMI_CLK_CNTL		0x1CC /* 0x73 offset in data sheet */
+#define HHI_VDEC_CLK_CNTL		0x1E0 /* 0x78 offset in data sheet */
+#define HHI_VDEC2_CLK_CNTL		0x1E4 /* 0x79 offset in data sheet */
+#define HHI_VDEC3_CLK_CNTL		0x1E8 /* 0x7a offset in data sheet */
+#define HHI_VDEC4_CLK_CNTL		0x1EC /* 0x7b offset in data sheet */
+#define HHI_HDCP22_CLK_CNTL		0x1F0 /* 0x7c offset in data sheet */
+#define HHI_VAPBCLK_CNTL		0x1F4 /* 0x7d offset in data sheet */
+
+#define HHI_VPU_CLKB_CNTL		0x20C /* 0x83 offset in data sheet */
+#define HHI_USB_CLK_CNTL		0x220 /* 0x88 offset in data sheet */
+#define HHI_32K_CLK_CNTL		0x224 /* 0x89 offset in data sheet */
+#define HHI_GEN_CLK_CNTL		0x228 /* 0x8a offset in data sheet */
+#define HHI_GEN_CLK_CNTL		0x228 /* 0x8a offset in data sheet */
+
+#define HHI_PCM_CLK_CNTL		0x258 /* 0x96 offset in data sheet */
+#define HHI_NAND_CLK_CNTL		0x25C /* 0x97 offset in data sheet */
+#define HHI_SD_EMMC_CLK_CNTL		0x264 /* 0x99 offset in data sheet */
+
+#define HHI_MPLL_CNTL			0x280 /* 0xa0 offset in data sheet */
+#define HHI_MPLL_CNTL2			0x284 /* 0xa1 offset in data sheet */
+#define HHI_MPLL_CNTL3			0x288 /* 0xa2 offset in data sheet */
+#define HHI_MPLL_CNTL4			0x28C /* 0xa3 offset in data sheet */
+#define HHI_MPLL_CNTL5			0x290 /* 0xa4 offset in data sheet */
+#define HHI_MPLL_CNTL6			0x294 /* 0xa5 offset in data sheet */
+#define HHI_MPLL_CNTL7			0x298 /* MP0, 0xa6 offset in data sheet */
+#define HHI_MPLL_CNTL8			0x29C /* MP1, 0xa7 offset in data sheet */
+#define HHI_MPLL_CNTL9			0x2A0 /* MP2, 0xa8 offset in data sheet */
+#define HHI_MPLL_CNTL10			0x2A4 /* MP2, 0xa9 offset in data sheet */
+
+#define HHI_MPLL3_CNTL0			0x2E0 /* 0xb8 offset in data sheet */
+#define HHI_MPLL3_CNTL1			0x2E4 /* 0xb9 offset in data sheet */
+#define HHI_VDAC_CNTL0			0x2F4 /* 0xbd offset in data sheet */
+#define HHI_VDAC_CNTL1			0x2F8 /* 0xbe offset in data sheet */
+
+#define HHI_SYS_PLL_CNTL		0x300 /* 0xc0 offset in data sheet */
+#define HHI_SYS_PLL_CNTL2		0x304 /* 0xc1 offset in data sheet */
+#define HHI_SYS_PLL_CNTL3		0x308 /* 0xc2 offset in data sheet */
+#define HHI_SYS_PLL_CNTL4		0x30c /* 0xc3 offset in data sheet */
+#define HHI_SYS_PLL_CNTL5		0x310 /* 0xc4 offset in data sheet */
+#define HHI_DPLL_TOP_I			0x318 /* 0xc6 offset in data sheet */
+#define HHI_DPLL_TOP2_I			0x31C /* 0xc7 offset in data sheet */
+#define HHI_HDMI_PLL_CNTL		0x320 /* 0xc8 offset in data sheet */
+#define HHI_HDMI_PLL_CNTL2		0x324 /* 0xc9 offset in data sheet */
+#define HHI_HDMI_PLL_CNTL3		0x328 /* 0xca offset in data sheet */
+#define HHI_HDMI_PLL_CNTL4		0x32C /* 0xcb offset in data sheet */
+#define HHI_HDMI_PLL_CNTL5		0x330 /* 0xcc offset in data sheet */
+#define HHI_HDMI_PLL_CNTL6		0x334 /* 0xcd offset in data sheet */
+#define HHI_HDMI_PLL_CNTL_I		0x338 /* 0xce offset in data sheet */
+#define HHI_HDMI_PLL_CNTL7		0x33C /* 0xcf offset in data sheet */
+
+#define HHI_HDMI_PHY_CNTL0		0x3A0 /* 0xe8 offset in data sheet */
+#define HHI_HDMI_PHY_CNTL1		0x3A4 /* 0xe9 offset in data sheet */
+#define HHI_HDMI_PHY_CNTL2		0x3A8 /* 0xea offset in data sheet */
+#define HHI_HDMI_PHY_CNTL3		0x3AC /* 0xeb offset in data sheet */
+
+#define HHI_VID_LOCK_CLK_CNTL		0x3C8 /* 0xf2 offset in data sheet */
+#define HHI_BT656_CLK_CNTL		0x3D4 /* 0xf5 offset in data sheet */
+#define HHI_SAR_CLK_CNTL		0x3D8 /* 0xf6 offset in data sheet */
+
+/*
+ * CLKID index values
+ *
+ * These indices are entirely contrived and do not map onto the hardware.
+ * Migrate them out of this header and into the DT header file when they need
+ * to be exposed to client nodes in DT: include/dt-bindings/clock/gxbb-clkc.h
+ */
+#define CLKID_SYS_PLL		  0
+/* CLKID_CPUCLK */
+#define CLKID_HDMI_PLL		  2
+#define CLKID_FIXED_PLL		  3
+#define CLKID_FCLK_DIV2		  4
+#define CLKID_FCLK_DIV3		  5
+#define CLKID_FCLK_DIV4		  6
+#define CLKID_FCLK_DIV5		  7
+#define CLKID_FCLK_DIV7		  8
+#define CLKID_GP0_PLL		  9
+#define CLKID_MPEG_SEL		  10
+#define CLKID_MPEG_DIV		  11
+/* CLKID_CLK81 */
+#define CLKID_MPLL0		  13
+#define CLKID_MPLL1		  14
+#define CLKID_MPLL2		  15
+#define CLKID_DDR		  16
+#define CLKID_DOS		  17
+#define CLKID_ISA		  18
+#define CLKID_PL301		  19
+#define CLKID_PERIPHS		  20
+#define CLKID_SPICC		  21
+#define CLKID_I2C		  22
+#define CLKID_SAR_ADC		  23
+#define CLKID_SMART_CARD	  24
+#define CLKID_RNG0		  25
+#define CLKID_UART0		  26
+#define CLKID_SDHC		  27
+#define CLKID_STREAM		  28
+#define CLKID_ASYNC_FIFO	  29
+#define CLKID_SDIO		  30
+#define CLKID_ABUF		  31
+#define CLKID_HIU_IFACE		  32
+#define CLKID_ASSIST_MISC	  33
+#define CLKID_SPI		  34
+#define CLKID_I2S_SPDIF		  35
+#define CLKID_ETH		  36
+#define CLKID_DEMUX		  37
+#define CLKID_AIU_GLUE		  38
+#define CLKID_IEC958		  39
+#define CLKID_I2S_OUT		  40
+#define CLKID_AMCLK		  41
+#define CLKID_AIFIFO2		  42
+#define CLKID_MIXER		  43
+#define CLKID_MIXER_IFACE	  44
+#define CLKID_ADC		  45
+#define CLKID_BLKMV		  46
+#define CLKID_AIU		  47
+#define CLKID_UART1		  48
+#define CLKID_G2D		  49
+#define CLKID_USB0		  50
+#define CLKID_USB1		  51
+#define CLKID_RESET		  52
+#define CLKID_NAND		  53
+#define CLKID_DOS_PARSER	  54
+#define CLKID_USB		  55
+#define CLKID_VDIN1		  56
+#define CLKID_AHB_ARB0		  57
+#define CLKID_EFUSE		  58
+#define CLKID_BOOT_ROM		  59
+#define CLKID_AHB_DATA_BUS	  60
+#define CLKID_AHB_CTRL_BUS	  61
+#define CLKID_HDMI_INTR_SYNC	  62
+#define CLKID_HDMI_PCLK		  63
+#define CLKID_USB1_DDR_BRIDGE	  64
+#define CLKID_USB0_DDR_BRIDGE	  65
+#define CLKID_MMC_PCLK		  66
+#define CLKID_DVIN		  67
+#define CLKID_UART2		  68
+#define CLKID_SANA		  69
+#define CLKID_VPU_INTR		  70
+#define CLKID_SEC_AHB_AHB3_BRIDGE 71
+#define CLKID_CLK81_A53		  72
+#define CLKID_VCLK2_VENCI0	  73
+#define CLKID_VCLK2_VENCI1	  74
+#define CLKID_VCLK2_VENCP0	  75
+#define CLKID_VCLK2_VENCP1	  76
+#define CLKID_GCLK_VENCI_INT0	  77
+#define CLKID_GCLK_VENCI_INT	  78
+#define CLKID_DAC_CLK		  79
+#define CLKID_AOCLK_GATE	  80
+#define CLKID_IEC958_GATE	  81
+#define CLKID_ENC480P		  82
+#define CLKID_RNG1		  83
+#define CLKID_GCLK_VENCI_INT1	  84
+#define CLKID_VCLK2_VENCLMCC	  85
+#define CLKID_VCLK2_VENCL	  86
+#define CLKID_VCLK_OTHER	  87
+#define CLKID_EDP		  88
+#define CLKID_AO_MEDIA_CPU	  89
+#define CLKID_AO_AHB_SRAM	  90
+#define CLKID_AO_AHB_BUS	  91
+#define CLKID_AO_IFACE		  92
+#define CLKID_AO_I2C		  93
+
+#define NR_CLKS			  94
+
+/* include the CLKIDs that have been made part of the stable DT binding */
+#include <dt-bindings/clock/gxbb-clkc.h>
+
+#endif /* __GXBB_H */
diff --git a/include/dt-bindings/clock/gxbb-clkc.h b/include/dt-bindings/clock/gxbb-clkc.h
new file mode 100644
index 0000000..f889d80
--- /dev/null
+++ b/include/dt-bindings/clock/gxbb-clkc.h
@@ -0,0 +1,12 @@
+/*
+ * GXBB clock tree IDs
+ */
+
+#ifndef __GXBB_CLKC_H
+#define __GXBB_CLKC_H
+
+#define CLKID_CPUCLK		1
+#define CLKID_CLK81		12
+#define CLKID_ETH		36
+
+#endif /* __GXBB_CLKC_H */
-- 
2.1.4
