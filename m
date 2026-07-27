Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C0242BE99
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 18:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785176742; cv=none; b=RumTfzxtGZDNjx9QuDAxhKznQ6R/Jx4Edo76uYsa7bBlgX0o/OVMj5TBBwkB9gFRfr5LTPQZMJPipuXgRzqaTEOSVlcotG11CnMpjl3RsYlxGIVnBKP+Un1oI50lkVMM67t4AaCy3++lRezKfMYx4lZsLrYJnFOWcYIEiqfZORw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785176742; c=relaxed/simple;
	bh=LdURn+0+X4zQSUbKVQI5rsVyMbNlyVDEY+4OIxxFeGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hTlvWaZhw7p1RNmYjP4Ji+Iu3MdvcKBNl4MiCD2lx5z+wUoYaEOid0ZfAag4GQ6VetewKrlzjuju7OKkpHAGRt9HgLTUaENcWbocvX+qQ4ac34Yb2Tx7KoacEF3ojN5fnoE4oF1ok4/vvYZlLTVfQyZOaxL3snz8RyCpcLl9niQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTtxT3Jh; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTtxT3Jh"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so33101155e9.2
        for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 11:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785176738; x=1785781538; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=59T+5oIoVV5cC9KVefDSTa1QHW8dszxBs6MHy+fS1AY=;
        b=XTtxT3JhUMhdyC1EL3+xPwwI6ds4sprbSmmuQ5EMfnbVdkmzZiViAc5mcsvakyBjmt
         UNplidzQw0VFKzDQOgPJ2oJqixEH+b9wWuoi70T7/x6NqRfFRbYRn2K2qTW2XEva3SiE
         OyoKrewYuaKtUf/xh3MZxH9l5tgjVDL2hnZxtj6IXB+NCzD5kBLVQYiTwtY+zQjTkVXf
         ASB0xLifDvQp8Qc5Lx4KVF2CE0sEUxHHZv3oIY7rrDxeP/uVL6eWCa+vLWcojjW2mwiw
         AUFsaBcCMcWaJMeGs+elYnvaUP4oJHjAXhRGpzi+dfXgPiwh7JkjQ+bi9jKs7FtLik7y
         hN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785176738; x=1785781538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=59T+5oIoVV5cC9KVefDSTa1QHW8dszxBs6MHy+fS1AY=;
        b=dGIq9TFtA/aXK1HqZ8BRFNDLmJlrsWnkAgMDcCHS8LOvOrGCpZksKZ7QZE+kp3QLFg
         AbmTNvSKdIY4ZglvRPETZbPDMjZej7F5VYpXIXz2h9XlyKYzsbcvfIq826BVLSChy2Hd
         SJ3zAJTMJNECOKfRFrqZ+Yy5srI3tT/z2Vu82H4k62dvzMDfdtrrwGjRQSp22/kBs6Xt
         JbcDz5vFykJ1um5RcnGqqURp2Cb97f6CqSIH9C6zugFbQCIL8WMQm1sF+X+mnsGLetXt
         8xXUTDdMACASle/Du2Gdj4tcIrw31DJc/SddKiS0m345D2UDPiktVVomt7X4Ydnfk7tV
         RVHg==
X-Gm-Message-State: AOJu0YzrS04ObAu6oNXmty33vSgY9xRVR9OdrxO3jBRI2fxN7NlZmap9
	YbucB6ALqzZnMk7+8WBQtCI4A5jbxKUYiLruq2X+8Ys5eLOhEfcOM+uU
X-Gm-Gg: AR+sD13KJDdzGey2xgEoK+bCHL9GpYpI8tSOXP4nuf+YbxCyT6HQtzSifTCvvFCctfJ
	Yxnt1EGcTRqzEX0WOPVFARWYXULv7Bb95A2f2UomO3RpEd6lewtcTxeeoVVCf+Wy0FoIwN7TbFV
	r7gSq0c2vzeruglNiwxV+3dqF/Wla4nA2BlA0Y63D/F0Sf//MoGjL/L192cTeJb6qzGgNdov1UP
	q72+MmoUIfkpyZrgqk4FPk/9tkj3IJGDww6rGhbLsaEDgIgzeYma+tg9r44PIbxf+BXQA+cxMkz
	jg67rDm3zt03+qPursg4tMjL3nVlmSbOG/VCIbxiXHLd5goP25K8tC6nhNUzo64nE7SyC9sw3FE
	a2ZNamLFyc0E4vrhUMC6pnyGBT7zmUYrxBRqCXcFaQAj1XMwHhnqCFKXGtD32A7IAVNC2mDMzdG
	R/sxgpj3jkxg36J75zruiAkf3GluEXWTAGrQ==
X-Received: by 2002:a05:6000:2089:b0:47f:8b05:f65c with SMTP id ffacd0b85a97d-47f9feaa4b3mr11541606f8f.59.1785176737447;
        Mon, 27 Jul 2026 11:25:37 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c53052sm50689288f8f.18.2026.07.27.11.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:25:36 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Mon, 27 Jul 2026 21:24:20 +0300
Subject: [PATCH v8 05/12] clk: zte: Add Clock registration infrastructure
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260727-zx29clk-v8-5-7a107b00f1dd@gmail.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
In-Reply-To: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=13092;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=LdURn+0+X4zQSUbKVQI5rsVyMbNlyVDEY+4OIxxFeGc=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqZ6J6w7rG0EkHt2YJ6nLKWtrFwkgWHD+TJZhcU
 6fnQs4u6aWJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCameiehsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJsDw//QVIuTYwR3iKEHztUmxk1isMcXBfxIRF
 u3+PHQQmH5ZEz2pYQEVJl4643uwD/OlkMAuXhIWy4SRHoRL4EvAcjqIewcs5YKqw1ogVVKY7i7c
 DgxnSOCTS87IzG1W74woh9AMvzOxrczfFUky1HheoZul/Iv9jqM2iTCxijkZQvqt7v6zqBsAt1+
 Bb9YK/j/NavX+1p1LkkuehjSubbhCGV0cPKwrUDuJXipYLIdRYk3ucOlhOPzo8TOIoaXNV5YNTG
 Z/9DQo6/MDdjCkZkytKVzoEMHNX1U33jRqeKi/dwG6y9V9VYG7NHak3Vzo7jgcQapTGiNyslRwO
 o30Bvlcy91DjktCcH06qWUQh7qHphDBCZSk5sUtw14SIZnB+lmkifKXR2dxxpcXoGmfBNlSs0Gs
 LS4UhS8tIUn329WLCn9Y6dPZGscwA6cQyhhXMA6lhwbKWexPSQ0Q3iI1YOoWBRzrFcyxq8Zc4tm
 1iCM7yY+4YQFRaEfx5BvyA3O7YC8w8MOb10R+rA0JfuvCmrIRVjWhEO+u7kQJRvYKkEA2v5bHOF
 f2cZLMBNMSRJEuOYzfxPz93f56xrj+RfS4mCUs2Q6b4vOgnMTrhk4KKSpBcFo3uH1CJUAz7zM4g
 9eAnrAAHACADV3Xb1RTgKGJn+B/yhpd0Vpkq10H1dsAYMljrdchQ=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

The next patches will implement the regmap clocks and PLL driver. The
actual hardware specific clock listing will live in a separate module.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Version 8:
Use ZX297520V3_CLK_NO_EXPORT=(~0u) for unexported clocks. While using 0,
and starting clock indices at 1, is a common pattern in existing
drivers, it exposes a driver implementation detail in the hardware
binding interface.

If desired, I can change the special index to a separate field in the
structs.

Fix the return value if the ->init() callback fails. (Sashiko)

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
code may have a reference to this data" is trying to tell me.

*) Fix error check for device_node_to_regmap.
---
 MAINTAINERS                  |   1 +
 drivers/clk/Kconfig          |   1 +
 drivers/clk/Makefile         |   1 +
 drivers/clk/zte/Kconfig      |  16 +++++
 drivers/clk/zte/Makefile     |   5 ++
 drivers/clk/zte/clk-regmap.c |  34 ++++++++++
 drivers/clk/zte/clk-zx.c     | 155 +++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/zte/clk-zx.h     |  91 +++++++++++++++++++++++++
 drivers/clk/zte/pll-zx.c     |  16 +++++
 9 files changed, 320 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b04e9d43cfb0..692f005cb2c4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3883,6 +3883,7 @@ F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	drivers/clk/zte/
 F:	drivers/mfd/zte-zx297520v3-crm.c
 F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 F:	include/dt-bindings/phy/zte,zx297520v3-topcrm.h
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
index 000000000000..c9e9048d3ade
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
+	unsigned int public_clk_count = 0, highest_id = 0;
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
+		if (data->muxes[i].id != ZX297520V3_CLK_NO_EXPORT) {
+			if (data->muxes[i].id > highest_id)
+				highest_id = data->muxes[i].id;
+			public_clk_count++;
+		}
+	}
+	for (i = 0; i < data->num_gates; ++i) {
+		if (data->gates[i].id != ZX297520V3_CLK_NO_EXPORT) {
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
+			return res;
+	}
+
+	res = zx_clk_register_fixed_dividers(dev, map, data->fixed_divs, data->num_fixed_divs);
+	if (res)
+		return res;
+
+	res = zx_clk_register_plls(dev, map, data->plls, data->num_plls);
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
+	for (i = 0; i < public_clk_count; i++) {
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
index 000000000000..90450da95941
--- /dev/null
+++ b/drivers/clk/zte/clk-zx.h
@@ -0,0 +1,91 @@
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
+#define ZX297520V3_CLK_NO_EXPORT		(~0u)
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

