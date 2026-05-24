Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7823D21CA0D
	for <linux-clk@vger.kernel.org>; Sun, 24 May 2026 13:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779628471; cv=none; b=l0PmZHFpUKuY/0XQyQzmQUj6IQ1dMoGH8BsTqaEuVv0o+Y44MT8L0llnavX8SbtJeDel2Q0wQxIxbbJWDezuGo73P3vaK0gtnvRYGuDhN98vGcFDzNj6/Hn1d3MjB9LFvM4LqqFWlRRzSM5B/LJXvNazdrpLcZ9QqZN5Xr7n5DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779628471; c=relaxed/simple;
	bh=vu14/XwAvcCRHTPFsqmzAQGkFgRlVC0pnNtImnogMis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aRmvx0sNNfXa23i5Lu4/sx1x9exc2cvDIHn/Vg2z7TqrIkBLRIyp/Eqn5vQVPJVcXHfs4U/xS6cwaGvcO8TAp4xHYf0KbHVtj783Jumx3gL0jKPv2YxBFu544P0QIYUzKtwzDt2KQ0Dn5YoQ0wtB7p1x0uG249OnxPRf3KIPEzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHDnPb5H; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHDnPb5H"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-83975e992e1so3440889b3a.2
        for <linux-clk@vger.kernel.org>; Sun, 24 May 2026 06:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779628467; x=1780233267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ctfu8zx5SNbIBGVYEO+cmqbwX4vUjVyP7QHbADfykEI=;
        b=cHDnPb5HNN5+rm2Ij3XCIsZf9oxDg2vraqeHdTf051sgkLGVAWrqvFikojqRd+6wDk
         g2v5rNKXN34BNuk6Vkjo7vM500bKA+vuBwMBjIPln/CUqUyolzeAaJ+VlA9NDdyRiZ8O
         PIoWJq4EWIn7vTUpYz0+A+1o5pDmW2HIOpTgtcwPwwRD9tZ6uxQi44TrTcLtKhWuB2Lm
         m+469guR3zQ0fh51ap3Rq9Fq/BtzR6iyH8ATigASmVSx8FdIjZBsEI7h76DZs2SHiAB8
         miy6xNChmBTPffnTZrBL06bDQVI9l5UjPeYzLNN2FHyifKsizrno2ISdZBhA73o7x4YW
         ujeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779628467; x=1780233267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ctfu8zx5SNbIBGVYEO+cmqbwX4vUjVyP7QHbADfykEI=;
        b=Afoceo0C7RXo4Bl2BzO5DlE+9zxTMlviMarJg1ltnyNVvLAlNZJcaHuyM7Es5taYzl
         cX6hxy/0TrvawlwL5a4TacFq/8KkLt6pdnYRNsbujdsU+7b2GnWyZ0QZAQTW4ENRA3Rw
         4IRZAAqxriXWymnQZ0uOwx0phbSryMypsvn1rFM5MJoSDrnVcvG10OF8Av3DJkn2pVT2
         6rT6i2FmSZIhDgPKFxVSQ4PATAaqK6tcu3tyNYN6xk9VzKSSNyw2iImuDO94v7l49gtO
         ArLjqjOiYLfGfElOCnLi7WUp8fZ1Cg+RI8N9mXvttcceWT4LkFZihPi5I98I0Ig7z0oc
         /sCg==
X-Forwarded-Encrypted: i=1; AFNElJ8GmrSFsWt93Zuw3h56zKzzckPYtNYeQ5ms6yKJdXuiCphNpUH5zXW4G9NZvw2o2D3MC0wBLtoi8YI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGAsTn8OQku+Y4Z55LzLcvRLTNzoEump/kj5TyHr3owdb8jfv1
	wmIj9Au4HcMc+5k8CKh03iztQLhrwc36wiAy/4jjpaJCF8EQe0+9WlAB
X-Gm-Gg: Acq92OHw26xxOoMiPEnbzfQSZzwOIXyGljgDel4BF9mbG6Ly9U2EJ6YBYw+ZtScsLKj
	5Mw6kSsV+Qoa7ZEotHHFUw1IByiPaF26poGORAHsXzen6P9vcLtzEQWNiXRUygAGOQR9UqqRsH3
	en/w33zolFG1ck5lVkKEFstdTtKiuCQ6dSptysm/yTPgekrFbtTmLu6oUACOCv2TCy9BcHLWXib
	r01VqpUJgglGSlnvBmC7uviWxRMTCtxfBrMnpds9E5PDuBJPPhzWLJVUlmodUwKjnOytAlBdPci
	Q4YVfaY6TT5mkldcJLV3mqhgVdjmqVdJ8BYJlCFwBFUYDR2a5cIou+atNADyIJCVtWa7c6xAp1y
	YjgVm7JlsGKPSJLrO2+iTPIHLo879DCjst9Xdbhpr3Nm5WQd3wntsucggPZnOYOK4gsNQYlpPJ6
	qBWBZX2HIjY2w+KnWX+lDPilXrFDE=
X-Received: by 2002:a05:6a00:2d25:b0:839:3ccb:7038 with SMTP id d2e1a72fcca58-8415f5b19demr9515909b3a.48.1779628466449;
        Sun, 24 May 2026 06:14:26 -0700 (PDT)
Received: from guoguo-lecoo.lan ([104.28.159.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fb28d5sm7163128b3a.41.2026.05.24.06.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 06:14:26 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sun, 24 May 2026 21:13:08 +0800
Subject: [PATCH v2 3/3] clk: add support for siflower sf21-topcrm
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-sf21-topcrm-v2-3-4527aae05c3d@gmail.com>
References: <20260524-sf21-topcrm-v2-0-4527aae05c3d@gmail.com>
In-Reply-To: <20260524-sf21-topcrm-v2-0-4527aae05c3d@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Yao Zi <me@ziyao.cc>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3

This commit adds a driver for the Toplevel clock and reset controller
found on Siflower SF21A6826/SF21H8898 SoCs.
This block contains control for 3 PLLs, several clock mux/gate/divider
blocks, and a reset register for on-chip peripherals.

There are also two registers for enabling PCIe clock output in this
block. They aren't covered by this patch because I can't test those
without a PCIe driver. These will be added with the PCIe driver
patchset later after I get that working.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/clk/Kconfig                    |    1 +
 drivers/clk/Makefile                   |    1 +
 drivers/clk/siflower/Kconfig           |   23 +
 drivers/clk/siflower/Makefile          |    1 +
 drivers/clk/siflower/clk-sf21-topcrm.c | 1017 ++++++++++++++++++++++++++++++++
 5 files changed, 1043 insertions(+)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 1717ce75a907..0fb6a69bb329 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -529,6 +529,7 @@ source "drivers/clk/renesas/Kconfig"
 source "drivers/clk/rockchip/Kconfig"
 source "drivers/clk/samsung/Kconfig"
 source "drivers/clk/sifive/Kconfig"
+source "drivers/clk/siflower/Kconfig"
 source "drivers/clk/socfpga/Kconfig"
 source "drivers/clk/sophgo/Kconfig"
 source "drivers/clk/spacemit/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index cc108a75a900..8ac25e6694a7 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -145,6 +145,7 @@ obj-y					+= renesas/
 obj-$(CONFIG_COMMON_CLK_ROCKCHIP)	+= rockchip/
 obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
 obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
+obj-$(CONFIG_CLK_SIFLOWER)		+= siflower/
 obj-y					+= socfpga/
 obj-y					+= sophgo/
 obj-y					+= spacemit/
diff --git a/drivers/clk/siflower/Kconfig b/drivers/clk/siflower/Kconfig
new file mode 100644
index 000000000000..25e94828360b
--- /dev/null
+++ b/drivers/clk/siflower/Kconfig
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0
+
+menuconfig CLK_SIFLOWER
+	bool "Clock driver for Siflower SoCs"
+	depends on ARCH_SIFLOWER || COMPILE_TEST
+	default ARCH_SIFLOWER
+	help
+	  Clock drivers for Siflower Linux-capable SoCs.
+
+if CLK_SIFLOWER
+
+config CLK_SF21_TOPCRM
+	tristate "Clock driver for Siflower SF21 toplevel clock & reset module"
+	depends on ARCH_SIFLOWER || COMPILE_TEST
+	default ARCH_SIFLOWER
+	select RESET_CONTROLLER
+	select RATIONAL
+	help
+	  Supports the toplevel clock and reset module in Siflower SF21 SoCs.
+	  If this kernel is meant to run on Siflower SF21A6826 or SF21H8898,
+	  enable this driver.
+
+endif
diff --git a/drivers/clk/siflower/Makefile b/drivers/clk/siflower/Makefile
new file mode 100644
index 000000000000..952a470a4308
--- /dev/null
+++ b/drivers/clk/siflower/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_CLK_SF21_TOPCRM) += clk-sf21-topcrm.o
diff --git a/drivers/clk/siflower/clk-sf21-topcrm.c b/drivers/clk/siflower/clk-sf21-topcrm.c
new file mode 100644
index 000000000000..ad96a2ff97ac
--- /dev/null
+++ b/drivers/clk/siflower/clk-sf21-topcrm.c
@@ -0,0 +1,1017 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <dt-bindings/clock/siflower,sf21-topcrm.h>
+#include <dt-bindings/reset/siflower,sf21-topcrm.h>
+#include <linux/bitfield.h>
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/rational.h>
+#include <linux/reset-controller.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+struct sf_clk_common {
+	void __iomem	*base;
+	/* Serializes register RMW sequences by clock ops. */
+	raw_spinlock_t	*lock;
+	struct clk_hw	hw;
+};
+
+static const struct clk_parent_data sf21_ref_parent[] = {
+	{ .index = 0 },
+};
+
+static inline struct sf_clk_common *hw_to_sf_clk_common(struct clk_hw *hw)
+{
+	return container_of(hw, struct sf_clk_common, hw);
+}
+
+static inline u32 sf_readl(struct sf_clk_common *priv, u32 reg)
+{
+	return readl(priv->base + reg);
+}
+
+static inline void sf_writel(struct sf_clk_common *priv, u32 reg, u32 val)
+{
+	return writel(val, priv->base + reg);
+}
+
+static inline void sf_rmw(struct sf_clk_common *priv, u32 reg, u32 clr, u32 set)
+{
+	u32 val;
+
+	val = sf_readl(priv, reg);
+	val &= ~clr;
+	val |= set;
+	sf_writel(priv, reg, val);
+}
+
+struct sf_dual_divider {
+	struct sf_clk_common common;
+	u8 div_reg;
+	u8 div1_offs;
+	u8 div2_offs;
+	u8 en_reg;
+	u8 en_bit;
+	u16 load_reg;
+	u8 load_bit;
+	u8 flags;
+};
+
+#define SF_DUAL_DIVIDER_DIV_MASK	GENMASK(2, 0)
+#define SF_DUAL_DIVIDER_START_FROM_1	BIT(0)
+
+static unsigned long sf21_dualdiv_round_rate(unsigned long rate,
+					     unsigned long parent_rate,
+					     unsigned int max_div,
+					     unsigned int *diva,
+					     unsigned int *divb)
+{
+	unsigned int div = DIV_ROUND_CLOSEST(parent_rate, rate);
+	unsigned int best_diff, da, db, cur_div, cur_diff;
+
+	if (div <= 1) {
+		*diva = 1;
+		*divb = 1;
+		return parent_rate;
+	}
+
+	best_diff = div - 1;
+	*diva = 1;
+	*divb = 1;
+
+	for (da = 1; da <= max_div; da++) {
+		db = DIV_ROUND_CLOSEST(div, da);
+		if (db > da)
+			db = da;
+
+		cur_div = da * db;
+		if (div > cur_div)
+			cur_diff = div - cur_div;
+		else
+			cur_diff = cur_div - div;
+
+		if (cur_diff < best_diff) {
+			best_diff = cur_diff;
+			*diva = da;
+			*divb = db;
+		}
+		if (cur_diff == 0)
+			break;
+	}
+
+	return parent_rate / *diva / *divb;
+}
+
+static unsigned int sf21_dual_divider_max(struct sf_dual_divider *priv)
+{
+	return FIELD_MAX(SF_DUAL_DIVIDER_DIV_MASK) +
+	       !!(priv->flags & SF_DUAL_DIVIDER_START_FROM_1);
+}
+
+static int sf21_dual_divider_determine_rate(struct clk_hw *hw,
+					    struct clk_rate_request *req)
+{
+	struct sf_dual_divider *priv =
+		container_of(hw, struct sf_dual_divider, common.hw);
+	unsigned int diva, divb;
+
+	if (!req->rate)
+		return -EINVAL;
+
+	req->rate = sf21_dualdiv_round_rate(req->rate, req->best_parent_rate,
+					    sf21_dual_divider_max(priv),
+					    &diva, &divb);
+
+	return 0;
+}
+
+static int sf21_dual_divider_set_rate(struct clk_hw *hw, unsigned long rate,
+				      unsigned long parent_rate)
+{
+	struct sf_dual_divider *priv =
+		container_of(hw, struct sf_dual_divider, common.hw);
+	struct sf_clk_common *cmn = hw_to_sf_clk_common(hw);
+	unsigned int div1, div2;
+
+	if (!rate)
+		return -EINVAL;
+
+	sf21_dualdiv_round_rate(rate, parent_rate, sf21_dual_divider_max(priv),
+				&div1, &div2);
+
+	if (priv->flags & SF_DUAL_DIVIDER_START_FROM_1) {
+		div1--;
+		div2--;
+	}
+
+	guard(raw_spinlock_irqsave)(cmn->lock);
+	sf_rmw(cmn, priv->div_reg,
+	       (SF_DUAL_DIVIDER_DIV_MASK << priv->div1_offs) |
+		       (SF_DUAL_DIVIDER_DIV_MASK << priv->div2_offs),
+	       (div1 << priv->div1_offs) | (div2 << priv->div2_offs));
+	sf_writel(cmn, priv->load_reg, BIT(priv->load_bit));
+	sf_writel(cmn, priv->load_reg, 0);
+	return 0;
+}
+
+static unsigned long sf21_dual_divider_recalc_rate(struct clk_hw *hw,
+						   unsigned long parent_rate)
+{
+	struct sf_dual_divider *priv =
+		container_of(hw, struct sf_dual_divider, common.hw);
+	struct sf_clk_common *cmn = hw_to_sf_clk_common(hw);
+	u32 cfg = sf_readl(cmn, priv->div_reg);
+	unsigned long div1 = (cfg >> priv->div1_offs) &
+			     SF_DUAL_DIVIDER_DIV_MASK;
+	unsigned long div2 = (cfg >> priv->div2_offs) &
+			     SF_DUAL_DIVIDER_DIV_MASK;
+
+	if (priv->flags & SF_DUAL_DIVIDER_START_FROM_1) {
+		div1++;
+		div2++;
+	} else if (!div1 || !div2) {
+		return 0;
+	}
+
+	return parent_rate / div1 / div2;
+}
+
+static int sf21_dual_divider_enable(struct clk_hw *hw)
+{
+	struct sf_dual_divider *priv =
+		container_of(hw, struct sf_dual_divider, common.hw);
+	struct sf_clk_common *cmn = hw_to_sf_clk_common(hw);
+
+	guard(raw_spinlock_irqsave)(priv->common.lock);
+	sf_rmw(cmn, priv->en_reg, 0, BIT(priv->en_bit));
+	sf_writel(cmn, priv->load_reg, BIT(priv->load_bit));
+	sf_writel(cmn, priv->load_reg, 0);
+	return 0;
+}
+
+static void sf21_dual_divider_disable(struct clk_hw *hw)
+{
+	struct sf_dual_divider *priv =
+		container_of(hw, struct sf_dual_divider, common.hw);
+	struct sf_clk_common *cmn = hw_to_sf_clk_common(hw);
+
+	guard(raw_spinlock_irqsave)(priv->common.lock);
+	sf_rmw(cmn, priv->en_reg, BIT(priv->en_bit), 0);
+	sf_writel(cmn, priv->load_reg, BIT(priv->load_bit));
+	sf_writel(cmn, priv->load_reg, 0);
+}
+
+static int sf21_dual_divider_is_enabled(struct clk_hw *hw)
+{
+	struct sf_dual_divider *priv =
+		container_of(hw, struct sf_dual_divider, common.hw);
+	struct sf_clk_common *cmn = hw_to_sf_clk_common(hw);
+
+	return sf_readl(cmn, priv->en_reg) & BIT(priv->en_bit) ? 1 : 0;
+}
+
+#define PLL_CMN_CFG1		0x0
+#define  PLL_CMN_BYPASS		BIT(27)
+#define  PLL_CMN_PD		BIT(26)
+#define  PLL_CMN_FBDIV		GENMASK(25, 14)
+#define  PLL_CMN_POSTDIV_PD	13
+#define  PLL_CMN_VCO_PD		BIT(12)
+#define  PLL_CMN_POSTDIV1_OFFS	9
+#define  PLL_CMN_POSTDIV2_OFFS	6
+#define  PLL_CMN_REFDIV		GENMASK(5, 0)
+
+#define PLL_CMN_LOCK		0xc8
+#define PLL_DDR_LOCK		0xcc
+#define PLL_PCIE_LOCK		0xd4
+
+#define CFG_LOAD		0x100
+#define  CFG_LOAD_PCIE_PLL_BIT	4
+#define  CFG_LOAD_DDR_PLL_BIT	2
+#define  CFG_LOAD_CMN_PLL_BIT	1
+#define  CFG_LOAD_DIV_BIT	0
+
+#define PLL_LOCK_TIMEOUT_US	1000
+
+static unsigned long sf21_cmnpll_vco_recalc_rate(struct clk_hw *hw,
+						 unsigned long parent_rate)
+{
+	struct sf_clk_common *priv = hw_to_sf_clk_common(hw);
+	u32 cfg = sf_readl(priv, PLL_CMN_CFG1);
+	unsigned long refdiv = FIELD_GET(PLL_CMN_REFDIV, cfg);
+	unsigned long fbdiv = FIELD_GET(PLL_CMN_FBDIV, cfg);
+
+	if (!refdiv || !fbdiv)
+		return 0;
+
+	return div_u64((u64)parent_rate * fbdiv, refdiv);
+}
+
+static int sf21_cmnpll_vco_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
+{
+	unsigned long fbdiv, refdiv;
+
+	rational_best_approximation(req->rate, req->best_parent_rate,
+				    FIELD_MAX(PLL_CMN_FBDIV),
+				    FIELD_MAX(PLL_CMN_REFDIV), &fbdiv, &refdiv);
+	if (!refdiv || !fbdiv)
+		return -EINVAL;
+
+	req->rate = div_u64((u64)req->best_parent_rate * fbdiv, refdiv);
+
+	return 0;
+}
+
+static int sf21_cmnpll_vco_set_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long parent_rate)
+{
+	struct sf_clk_common *priv = hw_to_sf_clk_common(hw);
+	unsigned long fbdiv, refdiv;
+	u32 val;
+
+	rational_best_approximation(rate, parent_rate, FIELD_MAX(PLL_CMN_FBDIV),
+				    FIELD_MAX(PLL_CMN_REFDIV), &fbdiv, &refdiv);
+	if (!refdiv || !fbdiv)
+		return -EINVAL;
+
+	guard(raw_spinlock_irqsave)(priv->lock);
+
+	sf_rmw(priv, PLL_CMN_CFG1, PLL_CMN_REFDIV | PLL_CMN_FBDIV | PLL_CMN_PD,
+	       FIELD_PREP(PLL_CMN_REFDIV, refdiv) |
+		       FIELD_PREP(PLL_CMN_FBDIV, fbdiv));
+	sf_writel(priv, CFG_LOAD, BIT(CFG_LOAD_CMN_PLL_BIT));
+	sf_writel(priv, CFG_LOAD, 0);
+
+	return readl_poll_timeout_atomic(priv->base + PLL_CMN_LOCK, val, val & 1,
+					0, PLL_LOCK_TIMEOUT_US);
+}
+
+static const struct clk_ops sf21_cmnpll_vco_ops = {
+	.recalc_rate = sf21_cmnpll_vco_recalc_rate,
+	.determine_rate = sf21_cmnpll_vco_determine_rate,
+	.set_rate = sf21_cmnpll_vco_set_rate,
+};
+
+static struct sf_clk_common cmnpll_vco = {
+	.hw.init = CLK_HW_INIT_PARENTS_DATA("cmnpll_vco", sf21_ref_parent,
+					    &sf21_cmnpll_vco_ops, 0),
+};
+
+static const struct clk_ops sf21_cmnpll_postdiv_ops = {
+	.recalc_rate = sf21_dual_divider_recalc_rate,
+	.determine_rate = sf21_dual_divider_determine_rate,
+	.set_rate = sf21_dual_divider_set_rate,
+};
+
+static struct sf_dual_divider cmnpll_postdiv = {
+	.common.hw.init = CLK_HW_INIT_HW("cmnpll_postdiv", &cmnpll_vco.hw,
+				  &sf21_cmnpll_postdiv_ops, 0),
+	.div_reg = PLL_CMN_CFG1,
+	.div1_offs = PLL_CMN_POSTDIV1_OFFS,
+	.div2_offs = PLL_CMN_POSTDIV2_OFFS,
+	.load_reg = CFG_LOAD,
+	.load_bit = CFG_LOAD_CMN_PLL_BIT,
+};
+
+#define PLL_DDR_CFG1		0x18
+#define  PLL_DDR_BYPASS		BIT(23)
+#define  PLL_DDR_PLLEN		BIT(22)
+#define  PLL_DDR_4PHASEEN	BIT(21)
+#define  PLL_DDR_POSTDIVEN	BIT(20)
+#define  PLL_DDR_DSMEN		BIT(19)
+#define  PLL_DDR_DACEN		BIT(18)
+#define  PLL_DDR_DSKEWCALBYP	BIT(17)
+#define  PLL_DDR_DSKEWCALCNT	GENMASK(16, 14)
+#define  PLL_DDR_DSKEWCALEN	BIT(13)
+#define  PLL_DDR_DSKEWCALIN	GENMASK(12, 1)
+#define  PLL_DDR_DSKEWFASTCAL	BIT(0)
+
+#define PLL_DDR_CFG2		0x1c
+#define  PLL_DDR_POSTDIV1	GENMASK(29, 27)
+#define  PLL_DDR_POSTDIV2	GENMASK(26, 24)
+#define  PLL_DDR_FRAC		GENMASK(23, 0)
+
+#define PLL_DDR_CFG3		0x20
+#define  PLL_DDR_FBDIV		GENMASK(17, 6)
+#define  PLL_DDR_REFDIV		GENMASK(5, 0)
+
+static unsigned long
+sf21_ddrpll_postdiv_recalc_rate(struct clk_hw *hw,
+				unsigned long parent_rate)
+{
+	struct sf_clk_common *priv = hw_to_sf_clk_common(hw);
+	u32 cfg2 = sf_readl(priv, PLL_DDR_CFG2);
+	u32 postdiv1 = FIELD_GET(PLL_DDR_POSTDIV1, cfg2);
+	u32 postdiv2 = FIELD_GET(PLL_DDR_POSTDIV2, cfg2);
+	u32 cfg3 = sf_readl(priv, PLL_DDR_CFG3);
+	u32 fbdiv = FIELD_GET(PLL_DDR_FBDIV, cfg3);
+	u32 refdiv = FIELD_GET(PLL_DDR_REFDIV, cfg3);
+
+	if (!refdiv || !fbdiv || !postdiv1 || !postdiv2)
+		return 0;
+
+	return div_u64((u64)parent_rate * fbdiv, refdiv * postdiv1 * postdiv2);
+}
+
+static const struct clk_ops sf21_ddrpll_postdiv_ops = {
+	.recalc_rate = sf21_ddrpll_postdiv_recalc_rate,
+};
+
+static struct sf_clk_common ddrpll_postdiv = {
+	.hw.init = CLK_HW_INIT_PARENTS_DATA("ddrpll_postdiv",
+					    sf21_ref_parent,
+					    &sf21_ddrpll_postdiv_ops, 0),
+};
+
+#define PLL_PCIE_CFG1		0x4c
+#define  PLL_PCIE_PLLEN		BIT(31)
+#define  PLL_PCIE_POSTDIV0PRE	BIT(30)
+#define  PLL_PCIE_REFDIV	GENMASK(29, 24)
+#define  PLL_PCIE_FRAC		GENMASK(23, 0)
+
+#define PLL_PCIE_CFG2		0x50
+#define  PLL_PCIE_FOUTEN_BIT(i)	(28 + (i))
+#define  PLL_PCIE_BYPASS(i)	BIT(24 + (i))
+#define  PLL_PCIE_PDIV1_OFFS(i)	(21 - 6 * (i))
+#define  PLL_PCIE_PDIV2_OFFS(i)	(18 - 6 * (i))
+#define  PLL_PCIE_PDIV_MASK	GENMASK(2, 0)
+
+#define PLL_PCIE_CFG3		0x54
+#define  PLL_PCIE_DSKEWFASTCAL	BIT(31)
+#define  PLL_PCIE_DACEN		BIT(30)
+#define  PLL_PCIE_DSMEN		BIT(29)
+#define  PLL_PCIE_DSKEWCALEN	BIT(28)
+#define  PLL_PCIE_DSKEWCALBYP	BIT(27)
+#define  PLL_PCIE_DSKEWCALCNT	GENMASK(26, 24)
+#define  PLL_PCIE_DSKEWCALIN	GENMASK(23, 12)
+#define  PLL_PCIE_FBDIV		GENMASK(11, 0)
+
+static unsigned long
+sf21_pciepll_vco_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct sf_clk_common *priv = hw_to_sf_clk_common(hw);
+	u32 cfg1 = sf_readl(priv, PLL_PCIE_CFG1);
+	unsigned long refdiv = FIELD_GET(PLL_PCIE_REFDIV, cfg1);
+	u32 cfg3 = sf_readl(priv, PLL_PCIE_CFG3);
+	unsigned long fbdiv = FIELD_GET(PLL_PCIE_FBDIV, cfg3);
+
+	if (!refdiv || !fbdiv)
+		return 0;
+
+	return div_u64((u64)parent_rate * fbdiv, refdiv * 4);
+}
+
+static int sf21_pciepll_vco_enable(struct clk_hw *hw)
+{
+	struct sf_clk_common *priv = hw_to_sf_clk_common(hw);
+	u32 val;
+
+	guard(raw_spinlock_irqsave)(priv->lock);
+	sf_rmw(priv, PLL_PCIE_CFG1, 0, PLL_PCIE_PLLEN);
+	sf_writel(priv, CFG_LOAD, BIT(CFG_LOAD_PCIE_PLL_BIT));
+	sf_writel(priv, CFG_LOAD, 0);
+	return readl_poll_timeout_atomic(priv->base + PLL_PCIE_LOCK, val,
+					 val & 1, 0, PLL_LOCK_TIMEOUT_US);
+}
+
+static void sf21_pciepll_vco_disable(struct clk_hw *hw)
+{
+	struct sf_clk_common *priv = hw_to_sf_clk_common(hw);
+
+	guard(raw_spinlock_irqsave)(priv->lock);
+	sf_rmw(priv, PLL_PCIE_CFG1, PLL_PCIE_PLLEN, 0);
+	sf_writel(priv, CFG_LOAD, BIT(CFG_LOAD_PCIE_PLL_BIT));
+	sf_writel(priv, CFG_LOAD, 0);
+}
+
+static int sf21_pciepll_vco_is_enabled(struct clk_hw *hw)
+{
+	struct sf_clk_common *priv = hw_to_sf_clk_common(hw);
+
+	return !!(sf_readl(priv, PLL_PCIE_CFG1) & PLL_PCIE_PLLEN);
+}
+
+static const struct clk_ops sf21_pciepll_vco_ops = {
+	.enable = sf21_pciepll_vco_enable,
+	.disable = sf21_pciepll_vco_disable,
+	.is_enabled = sf21_pciepll_vco_is_enabled,
+	.recalc_rate = sf21_pciepll_vco_recalc_rate,
+};
+
+static struct sf_clk_common pciepll_vco = {
+	.hw.init = CLK_HW_INIT_PARENTS_DATA("pciepll_vco", sf21_ref_parent,
+					    &sf21_pciepll_vco_ops,
+					    CLK_SET_RATE_GATE),
+};
+
+static const struct clk_ops sf21_pciepll_fout_ops = {
+	.enable = sf21_dual_divider_enable,
+	.disable = sf21_dual_divider_disable,
+	.is_enabled = sf21_dual_divider_is_enabled,
+	.recalc_rate = sf21_dual_divider_recalc_rate,
+	.determine_rate = sf21_dual_divider_determine_rate,
+	.set_rate = sf21_dual_divider_set_rate,
+};
+
+#define SF21_PCIEPLL_FOUT(_name, _idx, _flags)				\
+	struct sf_dual_divider _name = {				\
+		.common.hw.init = CLK_HW_INIT_HW(#_name,		\
+						 &pciepll_vco.hw,	\
+						 &sf21_pciepll_fout_ops,\
+						 _flags),		\
+	.div_reg = PLL_PCIE_CFG2,					\
+	.div1_offs = PLL_PCIE_PDIV1_OFFS(_idx),				\
+	.div2_offs = PLL_PCIE_PDIV2_OFFS(_idx),				\
+	.en_reg = PLL_PCIE_CFG2,					\
+	.en_bit = PLL_PCIE_FOUTEN_BIT(_idx),				\
+	.load_reg = CFG_LOAD,						\
+	.load_bit = CFG_LOAD_PCIE_PLL_BIT,				\
+	.flags = SF_DUAL_DIVIDER_START_FROM_1,				\
+	}
+
+static SF21_PCIEPLL_FOUT(pciepll_fout0, 0, 0);
+static SF21_PCIEPLL_FOUT(pciepll_fout1, 1, 0);
+static SF21_PCIEPLL_FOUT(pciepll_fout2, 2, 0);
+static SF21_PCIEPLL_FOUT(pciepll_fout3, 3, 0);
+
+struct sf21_clk_muxdiv {
+	struct sf_clk_common common;
+	u16 en;
+	u8 mux_reg;
+	u8 mux_offs;
+	u8 div_reg;
+	u8 div_offs;
+};
+
+#define CRM_CLK_SEL(_x)		((_x) * 4 + 0x80)
+#define  CLK_SEL1_PLL_TEST	GENMASK(6, 4)
+#define CRM_CLK_EN		0x8c
+#define CRM_CLK_DIV(_x)		((_x) * 4 + 0x94)
+#define  CRM_CLK_DIV_MASK	GENMASK(7, 0)
+
+static unsigned long sf21_muxdiv_recalc_rate(struct clk_hw *hw,
+					     unsigned long parent_rate)
+{
+	struct sf_clk_common *cmn_priv = hw_to_sf_clk_common(hw);
+	struct sf21_clk_muxdiv *priv =
+		container_of(cmn_priv, struct sf21_clk_muxdiv, common);
+	ulong div_reg = CRM_CLK_DIV(priv->div_reg);
+	u16 div_offs = priv->div_offs;
+	u16 div_val = (sf_readl(cmn_priv, div_reg) >> div_offs) &
+		      CRM_CLK_DIV_MASK;
+	div_val += 1;
+	return parent_rate / div_val;
+}
+
+static int sf21_muxdiv_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
+{
+	unsigned int div;
+
+	if (!req->rate)
+		return -EINVAL;
+
+	div = DIV_ROUND_CLOSEST(req->best_parent_rate, req->rate);
+	if (!div)
+		div = 1;
+	else if (div > CRM_CLK_DIV_MASK + 1)
+		div = CRM_CLK_DIV_MASK + 1;
+
+	req->rate = req->best_parent_rate / div;
+	return 0;
+}
+
+static int sf21_muxdiv_set_rate(struct clk_hw *hw, unsigned long rate,
+				unsigned long parent_rate)
+{
+	struct sf_clk_common *cmn_priv = hw_to_sf_clk_common(hw);
+	struct sf21_clk_muxdiv *priv =
+		container_of(cmn_priv, struct sf21_clk_muxdiv, common);
+	ulong div_reg = CRM_CLK_DIV(priv->div_reg);
+	u16 div_offs = priv->div_offs;
+	unsigned int div;
+
+	if (!rate)
+		return -EINVAL;
+
+	div = DIV_ROUND_CLOSEST(parent_rate, rate);
+	if (div < 1)
+		div = 1;
+	else if (div > CRM_CLK_DIV_MASK + 1)
+		div = CRM_CLK_DIV_MASK + 1;
+	div -= 1;
+
+	guard(raw_spinlock_irqsave)(cmn_priv->lock);
+	sf_rmw(cmn_priv, div_reg, CRM_CLK_DIV_MASK << div_offs,
+	       div << div_offs);
+	sf_writel(cmn_priv, CFG_LOAD, BIT(CFG_LOAD_DIV_BIT));
+	sf_writel(cmn_priv, CFG_LOAD, 0);
+	return 0;
+}
+
+static int sf21_muxdiv_enable(struct clk_hw *hw)
+{
+	struct sf_clk_common *cmn_priv = hw_to_sf_clk_common(hw);
+	struct sf21_clk_muxdiv *priv =
+		container_of(cmn_priv, struct sf21_clk_muxdiv, common);
+
+	guard(raw_spinlock_irqsave)(cmn_priv->lock);
+	sf_rmw(cmn_priv, CRM_CLK_EN, 0, BIT(priv->en));
+	/*
+	 * Clock divider value load only happens when the clock is running.
+	 * Pulse the CFG_LOAD_DIV so that set_rate() which happened
+	 * before enable() is applied.
+	 */
+	sf_writel(cmn_priv, CFG_LOAD, BIT(CFG_LOAD_DIV_BIT));
+	sf_writel(cmn_priv, CFG_LOAD, 0);
+	return 0;
+}
+
+static void sf21_muxdiv_disable(struct clk_hw *hw)
+{
+	struct sf_clk_common *cmn_priv = hw_to_sf_clk_common(hw);
+	struct sf21_clk_muxdiv *priv =
+		container_of(cmn_priv, struct sf21_clk_muxdiv, common);
+
+	guard(raw_spinlock_irqsave)(cmn_priv->lock);
+	sf_rmw(cmn_priv, CRM_CLK_EN, BIT(priv->en), 0);
+}
+
+static int sf21_muxdiv_is_enabled(struct clk_hw *hw)
+{
+	struct sf_clk_common *cmn_priv = hw_to_sf_clk_common(hw);
+	struct sf21_clk_muxdiv *priv =
+		container_of(cmn_priv, struct sf21_clk_muxdiv, common);
+	u32 reg_val = sf_readl(cmn_priv, CRM_CLK_EN);
+
+	return reg_val & (BIT(priv->en)) ? 1 : 0;
+}
+
+static u8 sf21_muxdiv_get_parent(struct clk_hw *hw)
+{
+	struct sf_clk_common *cmn_priv = hw_to_sf_clk_common(hw);
+	struct sf21_clk_muxdiv *priv =
+		container_of(cmn_priv, struct sf21_clk_muxdiv, common);
+	ulong mux_reg = CRM_CLK_SEL(priv->mux_reg);
+	u16 mux_offs = priv->mux_offs;
+	u32 reg_val = sf_readl(cmn_priv, mux_reg);
+
+	return reg_val & BIT(mux_offs) ? 1 : 0;
+}
+
+static int sf21_muxdiv_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct sf_clk_common *cmn_priv = hw_to_sf_clk_common(hw);
+	struct sf21_clk_muxdiv *priv =
+		container_of(cmn_priv, struct sf21_clk_muxdiv, common);
+	ulong mux_reg = CRM_CLK_SEL(priv->mux_reg);
+	u16 mux_offs = priv->mux_offs;
+
+	guard(raw_spinlock_irqsave)(cmn_priv->lock);
+	if (index)
+		sf_rmw(cmn_priv, mux_reg, 0, BIT(mux_offs));
+	else
+		sf_rmw(cmn_priv, mux_reg, BIT(mux_offs), 0);
+
+	return 0;
+}
+
+static const struct clk_ops sf21_clk_muxdiv_ops = {
+	.enable = sf21_muxdiv_enable,
+	.disable = sf21_muxdiv_disable,
+	.is_enabled = sf21_muxdiv_is_enabled,
+	.recalc_rate = sf21_muxdiv_recalc_rate,
+	.determine_rate = sf21_muxdiv_determine_rate,
+	.set_rate = sf21_muxdiv_set_rate,
+	.get_parent = sf21_muxdiv_get_parent,
+	.set_parent = sf21_muxdiv_set_parent,
+};
+
+#define SF21_MUXDIV(_name, _parents, _mux_reg, _mux_offs, _div_reg,	\
+		    _div_offs, _en, _flags)				\
+	struct sf21_clk_muxdiv _name = {				\
+		.common.hw.init = CLK_HW_INIT_PARENTS_HW(		\
+		#_name, _parents, &sf21_clk_muxdiv_ops, _flags),	\
+		.en = _en,						\
+		.mux_reg = _mux_reg,					\
+		.mux_offs = _mux_offs,					\
+		.div_reg = _div_reg,					\
+		.div_offs = _div_offs,					\
+	}
+
+static const struct clk_hw *clk_periph_parents[] = {
+	&cmnpll_postdiv.common.hw,
+	&ddrpll_postdiv.hw,
+};
+
+static const struct clk_hw *clk_ddr_parents[] = {
+	&ddrpll_postdiv.hw,
+	&cmnpll_postdiv.common.hw,
+};
+
+static const struct clk_hw *clk_gmac_usb_parents[] = {
+	&cmnpll_vco.hw,
+	&ddrpll_postdiv.hw,
+};
+
+static SF21_MUXDIV(muxdiv_cpu, clk_periph_parents, 0, 1, 0, 0, 0,
+		   CLK_IS_CRITICAL);
+static SF21_MUXDIV(muxdiv_pic, clk_periph_parents, 0, 3, 3, 16, 1,
+		   CLK_IS_CRITICAL);
+static SF21_MUXDIV(muxdiv_axi, clk_periph_parents, 0, 5, 0, 8, 2,
+		   CLK_IS_CRITICAL);
+static SF21_MUXDIV(muxdiv_ahb, clk_periph_parents, 0, 7, 0, 16, 3,
+		   CLK_IS_CRITICAL);
+static SF21_MUXDIV(muxdiv_apb, clk_periph_parents, 0, 9, 0, 24, 4,
+		   CLK_IS_CRITICAL);
+static SF21_MUXDIV(muxdiv_uart, clk_periph_parents, 0, 11, 1, 0, 5, 0);
+static SF21_MUXDIV(muxdiv_iram, clk_periph_parents, 0, 13, 1, 8, 6, 0);
+static SF21_MUXDIV(muxdiv_npu, clk_periph_parents, 0, 17, 1, 24, 8, 0);
+static SF21_MUXDIV(muxdiv_ddrphy, clk_ddr_parents, 0, 19, 2, 0, 9,
+		   CLK_IS_CRITICAL);
+static SF21_MUXDIV(muxdiv_ddr_bypass, clk_ddr_parents, 0, 21, 3, 0, 10,
+		   CLK_IS_CRITICAL);
+static SF21_MUXDIV(muxdiv_ethtsu, clk_periph_parents, 0, 25, 2, 16, 12,
+		   0);
+static SF21_MUXDIV(muxdiv_gmac_byp_ref, clk_gmac_usb_parents, 0, 27, 2,
+		   24, 13, 0);
+static SF21_MUXDIV(muxdiv_usb, clk_gmac_usb_parents, 1, 1, 1, 16, 24, 0);
+static SF21_MUXDIV(muxdiv_usbphy, clk_gmac_usb_parents, 1, 3, 2, 8, 25,
+		   0);
+static SF21_MUXDIV(muxdiv_serdes_csr, clk_periph_parents, 1, 15, 5, 0,
+		   20, 0);
+static SF21_MUXDIV(muxdiv_crypt_csr, clk_periph_parents, 1, 17, 5, 8,
+		   21, 0);
+static SF21_MUXDIV(muxdiv_crypt_app, clk_periph_parents, 1, 19, 5, 16,
+		   22, 0);
+static SF21_MUXDIV(muxdiv_irom, clk_periph_parents, 1, 21, 5, 24, 23,
+		   CLK_IS_CRITICAL);
+
+static int sf21_mux_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
+{
+	req->rate = req->best_parent_rate;
+	return 0;
+}
+
+static const struct clk_ops sf21_clk_mux_ops = {
+	.get_parent = sf21_muxdiv_get_parent,
+	.set_parent = sf21_muxdiv_set_parent,
+	.determine_rate = sf21_mux_determine_rate,
+};
+
+#define SF21_MUX(_name, _parents, _mux_reg, _mux_offs, _flags)	\
+	struct sf21_clk_muxdiv _name = {				\
+		.common.hw.init = CLK_HW_INIT_PARENTS_DATA(		\
+			#_name, _parents, &sf21_clk_mux_ops, _flags),	\
+		.en = 0,						\
+		.mux_reg = _mux_reg,					\
+		.mux_offs = _mux_offs,					\
+		.div_reg = 0,						\
+		.div_offs = 0,						\
+	}
+
+static const struct clk_parent_data clk_boot_parents[] = {
+	{ .hw = &muxdiv_irom.common.hw },
+	{ .index = 0 },
+};
+
+static SF21_MUX(mux_boot, clk_boot_parents, 0, 30, CLK_IS_CRITICAL);
+
+static const struct clk_ops sf21_clk_div_ops = {
+	.recalc_rate = sf21_muxdiv_recalc_rate,
+	.determine_rate = sf21_muxdiv_determine_rate,
+	.set_rate = sf21_muxdiv_set_rate,
+};
+
+#define SF21_DIV(_name, _parents, _div_reg, _div_offs, _flags)		\
+	struct sf21_clk_muxdiv _name = {				\
+		.common.hw.init = CLK_HW_INIT_PARENTS_DATA(		\
+			#_name, _parents, &sf21_clk_div_ops, _flags),	\
+		.en = 0,						\
+		.mux_reg = 0,						\
+		.mux_offs = 0,						\
+		.div_reg = _div_reg,					\
+		.div_offs = _div_offs,					\
+	}
+
+static SF21_DIV(div_pvt, sf21_ref_parent, 3, 8, 0);
+
+static const struct clk_hw *clk_pll_test_parents[] = {
+	&cmnpll_postdiv.common.hw,
+	&ddrpll_postdiv.hw,
+	&pciepll_fout3.common.hw,
+};
+
+static u8 sf21_pll_test_get_parent(struct clk_hw *hw)
+{
+	struct sf_clk_common *cmn_priv = hw_to_sf_clk_common(hw);
+	u32 reg_val = sf_readl(cmn_priv, CRM_CLK_SEL(1));
+	u8 parent = FIELD_GET(CLK_SEL1_PLL_TEST, reg_val);
+
+	if (parent >= ARRAY_SIZE(clk_pll_test_parents))
+		return 0;
+
+	return parent;
+}
+
+static int sf21_pll_test_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct sf_clk_common *cmn_priv = hw_to_sf_clk_common(hw);
+
+	if (index >= ARRAY_SIZE(clk_pll_test_parents))
+		return -EINVAL;
+
+	guard(raw_spinlock_irqsave)(cmn_priv->lock);
+	sf_rmw(cmn_priv, CRM_CLK_SEL(1), CLK_SEL1_PLL_TEST,
+	       FIELD_PREP(CLK_SEL1_PLL_TEST, index));
+	return 0;
+}
+
+static const struct clk_ops sf21_clk_pll_test_ops = {
+	.recalc_rate = sf21_muxdiv_recalc_rate,
+	.determine_rate = sf21_muxdiv_determine_rate,
+	.set_rate = sf21_muxdiv_set_rate,
+	.get_parent = sf21_pll_test_get_parent,
+	.set_parent = sf21_pll_test_set_parent,
+};
+
+static struct sf21_clk_muxdiv muxdiv_pll_test = {
+	.common.hw.init = CLK_HW_INIT_PARENTS_HW("muxdiv_pll_test",
+						 clk_pll_test_parents,
+						 &sf21_clk_pll_test_ops, 0),
+	.en = 0,
+	.mux_reg = 0,
+	.mux_offs = 0,
+	.div_reg = 3,
+	.div_offs = 24,
+};
+
+static const struct clk_ops sf21_clk_gate_ops = {
+	.enable = sf21_muxdiv_enable,
+	.disable = sf21_muxdiv_disable,
+	.is_enabled = sf21_muxdiv_is_enabled,
+};
+
+#define SF21_GATE(_name, _parents, _en, _flags)				\
+	struct sf21_clk_muxdiv _name = {				\
+		.common.hw.init = CLK_HW_INIT_PARENTS_HW(		\
+			#_name, _parents, &sf21_clk_gate_ops, _flags),	\
+		.en = _en,						\
+		.mux_reg = 0,						\
+		.mux_offs = 0,						\
+		.div_reg = 0,						\
+		.div_offs = 0,						\
+	}
+
+static const struct clk_hw *clk_pcie_parents[] = {
+	&pciepll_fout1.common.hw,
+};
+
+static SF21_GATE(pcie_refclk_n, clk_pcie_parents, 15, 0);
+static SF21_GATE(pcie_refclk_p, clk_pcie_parents, 16, 0);
+
+#define SF21_NUM_CLKS			31
+
+static struct clk_hw_onecell_data sf21_hw_clks = {
+	.num = SF21_NUM_CLKS,
+	.hws = {
+		[SF21_CLK_CMNPLL_VCO] = &cmnpll_vco.hw,
+		[SF21_CLK_CMNPLL_POSTDIV] = &cmnpll_postdiv.common.hw,
+		[SF21_CLK_DDRPLL_POSTDIV] = &ddrpll_postdiv.hw,
+		[SF21_CLK_PCIEPLL_VCO] = &pciepll_vco.hw,
+		[SF21_CLK_PCIEPLL_FOUT0] = &pciepll_fout0.common.hw,
+		[SF21_CLK_PCIEPLL_FOUT1] = &pciepll_fout1.common.hw,
+		[SF21_CLK_PCIEPLL_FOUT2] = &pciepll_fout2.common.hw,
+		[SF21_CLK_PCIEPLL_FOUT3] = &pciepll_fout3.common.hw,
+		[SF21_CLK_CPU] = &muxdiv_cpu.common.hw,
+		[SF21_CLK_PIC] = &muxdiv_pic.common.hw,
+		[SF21_CLK_AXI] = &muxdiv_axi.common.hw,
+		[SF21_CLK_AHB] = &muxdiv_ahb.common.hw,
+		[SF21_CLK_APB] = &muxdiv_apb.common.hw,
+		[SF21_CLK_UART] = &muxdiv_uart.common.hw,
+		[SF21_CLK_IRAM] = &muxdiv_iram.common.hw,
+		[SF21_CLK_NPU] = &muxdiv_npu.common.hw,
+		[SF21_CLK_DDRPHY_REF] = &muxdiv_ddrphy.common.hw,
+		[SF21_CLK_DDR_BYPASS] = &muxdiv_ddr_bypass.common.hw,
+		[SF21_CLK_ETHTSU] = &muxdiv_ethtsu.common.hw,
+		[SF21_CLK_GMAC_BYP_REF] = &muxdiv_gmac_byp_ref.common.hw,
+		[SF21_CLK_USB] = &muxdiv_usb.common.hw,
+		[SF21_CLK_USBPHY] = &muxdiv_usbphy.common.hw,
+		[SF21_CLK_SERDES_CSR] = &muxdiv_serdes_csr.common.hw,
+		[SF21_CLK_CRYPT_CSR] = &muxdiv_crypt_csr.common.hw,
+		[SF21_CLK_CRYPT_APP] = &muxdiv_crypt_app.common.hw,
+		[SF21_CLK_IROM] = &muxdiv_irom.common.hw,
+		[SF21_CLK_BOOT] = &mux_boot.common.hw,
+		[SF21_CLK_PVT] = &div_pvt.common.hw,
+		[SF21_CLK_PLL_TEST] = &muxdiv_pll_test.common.hw,
+		[SF21_CLK_PCIE_REFN] = &pcie_refclk_n.common.hw,
+		[SF21_CLK_PCIE_REFP] = &pcie_refclk_p.common.hw,
+	}
+};
+
+struct sf21_clk_ctrl {
+	void __iomem *base;
+	/* Serializes register RMW sequences by clock ops. */
+	raw_spinlock_t clk_lock;
+	/* Serializes register RMW sequences by reset ops. */
+	spinlock_t rst_lock;
+	struct reset_controller_dev rcdev;
+	const u32 *reset_bits;
+	unsigned int nr_resets;
+};
+
+#define SF21_SOFT_RESET		0xc0
+
+static const u32 sf21_topcrm_reset_bits[] = {
+	[SF21_RESET_GIC]			= BIT(1),
+	[SF21_RESET_AXI]			= BIT(2),
+	[SF21_RESET_AHB]			= BIT(3),
+	[SF21_RESET_APB]			= BIT(4),
+	[SF21_RESET_IRAM]			= BIT(5),
+	[SF21_RESET_NPU]			= BIT(7),
+	[SF21_RESET_DDR_CTL]			= BIT(8),
+	[SF21_RESET_DDR_PHY]			= BIT(9),
+	[SF21_RESET_DDR_PWR_OK_IN]		= BIT(10),
+	[SF21_RESET_DDR_CTL_APB]		= BIT(11),
+	[SF21_RESET_DDR_PHY_APB]		= BIT(12),
+	[SF21_RESET_USB]			= BIT(19),
+	[SF21_RESET_PVT]			= BIT(23),
+	[SF21_RESET_SERDES_CSR]			= BIT(24),
+	[SF21_RESET_CRYPT_CSR]			= BIT(28),
+	[SF21_RESET_CRYPT_APP]			= BIT(29),
+	[SF21_RESET_NPU2DDR_ASYNCBRIDGE]	= BIT(30),
+	[SF21_RESET_IROM]			= BIT(31),
+};
+
+static inline struct sf21_clk_ctrl *
+rcdev_to_sf21_topcrm(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct sf21_clk_ctrl, rcdev);
+}
+
+static int sf21_topcrm_reset_update(struct reset_controller_dev *rcdev,
+				    unsigned long id, bool assert)
+{
+	struct sf21_clk_ctrl *ctrl = rcdev_to_sf21_topcrm(rcdev);
+	u32 bit = ctrl->reset_bits[id];
+	u32 reg;
+
+	guard(spinlock_irqsave)(&ctrl->rst_lock);
+	reg = readl(ctrl->base + SF21_SOFT_RESET);
+	if (assert)
+		reg &= ~bit;
+	else
+		reg |= bit;
+	writel(reg, ctrl->base + SF21_SOFT_RESET);
+
+	return 0;
+}
+
+static int sf21_topcrm_reset_assert(struct reset_controller_dev *rcdev,
+				    unsigned long id)
+{
+	return sf21_topcrm_reset_update(rcdev, id, true);
+}
+
+static int sf21_topcrm_reset_deassert(struct reset_controller_dev *rcdev,
+				      unsigned long id)
+{
+	return sf21_topcrm_reset_update(rcdev, id, false);
+}
+
+static int sf21_topcrm_reset_status(struct reset_controller_dev *rcdev,
+				    unsigned long id)
+{
+	struct sf21_clk_ctrl *ctrl = rcdev_to_sf21_topcrm(rcdev);
+	u32 bit = ctrl->reset_bits[id];
+
+	return !(readl(ctrl->base + SF21_SOFT_RESET) & bit);
+}
+
+static const struct reset_control_ops sf21_topcrm_reset_ops = {
+	.assert = sf21_topcrm_reset_assert,
+	.deassert = sf21_topcrm_reset_deassert,
+	.status = sf21_topcrm_reset_status,
+};
+
+static int sf21_topcrm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct sf21_clk_ctrl *ctrl;
+	int i, ret;
+
+	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
+	if (!ctrl)
+		return -ENOMEM;
+
+	ctrl->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(ctrl->base))
+		return dev_err_probe(dev, PTR_ERR(ctrl->base),
+				     "failed to map resources\n");
+
+	raw_spin_lock_init(&ctrl->clk_lock);
+	spin_lock_init(&ctrl->rst_lock);
+
+	for (i = 0; i < sf21_hw_clks.num; i++) {
+		struct clk_hw *hw = sf21_hw_clks.hws[i];
+		struct sf_clk_common *common;
+
+		if (!hw)
+			continue;
+		common = hw_to_sf_clk_common(hw);
+		common->base = ctrl->base;
+		common->lock = &ctrl->clk_lock;
+		ret = devm_clk_hw_register(dev, hw);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to register clock %d\n",
+					     i);
+	}
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
+					  &sf21_hw_clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add hw provider\n");
+
+	ctrl->reset_bits = sf21_topcrm_reset_bits;
+	ctrl->nr_resets = ARRAY_SIZE(sf21_topcrm_reset_bits);
+	ctrl->rcdev.owner = THIS_MODULE;
+	ctrl->rcdev.nr_resets = ctrl->nr_resets;
+	ctrl->rcdev.ops = &sf21_topcrm_reset_ops;
+	ctrl->rcdev.of_node = dev->of_node;
+	ctrl->rcdev.of_reset_n_cells = 1;
+
+	ret = devm_reset_controller_register(dev, &ctrl->rcdev);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to register reset controller\n");
+
+	return 0;
+}
+
+static const struct of_device_id sf21_topcrm_dt_ids[] = {
+	{ .compatible = "siflower,sf21-topcrm" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, sf21_topcrm_dt_ids);
+
+static struct platform_driver sf21_topcrm_driver = {
+	.probe	= sf21_topcrm_probe,
+	.driver	= {
+		.name			= "sf21-topcrm",
+		.suppress_bind_attrs	= true,
+		.of_match_table		= sf21_topcrm_dt_ids,
+	},
+};
+module_platform_driver(sf21_topcrm_driver);
+
+MODULE_AUTHOR("Chuanhong Guo <gch981213@gmail.com>");
+MODULE_DESCRIPTION("driver for Siflower SF21 top clock and reset module");
+MODULE_LICENSE("GPL");

-- 
2.54.0

