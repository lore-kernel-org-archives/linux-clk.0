Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD0A3112BD;
	Thu, 20 Nov 2025 13:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763644628; cv=none; b=qzUhhcUakMu4F0VwV4fGy3bmPgWWqR5PyR/GoZZFwCNgASxDFHUSROFDv0jFwaCejTpKTnB8/1nZ9520Dt8LAJKtrsuyMtVa9Ydryybp9CrU0f+WT0Z2gMhiKdzlOf5r7YyjJ57jbsPH6uyr9BIrYUiDmGdbA9EmPfZlgpvD4tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763644628; c=relaxed/simple;
	bh=kxSICP8fwMm99AQGf8853Gn6w5FNP1Z6VkgI0xBu+jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NCm6vrl4Ieh/J8qJZVVOWVBk6p/MD9lAkQPZ0TyfvFroMKIA/KiItCk7TbejcmFkDmCru1IAEJ9TE/XVM5xoFbUKUQADH50DDOtqXqey9TBaPquwduYLCJ7XFiC7T9IcdjKgbLg8bc6vNm4pp34Lnx6Hv9HPqdsVxzXgEcxNr1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=h/91x6Pd; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="h/91x6Pd"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 407732608E;
	Thu, 20 Nov 2025 14:17:05 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tAWxe1q3_yOl; Thu, 20 Nov 2025 14:17:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1763644624; bh=kxSICP8fwMm99AQGf8853Gn6w5FNP1Z6VkgI0xBu+jc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=h/91x6Pdoy5sdusvGSpzxcKRU7oE9n8KSPTIKw63SMMVE3i3K3mEWVwfezcFdTWf5
	 rSzum9Hn4jlHWjYiPXA3alvmiZoPX0nMDe9eP/LksmN7r7N2n7L9y41VUwC+60+2wy
	 lVKGH+TBMw5tE26h9tGvplO0jfyIMe0yQ+zLjVzbzAS8PcVT+RtLrm3huZeSK1BZbb
	 B0tF3zpccEWmYwQos0x8m3sVt4qRlguG5z/cKGpLjiRMwB+PUBe+ShGwDfD6IzTyw9
	 31Av3GooD9gzRqVeoU91goE4bpeEMverL/Xbxq0HI6AhaokkNr3unqMYG26PoXrYlZ
	 TzWipCzM0dy5w==
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Icenowy Zheng <uwu@icenowy.me>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 6/7] clk: thead: th1520-ap: Support CPU frequency scaling
Date: Thu, 20 Nov 2025 13:14:15 +0000
Message-ID: <20251120131416.26236-7-ziyao@disroot.org>
In-Reply-To: <20251120131416.26236-1-ziyao@disroot.org>
References: <20251120131416.26236-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On TH1520 SoC, c910_clk feeds the CPU cluster. It could be glitchlessly
reparented to one of the two PLLs: either to cpu_pll0 indirectly through
c910_i0_clk, or to cpu_pll1 directly.

To achieve glitchless rate change, customized clock operations are
implemented for c910_clk: on rate change, the PLL not currently in use
is configured to the requested rate first, then c910_clk reparents to
it.

Additionally, c910_bus_clk, which in turn takes c910_clk as parent,
has a frequency limit of 750MHz. A clock notifier is registered on
c910_clk to adjust c910_bus_clk on c910_clk rate change.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/clk/thead/clk-th1520-ap.c | 148 +++++++++++++++++++++++++++++-
 1 file changed, 146 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index 79f001a047b2..cd3b396c9a3d 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -7,9 +7,11 @@
 
 #include <dt-bindings/clock/thead,th1520-clk-ap.h>
 #include <linux/bitfield.h>
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -34,6 +36,9 @@
 #define TH1520_PLL_LOCK_TIMEOUT_US	44
 #define TH1520_PLL_STABLE_DELAY_US	30
 
+/* c910_bus_clk must be kept below 750MHz for stability */
+#define TH1520_C910_BUS_MAX_RATE	(750 * 1000 * 1000)
+
 struct ccu_internal {
 	u8	shift;
 	u8	width;
@@ -472,6 +477,72 @@ static const struct clk_ops clk_pll_ops = {
 	.set_rate	= ccu_pll_set_rate,
 };
 
+/*
+ * c910_clk could be reparented glitchlessly for DVFS. There are two parents,
+ *  - c910_i0_clk, dervided from cpu_pll0_clk or osc_24m.
+ *  - cpu_pll1_clk, which provides the exact same set of rates as cpu_pll0_clk.
+ *
+ * During rate setting, always forward the request to the unused parent, and
+ * then switch c910_clk to it to avoid glitch.
+ */
+static u8 c910_clk_get_parent(struct clk_hw *hw)
+{
+	return clk_mux_ops.get_parent(hw);
+}
+
+static int c910_clk_set_parent(struct clk_hw *hw, u8 index)
+{
+	return clk_mux_ops.set_parent(hw, index);
+}
+
+static unsigned long c910_clk_recalc_rate(struct clk_hw *hw,
+					  unsigned long parent_rate)
+{
+	return parent_rate;
+}
+
+static int c910_clk_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
+{
+	u8 alt_parent_index = !c910_clk_get_parent(hw);
+	struct clk_hw *alt_parent;
+
+	alt_parent = clk_hw_get_parent_by_index(hw, alt_parent_index);
+
+	req->rate		= clk_hw_round_rate(alt_parent, req->rate);
+	req->best_parent_hw	= alt_parent;
+	req->best_parent_rate	= req->rate;
+
+	return 0;
+}
+
+static int c910_clk_set_rate(struct clk_hw *hw, unsigned long rate,
+			     unsigned long parent_rate)
+{
+	return -EOPNOTSUPP;
+}
+
+static int c910_clk_set_rate_and_parent(struct clk_hw *hw, unsigned long rate,
+					unsigned long parent_rate, u8 index)
+{
+	struct clk_hw *parent = clk_hw_get_parent_by_index(hw, index);
+
+	clk_set_rate(parent->clk, parent_rate);
+
+	c910_clk_set_parent(hw, index);
+
+	return 0;
+}
+
+static const struct clk_ops c910_clk_ops = {
+	.get_parent		= c910_clk_get_parent,
+	.set_parent		= c910_clk_set_parent,
+	.recalc_rate		= c910_clk_recalc_rate,
+	.determine_rate		= c910_clk_determine_rate,
+	.set_rate		= c910_clk_set_rate,
+	.set_rate_and_parent	= c910_clk_set_rate_and_parent,
+};
+
 static const struct clk_parent_data osc_24m_clk[] = {
 	{ .index = 0 }
 };
@@ -672,7 +743,8 @@ static const struct clk_parent_data c910_i0_parents[] = {
 static struct ccu_mux c910_i0_clk = {
 	.clkid	= CLK_C910_I0,
 	.reg	= 0x100,
-	.mux	= TH_CCU_MUX("c910-i0", c910_i0_parents, 1, 1),
+	.mux	= TH_CCU_MUX_FLAGS("c910-i0", c910_i0_parents, 1, 1,
+				   CLK_SET_RATE_PARENT, CLK_MUX_ROUND_CLOSEST),
 };
 
 static const struct clk_parent_data c910_parents[] = {
@@ -683,7 +755,14 @@ static const struct clk_parent_data c910_parents[] = {
 static struct ccu_mux c910_clk = {
 	.clkid	= CLK_C910,
 	.reg	= 0x100,
-	.mux	= TH_CCU_MUX("c910", c910_parents, 0, 1),
+	.mux	= {
+		.mask		= BIT(0),
+		.shift		= 0,
+		.hw.init	= CLK_HW_INIT_PARENTS_DATA("c910",
+							   c910_parents,
+							   &c910_clk_ops,
+							   CLK_SET_RATE_PARENT),
+	},
 };
 
 static struct ccu_div c910_bus_clk = {
@@ -1372,11 +1451,69 @@ static const struct th1520_plat_data th1520_vo_platdata = {
 	.nr_gate_clks = ARRAY_SIZE(th1520_vo_gate_clks),
 };
 
+/*
+ * Maintain clock rate of c910_bus_clk below TH1520_C910_BUS_MAX_RATE (750MHz)
+ * when its parent, c910_clk, changes the rate.
+ *
+ * Additionally, TRM is unclear about c910_bus_clk behavior with divisor set to
+ * 2, thus we should ensure the new divisor stays in (2, MAXDIVISOR).
+ */
+static unsigned long c910_bus_clk_divisor(struct ccu_div *cd,
+					  unsigned long parent_rate)
+{
+	return clamp(DIV_ROUND_UP(parent_rate, TH1520_C910_BUS_MAX_RATE),
+		     2U, 1U << cd->div.width);
+}
+
+static int c910_clk_notifier_cb(struct notifier_block *nb,
+				unsigned long action, void *data)
+{
+	struct clk_notifier_data *cnd = data;
+	unsigned long new_divisor, ref_rate;
+
+	if (action != PRE_RATE_CHANGE && action != POST_RATE_CHANGE)
+		return NOTIFY_DONE;
+
+	new_divisor	= c910_bus_clk_divisor(&c910_bus_clk, cnd->new_rate);
+
+	if (cnd->new_rate > cnd->old_rate) {
+		/*
+		 * Scaling up. Adjust c910_bus_clk divisor
+		 * - before c910_clk rate change to ensure the constraints
+		 *   aren't broken after scaling to higher rates,
+		 * - after c910_clk rate change to keep c910_bus_clk as high as
+		 *   possible
+		 */
+		ref_rate = action == PRE_RATE_CHANGE ?
+				cnd->old_rate : cnd->new_rate;
+		clk_set_rate(c910_bus_clk.common.hw.clk,
+			     ref_rate / new_divisor);
+	} else if (cnd->new_rate < cnd->old_rate &&
+		    action == POST_RATE_CHANGE) {
+		/*
+		 * Scaling down. Adjust c910_bus_clk divisor only after
+		 * c910_clk rate change to keep c910_bus_clk as high as
+		 * possible, Scaling down never breaks the constraints.
+		 */
+		clk_set_rate(c910_bus_clk.common.hw.clk,
+			     cnd->new_rate / new_divisor);
+	} else {
+		return NOTIFY_DONE;
+	}
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block c910_clk_notifier = {
+	.notifier_call	= c910_clk_notifier_cb,
+};
+
 static int th1520_clk_probe(struct platform_device *pdev)
 {
 	const struct th1520_plat_data *plat_data;
 	struct device *dev = &pdev->dev;
 	struct clk_hw_onecell_data *priv;
+	struct clk *notifier_clk;
 
 	struct regmap *map;
 	void __iomem *base;
@@ -1463,6 +1600,13 @@ static int th1520_clk_probe(struct platform_device *pdev)
 		ret = devm_clk_hw_register(dev, &emmc_sdio_ref_clk.hw);
 		if (ret)
 			return ret;
+
+		notifier_clk = devm_clk_hw_get_clk(dev, &c910_clk.mux.hw,
+						   "dvfs");
+		ret = devm_clk_notifier_register(dev, notifier_clk,
+						 &c910_clk_notifier);
+		if (ret)
+			return ret;
 	}
 
 	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, priv);
-- 
2.51.2

