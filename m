Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA1E3A9D84
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 20:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783024130; cv=none; b=V0MFnEUzaTbbtiVxYCokXfvvy9Vh2Rw/3x5ZqCGmx8SM7JjubDWdE48JcRBJpFCKW4MdWwGJvoA2y3sPZhJdtHHBROhO5srGhBuFTndFlf3uy0gFW0niz/GDy1+xPecmqbb4GJi7pzZHZI632Yhb6P68uxbQgtNGAWkMfirpC0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783024130; c=relaxed/simple;
	bh=nD4pdAjQRFx12q99yc0dvHRGI29k5S6vxp88vHzvDuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OqVLAgmMDhRjMaG5/BZYMgdHjl6oHXbSnCFbD+b+jVyzpn82PzScmpbgiVcvjgC3Q05zfMAzVQQhIUtjocPP7GVD704BuZswykvBEFR0d//dOb32BalqFLTYii8OObS0Nig1y29LLvSGaRm9kmWVtz2bZ7gjpRBsVxbjBcGHJHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UchRg9Bt; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UchRg9Bt"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so15727175e9.1
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 13:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783024127; x=1783628927; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tsfCXzmlFFAtUda42ACCVl9QcJBbK9RzBZ2SreyufmI=;
        b=UchRg9BthyJFqBWSNIoCGnuyW1RosLfEKfYYWaVa1LwHtS0xfqgQwedtveUtjGRS+W
         dTmdnfqdekVqvIVmusC1xh9oKl2Zi5X+Aa05J7zWxURDYsn0SkRF9vz9YJLU5zmN1GqR
         BzpkhXW5V57E1EXpTyuu8SdULt+QK662jtIULZP6aZYph5yF1Y8KwCOWmNOx63Kn/83W
         JQ/WUGP7RBFJELgwkHMOf0ghWi1q6hwHfQZNlUO77bvXrtFHtpLmrmWUOgbyqtUwMUE6
         Ng3A7ZrxdSFPvoI+ycyj6poU/trm4m7IcIZL052QRb3KSrvxM4fOc/FkS4SSgTG01xt2
         OitA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783024127; x=1783628927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tsfCXzmlFFAtUda42ACCVl9QcJBbK9RzBZ2SreyufmI=;
        b=tSTR2dtK3efjgqCBSPMS1S8wI2JkzD+iLxKAjnHN3l8lwr38w3XVlrZ2rAnfGajAtY
         ASUifq1NVTplYDOccpJceZ7xkZuqkBy+wAOdtwIN2RMadXKv8/53W0l7OnWXKrrwTqRf
         giYczDe86j3MBxPghj5vs8aoSwz38heyNw1n/WgXAkdOez/bjsUph6SwXoxSKTfmiCJA
         3FZmJrdfHGuux3Fx/Mf3KrSaNwCkpRffU7NOPChbf07CNMlF65csKePH4vrijFmm8F96
         LTp4TONkqKTKbtUlfV+LeDmVkl7BTUCNARyFsffbPIfQ9S814WEQW7Xx80nef4Dhh5DT
         sM4A==
X-Gm-Message-State: AOJu0YyWEaM/os8X18pzfcMS3OAlOlLzxVMa352fhlQJdf7209XmmQ8h
	ZFzuU3AMTSlpXoMtRuGEPDyto5ElzMrainDp5M/3Y37kZNvxcC8tKEJM
X-Gm-Gg: AfdE7clvZ5vJl3FTVhe4clY7nUEYj5zDbNNsCQdokK5rpXuFu8YqIzZGtcL+e8WogD/
	oSoFF3UiTdXkUYIr/OIyCOpHiflxhz9NN4h+Pu7gSM/RpPXNl7GnIKm3ZT1EXw4M70dEiRKkGSD
	GSbCgNiGdaytZOfCJL89SahO6+L2NHyen6zWtsCarsadspg6431Che2nGoMBzjrDhet876v5egk
	sQLpjKx0Rw2tPzNjp/HC5FpCS5buoz3Qr4Effsd9Bc1CNgTg0Lu8g85OWWq6AGbb6pkir5U92I+
	i9LSu6/AaqfeGG2C4MIvbLGxHtmaPW3UgqiC5hzSkbVPOWOOm591kSaAwlzYlXRxxxNoM1LqKL+
	wppQVuH2gxg9R/ea+fL+OoKTqraehhlt/kl62YpLWt9jQrV/CJleFXcp1ipzrVwkeAxEBU682Fm
	cP1BARID/89i2y/UJGjUVNvd8=
X-Received: by 2002:a05:600d:108:10b0:493:c337:db19 with SMTP id 5b1f17b1804b1-493c3cdf959mr80608715e9.17.1783024126599;
        Thu, 02 Jul 2026 13:28:46 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6369488sm80321145e9.9.2026.07.02.13.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 13:28:46 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Thu, 02 Jul 2026 23:28:00 +0300
Subject: [PATCH v6 05/12] clk: zte: Add Clock registration infrastructure.
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260702-zx29clk-v6-5-377b704f80c4@gmail.com>
References: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
In-Reply-To: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=11991;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=nD4pdAjQRFx12q99yc0dvHRGI29k5S6vxp88vHzvDuE=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqRsnpTTDTbcGy4QQA/hQMHoRjq2xP6RQkThZRA
 6GR+7jf0BqJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCakbJ6RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJ50A//ZpufSxdDDyuF6wU21b7fNI8lDeBJGgt
 hEb8q4fTLcS0K8kJKidCY/aGVLv/yt0K1kVLlwh8/ZUVscf+lYFoIdzSOFiDuF2TPU5s8frumyb
 +GviRnWxvT/oXiAIxq/AjNsBZDthsdN7yaT4lldS9xYZczFcSPAkstNdMKxqia8xnlisnsIhdNf
 IMl7lLNR+u2WqO3wuodBeIMcgEtXKlRZx7O+vzmlkg4HGOt26M8W/+2axLmAnw7i1h4c7NpklNG
 35yyzUrvCEN++afxuQq3lIIJt8XWccx+5AQB2oVFlS0AB6kpsNmIw777QxquzFe6G8SrmThrbkS
 dCFvBhUINx1C/Jt2y9zOGOlVdRaePkf9wOA6VXKPtHr73vxn7937s/5plq46eq3BTtuzCmVb+RF
 ffTRgE8mIzWGdTOQmxhFPGiaRsID/LPhq669OvO8pARiYrE8wr61GDlx/bGzhcm2DYtZr1/hvfd
 +ahVlZO6Enp8SVIPG9lFCq6H5mMRSTY+nf+FOcwsXRPSbrfFu33iotjEfjr8ZdwYN0ZjasbOhqS
 e7N+sa+5G0cw2fX1ZnP2wWaPvHRqOAT5NGuL50kPRthfPsLCmcWWr7hk+G+CVqQEqtspFK11UA9
 tStCM8oX//cKK+E36WZ9ldRd8n8LnoMLYknyHJfAUuFLqPSujECU=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

The next patches will implement the regmap clocks and PLL driver. The
actual hardware specific clock listing will live in a separate module.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

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
 drivers/clk/zte/clk-regmap.c |  35 +++++++++++
 drivers/clk/zte/clk-zx.c     | 142 +++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/zte/clk-zx.h     |  80 ++++++++++++++++++++++++
 drivers/clk/zte/pll-zx.c     |  17 ++++++
 9 files changed, 298 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6502d343fe44..8f2e436cb42b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3882,6 +3882,7 @@ F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
 F:	Documentation/devicetree/bindings/soc/zte/
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	drivers/clk/zte/
 F:	drivers/soc/zte/
 F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 F:	include/dt-bindings/reset/zte,zx297520v3-reset.h
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
index 000000000000..1180d7aa7d62
--- /dev/null
+++ b/drivers/clk/zte/clk-regmap.c
@@ -0,0 +1,35 @@
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
index 000000000000..8a1c91fdd63e
--- /dev/null
+++ b/drivers/clk/zte/clk-zx.c
@@ -0,0 +1,142 @@
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
index 000000000000..71ebcc1d5895
--- /dev/null
+++ b/drivers/clk/zte/clk-zx.h
@@ -0,0 +1,80 @@
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
+};
+
+int zx_clk_common_probe(struct device *dev, struct device_node *of_node,
+			const struct zx_clk_data *data);
+
+#endif /* __DRV_CLK_ZX_H */
diff --git a/drivers/clk/zte/pll-zx.c b/drivers/clk/zte/pll-zx.c
new file mode 100644
index 000000000000..1a8cb37ca7e2
--- /dev/null
+++ b/drivers/clk/zte/pll-zx.c
@@ -0,0 +1,17 @@
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
+			 const struct zx_pll_desc *desc, unsigned int num,
+			 struct clk_hw_onecell_data *clocks)
+{
+	return -ENODEV;
+}

-- 
2.54.0

