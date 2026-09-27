Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91533BE644
	for <linux-clk@vger.kernel.org>; Sun, 27 Sep 2026 20:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790540064; cv=none; b=hSQlEJdACyquO4VOMOmRDYzH8f+96s/QimlhWGuogMAg6b1vGdOid05PezraUqVs6uY8sKQi6/q67elV35VTVm4c7tTj+oTJGEYdvb/T9WBjpTVZ5IzExoattEpjnHzcRi0QBl/QCBMrHoCaXVxl8RmCRNTERSPkhl54xH3oI3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790540064; c=relaxed/simple;
	bh=ofd8rVoz0p52QzPz9+SkZywnce00Yrxb97abl1XuDdk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kQqAI5aWTYBb4TA6i+GHp1B5z1HtEcmNT9NIuQDWau1L0rbdaXZWFMychKnvSmHd348sdmkMXroLLyNqk/kdnzDPVY1vpBaBBXc3eN79NK2x0jGo/MfaKgy5cAguWv81XamMR9omPtBR+V/yf5JMsxYWBaICjeb/ahza1eYVaWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LWgqraIL; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWgqraIL"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso21201755e9.0
        for <linux-clk@vger.kernel.org>; Sun, 27 Sep 2026 13:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790540060; x=1791144860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lcshcCFgPieIG5e8bwiFJkZupH8EGx8PYrfbPTGlSIU=;
        b=LWgqraILu5Lt1VLsq7w9jgsSLCUXt013F7dqVFEbZ9v5aKdcUsfb4jJeRKGnRgxmOq
         6kxNaipfvTXhs1ZTNb9//dzHtrTdGk6vC22rFRL/U+x+5FyN0T3htlcG08Rqr6hQJc3V
         n5pteXfyY/yOVHPQy7ARc1GEAhfnn/TFqZhlYNXgObv2x06IDRkL84K3+Nm6qxJVp5lA
         CRIeC+2SoYA8Lh5afnhBpXWU3caYe4vP4wZKPP2edjFl1DYfVJ7TP8nxdlYuKq33PpFn
         B16gUC1kBiLpR7s1aEIIfkpl7xBsG2wRfeFxCSKswMjYjv/truv2GymY6XVK9Dr8KcHt
         Wqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790540060; x=1791144860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lcshcCFgPieIG5e8bwiFJkZupH8EGx8PYrfbPTGlSIU=;
        b=jMfThHOtKAqh1Vr6fQ0Lvw8QOdIv9SnMLQ9vPJqVI0GOefex1MNTC4XM+VgtYE6pwx
         C1C0z/j7YaPxAbwcrH/B32+ROqCDBAD7p0gH0hL1CcD9kDBPo6gVuq1IEmYa+jtdb95R
         toJ9XbGqilwGbJW1fGgoYk0HSqBWfxVsZcnxYglbDxDwHtwXdC4C7No+jpF/JZKpyVkU
         dXyiu4siueH2nFxo8Doz2UJfdEdzaHLTOwMvgMadvhITALGA2PkQds/DCtxhApRiqCD8
         Wh26I0388bw4QlCVymL9K5ULT/SnPJ2UnlG8ya0HrH/nYWlcsfFJ9tarycCZR4rsY1jT
         0AQw==
X-Gm-Message-State: AFuF++kgeya2mOky4aho/H38pFdNI/suoD9CB5qkrSU1rNvH9twC9+1g
	+agxi3EmON7Oy2oW5slCQ19FvEKtCQ3swAOyGiRfIx1lHBvxTQduMdDQ
X-Gm-Gg: AYBFou06TMApTy+t+qkNilvp0+r+WIkDU+ztj62b1Q3rs5X9DBNwoAa70aF3v8G9EbW
	kgPzRdAh2fzHM4nHmNCCqyvJfQVQfJufPrN727MT/giAF7vurM7lQ/VTTku4ISsGJiMUyShGWqG
	4jL+NMTMHL39vhZpinkqHHxLLww0lQ+oBdcoRBcFz+YPeCWX2eByAl8B2qmdXM8nXaYSQKfJIN7
	ezA4bNs7+uhFy3F79We5QNz8/Y099rw116NUs7VDL09lOUXndraWDkDBXqJxGEL78TwxTlyAi0d
	AqbYBK2Xcoz4AEhpOsazJfpjFP4CandwmrB7IKMIiipMvH48sLDnw3JPm/kxowl33EDa6X1S569
	nMDXoOUtO/TAxfHeV+O8RBDv1OP7miUkzW4HYgpUpzuRrg0PM9IHS2DLeuhys33fgKWM5eHusJo
	mYTjuI4P1A9KND9xv6/CbVYq1g1DgX0fLztQmWfXORnNrJe97My4Ri7SLKxsVoPpeKOMLyWzSbG
	JHKCINW
X-Received: by 2002:a05:600c:a211:b0:4a0:373:18f3 with SMTP id 5b1f17b1804b1-4a003731ce6mr17412175e9.2.1790540059698;
        Sun, 27 Sep 2026 13:14:19 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.96.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a570sm21781514f8f.13.2026.09.27.13.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:14:19 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 27 Sep 2026 23:13:34 +0300
Subject: [PATCH v13 06/13] clk: zte: Add Clock registration infrastructure
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260927-zx29clk-v13-6-70d8f673386c@gmail.com>
References: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
In-Reply-To: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=15712;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=ofd8rVoz0p52QzPz9+SkZywnce00Yrxb97abl1XuDdk=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBquXj0xo4v6acvpcXXLjh0HCgGV001IL5IGUtRJ
 yGe8+lHka2JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCarl49BsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLbgBAAnGF87HZUSY0U0jEK2edg3W0dwAtYFP6
 d5Ba+oIshYPzqsuQxmSJaZSpw4FDkyr+/Umir9CaPXNQScQ9Nc4MH9UnuR/1B5EM6cOyPSnW92U
 kQlON84K6cnfR2oDNCDOY/c+7Bdnsl/sogWmumC7yZgGUesfjSn6fKIgZCSrBFdBsB3rn0Z5GlR
 JIe+QVtsQvWU2YOxdzz06FJfSxZoEjkmn+McNYUxkSy2vKfypIQsjaPrRvF8yRw82sEP5h28V2U
 69TOG/NODpuLSSmwgrfwEMiR2r7/bWQLk/983slkY6uu9e7I12RHb/2fiPU4IlZ3g1GivqEci9U
 9vLOL3gC/qf1yTpR+QSwyniOAYchFz2VtpjT6sgI/VXT4n+a8/1DIfidF1hnXHqA3pGcjIapRjg
 E5OQdORfr5exSwhEy+1tG59p/tdAIapNtsCqBLDhOM7TooOv7fgXuU5wknxbngCswX4vn4KCKSC
 l4j8n194ulvGhoo7LdFj6fD9TOPgaeW0XiryXNBGIqV0v/JEeJHA1zsnqxFAYybRm7W+OaySQHf
 QqDrcK0bq5FuKAyMTBA1KxWi72SPxpWPpD3oTWCsyRJT4R1D+382lV8inb0JULT9Ld8bQn0AyqY
 EtnftCZLDiF8ibKY2+frxG9VbxjXcTF+YDSApkK3SUDIef4aoZ4c=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

The next patches will implement the regmap clocks and PLL driver. The
actual hardware specific clock listing will live in a separate module.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

Version 11, 12: Unchanged

@Sashiko: I think your concern about a NULL of_node in the call to
devm_clk_hw_register_fixed_factor_fwname is a false positive. The CCF
code looks for of_nodes in dev and dev->parent.

Version 10 (Brian):
Remove unused struct zx_clk_export
Remove a stray semicolon from switch/case in zx_get_parent
Explain the rationale for the validation code and discourage copying it
into other clock drivers
Make the exports array const (Sashiko)

Version 9:
Rework parent matching and clock export control. Most of the changes
will be in the next patches. The visible change here is that the clock
array is unified with single clocks having a type rather than one array
per type.

Depend on HAS_IOMEM, similarly to Sashiko's flagged issue in the Reset
patch

ZX297520V3_CLK_NO_EXPORT is gone again.

The explicit clock input array and enabling of LSP's pclk is removed
from the clock driver. The MFD parent takes care of this instead. The
clock driver does some sanity checking on the static clock data though.

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
 drivers/clk/zte/Kconfig      |  17 ++++
 drivers/clk/zte/Makefile     |   5 ++
 drivers/clk/zte/clk-regmap.c |  32 ++++++++
 drivers/clk/zte/clk-zx.c     | 192 +++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/zte/clk-zx.h     | 137 ++++++++++++++++++++++++++++++
 drivers/clk/zte/pll-zx.c     |  18 ++++
 9 files changed, 404 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 41c287316d0e..cf4e8c48ddfc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3927,6 +3927,7 @@ F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	drivers/clk/zte/
 F:	drivers/mfd/zte-zx297520v3-crm.c
 F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 F:	include/dt-bindings/phy/zte,zx297520v3-topcrm.h
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 252f6a1f21b8..ca4869c4e5e1 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -548,6 +548,7 @@ source "drivers/clk/uniphier/Kconfig"
 source "drivers/clk/visconti/Kconfig"
 source "drivers/clk/x86/Kconfig"
 source "drivers/clk/xilinx/Kconfig"
+source "drivers/clk/zte/Kconfig"
 source "drivers/clk/zynqmp/Kconfig"
 
 # Kunit test cases
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 2d8f60254373..91b73be31707 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -182,5 +182,6 @@ ifeq ($(CONFIG_COMMON_CLK), y)
 obj-$(CONFIG_X86)			+= x86/
 endif
 obj-y					+= xilinx/
+obj-$(CONFIG_COMMON_CLK_ZTE)		+= zte/
 obj-$(CONFIG_ARCH_ZYNQ)			+= zynq/
 obj-$(CONFIG_COMMON_CLK_ZYNQMP)         += zynqmp/
diff --git a/drivers/clk/zte/Kconfig b/drivers/clk/zte/Kconfig
new file mode 100644
index 000000000000..152c2423b8f0
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
+	depends on HAS_IOMEM
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
index 000000000000..80332dba97f6
--- /dev/null
+++ b/drivers/clk/zte/clk-regmap.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Stefan Dösinger
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/regmap.h>
+
+#include "clk-zx.h"
+
+struct clk_hw *zx_clk_register_gate(struct device *dev, struct regmap *regmap,
+				    const struct zx_gate_desc *desc,
+				    struct clk_hw * const *clocks)
+{
+	return ERR_PTR(-ENODEV);
+}
+
+struct clk_hw *zx_clk_register_divider(struct device *dev, struct regmap *regmap,
+				       const struct zx_div_desc *desc,
+				       struct clk_hw * const *clocks)
+{
+	return ERR_PTR(-ENODEV);
+}
+
+struct clk_hw *zx_clk_register_mux(struct device *dev, struct regmap *regmap,
+				   const struct zx_mux_desc *desc,
+				   struct clk_hw * const *clocks)
+{
+	return ERR_PTR(-ENODEV);
+}
diff --git a/drivers/clk/zte/clk-zx.c b/drivers/clk/zte/clk-zx.c
new file mode 100644
index 000000000000..aef0f7c753e6
--- /dev/null
+++ b/drivers/clk/zte/clk-zx.c
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+
+#include "clk-zx.h"
+
+static struct clk_hw *zx_clk_register_fixed_div(struct device *dev,
+						const struct zx_fixed_divider_desc *desc,
+						struct clk_hw * const *clocks)
+{
+	const struct zx_parent_desc *p = &desc->parent;
+
+	switch (p->type) {
+	case ZX_PARENT_FW:
+		return devm_clk_hw_register_fixed_factor_fwname(dev, NULL, desc->name, p->fw_name,
+								CLK_SET_RATE_PARENT, 1, desc->div);
+
+	case ZX_PARENT_ID:
+		return devm_clk_hw_register_fixed_factor_parent_hw(dev, desc->name, clocks[p->id],
+								   CLK_SET_RATE_PARENT, 1,
+								   desc->div);
+	}
+	WARN_ON_ONCE(1);
+	return ERR_PTR(-EINVAL);
+}
+
+static int zx_clk_validate(struct device *dev, struct device_node *of_node,
+			   const struct zx_clk_data *data)
+{
+	const struct zx_parent_desc *parents;
+	unsigned int i, p, num_parents;
+	struct clk *clk;
+
+	/*
+	 * Sanity check: Make sure all parents are there and write a clear message rather than
+	 * leave potential orphans.
+	 *
+	 * This check is unusual in clock drivers. It is in this driver because the clock tree is
+	 * based on manual reverse engineering rather than generated from a SoC datasheet.
+	 */
+	for (i = 0; i < data->num_clocks; ++i) {
+		switch (data->clocks[i].type) {
+		case ZX_CLOCK_PLL:
+			parents = data->clocks[i].pll.parents;
+			num_parents = data->clocks[i].pll.num_parents;
+			break;
+
+		case ZX_CLOCK_FIXED_DIV:
+			parents = &data->clocks[i].fixed_div.parent;
+			num_parents = 1;
+			break;
+
+		case ZX_CLOCK_MUX:
+			parents = data->clocks[i].mux.parents;
+			num_parents = data->clocks[i].mux.num_parents;
+			break;
+
+		case ZX_CLOCK_DIV:
+			parents = &data->clocks[i].div.parent;
+			num_parents = 1;
+			break;
+
+		case ZX_CLOCK_GATE:
+			parents = &data->clocks[i].gate.parent;
+			num_parents = 1;
+			break;
+
+		default:
+			return dev_err_probe(dev, -EINVAL, "Invalid clock entry %u\n", i);
+		}
+
+		for (p = 0; p < num_parents; ++p) {
+			switch (parents[p].type) {
+			case ZX_PARENT_FW:
+				clk = of_clk_get_by_name(of_node, parents[p].fw_name);
+				if (IS_ERR(clk))
+					return dev_err_probe(dev, PTR_ERR(clk),
+							     "Input clk %s failure\n",
+							     parents[p].fw_name);
+				clk_put(clk);
+				break;
+
+			case ZX_PARENT_ID:
+				if (parents[p].id >= i)
+					return dev_err_probe(dev, -EINVAL,
+							     "Clock %u has parent %u\n",
+							     i, parents[p].id);
+				break;
+
+			default:
+				return dev_err_probe(dev, -EINVAL,
+						     "Clock %u has unexpected parent of type %u\n",
+						     i, parents[p].type);
+			}
+		}
+	}
+
+	return 0;
+}
+
+int zx_clk_common_probe(struct device *dev, struct device_node *of_node,
+			const struct zx_clk_data *data)
+{
+	struct clk_hw_onecell_data *exports;
+	struct clk_hw **clocks;
+	struct regmap *map;
+	unsigned int i;
+	int res;
+
+	res = zx_clk_validate(dev, of_node, data);
+	if (res)
+		return res;
+
+	map = device_node_to_regmap(of_node);
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	clocks = devm_kcalloc(dev, data->num_clocks, sizeof(*clocks), GFP_KERNEL);
+	if (!clocks)
+		return -ENOMEM;
+
+	if (data->init) {
+		res = data->init(map);
+		if (res)
+			return res;
+	}
+
+	for (i = 0; i < data->num_clocks; ++i) {
+		struct clk_hw *hw;
+
+		switch (data->clocks[i].type) {
+		case ZX_CLOCK_PLL:
+			hw = zx_clk_register_pll(dev, map, &data->clocks[i].pll, clocks);
+			break;
+
+		case ZX_CLOCK_FIXED_DIV:
+			hw = zx_clk_register_fixed_div(dev, &data->clocks[i].fixed_div, clocks);
+			break;
+
+		case ZX_CLOCK_MUX:
+			hw = zx_clk_register_mux(dev, map, &data->clocks[i].mux, clocks);
+			break;
+
+		case ZX_CLOCK_DIV:
+			hw = zx_clk_register_divider(dev, map, &data->clocks[i].div, clocks);
+			break;
+
+		case ZX_CLOCK_GATE:
+			hw = zx_clk_register_gate(dev, map, &data->clocks[i].gate, clocks);
+			break;
+
+		default:
+			return -EINVAL;
+		}
+
+		if (IS_ERR(hw))
+			return dev_err_probe(dev, PTR_ERR(hw), "Failed to register clk %u\n", i);
+
+		clocks[i] = hw;
+	}
+
+	exports = devm_kzalloc(dev, struct_size(exports, hws, data->num_exports), GFP_KERNEL);
+	if (!exports)
+		return -ENOMEM;
+	exports->num = data->num_exports;
+
+	for (i = 0; i < data->num_exports; ++i) {
+		if (data->exports[i] >= data->num_clocks)
+			return dev_err_probe(dev, -EINVAL,
+					     "Export %u points to out of range clock %u\n",
+					     i, data->exports[i]);
+
+		exports->hws[i] = clocks[data->exports[i]];
+	}
+
+	devm_kfree(dev, clocks);
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, exports);
+}
+EXPORT_SYMBOL_NS_GPL(zx_clk_common_probe, "ZTE_CLK");
+
+MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
+MODULE_DESCRIPTION("ZTE common clock driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/zte/clk-zx.h b/drivers/clk/zte/clk-zx.h
new file mode 100644
index 000000000000..8137185f497f
--- /dev/null
+++ b/drivers/clk/zte/clk-zx.h
@@ -0,0 +1,137 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+
+#ifndef __DRV_CLK_ZX_H
+#define __DRV_CLK_ZX_H
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+#define CLK_ZX_PLL_PREPARE_IS_ENABLE	1
+#define CLK_ZX_MAX_PARENTS		8
+
+enum zx_parent_type {
+	ZX_PARENT_FW,
+	ZX_PARENT_ID,
+};
+
+struct zx_parent_desc {
+	enum zx_parent_type		type;
+	union {
+		const char		*fw_name;
+		unsigned int		id;
+	};
+};
+
+#define PARENT_FW(_name) { .type = ZX_PARENT_FW, .fw_name = (_name) }
+
+#define PARENT_ID(_id) { .type = ZX_PARENT_ID, .id = (_id) }
+
+static inline struct clk_parent_data zx_get_parent(const struct zx_parent_desc *p,
+						   struct clk_hw * const *clocks)
+{
+	struct clk_parent_data ret = {};
+
+	switch (p->type) {
+	case ZX_PARENT_FW:
+		ret.fw_name = p->fw_name;
+		ret.index = -1;
+		return ret;
+
+	case ZX_PARENT_ID:
+		ret.hw = clocks[p->id];
+		ret.index = -1;
+		return ret;
+	}
+
+	WARN_ON_ONCE(1);
+	return ret;
+}
+
+struct zx_pll_desc {
+	const char			*name;
+	const struct zx_parent_desc	*parents;
+	unsigned int			num_parents;
+	unsigned long			rate;
+	u16				reg;
+	u16				flags;
+};
+
+struct zx_fixed_divider_desc {
+	const char			*name;
+	struct zx_parent_desc		parent;
+	unsigned int			div;
+};
+
+struct zx_mux_desc {
+	const char			*name;
+	const struct zx_parent_desc	*parents;
+	unsigned int			num_parents;
+	u16				reg;
+	u8				shift, size;
+};
+
+struct zx_div_desc {
+	const char			*name;
+	struct zx_parent_desc		parent;
+	u16				reg;
+	u8				shift, size;
+};
+
+struct zx_gate_desc {
+	const char			*name;
+	struct zx_parent_desc		parent;
+	unsigned long			flags;
+	u16				reg;
+	u8				shift;
+};
+
+enum zx_clock_type {
+	ZX_CLOCK_INVALID = 0,
+	ZX_CLOCK_PLL,
+	ZX_CLOCK_FIXED_DIV,
+	ZX_CLOCK_MUX,
+	ZX_CLOCK_DIV,
+	ZX_CLOCK_GATE,
+};
+
+struct zx_clock {
+	enum zx_clock_type type;
+	union {
+		struct zx_pll_desc pll;
+		struct zx_fixed_divider_desc fixed_div;
+		struct zx_mux_desc mux;
+		struct zx_div_desc div;
+		struct zx_gate_desc gate;
+	};
+};
+
+struct clk_hw *zx_clk_register_pll(struct device *dev, struct regmap *regmap,
+				   const struct zx_pll_desc *desc,
+				   struct clk_hw * const *clocks);
+struct clk_hw *zx_clk_register_mux(struct device *dev, struct regmap *regmap,
+				   const struct zx_mux_desc *desc,
+				   struct clk_hw * const *clocks);
+struct clk_hw *zx_clk_register_divider(struct device *dev, struct regmap *regmap,
+				       const struct zx_div_desc *desc,
+				       struct clk_hw * const *clocks);
+struct clk_hw *zx_clk_register_gate(struct device *dev, struct regmap *regmap,
+				    const struct zx_gate_desc *desc,
+				    struct clk_hw * const *clocks);
+
+struct zx_clk_data {
+	int (*init)(struct regmap *map);
+	const struct zx_clock *clocks;
+	unsigned int num_clocks;
+	const unsigned int *exports;
+	unsigned int num_exports;
+};
+
+int zx_clk_common_probe(struct device *dev, struct device_node *of_node,
+			const struct zx_clk_data *data);
+
+#endif /* __DRV_CLK_ZX_H */
diff --git a/drivers/clk/zte/pll-zx.c b/drivers/clk/zte/pll-zx.c
new file mode 100644
index 000000000000..fc76c6524a16
--- /dev/null
+++ b/drivers/clk/zte/pll-zx.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/regmap.h>
+
+#include "clk-zx.h"
+
+struct clk_hw *zx_clk_register_pll(struct device *dev, struct regmap *regmap,
+				   const struct zx_pll_desc *desc,
+				   struct clk_hw * const *clocks)
+{
+	return ERR_PTR(-ENODEV);
+}

-- 
2.55.0

