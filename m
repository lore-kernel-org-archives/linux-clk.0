Return-Path: <mturquette@baylibre.com>
From: Michael Turquette <mturquette@baylibre.com>
To: linux-clk@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com,
	carlo@endlessm.com,
	victor.wan@amlogic.com,
	jerry.cao@amlogic.com,
	xing.xu@amlogic.com
Subject: [PATCH v2 3/6] clk: meson: add mpll support
Date: Wed, 22 Jun 2016 19:01:17 -0700
Message-Id: <1466647280-17596-4-git-send-email-mturquette@baylibre.com>
In-Reply-To: <1466647280-17596-1-git-send-email-mturquette@baylibre.com>
References: <1466647280-17596-1-git-send-email-mturquette@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

MPLLs are adjustable rate clocks derived from PLLs. On both Meson8b and
GXBB they appear to be only derived from fixed_pll.

Add support for these clock types so that they can be added to their
respective drivers.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Michael Turquette <mturquette@baylibre.com>
---
No change in v2.

 drivers/clk/meson/Makefile   |  2 +-
 drivers/clk/meson/clk-mpll.c | 94 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/clkc.h     | 10 +++++
 3 files changed, 105 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/meson/clk-mpll.c

diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
index b3d60fecd846..7667218b5e46 100644
--- a/drivers/clk/meson/Makefile
+++ b/drivers/clk/meson/Makefile
@@ -2,5 +2,5 @@
 # Makefile for Meson specific clk
 #
 
-obj-$(CONFIG_COMMON_CLK_AMLOGIC) += clk-pll.o clk-cpu.o
+obj-$(CONFIG_COMMON_CLK_AMLOGIC) += clk-pll.o clk-cpu.o clk-mpll.o
 obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b-clkc.o
diff --git a/drivers/clk/meson/clk-mpll.c b/drivers/clk/meson/clk-mpll.c
new file mode 100644
index 000000000000..03af79005ddb
--- /dev/null
+++ b/drivers/clk/meson/clk-mpll.c
@@ -0,0 +1,94 @@
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
+ * Copyright (c) 2016 AmLogic, Inc.
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
+/*
+ * MultiPhase Locked Loops are outputs from a PLL with additional frequency
+ * scaling capabilities. MPLL rates are calculated as:
+ *
+ * f(N2_integer, SDM_IN ) = 2.0G/(N2_integer + SDM_IN/16384)
+ */
+
+#include <linux/clk-provider.h>
+#include "clkc.h"
+
+#define SDM_MAX 16384
+
+#define to_meson_clk_mpll(_hw) container_of(_hw, struct meson_clk_mpll, hw)
+
+static unsigned long mpll_recalc_rate(struct clk_hw *hw,
+		unsigned long parent_rate)
+{
+	struct meson_clk_mpll *mpll = to_meson_clk_mpll(hw);
+	struct parm *p;
+	unsigned long rate = 0;
+	unsigned long reg, sdm, n2;
+
+	p = &mpll->sdm;
+	reg = readl(mpll->base + p->reg_off);
+	sdm = PARM_GET(p->width, p->shift, reg);
+
+	p = &mpll->n2;
+	reg = readl(mpll->base + p->reg_off);
+	n2 = PARM_GET(p->width, p->shift, reg);
+
+	rate = (parent_rate * SDM_MAX) / ((SDM_MAX * n2) + sdm);
+
+	return rate;
+}
+
+const struct clk_ops meson_clk_mpll_ro_ops = {
+	.recalc_rate = mpll_recalc_rate,
+};
diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
index 9436932880c0..73f014691240 100644
--- a/drivers/clk/meson/clkc.h
+++ b/drivers/clk/meson/clkc.h
@@ -73,6 +73,15 @@ struct meson_clk_cpu {
 int meson_clk_cpu_notifier_cb(struct notifier_block *nb, unsigned long event,
 		void *data);
 
+struct meson_clk_mpll {
+	struct clk_hw hw;
+	void __iomem *base;
+	struct parm sdm;
+	struct parm n2;
+	/* FIXME ssen gate control? */
+	spinlock_t *lock;
+};
+
 #define MESON_GATE(_name, _reg, _bit)					\
 struct clk_gate gxbb_##_name = { 						\
 	.reg = (void __iomem *) _reg, 					\
@@ -91,5 +100,6 @@ struct clk_gate gxbb_##_name = { 						\
 extern const struct clk_ops meson_clk_pll_ro_ops;
 extern const struct clk_ops meson_clk_pll_ops;
 extern const struct clk_ops meson_clk_cpu_ops;
+extern const struct clk_ops meson_clk_mpll_ro_ops;
 
 #endif /* __CLKC_H */
-- 
2.1.4
