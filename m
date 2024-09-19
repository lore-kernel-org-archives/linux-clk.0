Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58457199FCF;
	Thu, 19 Sep 2024 09:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726737117; cv=none; b=gVkGMdkzBtMNW2dFxgcNitY7V3INmAWVLXpOPzd+MalJp0fv+wd3nXMlzTdix2YGw6vFJV/E2J5xCEuJozflmG46ncJtXqddiKjQaDkY/rvLVxgNm3RcsV8hLDoRDCjPh3q+8Hy+tFij9EuZpu0nlQo4jV+ae6rPiz+tqOO1wX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726737117; c=relaxed/simple;
	bh=BaPtmF4mb/PCEA1E8pZgHwKNM3whMXBtZlS+CX4xCQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y1y/7cvsTNtTk69LXfjfVi0rhIbISzSvYhvktJ/dOPinu0U62vMDELyTXAuYne3oergcfz9XaUZckDJXFMQRjp+S9bX72ckFV8j7kaRoAZY6MyhUfjiNuVFJrIa9ISSoB5a+MWxgkyn+rRbrNtX6AjBMuD0vwahFXyr8qntDm1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=B/pHl/yq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="B/pHl/yq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1726737107;
	bh=BaPtmF4mb/PCEA1E8pZgHwKNM3whMXBtZlS+CX4xCQI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B/pHl/yqcNVg/mNCYsguhElGGApOy3M+GdqA6M6DCSz/hjvaZxJBK6fuj6XNwh8Fo
	 iRvWLYnKNoMyxVga/fxW05mjeEptCYQj5KIwYzoVmUQSRJyaCgzwz9a9Su3MPBX4Fq
	 Z99bzWifDzVVwYy4etfGRTC9IlVqsqU1fCykJ2shOuS1dCfa2j0kp2TncRflXvXtSE
	 0AqMWXj0qqSHwXgYBpwuiIQ0O0IJipfzRkvE2yW3yXjAWvSx2CoMkIUkX12rpjznYa
	 G1W0I4ihYaLI1fMZ+79aDF2Iwtav05BfO98NKZGe59feDQQmAFGIZAoy0JpFN6ybwM
	 8BT+CpbcuNYrg==
Received: from jupiter.universe (dyndsl-091-248-208-160.ewe-ip-backbone.de [91.248.208.160])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6ED8B17E1080;
	Thu, 19 Sep 2024 11:11:47 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 26FCB480086; Thu, 19 Sep 2024 11:11:47 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: Elaine Zhang <zhangqing@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	huangtao@rock-chips.com,
	andy.yan@rock-chips.com,
	Michal Tomek <mtdev79b@gmail.com>,
	Ilya K <me@0upti.me>,
	Chad LeClair <leclair@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com
Subject: [PATCH v11 4/5] clk: rockchip: implement linked gate clock support
Date: Thu, 19 Sep 2024 11:09:47 +0200
Message-ID: <20240919091129.83500-5-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240919091129.83500-1-sebastian.reichel@collabora.com>
References: <20240919091129.83500-1-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recent Rockchip SoCs have a new hardware block called Native Interface
Unit (NIU), which gates clocks to devices behind them. These clock
gates will only have a running output clock when all of the following
conditions are met:

1. the parent clock is enabled
2. the enable bit is set correctly
3. the linked clock is enabled

To handle them this code registers them as a normal gate type clock,
which takes care of condition 1 + 2. The linked clock is handled by
using runtime PM clocks. Handling it via runtime PM requires setting
up a struct device for each of these clocks with a driver attached
to use the correct runtime PM operations. Thus the complete handling
of these clocks has been moved into its own driver.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/clk/rockchip/Makefile     |  1 +
 drivers/clk/rockchip/clk-rk3588.c | 23 +--------
 drivers/clk/rockchip/clk.c        | 52 +++++++++++++++++++
 drivers/clk/rockchip/clk.h        | 25 +++++++++
 drivers/clk/rockchip/gate-link.c  | 85 +++++++++++++++++++++++++++++++
 5 files changed, 165 insertions(+), 21 deletions(-)
 create mode 100644 drivers/clk/rockchip/gate-link.c

diff --git a/drivers/clk/rockchip/Makefile b/drivers/clk/rockchip/Makefile
index 36894f6a7022..179be95c6ffb 100644
--- a/drivers/clk/rockchip/Makefile
+++ b/drivers/clk/rockchip/Makefile
@@ -13,6 +13,7 @@ clk-rockchip-y += clk-inverter.o
 clk-rockchip-y += clk-mmc-phase.o
 clk-rockchip-y += clk-muxgrf.o
 clk-rockchip-y += clk-ddr.o
+clk-rockchip-y += gate-link.o
 clk-rockchip-$(CONFIG_RESET_CONTROLLER) += softrst.o
 
 obj-$(CONFIG_CLK_PX30)          += clk-px30.o
diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index b707105573d2..4d85ae615e15 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -12,25 +12,6 @@
 #include <dt-bindings/clock/rockchip,rk3588-cru.h>
 #include "clk.h"
 
-/*
- * Recent Rockchip SoCs have a new hardware block called Native Interface
- * Unit (NIU), which gates clocks to devices behind them. These effectively
- * need two parent clocks.
- *
- * Downstream enables the linked clock via runtime PM whenever the gate is
- * enabled. This implementation uses separate clock nodes for each of the
- * linked gate clocks, which leaks parts of the clock tree into DT.
- *
- * The GATE_LINK macro instead takes the second parent via 'linkname', but
- * ignores the information. Once the clock framework is ready to handle it, the
- * information should be passed on here. But since these clocks are required to
- * access multiple relevant IP blocks, such as PCIe or USB, we mark all linked
- * clocks critical until a better solution is available. This will waste some
- * power, but avoids leaking implementation details into DT or hanging the
- * system.
- */
-#define GATE_LINK(_id, cname, pname, linkedclk, f, o, b, gf) \
-	GATE(_id, cname, pname, f, o, b, gf)
 #define RK3588_LINKED_CLK		CLK_IS_CRITICAL
 
 
@@ -2513,8 +2494,8 @@ static int clk_rk3588_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 
-	rockchip_clk_register_branches(ctx, rk3588_clk_branches,
-				       ARRAY_SIZE(rk3588_clk_branches));
+	rockchip_clk_register_late_branches(dev, ctx, rk3588_clk_branches,
+					    ARRAY_SIZE(rk3588_clk_branches));
 
 	rockchip_clk_finalize(ctx);
 
diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index b87ca1e8c540..f0d76d62382c 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -19,6 +19,7 @@
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
+#include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reboot.h>
 
@@ -467,6 +468,29 @@ unsigned long rockchip_clk_find_max_clk_id(struct rockchip_clk_branch *list,
 }
 EXPORT_SYMBOL_GPL(rockchip_clk_find_max_clk_id);
 
+static struct platform_device *rockchip_clk_register_gate_link(
+		struct device *parent_dev,
+		struct rockchip_clk_provider *ctx,
+		struct rockchip_clk_branch *clkbr)
+{
+	struct rockchip_gate_link_platdata gate_link_pdata = {
+		.ctx = ctx,
+		.clkbr = clkbr,
+	};
+
+	struct platform_device_info pdevinfo = {
+		.parent = parent_dev,
+		.name = "rockchip-gate-link-clk",
+		.id = clkbr->id,
+		.fwnode = dev_fwnode(parent_dev),
+		.of_node_reused = true,
+		.data = &gate_link_pdata,
+		.size_data = sizeof(gate_link_pdata),
+	};
+
+	return platform_device_register_full(&pdevinfo);
+}
+
 void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
 				    struct rockchip_clk_branch *list,
 				    unsigned int nr_clk)
@@ -592,6 +616,9 @@ void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
 				list->div_width, list->div_flags,
 				ctx->reg_base, &ctx->lock);
 			break;
+		case branch_linked_gate:
+			/* must be registered late, fall-through for error message */
+			break;
 		}
 
 		/* none of the cases above matched */
@@ -612,6 +639,31 @@ void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
 }
 EXPORT_SYMBOL_GPL(rockchip_clk_register_branches);
 
+void rockchip_clk_register_late_branches(struct device *dev,
+					 struct rockchip_clk_provider *ctx,
+					 struct rockchip_clk_branch *list,
+					 unsigned int nr_clk)
+{
+	unsigned int idx;
+
+	for (idx = 0; idx < nr_clk; idx++, list++) {
+		struct platform_device *pdev = NULL;
+
+		switch (list->branch_type) {
+		case branch_linked_gate:
+			pdev = rockchip_clk_register_gate_link(dev, ctx, list);
+			break;
+		default:
+			dev_err(dev, "unknown clock type %d\n", list->branch_type);
+			break;
+		}
+
+		if (!pdev)
+			dev_err(dev, "failed to register device for clock %s\n", list->name);
+	}
+}
+EXPORT_SYMBOL_GPL(rockchip_clk_register_late_branches);
+
 void rockchip_clk_register_armclk(struct rockchip_clk_provider *ctx,
 				  unsigned int lookup_id,
 				  const char *name, const char *const *parent_names,
diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index 3dc5fb9bac4f..3fb620f8dd57 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -517,6 +517,7 @@ enum rockchip_clk_branch_type {
 	branch_divider,
 	branch_fraction_divider,
 	branch_gate,
+	branch_linked_gate,
 	branch_mmc,
 	branch_inverter,
 	branch_factor,
@@ -544,6 +545,7 @@ struct rockchip_clk_branch {
 	int				gate_offset;
 	u8				gate_shift;
 	u8				gate_flags;
+	unsigned int			linked_clk_id;
 	struct rockchip_clk_branch	*child;
 };
 
@@ -842,6 +844,20 @@ struct rockchip_clk_branch {
 		.gate_flags	= gf,				\
 	}
 
+#define GATE_LINK(_id, cname, pname, linkedclk, f, o, b, gf)	\
+	{							\
+		.id		= _id,				\
+		.branch_type	= branch_linked_gate,		\
+		.name		= cname,			\
+		.parent_names	= (const char *[]){ pname },	\
+		.linked_clk_id	= linkedclk,			\
+		.num_parents	= 1,				\
+		.flags		= f,				\
+		.gate_offset	= o,				\
+		.gate_shift	= b,				\
+		.gate_flags	= gf,				\
+	}
+
 #define MMC(_id, cname, pname, offset, shift)			\
 	{							\
 		.id		= _id,				\
@@ -981,6 +997,11 @@ static inline void rockchip_clk_set_lookup(struct rockchip_clk_provider *ctx,
 	ctx->clk_data.clks[id] = clk;
 }
 
+struct rockchip_gate_link_platdata {
+	struct rockchip_clk_provider *ctx;
+	struct rockchip_clk_branch *clkbr;
+};
+
 struct rockchip_clk_provider *rockchip_clk_init(struct device_node *np,
 			void __iomem *base, unsigned long nr_clks);
 struct rockchip_clk_provider *rockchip_clk_init_early(struct device_node *np,
@@ -993,6 +1014,10 @@ unsigned long rockchip_clk_find_max_clk_id(struct rockchip_clk_branch *list,
 void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
 				    struct rockchip_clk_branch *list,
 				    unsigned int nr_clk);
+void rockchip_clk_register_late_branches(struct device *dev,
+					 struct rockchip_clk_provider *ctx,
+					 struct rockchip_clk_branch *list,
+					 unsigned int nr_clk);
 void rockchip_clk_register_plls(struct rockchip_clk_provider *ctx,
 				struct rockchip_pll_clock *pll_list,
 				unsigned int nr_pll, int grf_lock_offset);
diff --git a/drivers/clk/rockchip/gate-link.c b/drivers/clk/rockchip/gate-link.c
new file mode 100644
index 000000000000..cd0f7a2d30ab
--- /dev/null
+++ b/drivers/clk/rockchip/gate-link.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2024 Collabora Ltd.
+ * Author: Sebastian Reichel <sebastian.reichel@collabora.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
+#include <linux/property.h>
+#include "clk.h"
+
+static int rk_clk_gate_link_register(struct device *dev,
+				     struct rockchip_clk_provider *ctx,
+				     struct rockchip_clk_branch *clkbr)
+{
+	unsigned long flags = clkbr->flags | CLK_SET_RATE_PARENT;
+	struct clk *clk;
+
+	clk = clk_register_gate(dev, clkbr->name, clkbr->parent_names[0],
+				flags, ctx->reg_base + clkbr->gate_offset,
+				clkbr->gate_shift, clkbr->gate_flags,
+				&ctx->lock);
+
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	rockchip_clk_set_lookup(ctx, clk, clkbr->id);
+	return 0;
+}
+
+static int rk_clk_gate_link_probe(struct platform_device *pdev)
+{
+	struct rockchip_gate_link_platdata *pdata;
+	struct device *dev = &pdev->dev;
+	struct clk *linked_clk;
+	int ret;
+
+	pdata = dev_get_platdata(dev);
+	if (!pdata)
+		return dev_err_probe(dev, -ENODEV, "missing platform data");
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	ret = devm_pm_clk_create(dev);
+	if (ret)
+		return ret;
+
+	linked_clk = rockchip_clk_get_lookup(pdata->ctx, pdata->clkbr->linked_clk_id);
+	ret = pm_clk_add_clk(dev, linked_clk);
+	if (ret)
+		return ret;
+
+	ret = rk_clk_gate_link_register(dev, pdata->ctx, pdata->clkbr);
+	if (ret)
+		goto err;
+
+	return 0;
+
+err:
+	pm_clk_remove_clk(dev, linked_clk);
+	return ret;
+}
+
+static const struct dev_pm_ops rk_clk_gate_link_pm_ops = {
+	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
+static struct platform_driver rk_clk_gate_link_driver = {
+	.probe		= rk_clk_gate_link_probe,
+	.driver		= {
+		.name	= "rockchip-gate-link-clk",
+		.pm = &rk_clk_gate_link_pm_ops,
+		.suppress_bind_attrs = true,
+	},
+};
+
+static int __init rk_clk_gate_link_drv_register(void)
+{
+	return platform_driver_register(&rk_clk_gate_link_driver);
+}
+core_initcall(rk_clk_gate_link_drv_register);
-- 
2.45.2

