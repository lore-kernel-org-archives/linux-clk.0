Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.175.55.52])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB51C35B62F;
	Thu, 23 Apr 2026 09:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.175.55.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776935501; cv=none; b=pa0uRdmbxQZj/A6GevT2YN+BsrGpanrCYzmEWq9wa5Vw4hWz3RxvnFQi1VBVgmEYmmJlsLOfkiLskxuAM81dQ7s4ZZsSMs9ZRzQjDuoyAPAxphbwwEuEsH6UBNbcaIPaWU2TFUzOdHxMkzHl0X5DYPKemCoNhleOpoeMEKi3GXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776935501; c=relaxed/simple;
	bh=Z5HPvN/1lOPqgBR4HU6xsUkYEt83Oiet2z5F+s7vPmQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X7MPrdjznmWRrtCcSzeacX605ym9UdYmori4+1Tr3Lg5FPU/QA8YX+wxUIDxmvRKcNsk6EXhImXY7pVSFQnig9xyiJ0LZnLqdS7pV3K/vxWTGx9PSWmBovGvyMp0dTDrv6Q0oYtrg577wFwe8lx3hACz2tSp+apYLYcEnzhP/Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=52.175.55.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0005152DT.eswin.cn (unknown [10.12.96.41])
	by app1 (Coremail) with SMTP id TAJkCgAnyXI24ulpRgEUAA--.16353S2;
	Thu, 23 Apr 2026 17:11:27 +0800 (CST)
From: dongxuyang@eswincomputing.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de,
	huangyifeng@eswincomputing.com,
	dongxuyang@eswincomputing.com,
	benoit.monin@bootlin.com,
	bmasney@redhat.com
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com
Subject: [PATCH v3 2/3] clk: eswin: Add eic7700 HSP clock driver
Date: Thu, 23 Apr 2026 17:11:14 +0800
Message-Id: <20260423091114.2326-1-dongxuyang@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20260423090904.2108-1-dongxuyang@eswincomputing.com>
References: <20260423090904.2108-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TAJkCgAnyXI24ulpRgEUAA--.16353S2
X-Coremail-Antispam: 1UD129KBjvAXoW3KrW5Aw47Jr1Uuw13WryfJFb_yoW8GFW5Zo
	WfKF43Za48Jw18urWFkw1Sy3WfZrs7AFy3XFn5Crnrua40yr45JryfGwnI9r13ta4Y9rWD
	Arn7JryfuFZxGFyfn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUYK7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20xva
	j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
	x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
	Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7M4kE6xkIj40Ew7xC0wCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE-syl42
	xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
	GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI4
	8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4U
	MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
	8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUeZ2-DUUUU
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/

From: Xuyang Dong <dongxuyang@eswincomputing.com>

Add driver for the ESWIN EIC7700 high-speed peripherals system
clock controller and register an auxiliary device for system
reset controller which is named as "hsp-reset".

Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
---
 drivers/clk/eswin/Kconfig           |  12 +
 drivers/clk/eswin/Makefile          |   1 +
 drivers/clk/eswin/clk-eic7700-hsp.c | 384 ++++++++++++++++++++++++++++
 3 files changed, 397 insertions(+)
 create mode 100644 drivers/clk/eswin/clk-eic7700-hsp.c

diff --git a/drivers/clk/eswin/Kconfig b/drivers/clk/eswin/Kconfig
index 0406ec499ec9..e6cc2a407bac 100644
--- a/drivers/clk/eswin/Kconfig
+++ b/drivers/clk/eswin/Kconfig
@@ -13,3 +13,15 @@ config COMMON_CLK_EIC7700
 	  SoC. The clock controller generates and supplies clocks to various
 	  peripherals within the SoC.
 	  Say yes here to support the clock controller on the EIC7700 SoC.
+
+config COMMON_CLK_EIC7700_HSP
+	tristate "EIC7700 HSP Clock Driver"
+	depends on ARCH_ESWIN || COMPILE_TEST
+	select AUXILIARY_BUS
+	select COMMON_CLK_EIC7700
+	select RESET_EIC7700_HSP if RESET_CONTROLLER
+	help
+	  This driver provides support for clock controller on ESWIN EIC7700
+	  HSP. The clock controller generates and supplies clocks to high
+	  speed peripherals within the SoC.
+	  Say yes here to support the clock controller on the EIC7700 HSP.
diff --git a/drivers/clk/eswin/Makefile b/drivers/clk/eswin/Makefile
index 4a7c2af82164..21a09a3396df 100644
--- a/drivers/clk/eswin/Makefile
+++ b/drivers/clk/eswin/Makefile
@@ -6,3 +6,4 @@
 obj-$(CONFIG_COMMON_CLK_ESWIN)		+= clk.o

 obj-$(CONFIG_COMMON_CLK_EIC7700)	+= clk-eic7700.o
+obj-$(CONFIG_COMMON_CLK_EIC7700_HSP)	+= clk-eic7700-hsp.o
diff --git a/drivers/clk/eswin/clk-eic7700-hsp.c b/drivers/clk/eswin/clk-eic7700-hsp.c
new file mode 100644
index 000000000000..68f694890231
--- /dev/null
+++ b/drivers/clk/eswin/clk-eic7700-hsp.c
@@ -0,0 +1,384 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2026, Beijing ESWIN Computing Technology Co., Ltd..
+ * All rights reserved.
+ *
+ * ESWIN EIC7700 HSP Clock Driver
+ *
+ * Authors: Xuyang Dong <dongxuyang@eswincomputing.com>
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/eswin,eic7700-hspcrg.h>
+
+#include "common.h"
+
+#define EIC7700_HSP_SATA_REG		0x300
+#define EIC7700_HSP_MSHC0_REG		0x510
+#define EIC7700_HSP_MSHC1_REG		0x610
+#define EIC7700_HSP_MSHC2_REG		0x710
+#define EIC7700_HSP_USB0_REG		0x800
+#define EIC7700_HSP_USB0_REF_REG	0x83c
+#define EIC7700_HSP_USB1_REG		0x900
+#define EIC7700_HSP_USB1_REF_REG	0x93c
+
+#define USB_REF_XTAL24M			0x2a
+#define EIC7700_HSP_NR_CLKS		(EIC7700_HSP_CLK_GATE_SATA + 1)
+
+struct eic7700_hsp_clk_gate {
+	struct clk_hw hw;
+	unsigned int id;
+	void __iomem *reg;
+	void __iomem *ref_reg;
+	const char *name;
+	const struct clk_parent_data *parent_data;
+	unsigned long flags;
+	unsigned long offset;
+	unsigned long ref_offset;
+	u8 bit_idx;
+	spinlock_t *lock; /* protect register read-modify-write cycle */
+};
+
+/*
+ * The USB clock gate (hsp_clk_gate_endisable) and the reset driver both
+ * perform read-modify-write cycles on registers 0x800 and 0x900. Use
+ * custom regmap lock callbacks so that regmap operations hold data->lock
+ * with IRQs disabled, the same lock the clock gate path uses, preventing
+ * concurrent RMW races on those shared registers.
+ */
+struct eic7700_hsp_regmap_lock {
+	spinlock_t *lock; /* protect register read-modify-write cycle */
+	unsigned long flags;
+};
+
+static void eic7700_hsp_regmap_lock(void *arg)
+__acquires(lock_ctx->lock)
+{
+	struct eic7700_hsp_regmap_lock *const lock_ctx = arg;
+	unsigned long flags;
+
+	spin_lock_irqsave(lock_ctx->lock, flags);
+	lock_ctx->flags = flags;
+}
+
+static void eic7700_hsp_regmap_unlock(void *arg)
+__releases(lock_ctx->lock)
+{
+	struct eic7700_hsp_regmap_lock *const lock_ctx = arg;
+
+	spin_unlock_irqrestore(lock_ctx->lock, lock_ctx->flags);
+}
+
+static inline struct eic7700_hsp_clk_gate *to_gate_clk(struct clk_hw *hw)
+{
+	return container_of(hw, struct eic7700_hsp_clk_gate, hw);
+}
+
+#define EIC7700_HSP_GATE(_id, _name, _pdata, _flags, _offset, _idx,	\
+			 _ref_offset)					\
+	{								\
+		.id		= _id,					\
+		.name		= _name,				\
+		.parent_data	= _pdata,				\
+		.flags		= _flags,				\
+		.offset		= _offset,				\
+		.ref_offset	= _ref_offset,				\
+		.bit_idx	= _idx,					\
+	}
+
+static void hsp_clk_gate_endisable(struct clk_hw *hw, int enable)
+{
+	struct eic7700_hsp_clk_gate *gate = to_gate_clk(hw);
+	u32 reg;
+
+	guard(spinlock_irqsave)(gate->lock);
+
+	reg = readl(gate->reg);
+
+	if (enable) {
+		reg |= BIT(gate->bit_idx);
+		/*
+		 * Hardware bug: The USB reference clock must be 24MHz.
+		 * The default register value after reset is invalid.
+		 * Workaround: Rewrite the correct value before enabling
+		 * the USB gate clock.
+		 */
+		writel(USB_REF_XTAL24M, gate->ref_reg);
+	} else {
+		reg &= ~BIT(gate->bit_idx);
+	}
+
+	writel(reg, gate->reg);
+}
+
+static int hsp_clk_gate_enable(struct clk_hw *hw)
+{
+	hsp_clk_gate_endisable(hw, 1);
+
+	return 0;
+}
+
+static void hsp_clk_gate_disable(struct clk_hw *hw)
+{
+	hsp_clk_gate_endisable(hw, 0);
+}
+
+static int hsp_clk_gate_is_enabled(struct clk_hw *hw)
+{
+	struct eic7700_hsp_clk_gate *gate = to_gate_clk(hw);
+
+	return !!(readl(gate->reg) & BIT(gate->bit_idx));
+}
+
+static const struct clk_ops hsp_clk_gate_ops = {
+	.enable = hsp_clk_gate_enable,
+	.disable = hsp_clk_gate_disable,
+	.is_enabled = hsp_clk_gate_is_enabled,
+};
+
+static struct clk_hw *
+hsp_clk_register_gate(struct device *dev, unsigned int id, const char *name,
+		      const struct clk_parent_data *parent_data,
+		      unsigned long flags, void __iomem *reg,
+		      void __iomem *ref_reg, u8 bit_idx, spinlock_t *lock)
+{
+	struct eic7700_hsp_clk_gate *gate;
+	struct clk_init_data init = {};
+	struct clk_hw *hw;
+	int ret;
+
+	gate = devm_kzalloc(dev, sizeof(*gate), GFP_KERNEL);
+	if (!gate)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.ops = &hsp_clk_gate_ops;
+	init.flags = flags;
+	init.parent_data = parent_data;
+	init.num_parents = 1;
+
+	gate->id = id;
+	gate->reg = reg;
+	gate->ref_reg = ref_reg;
+	gate->bit_idx = bit_idx;
+	gate->lock = lock;
+	gate->hw.init = &init;
+
+	hw = &gate->hw;
+	ret = devm_clk_hw_register(dev, hw);
+	if (ret)
+		hw = ERR_PTR(ret);
+
+	return hw;
+}
+
+static const struct clk_parent_data hsp_cfg[] = {
+	{ .index = 0 }
+};
+
+static const struct clk_parent_data hsp_mmc[] = {
+	{ .index = 1 }
+};
+
+static const struct clk_parent_data hsp_usb_sata[] = {
+	{ .index = 2 }
+};
+
+static struct eswin_fixed_factor_clock eic7700_hsp_factor_clks[] = {
+	ESWIN_FACTOR(EIC7700_HSP_CLK_FAC_CFG_DIV2, "factor_hsp_cfg_div2",
+		     hsp_cfg, 1, 2, 0),
+	ESWIN_FACTOR(EIC7700_HSP_CLK_FAC_CFG_DIV4, "factor_hsp_cfg_div4",
+		     hsp_cfg, 1, 4, 0),
+	ESWIN_FACTOR(EIC7700_HSP_CLK_FAC_MMC_DIV10, "factor_hsp_mmc_div10",
+		     hsp_mmc, 1, 10, 0),
+};
+
+static struct eswin_gate_clock eic7700_hsp_gate_clks[] = {
+	ESWIN_GATE(EIC7700_HSP_CLK_GATE_SATA, "gate_clk_hsp_sata", hsp_usb_sata,
+		   CLK_SET_RATE_PARENT, EIC7700_HSP_SATA_REG, 28, 0),
+	ESWIN_GATE(EIC7700_HSP_CLK_GATE_MSHC0_TMR, "gate_clk_hsp_mshc0_tmr",
+		   hsp_mmc, CLK_SET_RATE_PARENT, EIC7700_HSP_MSHC0_REG, 8, 0),
+	ESWIN_GATE(EIC7700_HSP_CLK_GATE_MSHC1_TMR, "gate_clk_hsp_mshc1_tmr",
+		   hsp_mmc, CLK_SET_RATE_PARENT, EIC7700_HSP_MSHC1_REG, 8, 0),
+	ESWIN_GATE(EIC7700_HSP_CLK_GATE_MSHC2_TMR, "gate_clk_hsp_mshc2_tmr",
+		   hsp_mmc, CLK_SET_RATE_PARENT, EIC7700_HSP_MSHC2_REG, 8, 0),
+};
+
+static struct eic7700_hsp_clk_gate eic7700_hsp_spec_gate_clks[] = {
+	EIC7700_HSP_GATE(EIC7700_HSP_CLK_GATE_USB0, "gate_clk_hsp_usb0",
+			 hsp_usb_sata, CLK_SET_RATE_PARENT,
+			 EIC7700_HSP_USB0_REG, 28, EIC7700_HSP_USB0_REF_REG),
+	EIC7700_HSP_GATE(EIC7700_HSP_CLK_GATE_USB1, "gate_clk_hsp_usb1",
+			 hsp_usb_sata, CLK_SET_RATE_PARENT,
+			 EIC7700_HSP_USB1_REG, 28, EIC7700_HSP_USB1_REF_REG),
+};
+
+static const struct clk_parent_data mux_mmc_3mux1_p[] = {
+	{ .fw_name = "cfg" },
+	{ .hw = &eic7700_hsp_factor_clks[0].hw },
+	{ .hw = &eic7700_hsp_factor_clks[1].hw },
+};
+
+static const struct clk_parent_data mux_mmc_2mux1_p[] = {
+	{ .fw_name = "mmc" },
+	{ .hw = &eic7700_hsp_factor_clks[2].hw },
+};
+
+static u32 mux_mmc_3mux1_tbl[] = { 0x0, 0x1, 0x3 };
+
+static struct eswin_mux_clock eic7700_hsp_mux_clks[] = {
+	ESWIN_MUX_TBL(EIC7700_HSP_CLK_MUX_EMMC_3MUX1, "mux_hsp_emmc_3mux1",
+		      mux_mmc_3mux1_p, ARRAY_SIZE(mux_mmc_3mux1_p),
+		      CLK_SET_RATE_PARENT, EIC7700_HSP_MSHC0_REG, 16, 2, 0,
+		      mux_mmc_3mux1_tbl),
+	ESWIN_MUX_TBL(EIC7700_HSP_CLK_MUX_SD0_3MUX1, "mux_hsp_sd0_3mux1",
+		      mux_mmc_3mux1_p, ARRAY_SIZE(mux_mmc_3mux1_p),
+		      CLK_SET_RATE_PARENT, EIC7700_HSP_MSHC1_REG, 16, 2, 0,
+		      mux_mmc_3mux1_tbl),
+	ESWIN_MUX_TBL(EIC7700_HSP_CLK_MUX_SD1_3MUX1, "mux_hsp_sd1_3mux1",
+		      mux_mmc_3mux1_p, ARRAY_SIZE(mux_mmc_3mux1_p),
+		      CLK_SET_RATE_PARENT, EIC7700_HSP_MSHC2_REG, 16, 2, 0,
+		      mux_mmc_3mux1_tbl),
+	ESWIN_MUX(EIC7700_HSP_CLK_MUX_EMMC_CQE_2MUX1, "mux_hsp_emmc_cqe_2mux1",
+		  mux_mmc_2mux1_p, ARRAY_SIZE(mux_mmc_2mux1_p),
+		  CLK_SET_RATE_PARENT, EIC7700_HSP_MSHC0_REG, 0, 1, 0),
+	ESWIN_MUX(EIC7700_HSP_CLK_MUX_SD0_CQE_2MUX1, "mux_hsp_sd0_cqe_2mux1",
+		  mux_mmc_2mux1_p, ARRAY_SIZE(mux_mmc_2mux1_p),
+		  CLK_SET_RATE_PARENT, EIC7700_HSP_MSHC1_REG, 0, 1, 0),
+	ESWIN_MUX(EIC7700_HSP_CLK_MUX_SD1_CQE_2MUX1, "mux_hsp_sd1_cqe_2mux1",
+		  mux_mmc_2mux1_p, ARRAY_SIZE(mux_mmc_2mux1_p),
+		  CLK_SET_RATE_PARENT, EIC7700_HSP_MSHC2_REG, 0, 1, 0),
+};
+
+static struct eswin_clk_info eic7700_hsp_clks[] = {
+	ESWIN_GATE_TYPE(EIC7700_HSP_CLK_GATE_EMMC, "gate_clk_hsp_emmc",
+			EIC7700_HSP_CLK_MUX_EMMC_3MUX1,
+			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			EIC7700_HSP_MSHC0_REG, 24, 0),
+	ESWIN_GATE_TYPE(EIC7700_HSP_CLK_GATE_SD0, "gate_clk_hsp_sd0",
+			EIC7700_HSP_CLK_MUX_SD0_3MUX1,
+			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			EIC7700_HSP_MSHC1_REG, 24, 0),
+	ESWIN_GATE_TYPE(EIC7700_HSP_CLK_GATE_SD1, "gate_clk_hsp_sd1",
+			EIC7700_HSP_CLK_MUX_SD1_3MUX1,
+			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			EIC7700_HSP_MSHC2_REG, 24, 0),
+};
+
+static int eic7700_hsp_clk_probe(struct platform_device *pdev)
+{
+	struct regmap_config eic7700_hsp_regmap_config;
+	struct eic7700_hsp_regmap_lock *lock_ctx;
+	struct device *dev = &pdev->dev;
+	struct auxiliary_device *adev;
+	struct eswin_clock_data *data;
+	struct regmap *regmap;
+	struct clk_hw *hw;
+	int i, ret;
+
+	data = eswin_clk_init(pdev, EIC7700_HSP_NR_CLKS);
+	if (IS_ERR(data))
+		return dev_err_probe(dev, PTR_ERR(data),
+				     "failed to get clk data!\n");
+
+	lock_ctx = devm_kzalloc(dev, sizeof(*lock_ctx), GFP_KERNEL);
+	if (!lock_ctx)
+		return dev_err_probe(dev, -ENOMEM,
+				     "failed to alloc regmap lock ctx\n");
+
+	lock_ctx->lock = &data->lock;
+	eic7700_hsp_regmap_config = (struct regmap_config) {
+		.reg_bits = 32,
+		.val_bits = 32,
+		.max_register = 0x1ffc,
+		.reg_stride = 4,
+		.lock = eic7700_hsp_regmap_lock,
+		.unlock = eic7700_hsp_regmap_unlock,
+		.lock_arg = lock_ctx,
+	};
+
+	regmap = devm_regmap_init_mmio(dev, data->base,
+				       &eic7700_hsp_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "failed to get regmap!\n");
+
+	ret = eswin_clk_register_fixed_factor(dev, eic7700_hsp_factor_clks,
+					      ARRAY_SIZE(eic7700_hsp_factor_clks),
+					      data);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to register fixed factor clock\n");
+
+	ret = eswin_clk_register_gate(dev, eic7700_hsp_gate_clks,
+				      ARRAY_SIZE(eic7700_hsp_gate_clks), data);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to register gate clock\n");
+
+	ret = eswin_clk_register_mux(dev, eic7700_hsp_mux_clks,
+				     ARRAY_SIZE(eic7700_hsp_mux_clks),
+				     data);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to register mux clock\n");
+
+	ret = eswin_clk_register_clks(dev, eic7700_hsp_clks,
+				      ARRAY_SIZE(eic7700_hsp_clks), data);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to register clock\n");
+
+	for (i = 0; i < ARRAY_SIZE(eic7700_hsp_spec_gate_clks); i++) {
+		struct eic7700_hsp_clk_gate *gate;
+
+		gate = &eic7700_hsp_spec_gate_clks[i];
+		hw = hsp_clk_register_gate(dev, gate->id, gate->name,
+					   gate->parent_data, gate->flags,
+					   data->base + gate->offset,
+					   data->base + gate->ref_offset,
+					   gate->bit_idx, &data->lock);
+		if (IS_ERR(hw))
+			return dev_err_probe(dev, PTR_ERR(hw),
+					     "failed to register gate clock\n");
+
+		data->clk_data.hws[gate->id] = hw;
+	}
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
+					  &data->clk_data);
+	if (ret)
+		return dev_err_probe(dev, ret, "add clk provider failed\n");
+
+	adev = devm_auxiliary_device_create(dev, "hsp-reset", NULL);
+	if (!adev)
+		return dev_err_probe(dev, -ENODEV,
+				     "register hsp-reset device failed\n");
+
+	return 0;
+}
+
+static const struct of_device_id eic7700_hsp_clock_dt_ids[] = {
+	{ .compatible = "eswin,eic7700-hspcrg", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, eic7700_hsp_clock_dt_ids);
+
+static struct platform_driver eic7700_hsp_clock_driver = {
+	.probe	= eic7700_hsp_clk_probe,
+	.driver = {
+		.name	= "eic7700-hsp-clock",
+		.of_match_table	= eic7700_hsp_clock_dt_ids,
+	},
+};
+
+module_platform_driver(eic7700_hsp_clock_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Xuyang Dong <dongxuyang@eswincomputing.com>");
+MODULE_DESCRIPTION("ESWIN EIC7700 HSP clock controller driver");
--
2.34.1

