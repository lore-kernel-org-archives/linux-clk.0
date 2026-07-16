Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4EC3C9EF3
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 21:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784237779; cv=none; b=NIKpqoN/BJl8gVGDJOvY71vScEqsyGZWXAMM8kKlgeX9ACyKkXM6clcbN3V88GhdVSNFZuF2PtEvOATeviFpNfh6aTxsO/IltFikrAAm8/NAYeJO9xVvpmNuIa5aP6ekRO8iOGWg7auR2MJeODuTfDd/wyA9U2GbP00h0ktFjVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784237779; c=relaxed/simple;
	bh=C5xKHsMuzaBYcEFc16GfaBkK5o1oYFjlxMRTNW9V63E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uSI2wt+lGeT9V1dwtzSZZC0x8mnA2xNrpNXTK1uPhKYALA8/h9b9LFRC48z6fufXwsMDslW3BihphDYLvLAx0/H1Us4HZLaTfW4QuTNqud4IUoYBnnOo6yytJ3nvb5fclSZuFjhhaS8oKLGljdSt4wr0nBqY63qdHRvvGLXOvq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AFmTGeZO; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AFmTGeZO"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-495437bb891so6187335e9.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 14:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784237776; x=1784842576; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+mAie+4SRqYB5ehQZsR75LVrdIpVXjXA+qRH2nIqf3c=;
        b=AFmTGeZOo/ZQhls145BwlbMWT+p9JkvH81ZpCjlV7ZzUQCKKkQg6/MO5UdVFkeCec/
         YbxH6aySnPvDbk2A//VlcX9eY4DcIeNBesJUhAqdOO+o13sHoJ8xsJgIyIsVwT4VTrGA
         irY+K7j+J+sdROXzF6RP7jS10fVEZH2uYagLXc8ZzZ679WMbbOmmpQZGnPtg29Conmbf
         SYnFHhxvh51ZV+bYZGVr9frK+O/4F0MyfjrVLfo+aHGWKxi45mA+zBCV/5O92UyNW8av
         2GvIJdzEE/6TJtNlzVeQNl0UgSSQv9AxzoCvyIgEk9EiE5qOb1Wv9rt2r8cWgH7xvzpN
         vxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784237776; x=1784842576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+mAie+4SRqYB5ehQZsR75LVrdIpVXjXA+qRH2nIqf3c=;
        b=riEoyP1Zc5MH1iBXhcqDF8/wma6Coa7yWG2i8WumO13fNxv6LLahVEf8HHTgj//37K
         +v2ufc1l/lH2Wh4AnaOaD0P/dR9ez9CR8tbJGGL7ij0+CJGFmZyKCNpXSVCMWsd/uZGr
         BQjn9LEMFeCWRFKQGR8GFoHwlYXa1/3dm2zbetNGPHj1bB+qrQo1TFNqddDnYhkkh7Vv
         BecRujLFV8TjpQdvKTU0v3AnwIeuOiJ9u7sm4QkFmIa1foQhNEJQcQvuqEEOGpmuu6Te
         zGPZ8CzQL8n+/zwngy743j329ulN5iFdGXJEwocMYl5RJQ/3vIvwDMUSeWW8E+fiHgWz
         y2Og==
X-Gm-Message-State: AOJu0YzaJj51qm6VgQ1GD44rjDKT8i7ZXfSKBv+tMflNJcMOqIekL4hA
	3kAXpVf8pojX2lq+mCxKBJQ/6qCqM03IBqVO2vnAwHinex9GHaX5rhG8
X-Gm-Gg: AfdE7ckX8k0/SlJtjb4t+fagHnak9xmUCx+QeUJ2/4nxu0KWjvztvZ+pQn3rpte90LO
	LsKwCpp7fReXNw1wMMlYDzby6wXTbupoNwNRqSF+f2cX2+bJt2JB5uw1vkLyIJliz0TnKEVqhKL
	oaT328AWYYMNqXEJVLpZaeN71i/4gEcFpLXiy0vDaCSmM3E27fi4KzRdA0qIC0yqM0zv2SmhExf
	ezeOYgxBdKg7Nn0bwijBGIyoZe6JZE40eAKeU7MYatlILK/vo+HBMA5+OOxmQQkHzIMejELd4IU
	K8UaboXC7arseEj1KiKhaIBaV/hnSRvcxJq+3uawP+t0Sjv3fpMuvTneWgwaEvgYbu34EDYnzhL
	IbqdGHxHuVqriDSrGZxQX1rEz9OIIB6zsL1hvQcrORh9OJ95JEHn8s0qz86PTyBoKnOcu9rZ/+r
	FDJEUQX1UtVwId
X-Received: by 2002:a05:600c:a48:b0:493:b4a3:5ab0 with SMTP id 5b1f17b1804b1-4954288882bmr50519625e9.13.1784237775629;
        Thu, 16 Jul 2026 14:36:15 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464b7f09sm27517548f8f.26.2026.07.16.14.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 14:36:14 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Fri, 17 Jul 2026 00:35:42 +0300
Subject: [PATCH v7 06/13] clk: zte: Add Clock registration infrastructure
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260717-zx29clk-v7-6-408411cfcf36@gmail.com>
References: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
In-Reply-To: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=12642;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=C5xKHsMuzaBYcEFc16GfaBkK5o1oYFjlxMRTNW9V63E=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqWU6xti7TkPF9z6pIDzJfNXj1b/BzbhKQGRF9K
 TeXXhygafaJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCallOsRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiImPA//QyTRrt/qagmCe12CJycWOEDtslxoiz1
 6pGKp/qb+XM2zsb62ozc1nWhpjI19jo3f1WETKCR0ODpKgTJUmBj+lhQ87fQrl9XRDHvEuxXars
 BHUgHY7lCDlcudxmTaoRabCgihzh7JnbOplWKSqBMHrYw010QtSId4T3OxT6HaeiEKwCWDGf5TJ
 vIeeT3mJlfg4et1C8hB3KChIDRz2a/r14L/2gIN8dEvQEYBdjMFA1DFX8expxfOP/7zcfwfnpQS
 fhX6BkRKJTq7YSO+goMcVTeV1BISGzmtuIOTHWwDLy1zXzQ9jSbqe+LdNmGykl3urXnMHBBe99x
 ubtzm2JNmjO3i1GW90eH+aEoBHQ5Jt8z0qLyi8q/WdC93xFOdNqf4jeS31X/TDZh4Dp0ulUpWDC
 OKzcSBZUImz7wWQe2AUlndMhdM1OVHj7DLK7PTffrNUnPuHcdn5xMKfCmcxMRuk6GaV5YgYZOUN
 hi21dgcA5jrNl3A7qDh6INzNoCzaoRe0n/BnjrofyZCYS2oeEJ/EFFD8kGLeALFzaC5xt0WvkWe
 fMhhRQEh11DLGLHEnci0TU3JdGApzyBsvbUZu0R6xBXqaQC2lcOemUhD/oemdD/jGtNYWt3ABjX
 xaCa3dkdD7bLVhMKq8Cu3fRzA+BE/5ct3R1x2mp7BD/OGQyZPyOY=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

The next patches will implement the regmap clocks and PLL driver. The
actual hardware specific clock listing will live in a separate module.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Version 7:
*) Add fixed dividers to handle PLL subdivisions
*) Never register PLLs directly as exported clocks - everything on this
SoC goes through a gate before it leaves a controller.

Version 6:
*) Remove auxdev now that LSP clocks also use MFD
*) Error codepath fixes pointed out by Sashiko.

Version 5:

*) Pass the static clk data instead of calling get_match_data to prepare
for operating as an MFD child.

*) Don't use devm_kzalloc to allocate the auxiliary_device
structure. I guess Sashiko is right, and that's what "Because once the
device is placed on the bus the parent driver can not tell what other
code may have a reference to this data" is trying to dell me.

*) Fix error check for device_node_to_regmap.
---
 MAINTAINERS                  |   1 +
 drivers/clk/Kconfig          |   1 +
 drivers/clk/Makefile         |   1 +
 drivers/clk/zte/Kconfig      |  16 +++++
 drivers/clk/zte/Makefile     |   5 ++
 drivers/clk/zte/clk-regmap.c |  34 ++++++++++
 drivers/clk/zte/clk-zx.c     | 155 +++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/zte/clk-zx.h     |  90 +++++++++++++++++++++++++
 drivers/clk/zte/pll-zx.c     |  16 +++++
 9 files changed, 319 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6ca3312aa746..f88a2eda737a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3884,6 +3884,7 @@ F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	Documentation/devicetree/bindings/phy/zte,zx297520v3-usb-phy.yaml
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	drivers/clk/zte/
 F:	drivers/soc/zte/
 F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 F:	include/dt-bindings/phy/phy-zte-zx297520v3-usb.h
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 1717ce75a907..6f0a863951ca 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -545,6 +545,7 @@ source "drivers/clk/uniphier/Kconfig"
 source "drivers/clk/visconti/Kconfig"
 source "drivers/clk/x86/Kconfig"
 source "drivers/clk/xilinx/Kconfig"
+source "drivers/clk/zte/Kconfig"
 source "drivers/clk/zynqmp/Kconfig"
 
 # Kunit test cases
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index cc108a75a900..13a5478f1112 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -167,5 +167,6 @@ ifeq ($(CONFIG_COMMON_CLK), y)
 obj-$(CONFIG_X86)			+= x86/
 endif
 obj-y					+= xilinx/
+obj-$(CONFIG_COMMON_CLK_ZTE)		+= zte/
 obj-$(CONFIG_ARCH_ZYNQ)			+= zynq/
 obj-$(CONFIG_COMMON_CLK_ZYNQMP)         += zynqmp/
diff --git a/drivers/clk/zte/Kconfig b/drivers/clk/zte/Kconfig
new file mode 100644
index 000000000000..0222549dd211
--- /dev/null
+++ b/drivers/clk/zte/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# ZTE Clock Drivers
+#
+
+config COMMON_CLK_ZTE
+	tristate "Clock driver for ZTE SoCs"
+	depends on ARCH_ZTE || COMPILE_TEST
+	default ARCH_ZTE
+	select MFD_SYSCON
+	help
+	  This option selects common clock infrastructure for ZTE based SoCs.
+	  You will need to enable one or more SoC specific drivers to make use
+	  of this.
+
+	  Enable this if you are building a kernel for a ZTE designed board.
diff --git a/drivers/clk/zte/Makefile b/drivers/clk/zte/Makefile
new file mode 100644
index 000000000000..27db07293165
--- /dev/null
+++ b/drivers/clk/zte/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_COMMON_CLK_ZTE) += clk-zte.o
+
+clk-zte-y += clk-zx.o pll-zx.o clk-regmap.o
diff --git a/drivers/clk/zte/clk-regmap.c b/drivers/clk/zte/clk-regmap.c
new file mode 100644
index 000000000000..984abeb45ab2
--- /dev/null
+++ b/drivers/clk/zte/clk-regmap.c
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2014 MediaTek Inc.
+ * Copyright (c) 2018 BayLibre, SAS.
+ * Copyright (c) 2026 Stefan Dösinger.
+ * Author: Stefan Dösinger <stefandoesinger@gmail.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/regmap.h>
+#include <linux/errno.h>
+
+#include "clk-zx.h"
+
+int zx_clk_register_gates(struct device *dev, struct regmap *regmap,
+			  const struct zx_gate_desc *desc, unsigned int num,
+			  struct clk_hw_onecell_data *clocks)
+{
+	return -ENODEV;
+}
+
+int zx_clk_register_dividers(struct device *dev, struct regmap *regmap,
+			     const struct zx_div_desc *desc, unsigned int num)
+{
+	return -ENODEV;
+}
+
+int zx_clk_register_muxes(struct device *dev, struct regmap *regmap,
+			  const struct zx_mux_desc *desc, unsigned int num,
+			  struct clk_hw_onecell_data *clocks)
+{
+	return -ENODEV;
+}
diff --git a/drivers/clk/zte/clk-zx.c b/drivers/clk/zte/clk-zx.c
new file mode 100644
index 000000000000..db4fad2b4b05
--- /dev/null
+++ b/drivers/clk/zte/clk-zx.c
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/errno.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+
+#include "clk-zx.h"
+
+static int zx_clk_register_fixed_dividers(struct device *dev, struct regmap *regmap,
+					  const struct zx_fixed_divider_desc *desc,
+					  unsigned int num)
+{
+	struct clk_hw *clk;
+	unsigned int i;
+
+	for (i = 0; i < num; ++i) {
+		clk = devm_clk_hw_register_fixed_factor(dev, desc[i].name, desc[i].parent,
+							CLK_SET_RATE_PARENT, 1, desc[i].div);
+		if (IS_ERR(clk)) {
+			return dev_err_probe(dev, PTR_ERR(clk), "Failed to register clk %s\n",
+					     desc[i].name);
+		}
+	}
+
+	return 0;
+}
+
+static void zx_delete_clk_provider(void *data)
+{
+	of_clk_del_provider(data);
+}
+
+static void zx_clk_disable_unprepare_put(void *data)
+{
+	clk_disable_unprepare(data);
+	clk_put(data);
+}
+
+int zx_clk_common_probe(struct device *dev, struct device_node *of_node,
+			const struct zx_clk_data *data)
+{
+	unsigned int public_clk_count = 1, highest_id = 0;
+	struct clk_hw_onecell_data *clocks;
+	struct regmap *map;
+	struct clk *clk;
+	unsigned int i;
+	int res;
+
+	map = device_node_to_regmap(of_node);
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	for (i = 0; i < data->num_muxes; ++i) {
+		if (data->muxes[i].id) {
+			if (data->muxes[i].id > highest_id)
+				highest_id = data->muxes[i].id;
+			public_clk_count++;
+		}
+	}
+	for (i = 0; i < data->num_gates; ++i) {
+		if (data->gates[i].id) {
+			if (data->gates[i].id > highest_id)
+				highest_id = data->gates[i].id;
+			public_clk_count++;
+		}
+	}
+
+	if (WARN_ON(public_clk_count != highest_id + 1))
+		return -EINVAL;
+
+	clocks = devm_kzalloc(dev, struct_size(clocks, hws, public_clk_count), GFP_KERNEL);
+	if (!clocks)
+		return -ENOMEM;
+	clocks->num = public_clk_count;
+
+	for (i = 0; i < data->num_inputs_enable; ++i) {
+		clk = of_clk_get_by_name(of_node, data->inputs_enable[i]);
+		if (IS_ERR(clk)) {
+			return dev_err_probe(dev, PTR_ERR(clk), "Input clk %s failure\n",
+					     data->inputs_enable[i]);
+		}
+
+		res = clk_prepare_enable(clk);
+		if (res) {
+			clk_put(clk);
+			return dev_err_probe(dev, res, "Input clk %s enable failure\n",
+					     data->inputs_enable[i]);
+		}
+		res = devm_add_action_or_reset(dev, zx_clk_disable_unprepare_put, clk);
+		if (res)
+			return res;
+	}
+	for (i = 0; i < data->num_inputs; ++i) {
+		/* FIXME: devm_get_clk_from_child doesn't do any tree traversal, so it works here
+		 * whether "of_node" belongs to "dev" or a parent of "dev". Is it supposed to be
+		 * used that way though?
+		 */
+		clk = devm_get_clk_from_child(dev, of_node, data->inputs[i]);
+		if (IS_ERR(clk)) {
+			return dev_err_probe(dev, PTR_ERR(clk), "Input clk %s failure\n",
+					     data->inputs[i]);
+		}
+	}
+
+	if (data->init) {
+		res = data->init(map);
+		if (res)
+			return dev_err_probe(dev, PTR_ERR(clk), "Controller init failure\n");
+	}
+
+	res = zx_clk_register_plls(dev, map, data->plls, data->num_plls);
+	if (res)
+		return res;
+
+	res = zx_clk_register_fixed_dividers(dev, map, data->fixed_divs, data->num_fixed_divs);
+	if (res)
+		return res;
+
+	res = zx_clk_register_muxes(dev, map, data->muxes, data->num_muxes, clocks);
+	if (res)
+		return res;
+
+	res = zx_clk_register_dividers(dev, map, data->divs, data->num_divs);
+	if (res)
+		return res;
+
+	res = zx_clk_register_gates(dev, map, data->gates, data->num_gates, clocks);
+	if (res)
+		return res;
+
+	/* This is to catch holes in the tables rather than registration errors. The count vs
+	 * highest ID should catch most static issues. This check here will trigger if an ID is
+	 * reused by accident.
+	 */
+	for (i = 1; i < public_clk_count; i++) {
+		if (WARN(!clocks->hws[i], "Clock %u not registered\n", i))
+			return -EINVAL;
+	}
+
+	res = of_clk_add_hw_provider(of_node, of_clk_hw_onecell_get, clocks);
+	if (res)
+		return res;
+	return devm_add_action_or_reset(dev, zx_delete_clk_provider, of_node);
+}
+EXPORT_SYMBOL_NS_GPL(zx_clk_common_probe, "ZTE_CLK");
+
+MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
+MODULE_DESCRIPTION("ZTE common clock driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/zte/clk-zx.h b/drivers/clk/zte/clk-zx.h
new file mode 100644
index 000000000000..b30e4a29d951
--- /dev/null
+++ b/drivers/clk/zte/clk-zx.h
@@ -0,0 +1,90 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+
+#ifndef __DRV_CLK_ZX_H
+#define __DRV_CLK_ZX_H
+
+#include <linux/platform_device.h>
+#include <linux/clk-provider.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+#define ZX297520V3_PLL_PREPARE_IS_ENABLE	1
+
+/* PLLs, divs and fixed div/factor clocks are never exported directly, only
+ * through a gate.
+ */
+
+struct zx_pll_desc {
+	const char *name;
+	const char * const *parents;
+	unsigned int num_parents;
+	unsigned long rate;
+	u16 reg;
+	u16 flags;
+};
+
+struct zx_fixed_divider_desc {
+	const char	*name;
+	const char	*parent;
+	unsigned int	div;
+};
+
+struct zx_mux_desc {
+	unsigned int id;
+	const char *name;
+	const char * const *parents;
+	unsigned int num_parents;
+	u16 reg;
+	u8 shift, size;
+};
+
+struct zx_div_desc {
+	const char *name, *parent;
+	u16 reg;
+	u8 shift, size;
+};
+
+struct zx_gate_desc {
+	unsigned int id;
+	const char *name, *parent;
+	unsigned long flags;
+	u16 reg;
+	u8 shift;
+};
+
+int zx_clk_register_plls(struct device *dev, struct regmap *regmap,
+			 const struct zx_pll_desc *desc, unsigned int num);
+int zx_clk_register_muxes(struct device *dev, struct regmap *regmap,
+			  const struct zx_mux_desc *desc, unsigned int num,
+			  struct clk_hw_onecell_data *clocks);
+int zx_clk_register_dividers(struct device *dev, struct regmap *regmap,
+			     const struct zx_div_desc *desc, unsigned int num);
+int zx_clk_register_gates(struct device *dev, struct regmap *regmap,
+			  const struct zx_gate_desc *desc, unsigned int num,
+			  struct clk_hw_onecell_data *clocks);
+
+struct zx_clk_data {
+	int (*init)(struct regmap *map);
+	const char * const *inputs_enable;
+	unsigned int num_inputs_enable;
+	const char * const *inputs;
+	unsigned int num_inputs;
+	const struct zx_pll_desc *plls;
+	unsigned int num_plls;
+	const struct zx_fixed_divider_desc *fixed_divs;
+	unsigned int num_fixed_divs;
+	const struct zx_mux_desc *muxes;
+	unsigned int num_muxes;
+	const struct zx_div_desc *divs;
+	unsigned int num_divs;
+	const struct zx_gate_desc *gates;
+	unsigned int num_gates;
+};
+
+int zx_clk_common_probe(struct device *dev, struct device_node *of_node,
+			const struct zx_clk_data *data);
+
+#endif /* __DRV_CLK_ZX_H */
diff --git a/drivers/clk/zte/pll-zx.c b/drivers/clk/zte/pll-zx.c
new file mode 100644
index 000000000000..f8ddb4c7dff6
--- /dev/null
+++ b/drivers/clk/zte/pll-zx.c
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/regmap.h>
+#include <linux/errno.h>
+
+#include "clk-zx.h"
+
+int zx_clk_register_plls(struct device *dev, struct regmap *regmap,
+			 const struct zx_pll_desc *desc, unsigned int num)
+{
+	return -ENODEV;
+}

-- 
2.54.0

