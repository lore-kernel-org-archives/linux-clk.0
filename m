Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BE22D780C
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 22:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771280211; cv=none; b=J+V2fE/xXDORcdgR9/o9P4EZfdj9dIUncIkD6s5zT4uB8q55OGWT6+DtAg6xGKeGrL18q1xQq63vfJVUq3OJWxAlAT48e0gA0kCVHtGtOW0aMIEaZ7k+e0yJ4HTTwgXaIZ+wM5aw/h5uAvkfn2ad3CUk+EhKOAVkIe1WFujB9h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771280211; c=relaxed/simple;
	bh=msYrTbGFXhbxNIZwXtfzjX0+zjZWsj0IdZQpORSj7vM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E8NBMRhwc0zkGLv+RuiAFfbYPixOCLe0h4oKjtTCqdlo6xeQ2sYNVZ1YdOdkSr7jsOlQSfJBlG2Cwm55o+YKTtU+J5QFNq1hDYhwiqYO1NNRCuqWJAaHyp7DOFSH1MkMztcHjGpq5zbnqK0zE6sTv3uhdYSMMa/igwHXjw8YhVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=Um6ex4aZ; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="Um6ex4aZ"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79456d5ebf9so32323077b3.2
        for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 14:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1771280207; x=1771885007; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0lklQ9Fubw6mi7iw7OMuloTnwCNwbym6xX9jLwp8KwA=;
        b=Um6ex4aZfiKnUAtewpOsR/s16JeX0L6apIfI2w3VSdIoCbBgNFaaZytdHQIt2Wu/L9
         VSDioDO2fUL0v6ak5cGDpPrZw0zkXYhVM8gh7kIwahMbZpdEzLg2n3iT82dEjY2mr5Pp
         MG10aEwgonx/J87JZGb49hBcZ0AmcelLhpjBgTHPqpWxUSJ+4cZ+zFHxbjdLf9+R3Gt0
         MAIYpovWh0u32QIE5kJBMK2v7tKrPflApLCTGDzK0vRk0EHsaoCFD9OdIi9pafFNVJDa
         hNWhMaWQLHT98I6b34X3E+kznTE5e64qqp1rzqigxXPluhwI7p5X/n7fiGXOGKKhpzgW
         mCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771280207; x=1771885007;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0lklQ9Fubw6mi7iw7OMuloTnwCNwbym6xX9jLwp8KwA=;
        b=VQmBxpa0TPirMFzTdSWL6UDwdrn/ie/8QWeUjkcraY/lXkLXnbU4O/7Z7YkV/1DmcV
         gY1X4I8Rm7FXksBW2L6kfBZGBT4PDQC8xglUkLoc5JfMqSREZivMDQUfa+Fsujv8KPPp
         89twLHVTfHVaiTcdXI5ZVwxa261aV4PTzsrAYQBr7D5ZZoqFAD1OPtEZtwZxM/iyYjvn
         27oUbfziQiwhxZMJZYlkTfpEqY7ZpOK7u0XT4xsSGVqnzLu3Iql7uTn7QezxFIl6Wcof
         nJ0pM+UEiAlM5B6UQSyKE2tcbN3cBJ63WgKetIprXmxjHuohY2xKqEdG3RXx+hDtqX7G
         VKOw==
X-Forwarded-Encrypted: i=1; AJvYcCWnAxs4j3G8qFuiR+5Krc17owmCnthJypJsxwZN6yVnjenpt6Ct1cNZ7N1ViGsCnrGoHV9VJCXnv+s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxnrmyg33KIcjF2UVytWV0l0eSPnyGhY59cMWDWI2w3fckGGl3
	NGRpE6Iz0Ydgkl0uczU6V0Hg2B8OF2MkF9/5DxwLI2o403MsBHd9CPZ6liCBACYJx5U=
X-Gm-Gg: AZuq6aIM5GjBExm9Zg2FGlXBr75/1L5XIjMzFAzMLvBx9R/UtcVyzw0D7QHKflGrv+3
	G23tB3LqAYOYiOEVj7D9FEQymnC+2wdbDPmU5ywtWDTA0uUz3xYL8tJSz/AmPoZtuoVeemoNQvL
	ldaHx6R6clcEAmuVGNZDJMRC7DNEaTUtKCaNmj1lJq7SgUAtQtt/fWfZknsK46RL1N8A5Na3m+2
	Zawrstpr4PJs3Eylh1azxlLHYkhcTYJJJT01GZ4bLtKiH5MEaVYs2CbVy5Gcb0b0ff0KVG03XqL
	OVgK882nUBN9Nr2csdYQarYxyKDtXO8ithSS/cutnopr3V5WQ2tvRoYwHOiOoh2hzuPm2ZAsVS8
	ZKl2wXh9/6cl7fQN4RKIpKz4S6WeB8lp/CJqLTmvcDtzBfNpl16nsA6L3Y/lpD8cYGP2BF2+zeN
	h+HTC4pivCKMi9Aq1TVtKQbUwBG9F+nwfrt7BgJ7lq5fXSRdBZi4Nlj3FTGdH6FR8zXvtuc2Fkv
	aMIzjPUBDCQgHwW79P+fw==
X-Received: by 2002:a05:690c:60c2:b0:796:2fde:5de7 with SMTP id 00721157ae682-797ac5d39famr73811937b3.34.1771280207006;
        Mon, 16 Feb 2026 14:16:47 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c1a8222sm106705757b3.23.2026.02.16.14.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 14:16:46 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Mon, 16 Feb 2026 16:16:34 -0600
Subject: [PATCH v6 3/3] clk: tenstorrent: Add Atlantis clock controller
 driver
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-atlantis-clocks-v6-3-cb46d6a59c73@oss.tenstorrent.com>
References: <20260216-atlantis-clocks-v6-0-cb46d6a59c73@oss.tenstorrent.com>
In-Reply-To: <20260216-atlantis-clocks-v6-0-cb46d6a59c73@oss.tenstorrent.com>
To: Drew Fustini <dfustini@oss.tenstorrent.com>, 
 Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, 
 fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com, 
 npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com, 
 bmasney@redhat.com
X-Mailer: b4 0.14.3

Add driver for clock controller in Tenstorrent Atlantis SoC. This version
of the driver coves clocks from RCPU syscon.

5 types of clocks generated by this controller: PLLs (PLLs
with bypass functionality and an additional Gate clk at output), Shared
Gates (Multiple Gate clks that share an enable bit), standard Muxes,
Dividers and Gates. All clocks are implemented using custom clk ops and
use the regmap interface associated with the syscon. All clocks are derived
from a 24 Mhz oscillator.

The reset controller is also setup as an auxiliary device of the clock
controller.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 MAINTAINERS                             |   1 +
 drivers/clk/Kconfig                     |   1 +
 drivers/clk/Makefile                    |   1 +
 drivers/clk/tenstorrent/Kconfig         |  14 +
 drivers/clk/tenstorrent/Makefile        |   3 +
 drivers/clk/tenstorrent/atlantis-prcm.c | 901 ++++++++++++++++++++++++++++++++
 6 files changed, 921 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93f4e860e589..b4aee846aa5e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22537,6 +22537,7 @@ T:	git https://github.com/tenstorrent/linux.git
 F:	Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm-rcpu.yaml
 F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
 F:	arch/riscv/boot/dts/tenstorrent/
+F:	drivers/clk/tenstorrent/
 F:	drivers/reset/reset-tenstorrent-atlantis.c
 F:	include/dt-bindings/clock/tenstorrent,atlantis-prcm-rcpu.h
 
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 3a1611008e48..643084887257 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -542,6 +542,7 @@ source "drivers/clk/starfive/Kconfig"
 source "drivers/clk/sunxi/Kconfig"
 source "drivers/clk/sunxi-ng/Kconfig"
 source "drivers/clk/tegra/Kconfig"
+source "drivers/clk/tenstorrent/Kconfig"
 source "drivers/clk/thead/Kconfig"
 source "drivers/clk/stm32/Kconfig"
 source "drivers/clk/ti/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 61ec08404442..f88c116d315f 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -156,6 +156,7 @@ obj-y					+= starfive/
 obj-$(CONFIG_ARCH_SUNXI)		+= sunxi/
 obj-y					+= sunxi-ng/
 obj-$(CONFIG_ARCH_TEGRA)		+= tegra/
+obj-y					+= tenstorrent/
 obj-$(CONFIG_ARCH_THEAD)		+= thead/
 obj-y					+= ti/
 obj-$(CONFIG_CLK_UNIPHIER)		+= uniphier/
diff --git a/drivers/clk/tenstorrent/Kconfig b/drivers/clk/tenstorrent/Kconfig
new file mode 100644
index 000000000000..9d4391eeeae0
--- /dev/null
+++ b/drivers/clk/tenstorrent/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config TENSTORRENT_ATLANTIS_PRCM
+	tristate "Support for Tenstorrent Atlantis PRCM Clock Controller"
+	depends on ARCH_TENSTORRENT || COMPILE_TEST
+	default ARCH_TENSTORRENT
+	select REGMAP_MMIO
+	select AUXILIARY_BUS
+	select MFD_SYSCON
+	help
+	  Say yes here to support the different clock
+	  controllers found in the Tenstorrent Atlantis SoC.
+	  This includes the clocks from the RCPU, HSIO, MMIO
+	  and PCIE domain.
diff --git a/drivers/clk/tenstorrent/Makefile b/drivers/clk/tenstorrent/Makefile
new file mode 100644
index 000000000000..95d87bac7bf5
--- /dev/null
+++ b/drivers/clk/tenstorrent/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_TENSTORRENT_ATLANTIS_PRCM)	+= atlantis-prcm.o
diff --git a/drivers/clk/tenstorrent/atlantis-prcm.c b/drivers/clk/tenstorrent/atlantis-prcm.c
new file mode 100644
index 000000000000..6bedb3e5ec7a
--- /dev/null
+++ b/drivers/clk/tenstorrent/atlantis-prcm.c
@@ -0,0 +1,901 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Tenstorrent Atlantis PRCM Clock Driver
+ *
+ * Copyright (c) 2026 Tenstorrent
+ */
+
+#include <dt-bindings/clock/tenstorrent,atlantis-prcm-rcpu.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/bitfield.h>
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+/* RCPU Clock Register Offsets */
+#define RCPU_PLL_CFG_REG	0x0000
+#define RCPU_NOCC_PLL_CFG_REG	0x0004
+#define RCPU_NOCC_CLK_CFG_REG	0x0008
+#define RCPU_DIV_CFG_REG	0x000C
+#define RCPU_BLK_CG_REG		0x0014
+#define LSIO_BLK_CG_REG		0x0018
+#define PLL_RCPU_EN_REG		0x011c
+#define PLL_NOCC_EN_REG		0x0120
+#define BUS_CG_REG		0x01FC
+
+/* PLL Bit Definitions */
+#define PLL_CFG_EN_BIT		BIT(0)
+#define PLL_CFG_BYPASS_BIT	BIT(1)
+#define PLL_CFG_REFDIV_MASK	GENMASK(7, 2)
+#define PLL_CFG_REFDIV_SHIFT	2
+#define PLL_CFG_POSTDIV1_MASK	GENMASK(10, 8)
+#define PLL_CFG_POSTDIV1_SHIFT	8
+#define PLL_CFG_POSTDIV2_MASK	GENMASK(13, 11)
+#define PLL_CFG_POSTDIV2_SHIFT	11
+#define PLL_CFG_FBDIV_MASK	GENMASK(25, 14)
+#define PLL_CFG_FBDIV_SHIFT	14
+#define PLL_CFG_LKDT_BIT	BIT(30)
+#define PLL_CFG_LOCK_BIT	BIT(31)
+#define PLL_LOCK_TIMEOUT_US	1000
+#define PLL_BYPASS_WAIT_US	500
+
+struct atlantis_clk_common {
+	int clkid;
+	struct regmap *regmap;
+	struct clk_hw hw;
+};
+
+static inline struct atlantis_clk_common *
+hw_to_atlantis_clk_common(struct clk_hw *hw)
+{
+	return container_of(hw, struct atlantis_clk_common, hw);
+}
+
+struct atlantis_clk_mux_config {
+	u8 shift;
+	u8 width;
+	u32 reg_offset;
+};
+
+struct atlantis_clk_mux {
+	struct atlantis_clk_common common;
+	struct atlantis_clk_mux_config config;
+};
+
+struct atlantis_clk_gate_config {
+	u32 reg_offset;
+	u32 enable;
+};
+
+struct atlantis_clk_gate {
+	struct atlantis_clk_common common;
+	struct atlantis_clk_gate_config config;
+};
+
+struct atlantis_clk_divider_config {
+	u8 shift;
+	u8 width;
+	u32 flags;
+	u32 reg_offset;
+};
+
+struct atlantis_clk_divider {
+	struct atlantis_clk_common common;
+	struct atlantis_clk_divider_config config;
+};
+
+struct atlantis_clk_pll_config {
+	u32 tbl_num;
+	u32 reg_offset;
+	u32 en_reg_offset;
+	u32 cg_reg_offset;
+	u32 cg_reg_enable;
+};
+
+/* Models a PLL with Bypass Functionality and Enable Bit + a Gate Clock at it's output */
+struct atlantis_clk_pll {
+	struct atlantis_clk_common common;
+	struct atlantis_clk_pll_config config;
+};
+
+struct atlantis_clk_gate_shared_config {
+	u32 reg_offset;
+	u32 enable;
+	unsigned int *share_count;
+	spinlock_t *refcount_lock;
+};
+
+struct atlantis_clk_gate_shared {
+	struct atlantis_clk_common common;
+	struct atlantis_clk_gate_shared_config config;
+};
+
+struct atlantis_clk_fixed_factor_config {
+	unsigned int mult;
+	unsigned int div;
+};
+
+struct atlantis_clk_fixed_factor {
+	struct atlantis_clk_fixed_factor_config config;
+	struct atlantis_clk_common common;
+};
+
+static inline struct atlantis_clk_mux *hw_to_atlantis_clk_mux(struct clk_hw *hw)
+{
+	struct atlantis_clk_common *common = hw_to_atlantis_clk_common(hw);
+
+	return container_of(common, struct atlantis_clk_mux, common);
+}
+
+static inline struct atlantis_clk_gate *
+hw_to_atlantis_clk_gate(struct clk_hw *hw)
+{
+	struct atlantis_clk_common *common = hw_to_atlantis_clk_common(hw);
+
+	return container_of(common, struct atlantis_clk_gate, common);
+}
+
+static inline struct atlantis_clk_divider *
+hw_to_atlantis_clk_divider(struct clk_hw *hw)
+{
+	struct atlantis_clk_common *common = hw_to_atlantis_clk_common(hw);
+
+	return container_of(common, struct atlantis_clk_divider, common);
+}
+
+static inline struct atlantis_clk_pll *hw_to_atlantis_pll(struct clk_hw *hw)
+{
+	struct atlantis_clk_common *common = hw_to_atlantis_clk_common(hw);
+
+	return container_of(common, struct atlantis_clk_pll, common);
+}
+
+static inline struct atlantis_clk_gate_shared *
+hw_to_atlantis_clk_gate_shared(struct clk_hw *hw)
+{
+	struct atlantis_clk_common *common = hw_to_atlantis_clk_common(hw);
+
+	return container_of(common, struct atlantis_clk_gate_shared, common);
+}
+
+static inline struct atlantis_clk_fixed_factor *
+hw_to_atlantis_clk_fixed_factor(struct clk_hw *hw)
+{
+	struct atlantis_clk_common *common = hw_to_atlantis_clk_common(hw);
+
+	return container_of(common, struct atlantis_clk_fixed_factor, common);
+}
+
+static u8 atlantis_clk_mux_get_parent(struct clk_hw *hw)
+{
+	struct atlantis_clk_mux *mux = hw_to_atlantis_clk_mux(hw);
+	u32 val;
+
+	regmap_read(mux->common.regmap, mux->config.reg_offset, &val);
+	val >>= mux->config.shift;
+	val &= (BIT(mux->config.width) - 1);
+
+	return val;
+}
+
+static int atlantis_clk_mux_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct atlantis_clk_mux *mux = hw_to_atlantis_clk_mux(hw);
+	u32 val = index;
+
+	return regmap_update_bits(mux->common.regmap, mux->config.reg_offset,
+				  (BIT(mux->config.width) - 1)
+					  << mux->config.shift,
+				  val << mux->config.shift);
+}
+
+static int atlantis_clk_mux_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
+{
+	return clk_mux_determine_rate_flags(hw, req, hw->init->flags);
+}
+
+const struct clk_ops atlantis_clk_mux_ops = {
+	.get_parent = atlantis_clk_mux_get_parent,
+	.set_parent = atlantis_clk_mux_set_parent,
+	.determine_rate = atlantis_clk_mux_determine_rate,
+};
+
+static void atlantis_clk_gate_endisable(struct clk_hw *hw, int enable)
+{
+	struct atlantis_clk_gate *gate = hw_to_atlantis_clk_gate(hw);
+	u32 val;
+
+	if (enable)
+		val = gate->config.enable;
+	else
+		val = ~(gate->config.enable);
+
+	regmap_update_bits(gate->common.regmap, gate->config.reg_offset,
+			   gate->config.enable, val);
+}
+
+static int atlantis_clk_gate_enable(struct clk_hw *hw)
+{
+	atlantis_clk_gate_endisable(hw, 1);
+
+	return 0;
+}
+
+static void atlantis_clk_gate_disable(struct clk_hw *hw)
+{
+	atlantis_clk_gate_endisable(hw, 0);
+}
+
+static int atlantis_clk_gate_is_enabled(struct clk_hw *hw)
+{
+	struct atlantis_clk_gate *gate = hw_to_atlantis_clk_gate(hw);
+	u32 val;
+
+	regmap_read(gate->common.regmap, gate->config.reg_offset, &val);
+
+	val &= gate->config.enable;
+
+	return val ? 1 : 0;
+}
+
+const struct clk_ops atlantis_clk_gate_ops = {
+	.enable = atlantis_clk_gate_enable,
+	.disable = atlantis_clk_gate_disable,
+	.is_enabled = atlantis_clk_gate_is_enabled,
+};
+
+static unsigned long atlantis_clk_divider_recalc_rate(struct clk_hw *hw,
+						      unsigned long parent_rate)
+{
+	struct atlantis_clk_divider *divider = hw_to_atlantis_clk_divider(hw);
+	u32 val;
+
+	regmap_read(divider->common.regmap, divider->config.reg_offset, &val);
+
+	val >>= divider->config.shift;
+	val &= ((1 << (divider->config.width)) - 1);
+
+	return DIV_ROUND_UP_ULL((u64)parent_rate, val + 1);
+}
+
+const struct clk_ops atlantis_clk_divider_ops = {
+	.recalc_rate = atlantis_clk_divider_recalc_rate,
+};
+
+static unsigned long
+atlantis_clk_fixed_factor_recalc_rate(struct clk_hw *hw,
+				      unsigned long parent_rate)
+{
+	struct atlantis_clk_fixed_factor *factor =
+		hw_to_atlantis_clk_fixed_factor(hw);
+	unsigned long long rate;
+
+	rate = (unsigned long long)parent_rate * factor->config.mult;
+	do_div(rate, factor->config.div);
+	return (unsigned long)rate;
+}
+
+const struct clk_ops atlantis_clk_fixed_factor_ops = {
+	.recalc_rate = atlantis_clk_fixed_factor_recalc_rate,
+};
+
+static int atlantis_clk_pll_is_enabled(struct clk_hw *hw)
+{
+	struct atlantis_clk_pll *pll = hw_to_atlantis_pll(hw);
+	u32 val, en_val, cg_val;
+
+	regmap_read(pll->common.regmap, pll->config.reg_offset, &val);
+	regmap_read(pll->common.regmap, pll->config.en_reg_offset, &en_val);
+	regmap_read(pll->common.regmap, pll->config.cg_reg_offset, &cg_val);
+
+	/* Check if PLL is powered on, locked and Gate clk is enabled */
+	return !!(en_val & PLL_CFG_EN_BIT) && !!(val & PLL_CFG_LOCK_BIT) &&
+	       !!(cg_val & pll->config.cg_reg_enable);
+}
+
+static int atlantis_clk_pll_enable(struct clk_hw *hw)
+{
+	struct atlantis_clk_pll *pll = hw_to_atlantis_pll(hw);
+	u32 val, en_val, cg_val;
+	int ret;
+
+	regmap_read(pll->common.regmap, pll->config.reg_offset, &val);
+	regmap_read(pll->common.regmap, pll->config.en_reg_offset, &en_val);
+	regmap_read(pll->common.regmap, pll->config.cg_reg_offset, &cg_val);
+
+	/* Check if PLL is already enabled, locked and Gate clk is enabled */
+	if ((en_val & PLL_CFG_EN_BIT) && (val & PLL_CFG_LOCK_BIT) &&
+	    (cg_val & pll->config.cg_reg_enable) &&
+	    !(val & PLL_CFG_BYPASS_BIT)) {
+		return 0;
+	}
+
+	/* Step 1: Set bypass mode first */
+	regmap_update_bits(pll->common.regmap, pll->config.reg_offset,
+			   PLL_CFG_BYPASS_BIT, PLL_CFG_BYPASS_BIT);
+
+	/* Step 2: Enable PLL (clear then set power bit) */
+	regmap_update_bits(pll->common.regmap, pll->config.en_reg_offset,
+			   PLL_CFG_EN_BIT, 0);
+
+	regmap_update_bits(pll->common.regmap, pll->config.en_reg_offset,
+			   PLL_CFG_EN_BIT, PLL_CFG_EN_BIT);
+
+	/* Step 3: Wait for PLL lock */
+	ret = regmap_read_poll_timeout(pll->common.regmap,
+				       pll->config.reg_offset, val,
+				       val & PLL_CFG_LOCK_BIT, 10,
+				       PLL_BYPASS_WAIT_US);
+	if (ret) {
+		pr_err("PLL failed to lock within timeout\n");
+		return ret;
+	}
+
+	/* Step 4: Switch from bypass to PLL output */
+	regmap_update_bits(pll->common.regmap, pll->config.reg_offset,
+			   PLL_CFG_BYPASS_BIT, 0);
+
+	/* Enable Gate clk at PLL Output */
+	return regmap_update_bits(pll->common.regmap, pll->config.cg_reg_offset,
+				  pll->config.cg_reg_enable,
+				  pll->config.cg_reg_enable);
+}
+
+static void atlantis_clk_pll_disable(struct clk_hw *hw)
+{
+	struct atlantis_clk_pll *pll = hw_to_atlantis_pll(hw);
+
+	/* Step 1: Switch to bypass mode before disabling */
+	regmap_update_bits(pll->common.regmap, pll->config.reg_offset,
+			   PLL_CFG_BYPASS_BIT, PLL_CFG_BYPASS_BIT);
+	/* Step 2: Power down PLL */
+	regmap_update_bits(pll->common.regmap, pll->config.en_reg_offset,
+			   PLL_CFG_EN_BIT, 0);
+}
+
+static unsigned long atlantis_clk_pll_recalc_rate(struct clk_hw *hw,
+						  unsigned long parent_rate)
+{
+	struct atlantis_clk_pll *pll = hw_to_atlantis_pll(hw);
+
+	u32 val, refdiv, fbdiv, postdiv1, postdiv2;
+	u64 fout;
+
+	regmap_read(pll->common.regmap, pll->config.reg_offset, &val);
+
+	if (val & PLL_CFG_BYPASS_BIT)
+		return parent_rate;
+
+	refdiv = FIELD_GET(PLL_CFG_REFDIV_MASK, val);
+	fbdiv = FIELD_GET(PLL_CFG_FBDIV_MASK, val);
+	postdiv1 = FIELD_GET(PLL_CFG_POSTDIV1_MASK, val);
+	postdiv2 = FIELD_GET(PLL_CFG_POSTDIV2_MASK, val);
+
+	if (!refdiv)
+		refdiv = 1;
+	if (!postdiv1)
+		postdiv1 = 1;
+	if (!postdiv2)
+		postdiv2 = 1;
+	if (!fbdiv)
+		return 0;
+
+	fout = div64_u64((u64)parent_rate * fbdiv,
+			 refdiv * postdiv1 * postdiv2);
+
+	return fout;
+}
+
+const struct clk_ops atlantis_clk_pll_ops = {
+	.enable = atlantis_clk_pll_enable,
+	.disable = atlantis_clk_pll_disable,
+	.recalc_rate = atlantis_clk_pll_recalc_rate,
+	.is_enabled = atlantis_clk_pll_is_enabled,
+};
+
+static int atlantis_clk_gate_shared_enable(struct clk_hw *hw)
+{
+	struct atlantis_clk_gate_shared *gate =
+		hw_to_atlantis_clk_gate_shared(hw);
+	bool need_enable;
+	u32 reg;
+
+	scoped_guard(spinlock_irqsave, gate->config.refcount_lock)
+	{
+		need_enable = (*gate->config.share_count)++ == 0;
+		if (need_enable) {
+			regmap_read(gate->common.regmap,
+				    gate->config.reg_offset, &reg);
+			reg |= gate->config.enable;
+			regmap_write(gate->common.regmap,
+				     gate->config.reg_offset, reg);
+		}
+	}
+
+	if (need_enable) {
+		regmap_read(gate->common.regmap, gate->config.reg_offset, &reg);
+
+		if (!(reg & gate->config.enable)) {
+			pr_warn("%s: gate enable %d failed to enable\n",
+				clk_hw_get_name(hw), gate->config.enable);
+			return -EIO;
+		}
+	}
+
+	return 0;
+}
+
+static void atlantis_clk_gate_shared_disable(struct clk_hw *hw)
+{
+	struct atlantis_clk_gate_shared *gate =
+		hw_to_atlantis_clk_gate_shared(hw);
+	u32 reg;
+
+	scoped_guard(spinlock_irqsave, gate->config.refcount_lock)
+	{
+		if (WARN_ON(*gate->config.share_count == 0))
+			return;
+		if (--(*gate->config.share_count) > 0)
+			return;
+
+		regmap_read(gate->common.regmap, gate->config.reg_offset, &reg);
+		reg &= ~gate->config.enable;
+		regmap_write(gate->common.regmap, gate->config.reg_offset, reg);
+	}
+}
+
+static int atlantis_clk_gate_shared_is_enabled(struct clk_hw *hw)
+{
+	struct atlantis_clk_gate_shared *gate =
+		hw_to_atlantis_clk_gate_shared(hw);
+	u32 reg;
+
+	regmap_read(gate->common.regmap, gate->config.reg_offset, &reg);
+
+	return !!(reg & gate->config.enable);
+}
+
+static void atlantis_clk_gate_shared_disable_unused(struct clk_hw *hw)
+{
+	struct atlantis_clk_gate_shared *gate =
+		hw_to_atlantis_clk_gate_shared(hw);
+
+	u32 reg;
+
+	scoped_guard(spinlock_irqsave, gate->config.refcount_lock)
+	{
+		if (*gate->config.share_count == 0) {
+			regmap_read(gate->common.regmap,
+				    gate->config.reg_offset, &reg);
+			reg &= ~gate->config.enable;
+			regmap_write(gate->common.regmap,
+				     gate->config.reg_offset, reg);
+		}
+	}
+}
+
+const struct clk_ops atlantis_clk_gate_shared_ops = {
+	.enable = atlantis_clk_gate_shared_enable,
+	.disable = atlantis_clk_gate_shared_disable,
+	.disable_unused = atlantis_clk_gate_shared_disable_unused,
+	.is_enabled = atlantis_clk_gate_shared_is_enabled,
+};
+
+#define ATLANTIS_PLL_CONFIG(_reg_offset, _en_reg_offset, _cg_reg_offset, \
+			    _cg_reg_enable)                              \
+	{                                                                \
+		.reg_offset = (_reg_offset),                             \
+		.en_reg_offset = (_en_reg_offset),                       \
+		.cg_reg_offset = (_cg_reg_offset),                       \
+		.cg_reg_enable = (_cg_reg_enable),                       \
+	}
+
+#define ATLANTIS_PLL_DEFINE(_clkid, _name, _parent, _reg_offset,               \
+			    _en_reg_offset, _cg_reg_offset, _cg_reg_enable,    \
+			    _flags)                                            \
+	static struct atlantis_clk_pll _name = {                               \
+		.config = ATLANTIS_PLL_CONFIG(_reg_offset, _en_reg_offset,     \
+					      _cg_reg_offset, _cg_reg_enable), \
+		.common = { .clkid = _clkid,                                   \
+			    .hw.init = CLK_HW_INIT_PARENTS_DATA(               \
+				    #_name, _parent, &atlantis_clk_pll_ops,    \
+				    _flags) },                                 \
+	}
+#define ATLANTIS_MUX_CONFIG(_shift, _width, _reg_offset)                    \
+	{                                                                   \
+		.shift = _shift, .width = _width, .reg_offset = _reg_offset \
+	}
+
+#define ATLANTIS_MUX_DEFINE(_clkid, _name, _parents, _reg_offset, _shift,    \
+			    _width, _flags)                                  \
+	static struct atlantis_clk_mux _name = {                             \
+		.config = ATLANTIS_MUX_CONFIG(_shift, _width, _reg_offset),  \
+		.common = { .clkid = _clkid,                                 \
+			    .hw.init = CLK_HW_INIT_PARENTS_DATA(             \
+				    #_name, _parents, &atlantis_clk_mux_ops, \
+				    _flags) }                                \
+	}
+
+#define ATLANTIS_DIVIDER_CONFIG(_shift, _width, _flags, _reg_offset) \
+	{                                                            \
+		.shift = _shift, .width = _width, .flags = _flags,   \
+		.reg_offset = _reg_offset                            \
+	}
+
+#define ATLANTIS_DIVIDER_DEFINE(_clkid, _name, _parent, _reg_offset, _shift, \
+				_width, _divflags, _flags)                   \
+	static struct atlantis_clk_divider _name = {                         \
+		.config = ATLANTIS_DIVIDER_CONFIG(_shift, _width, _divflags, \
+						  _reg_offset),              \
+		.common = { .clkid = _clkid,                                 \
+			    .hw.init = CLK_HW_INIT_HW(                       \
+				    #_name, &_parent.common.hw,              \
+				    &atlantis_clk_divider_ops, _flags) }     \
+	}
+#define ATLANTIS_GATE_CONFIG(_enable, _reg_offset)           \
+	{                                                    \
+		.enable = _enable, .reg_offset = _reg_offset \
+	}
+
+#define ATLANTIS_GATE_DEFINE(_clkid, _name, _parent, _reg_offset, _enable, \
+			     _flags)                                       \
+	static struct atlantis_clk_gate _name = {                          \
+		.config = ATLANTIS_GATE_CONFIG(_enable, _reg_offset),      \
+		.common = { .clkid = _clkid,                               \
+			    .hw.init = CLK_HW_INIT_HW(                     \
+				    #_name, &_parent.common.hw,            \
+				    &atlantis_clk_gate_ops, _flags) }      \
+	}
+#define ATLANTIS_GATE_SHARED_CONFIG(_reg_offset, _enable, _share_count)      \
+	{                                                                    \
+		.reg_offset = _reg_offset, .enable = _enable,                \
+		.share_count = _share_count, .refcount_lock = &refcount_lock \
+	}
+#define ATLANTIS_GATE_SHARED_DEFINE(_clkid, _name, _parent, _reg_offset,     \
+				    _enable, _share_count, _flags)           \
+	static struct atlantis_clk_gate_shared _name = {                     \
+		.config = ATLANTIS_GATE_SHARED_CONFIG(_reg_offset, _enable,  \
+						      _share_count),         \
+		.common = { .clkid = _clkid,                                 \
+			    .hw.init = CLK_HW_INIT_HW(                       \
+				    #_name, &_parent.common.hw,              \
+				    &atlantis_clk_gate_shared_ops, _flags) } \
+	}
+#define ATLANTIS_CLK_FIXED_FACTOR_DEFINE(_clkid, _name, _parent, _mult, _div, \
+					 _flags)                              \
+	static struct atlantis_clk_fixed_factor _name = {                     \
+		.config = { .mult = _mult, .div = _div },                     \
+		.common = { .clkid = _clkid,                                  \
+			    .hw.init = CLK_HW_INIT_HW(                        \
+				    #_name, &_parent.common.hw,               \
+				    &atlantis_clk_fixed_factor_ops, _flags) } \
+	}
+
+static DEFINE_SPINLOCK(refcount_lock); /* Lock for refcount value accesses */
+
+static const struct regmap_config atlantis_prcm_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xFFFC,
+	.cache_type = REGCACHE_NONE,
+};
+
+struct atlantis_prcm_data {
+	struct clk_hw **hws;
+	size_t num;
+	const char *reset_name;
+};
+
+static const struct clk_parent_data osc_24m_clk[] = {
+	{ .index = 0 },
+};
+
+ATLANTIS_PLL_DEFINE(CLK_RCPU_PLL, rcpu_pll_clk, osc_24m_clk, RCPU_PLL_CFG_REG,
+		    PLL_RCPU_EN_REG, BUS_CG_REG, BIT(7),
+		    CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_UNGATE |
+			    CLK_IS_CRITICAL);
+
+static const struct clk_parent_data rcpu_root_parents[] = {
+	{ .index = 0 },
+	{ .hw = &rcpu_pll_clk.common.hw },
+};
+
+ATLANTIS_MUX_DEFINE(CLK_RCPU_ROOT, rcpu_root_mux, rcpu_root_parents,
+		    RCPU_DIV_CFG_REG, 0, 1, CLK_SET_RATE_NO_REPARENT);
+
+ATLANTIS_DIVIDER_DEFINE(CLK_RCPU_DIV2, rcpu_div2_clk, rcpu_root_mux,
+			RCPU_DIV_CFG_REG, 2, 4, 0, 0);
+ATLANTIS_DIVIDER_DEFINE(CLK_RCPU_DIV4, rcpu_div4_clk, rcpu_root_mux,
+			RCPU_DIV_CFG_REG, 7, 4, 0, 0);
+ATLANTIS_DIVIDER_DEFINE(CLK_RCPU_RTC, rcpu_rtc_clk, rcpu_div4_clk,
+			RCPU_DIV_CFG_REG, 12, 6, 0, 0);
+
+ATLANTIS_GATE_DEFINE(CLK_SMNDMA0_ACLK, smndma0_aclk, rcpu_div2_clk,
+		     RCPU_BLK_CG_REG, BIT(0), 0);
+ATLANTIS_GATE_DEFINE(CLK_SMNDMA1_ACLK, smndma1_aclk, rcpu_div2_clk,
+		     RCPU_BLK_CG_REG, BIT(1), 0);
+ATLANTIS_GATE_DEFINE(CLK_WDT0_PCLK, wdt0_pclk, rcpu_div4_clk, RCPU_BLK_CG_REG,
+		     BIT(2), 0);
+ATLANTIS_GATE_DEFINE(CLK_WDT1_PCLK, wdt1_pclk, rcpu_div4_clk, RCPU_BLK_CG_REG,
+		     BIT(3), 0);
+ATLANTIS_GATE_DEFINE(CLK_TIMER_PCLK, timer_pclk, rcpu_div4_clk, RCPU_BLK_CG_REG,
+		     BIT(4), 0);
+ATLANTIS_GATE_DEFINE(CLK_PVTC_PCLK, pvtc_pclk, rcpu_div4_clk, RCPU_BLK_CG_REG,
+		     BIT(12), 0);
+ATLANTIS_GATE_DEFINE(CLK_PMU_PCLK, pmu_pclk, rcpu_div4_clk, RCPU_BLK_CG_REG,
+		     BIT(13), 0);
+ATLANTIS_GATE_DEFINE(CLK_MAILBOX_HCLK, mb_hclk, rcpu_div2_clk, RCPU_BLK_CG_REG,
+		     BIT(14), 0);
+ATLANTIS_GATE_DEFINE(CLK_SEC_SPACC_HCLK, sec_spacc_hclk, rcpu_div2_clk,
+		     RCPU_BLK_CG_REG, BIT(26), 0);
+ATLANTIS_GATE_DEFINE(CLK_SEC_OTP_HCLK, sec_otp_hclk, rcpu_div2_clk,
+		     RCPU_BLK_CG_REG, BIT(28), 0);
+ATLANTIS_GATE_DEFINE(CLK_TRNG_PCLK, trng_pclk, rcpu_div4_clk, RCPU_BLK_CG_REG,
+		     BIT(29), 0);
+ATLANTIS_GATE_DEFINE(CLK_SEC_CRC_HCLK, sec_crc_hclk, rcpu_div2_clk,
+		     RCPU_BLK_CG_REG, BIT(30), 0);
+
+ATLANTIS_CLK_FIXED_FACTOR_DEFINE(CLK_SMN_HCLK, rcpu_smn_hclk, rcpu_div2_clk, 1,
+				 1, 0);
+ATLANTIS_CLK_FIXED_FACTOR_DEFINE(CLK_AHB0_HCLK, rcpu_ahb0_hclk, rcpu_div2_clk,
+				 1, 1, 0);
+
+ATLANTIS_CLK_FIXED_FACTOR_DEFINE(CLK_SMN_PCLK, rcpu_smn_pclk, rcpu_div4_clk, 1,
+				 1, 0);
+
+ATLANTIS_CLK_FIXED_FACTOR_DEFINE(CLK_SMN_CLK, rcpu_smn_clk, rcpu_root_mux, 1, 1,
+				 0);
+ATLANTIS_CLK_FIXED_FACTOR_DEFINE(CLK_SCRATCHPAD_CLK, rcpu_scratchpad_aclk,
+				 rcpu_root_mux, 1, 1, 0);
+ATLANTIS_CLK_FIXED_FACTOR_DEFINE(CLK_RCPU_CORE_CLK, rcpu_core_clk,
+				 rcpu_root_mux, 1, 1, 0);
+ATLANTIS_CLK_FIXED_FACTOR_DEFINE(CLK_RCPU_ROM_CLK, rcpu_rom_aclk, rcpu_root_mux,
+				 1, 1, 0);
+
+static struct atlantis_clk_fixed_factor
+	otp_load_clk = { .config = { .mult = 1, .div = 1 },
+			 .common = {
+				 .clkid = CLK_OTP_LOAD_CLK,
+				 .hw.init = CLK_HW_INIT_PARENTS_DATA(
+					 "otp_load_clk", osc_24m_clk,
+					 &atlantis_clk_fixed_factor_ops,
+					 CLK_SET_RATE_NO_REPARENT),
+			 } };
+
+ATLANTIS_PLL_DEFINE(CLK_NOC_PLL, nocc_pll_clk, osc_24m_clk,
+		    RCPU_NOCC_PLL_CFG_REG, PLL_NOCC_EN_REG, BUS_CG_REG, BIT(0),
+		    CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_UNGATE |
+			    CLK_IS_CRITICAL);
+
+static const struct clk_parent_data nocc_mux_parents[] = {
+	{ .index = 0 },
+	{ .hw = &nocc_pll_clk.common.hw },
+};
+
+ATLANTIS_MUX_DEFINE(CLK_NOCC_CLK, nocc_clk_mux, nocc_mux_parents,
+		    RCPU_NOCC_CLK_CFG_REG, 0, 1, CLK_SET_RATE_NO_REPARENT);
+
+ATLANTIS_DIVIDER_DEFINE(CLK_NOCC_DIV2, nocc_div2_clk, nocc_clk_mux,
+			RCPU_NOCC_CLK_CFG_REG, 1, 4, 0, 0);
+ATLANTIS_DIVIDER_DEFINE(CLK_NOCC_DIV4, nocc_div4_clk, nocc_clk_mux,
+			RCPU_NOCC_CLK_CFG_REG, 5, 4, 0, 0);
+ATLANTIS_DIVIDER_DEFINE(CLK_NOCC_RTC, nocc_rtc_clk, nocc_div4_clk,
+			RCPU_NOCC_CLK_CFG_REG, 9, 6, 0, 0);
+ATLANTIS_DIVIDER_DEFINE(CLK_NOCC_CAN, nocc_can_div, nocc_clk_mux,
+			RCPU_NOCC_CLK_CFG_REG, 15, 4, 0, 0);
+
+static unsigned int refcnt_qspi;
+ATLANTIS_GATE_SHARED_DEFINE(CLK_QSPI_SCLK, qspi_sclk, nocc_clk_mux,
+			    LSIO_BLK_CG_REG, BIT(0), &refcnt_qspi, 0);
+ATLANTIS_GATE_SHARED_DEFINE(CLK_QSPI_HCLK, qspi_hclk, nocc_div2_clk,
+			    LSIO_BLK_CG_REG, BIT(0), &refcnt_qspi, 0);
+ATLANTIS_GATE_DEFINE(CLK_I2C0_PCLK, i2c0_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
+		     BIT(1), 0);
+ATLANTIS_GATE_DEFINE(CLK_I2C1_PCLK, i2c1_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
+		     BIT(2), 0);
+ATLANTIS_GATE_DEFINE(CLK_I2C2_PCLK, i2c2_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
+		     BIT(3), 0);
+ATLANTIS_GATE_DEFINE(CLK_I2C3_PCLK, i2c3_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
+		     BIT(4), 0);
+ATLANTIS_GATE_DEFINE(CLK_I2C4_PCLK, i2c4_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
+		     BIT(5), 0);
+
+ATLANTIS_GATE_DEFINE(CLK_UART0_PCLK, uart0_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
+		     BIT(6), 0);
+ATLANTIS_GATE_DEFINE(CLK_UART1_PCLK, uart1_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
+		     BIT(7), 0);
+ATLANTIS_GATE_DEFINE(CLK_UART2_PCLK, uart2_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
+		     BIT(8), 0);
+ATLANTIS_GATE_DEFINE(CLK_UART3_PCLK, uart3_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
+		     BIT(9), 0);
+ATLANTIS_GATE_DEFINE(CLK_UART4_PCLK, uart4_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
+		     BIT(10), 0);
+ATLANTIS_GATE_DEFINE(CLK_SPI0_PCLK, spi0_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
+		     BIT(11), 0);
+ATLANTIS_GATE_DEFINE(CLK_SPI1_PCLK, spi1_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
+		     BIT(12), 0);
+ATLANTIS_GATE_DEFINE(CLK_SPI2_PCLK, spi2_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
+		     BIT(13), 0);
+ATLANTIS_GATE_DEFINE(CLK_SPI3_PCLK, spi3_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
+		     BIT(14), 0);
+ATLANTIS_GATE_DEFINE(CLK_GPIO_PCLK, gpio_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
+		     BIT(15), 0);
+
+static unsigned int refcnt_can0;
+ATLANTIS_GATE_SHARED_DEFINE(CLK_CAN0_HCLK, can0_hclk, nocc_div2_clk,
+			    LSIO_BLK_CG_REG, BIT(17), &refcnt_can0, 0);
+ATLANTIS_GATE_SHARED_DEFINE(CLK_CAN0_CLK, can0_clk, nocc_can_div,
+			    LSIO_BLK_CG_REG, BIT(17), &refcnt_can0, 0);
+
+static unsigned int refcnt_can1;
+ATLANTIS_GATE_SHARED_DEFINE(CLK_CAN1_HCLK, can1_hclk, nocc_div2_clk,
+			    LSIO_BLK_CG_REG, BIT(18), &refcnt_can1, 0);
+ATLANTIS_GATE_SHARED_DEFINE(CLK_CAN1_CLK, can1_clk, nocc_can_div,
+			    LSIO_BLK_CG_REG, BIT(18), &refcnt_can1, 0);
+
+ATLANTIS_CLK_FIXED_FACTOR_DEFINE(CLK_CAN0_TIMER_CLK, can0_timer_clk,
+				 nocc_rtc_clk, 1, 1, 0);
+ATLANTIS_CLK_FIXED_FACTOR_DEFINE(CLK_CAN1_TIMER_CLK, can1_timer_clk,
+				 nocc_rtc_clk, 1, 1, 0);
+
+static struct clk_hw *atlantis_rcpu_clks[] = {
+	[CLK_RCPU_PLL]		= &rcpu_pll_clk.common.hw,
+	[CLK_RCPU_ROOT]		= &rcpu_root_mux.common.hw,
+	[CLK_RCPU_DIV2]		= &rcpu_div2_clk.common.hw,
+	[CLK_RCPU_DIV4]		= &rcpu_div4_clk.common.hw,
+	[CLK_RCPU_RTC]		= &rcpu_rtc_clk.common.hw,
+	[CLK_SMNDMA0_ACLK]	= &smndma0_aclk.common.hw,
+	[CLK_SMNDMA1_ACLK]	= &smndma1_aclk.common.hw,
+	[CLK_WDT0_PCLK]		= &wdt0_pclk.common.hw,
+	[CLK_WDT1_PCLK]		= &wdt1_pclk.common.hw,
+	[CLK_TIMER_PCLK]	= &timer_pclk.common.hw,
+	[CLK_PVTC_PCLK]		= &pvtc_pclk.common.hw,
+	[CLK_PMU_PCLK]		= &pmu_pclk.common.hw,
+	[CLK_MAILBOX_HCLK]	= &mb_hclk.common.hw,
+	[CLK_SEC_SPACC_HCLK]	= &sec_spacc_hclk.common.hw,
+	[CLK_SEC_OTP_HCLK]	= &sec_otp_hclk.common.hw,
+	[CLK_TRNG_PCLK]		= &trng_pclk.common.hw,
+	[CLK_SEC_CRC_HCLK]	= &sec_crc_hclk.common.hw,
+	[CLK_SMN_HCLK]		= &rcpu_smn_hclk.common.hw,
+	[CLK_AHB0_HCLK]		= &rcpu_ahb0_hclk.common.hw,
+	[CLK_SMN_PCLK]		= &rcpu_smn_pclk.common.hw,
+	[CLK_SMN_CLK]		= &rcpu_smn_clk.common.hw,
+	[CLK_SCRATCHPAD_CLK]	= &rcpu_scratchpad_aclk.common.hw,
+	[CLK_RCPU_CORE_CLK]	= &rcpu_core_clk.common.hw,
+	[CLK_RCPU_ROM_CLK]	= &rcpu_rom_aclk.common.hw,
+	[CLK_OTP_LOAD_CLK]	= &otp_load_clk.common.hw,
+	[CLK_NOC_PLL]		= &nocc_pll_clk.common.hw,
+	[CLK_NOCC_CLK]		= &nocc_clk_mux.common.hw,
+	[CLK_NOCC_DIV2]		= &nocc_div2_clk.common.hw,
+	[CLK_NOCC_DIV4]		= &nocc_div4_clk.common.hw,
+	[CLK_NOCC_RTC]		= &nocc_rtc_clk.common.hw,
+	[CLK_NOCC_CAN]		= &nocc_can_div.common.hw,
+	[CLK_QSPI_SCLK]		= &qspi_sclk.common.hw,
+	[CLK_QSPI_HCLK]		= &qspi_hclk.common.hw,
+	[CLK_I2C0_PCLK]		= &i2c0_pclk.common.hw,
+	[CLK_I2C1_PCLK]		= &i2c1_pclk.common.hw,
+	[CLK_I2C2_PCLK]		= &i2c2_pclk.common.hw,
+	[CLK_I2C3_PCLK]		= &i2c3_pclk.common.hw,
+	[CLK_I2C4_PCLK]		= &i2c4_pclk.common.hw,
+	[CLK_UART0_PCLK]	= &uart0_pclk.common.hw,
+	[CLK_UART1_PCLK]	= &uart1_pclk.common.hw,
+	[CLK_UART2_PCLK]	= &uart2_pclk.common.hw,
+	[CLK_UART3_PCLK]	= &uart3_pclk.common.hw,
+	[CLK_UART4_PCLK]	= &uart4_pclk.common.hw,
+	[CLK_SPI0_PCLK]		= &spi0_pclk.common.hw,
+	[CLK_SPI1_PCLK]		= &spi1_pclk.common.hw,
+	[CLK_SPI2_PCLK]		= &spi2_pclk.common.hw,
+	[CLK_SPI3_PCLK]		= &spi3_pclk.common.hw,
+	[CLK_GPIO_PCLK]		= &gpio_pclk.common.hw,
+	[CLK_CAN0_HCLK]		= &can0_hclk.common.hw,
+	[CLK_CAN0_CLK]		= &can0_clk.common.hw,
+	[CLK_CAN1_HCLK]		= &can1_hclk.common.hw,
+	[CLK_CAN1_CLK]		= &can1_clk.common.hw,
+	[CLK_CAN0_TIMER_CLK]	= &can0_timer_clk.common.hw,
+	[CLK_CAN1_TIMER_CLK]	= &can1_timer_clk.common.hw,
+};
+
+static const struct atlantis_prcm_data atlantis_prcm_rcpu_data = {
+	.hws = atlantis_rcpu_clks,
+	.num = ARRAY_SIZE(atlantis_rcpu_clks),
+	.reset_name = "rcpu-reset"
+};
+
+static int atlantis_prcm_clocks_register(struct device *dev,
+					 struct regmap *regmap,
+					 const struct atlantis_prcm_data *data)
+{
+	struct clk_hw_onecell_data *clk_data;
+	int i, ret;
+	size_t num_clks = data->num;
+
+	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->num),
+				GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
+
+	for (i = 0; i < data->num; i++) {
+		struct clk_hw *hw = data->hws[i];
+		const char *name = hw->init->name;
+		struct atlantis_clk_common *common =
+			hw_to_atlantis_clk_common(hw);
+		common->regmap = regmap;
+
+		ret = devm_clk_hw_register(dev, hw);
+
+		if (ret) {
+			dev_err(dev, "Cannot register clock %d - %s\n", i,
+				name);
+			return ret;
+		}
+
+		clk_data->hws[common->clkid] = hw;
+	}
+
+	clk_data->num = num_clks;
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
+	if (ret)
+		dev_err(dev, "failed to add clock hardware provider (%d)\n",
+			ret);
+
+	return ret;
+}
+
+static int atlantis_prcm_probe(struct platform_device *pdev)
+{
+	const struct atlantis_prcm_data *data;
+	struct auxiliary_device *reset_adev;
+	struct regmap *regmap;
+	void __iomem *base;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return dev_err_probe(dev, PTR_ERR(base),
+				     "Failed to map registers\n");
+
+	regmap = devm_regmap_init_mmio(dev, base, &atlantis_prcm_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "Failed to init regmap\n");
+
+	data = of_device_get_match_data(dev);
+
+	ret = atlantis_prcm_clocks_register(dev, regmap, data);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register clocks\n");
+
+	reset_adev = devm_auxiliary_device_create(dev, data->reset_name, NULL);
+	if (!reset_adev)
+		return dev_err_probe(dev, -ENODEV, "failed to register resets\n");
+
+	return 0;
+}
+
+static const struct of_device_id atlantis_prcm_of_match[] = {
+	{
+		.compatible = "tenstorrent,atlantis-prcm-rcpu",
+		.data = &atlantis_prcm_rcpu_data,
+	},
+	{}
+
+};
+MODULE_DEVICE_TABLE(of, atlantis_prcm_of_match);
+
+static struct platform_driver atlantis_prcm_driver = {
+	.probe = atlantis_prcm_probe,
+	.driver = {
+		.name = "atlantis-prcm",
+		.of_match_table = atlantis_prcm_of_match,
+	},
+};
+module_platform_driver(atlantis_prcm_driver);
+
+MODULE_DESCRIPTION("Tenstorrent Atlantis PRCM Clock Controller Driver");
+MODULE_AUTHOR("Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>");
+MODULE_LICENSE("GPL");

-- 
2.43.0

