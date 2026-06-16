Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C1E391507
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 20:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781641630; cv=none; b=f4sxI4FQn/6sfW63r/4JF+J2jQdWOiI7VWlY+48fsYMjwd34SHx+56f3hHuX65hxWvfwf5aOa0L/kc/x9JtUmy+59SS/fCJTRiOm8yDNLDD2mJLVUu4jubTa+0Xf+NMW23CyXrmB4XEDEASbyfJ2bSqOELGKBW47FWT09E+JFD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781641630; c=relaxed/simple;
	bh=qum6l8+tCrrqR02yHwh3t4yH0w6TRVXfiZs3oZFSBbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=deubdyUbqu6esR6vKet3ILg/6XS3LrFzF4ms0CU5L2suHRpePHVZa0iow/8K6z+PzmfZ8x7KvQ+o1Rkzi5qE4FoJPCs9bzVhpkt3iLL/ElyCxTrTbByrLwiGVoAESuc16262otCFzdW1LuTgvlK5RbZW0b1WPGG5huVyKaDePT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rQNMKkw8; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rQNMKkw8"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-491609cdd8fso26559785e9.2
        for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 13:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781641627; x=1782246427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXBv0LTahcDV/Iaq6s1n4lHcOX1JeaCaC/1W6Jb31AA=;
        b=rQNMKkw85CF3QiFCl9TOwTXKjzHrxC4qKkg/vnxdEhzgBUhTsOI1ddtzKNh75P6xMN
         OZL91FL5+doMeTe+aL2at1TbkGv9uhugj73qGdwryVgj/Wn8kW/yBlkH4FwlqcvsGCTy
         pKd9fAAVmYBMFdViiWUgBZh0Vgxenrd9vnoCUqVENALbbgO4g2epJMwSqhC0ts5rcmXk
         DVWcL70CoVjEXY08QpKhukagFDPZmVkGisowfM6Czg7UsdgcCvufyldEDnKtKK+kdvBi
         /TytnNsaxcHMPyTal9ekgKqJm8CQk3q6aCehJIyGqcVY8DPmWBixLu6n8vA1Fm6SQNeH
         Nj7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781641627; x=1782246427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NXBv0LTahcDV/Iaq6s1n4lHcOX1JeaCaC/1W6Jb31AA=;
        b=EhjDfLb+kaH+0lE6IR1/DoOeDLWFny0DDpqEBDr6kg7WUHTSESffzts/ektmcc4VF0
         cZE3qmY8r/Nc0RasYkD3kIniAL43YernrYFsMH320QlF4vIErlNef55pfBgSNdh+PASI
         s2ImxAFGkLOAYkMHdL8LV5CjrdEhHQ6MULFeaD1rmA8gutmLH2l+6Mj0+6Sw4TNLzCFo
         RRvSasEzNj3bDGe00g29OXFwhGS78V1lMwuayeJIQOOEE/lBQIUPIaD0wjixCFsDALGk
         aHHWNojO+KWa2WEd3574AncL/ChH1m61L3p2MiXA8mug3DIzPWg0n+rKh3U+qn3mb6kC
         X4jg==
X-Gm-Message-State: AOJu0Yy4+zwny1iMN4dXMiGIMVjpgTtNjinJW4eIVQ9BgRcZa9RRxCcQ
	iwGlTn8AyUEFUi7vQxhbFv5PP4kvJ8PGjbBPTnTmB8UemLB8ub0DjY7F
X-Gm-Gg: Acq92OHfIll+nTRbU0cpJKQO/f7bp7x8jAZh7PMZC8m60yhMiiK6qEiIvt/csyn8Zg7
	I8OAZ/yoKRZFeCH7oWJWXE+mtQPPCOof0vXPnkZdZ0drwNsHL/fJRq4WZOuhQdUTPBFwCQoJ3Sj
	YjYqhtCoQIcf+f7Br+zOpfrO4EPDdi0dkvMjPBJTWorLNUwOC+3flRYWo0mLM5d2ZMXXNR+2S6t
	prNRTLDQWxkBUIJQo/uohDWsF9VuOndwI5f9T/yMXDCJuub8ccnxkGbBUgXw4T94/coVYbzLSTo
	Hp/Jc8o/TaaTQ+y30qBpr8Au6zfCAwIE7cRw0DkqDpr4jrlAPv8GFjwgf7EqohWYLSegmIUR+Rl
	/yB52bAN04duvjZ/f4BkgUbwr3w25mFnvVHAX8snmzJwGrX3FayN8hQUR4LQkaZIT96p8otXai9
	mWTb4LEV/G/eRFk8LGsyvDOqMp3e/D7Paj1A==
X-Received: by 2002:a05:600c:a104:b0:490:958f:2a5e with SMTP id 5b1f17b1804b1-492333ab197mr15140435e9.13.1781641626827;
        Tue, 16 Jun 2026 13:27:06 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm89987005e9.3.2026.06.16.13.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:27:06 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Tue, 16 Jun 2026 23:26:24 +0300
Subject: [PATCH RFC v4 04/12] clk: zte: Add Clock registration
 infrastructure.
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260616-zx29clk-v4-4-ca994bd22e9d@gmail.com>
References: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
In-Reply-To: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=11496;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=qum6l8+tCrrqR02yHwh3t4yH0w6TRVXfiZs3oZFSBbY=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqMbGGvZqzCIpbWjYc5d7M1aNl2DjTTdzYR2Kq2
 ig8adoeMGKJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCajGxhhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKEKBAAoyvFxBhwoWKuc9d5nb7HQWGArjoDaAy
 98GoacliWT6n/v5nS8F9r5cRNcr9UL/inhK80tv3dMtprYK4SWA9QHbIPlbGOWx9riFjf157yYj
 hnK5ynhEbEO3KmzasZAboD92Ee3cgljkUNXGw/Am9C9Ray7lO3GunuFgyGuE3bf2l8efMkJQz04
 1dj0yJ0c6PzM8+7kFLS+SDrKUfGcR+fwFg2ej1eni8vUCBfdEYLLyCVKpiiqN1e2FeOzPhIUnIy
 T2Sr5ro82ik4vmkiaQM9F+iVdaiBQAi2V+5ouCL0DK/9oiMkWT0RZjl7LiFfv/IYZBaJMomjJ/2
 OUQ+pSsl9n3O9PYcSVmCFaiN6T5ddKAcgT3tw6/r7dMZjrCe83zZzjVYaxg1p5JhwLuBSuhEowr
 XdtZfykGXdKmPICd7mSUXS1eK1Mr2zvqHyWZXfRqzgBmxru0YCuF3gNB+JbYckTjVt5yqQBRXB1
 9HMRge3gJ82G2Qqn5D1lJLqxvMUHpC8B7MizSeTU4FRj5Os4nTlZ/BJ6+4d1vP7BEP5hIoBIM5z
 au+2P4sBmZCoPaR+2WbKtRleLuiZ8hNk4hwAbYGdSqb/cSY2xtvf/XziAlAxqmCS8wufNexys4w
 bomTXjdrfQhL+1lwANc3j/hUGSP1+3JpQMz2bWeOzsIGtM/I1QvU=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

The next patches will implement the regmap clocks and PLL driver. The
actual hardware specific clock listing will live in a separate module.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 MAINTAINERS                  |   1 +
 drivers/clk/Kconfig          |   1 +
 drivers/clk/Makefile         |   1 +
 drivers/clk/zte/Kconfig      |  17 +++++
 drivers/clk/zte/Makefile     |   5 ++
 drivers/clk/zte/clk-regmap.c |  30 +++++++++
 drivers/clk/zte/clk-zx.c     | 157 +++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/zte/clk-zx.h     |  79 ++++++++++++++++++++++
 drivers/clk/zte/pll-zx.c     |  19 ++++++
 9 files changed, 310 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0cc1ede3c80c..f1f0459b2c72 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3870,6 +3870,7 @@ F:	Documentation/devicetree/bindings/arm/zte.yaml
 F:	Documentation/devicetree/zte,zx297520v3-*
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	drivers/clk/zte/
 F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 
 ARM/ZYNQ ARCHITECTURE
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
index 000000000000..b7b65a2172a9
--- /dev/null
+++ b/drivers/clk/zte/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# ZTE Clock Drivers
+#
+
+config COMMON_CLK_ZTE
+	tristate "Clock driver for ZTE SoCs"
+	depends on ARCH_ZTE || COMPILE_TEST
+	default ARCH_ZTE
+	select AUXILIARY_BUS
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
index 000000000000..7908f1562f63
--- /dev/null
+++ b/drivers/clk/zte/clk-regmap.c
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2014 MediaTek Inc.
+ * Copyright (c) 2018 BayLibre, SAS.
+ * Copyright (c) 2026 Stefan Dösinger.
+ * Author: Stefan Dösinger <stefandoesinger@gmail.com>
+ */
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
+			     const struct zx_div_desc *desc, unsigned int num,
+			     struct clk_hw_onecell_data *clocks)
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
index 000000000000..6e21c4a82a46
--- /dev/null
+++ b/drivers/clk/zte/clk-zx.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+
+#include <linux/platform_device.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/clk-provider.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+
+#include "clk-zx.h"
+
+static void zx_adev_release(struct device *dev)
+{
+	dev_info(dev, "Aux device released.\n");
+}
+
+static void zx_adev_unregister(void *data)
+{
+	struct auxiliary_device *adev = data;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+int zx_clk_probe(struct platform_device *pdev)
+{
+	unsigned int public_clk_count = 1, highest_id = 0;
+	struct clk_hw_onecell_data *clocks;
+	struct device *dev = &pdev->dev;
+	const struct zx_clk_data *data;
+	struct auxiliary_device *adev;
+	struct regmap *map;
+	struct clk *clk;
+	unsigned int i;
+	int res;
+
+	data = device_get_match_data(dev);
+	if (!data)
+		return -EINVAL;
+
+	map = device_node_to_regmap(dev->of_node);
+	if (!map)
+		return -EINVAL;
+
+	for (i = 0; i < data->num_plls; ++i) {
+		if (data->plls[i].id) {
+			unsigned int last_idx = data->plls[i].id + data->plls[i].num_postdivs - 1;
+
+			if (last_idx > highest_id)
+				highest_id = last_idx;
+			public_clk_count += data->plls[i].num_postdivs;
+		}
+	}
+	for (i = 0; i < data->num_muxes; ++i) {
+		if (data->muxes[i].id) {
+			if (data->muxes[i].id > highest_id)
+				highest_id = data->muxes[i].id;
+			public_clk_count++;
+		}
+	}
+	for (i = 0; i < data->num_divs; ++i) {
+		if (data->divs[i].id) {
+			if (data->divs[i].id > highest_id)
+				highest_id = data->divs[i].id;
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
+		clk = devm_clk_get_enabled(dev, data->inputs_enable[i]);
+		if (IS_ERR(clk)) {
+			return dev_err_probe(dev, PTR_ERR(clk), "Input clk %s failure\n",
+					     data->inputs_enable[i]);
+		}
+	}
+	for (i = 0; i < data->num_inputs; ++i) {
+		clk = devm_clk_get(dev, data->inputs[i]);
+		if (IS_ERR(clk)) {
+			return dev_err_probe(dev, PTR_ERR(clk), "Input clk %s failure\n",
+					     data->inputs[i]);
+		}
+	}
+
+	res = zx_clk_register_plls(dev, map, data->plls, data->num_plls, clocks);
+	if (res)
+		return res;
+
+	res = zx_clk_register_muxes(dev, map, data->muxes, data->num_muxes, clocks);
+	if (res)
+		return res;
+
+	res = zx_clk_register_dividers(dev, map, data->divs, data->num_divs, clocks);
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
+	res = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clocks);
+	if (res)
+		return res;
+
+	adev = devm_kzalloc(dev, sizeof(*adev), GFP_KERNEL);
+	if (!adev)
+		return -ENOMEM;
+
+	adev->name = data->reset_auxdev_name;
+	adev->dev.parent = dev;
+	adev->dev.release = zx_adev_release;
+	adev->dev.of_node = dev->of_node;
+
+	res = auxiliary_device_init(adev);
+	if (res)
+		return dev_err_probe(dev, res, "Failed to init aux dev %s\n", adev->name);
+
+	res = auxiliary_device_add(adev);
+	if (res) {
+		auxiliary_device_uninit(adev);
+		return dev_err_probe(dev, res, "Failed to add aux dev %s\n", adev->name);
+	}
+
+	return devm_add_action_or_reset(dev, zx_adev_unregister, adev);
+}
+EXPORT_SYMBOL_NS_GPL(zx_clk_probe, "ZTE_CLK");
+
+MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
+MODULE_DESCRIPTION("ZTE common clock driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/zte/clk-zx.h b/drivers/clk/zte/clk-zx.h
new file mode 100644
index 000000000000..b39bbed2d420
--- /dev/null
+++ b/drivers/clk/zte/clk-zx.h
@@ -0,0 +1,79 @@
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
+
+struct zx_pll_desc {
+	unsigned int id;
+	const char *name;
+	const char * const *parents;
+	unsigned int num_parents;
+	unsigned long rate;
+	const unsigned int *postdivs;
+	unsigned int num_postdivs;
+	u16 reg;
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
+	unsigned int id;
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
+			 const struct zx_pll_desc *desc, unsigned int num,
+			 struct clk_hw_onecell_data *clocks);
+int zx_clk_register_muxes(struct device *dev, struct regmap *regmap,
+			  const struct zx_mux_desc *desc, unsigned int num,
+			  struct clk_hw_onecell_data *clocks);
+int zx_clk_register_dividers(struct device *dev, struct regmap *regmap,
+			     const struct zx_div_desc *desc, unsigned int num,
+			     struct clk_hw_onecell_data *clocks);
+int zx_clk_register_gates(struct device *dev, struct regmap *regmap,
+			  const struct zx_gate_desc *desc, unsigned int num,
+			  struct clk_hw_onecell_data *clocks);
+
+struct zx_clk_data {
+	const char * const *inputs_enable;
+	unsigned int num_inputs_enable;
+	const char * const *inputs;
+	unsigned int num_inputs;
+	const struct zx_pll_desc *plls;
+	unsigned int num_plls;
+	const struct zx_mux_desc *muxes;
+	unsigned int num_muxes;
+	const struct zx_div_desc *divs;
+	unsigned int num_divs;
+	const struct zx_gate_desc *gates;
+	unsigned int num_gates;
+	const char *reset_auxdev_name;
+};
+
+int zx_clk_probe(struct platform_device *pdev);
+
+#endif /* __DRV_CLK_ZX_H */
diff --git a/drivers/clk/zte/pll-zx.c b/drivers/clk/zte/pll-zx.c
new file mode 100644
index 000000000000..c0475d5441fb
--- /dev/null
+++ b/drivers/clk/zte/pll-zx.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+#include <linux/clk-provider.h>
+#include <linux/rational.h>
+#include <linux/device.h>
+#include <linux/regmap.h>
+#include <linux/units.h>
+#include <linux/clk.h>
+
+#include "clk-zx.h"
+
+int zx_clk_register_plls(struct device *dev, struct regmap *regmap,
+			 const struct zx_pll_desc *desc, unsigned int num,
+			 struct clk_hw_onecell_data *clocks)
+{
+	return -ENODEV;
+}

-- 
2.53.0

