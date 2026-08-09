Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6818B377574
	for <linux-clk@vger.kernel.org>; Sun,  9 Aug 2026 21:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786310960; cv=none; b=javMewRGm3CQmYn//I5Lv+Jt1gW00Oidns6Q3h7gj0S7dtXpXOd+hRAEo/onc25Uvtih9jkGzn3mFwLMQWoMyL0D2Yt81Y5PZgz9HBSL03qcnlw2/+7k2OvOeeBisWfWlrromFqCRIcRseDODvp1MFyuWfzynP5NHY7f/3sqtXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786310960; c=relaxed/simple;
	bh=gSDtfWAVWdvlcma8ZqUEgPrZSl9GaOphLarVRTTZ1SQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H0neYFXcy0wTexnJvLePTEgDKvi06GIqdsYljUoj4n3sunw+GTrfhtu+CB6HSFlFxVPfk6BEFAgzJFTFimr7ePGiyCDQkr329RcK+6mwrtzAxX/yF7OfQNwwdX7kSDkzDS7LZIffAp3OXVhoMaeMRupmGwhcN4wjIpf8K+gwaJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oPJ55l9a; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oPJ55l9a"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954afac04bso13587265e9.0
        for <linux-clk@vger.kernel.org>; Sun, 09 Aug 2026 14:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786310957; x=1786915757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lMTBVu3U9QKzRcwaIpX6+14eLfct+c7n+dFYUe5JO9M=;
        b=oPJ55l9at4X+eulb+iFBbAGgLQiXnrbfXT/sUd5KLroKu9PRGFwJuaaGSQuWfVFnYJ
         asjny6Gr2De1THB7CmsQqaxDpiv3CgUIK80GhfoTIc1YUa6X6mQpiupghWVtK8J4IYWi
         BgoT0jcuHdJIIoP8dL2o91s6s9qh0WuyBDxT3BQb0cSigSUDjGaquTZvOO+GBUan8Mzz
         pquz32JPYSNlq/lrITbf3uqE+jJBZxI4wdKNxjb0VapUztslMVY2jN4KrHOaN+GBAuGl
         ksZGn7X0YE2IzRDkjZfWCV2/I1p9X0lXDyq74d8lSA396gLRnqw42e3h5J09UIiJEXbc
         j5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786310957; x=1786915757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lMTBVu3U9QKzRcwaIpX6+14eLfct+c7n+dFYUe5JO9M=;
        b=sgYRk/PWKsQQhB1xBZ555z7VsUkU3cL8xCGbBjjseDOGsG6R+D8kGt5F6ljUhdRJKm
         dpRggsnZcox+71jp6ZV38ZIFMTQ+qZvL4zpaGkb+BkX3VzVDI+d0n+F29j5q76pDRnMe
         GP8p/h5S8TlDL+5DSTl1i981D2N1mHxYmHDePZQOe95fI6xxhwwzJfvu3WMmIBDaLafX
         V9ze2sR4JxJAcmMveY9BAZOxT4/uDQk872/3MUvots/G9nTpgM7apXjoAu/hdIeJOHZx
         YGpkpgplrt0XnYd1DgQ373D/EY7+Lt6i2I1OoHLpjzgKJszGR6ellEX/UzI1+apdVEil
         VqiQ==
X-Gm-Message-State: AOJu0YyGxKKB8zdgRANOURlrDHki7hQUFimptxJOFGZdhlTOBZPERhPa
	+AfXDjvVtrl5pJqXnTXCVyVTGjSTKtXsY0RNHzb/TvSjeNy0qQRRfDjz
X-Gm-Gg: AR+sD12WblDALAwih+c3Y+6F0cS7xWh3BT1/ciiMIKUC6ivZssgXxX5e3N/ECAjaA+H
	xTNLAbCT2KmE8z5u0EWe41qU2obA+ExEcCUD1iUupr7emNNy08VoxYpxVn1yVc7jv83nxSGI6DQ
	Z6HEqbbyyDh8QX6Fb/4lTvGHGcBC7lvcIOKFDvZ7hwxj1elWuK4MhguOzOZ9zVVJMrDPTTQpDlO
	r2TcBO7NcLP4uiCxk+HMoeXC51OKrF3E6EdhjyFHYFeLl5jd37Ox6MReIhGxfagzod7A1cfADO7
	EHkuLGLTA/klw4PFjtPYp2wlvfRxrxCaSKYWWU3yE1jLVT6iS9Z1JBFTUQLTrAMRq49to6fxokz
	ZtAu8zkYHL7SuxS4Xmqa0AKYJ4k6heVfUzO+cAbquzqHOGjgpBL7vdUmpj+bgWpNneZn1+O021P
	O+6zxInx0qg2Vz1DGoqW6QNSFbRGUcSYbINQtwXz4lrfl30oRFJDBYX7cOZQPYg7Nv9e1qpls=
X-Received: by 2002:a05:600c:8b4c:b0:495:5b4a:53b7 with SMTP id 5b1f17b1804b1-49961b9e37amr185947715e9.19.1786310956592;
        Sun, 09 Aug 2026 14:29:16 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.226.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8c5asm28987451f8f.18.2026.08.09.14.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 14:29:15 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Mon, 10 Aug 2026 00:28:24 +0300
Subject: [PATCH v10 05/12] clk: zte: Add Clock registration infrastructure
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260810-zx29clk-v10-5-63846490712c@gmail.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
In-Reply-To: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=15447;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=gSDtfWAVWdvlcma8ZqUEgPrZSl9GaOphLarVRTTZ1SQ=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqePEO9Je+sowmHKrdKiomiDMuSudW5th1QLiaV
 cIfVMGW2jKJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCanjxDhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLPjRAAlfnRtNJicYbcljtBRnkojI1vD29Yukh
 C2+ahjGL/8eOsbJlu8VZlubikRhX9XnEj1G3nrRAscL7o/fi1ZmjhlJyMVY+2Z330jNMoknd87t
 g3X/Zj5M4MtnCOIkKX/PeQQM9SyeV4+eptX8VTAx7wr+0TewJMCsnSAFvAZ5bKsFVlZCxF+V2Bg
 YQvfZfZPJL2e/DcOrfDkPQDcuIiZUPMRdumfaNJbsk9Q16njq53PuD7PL/yukISm95B3rbjqHrM
 ctOgbgUA7GnV6ohOpHxta5wvXOs8inlGjB+Dlzc6AdbzLgEA2bTzDJ/jZCjk/l44fC+37dgj0PR
 6mYsWIk9UCW/zmlge782TyVHGza8pgtPArX8ewTgRhl+bqNawG52qj61TPXM7cxxmYjRghlPe/w
 60dkx0GqMhrrNWAXUf8WV/fG7J4nRsAEQC1achVObmur7L8frhEyyxLypbfDfdbFZY+ifvUHqeL
 714s/F8yNLnZMpD5uInDLrPxoyNV+R5q/1U2xwBHJT0jNyEEDa/z8RXunrRB3nOIcBvMtyzWC9l
 8ZogTCNLqgVVGLi0P8v3aPY9iYNp/0FY6RaG01Nr8t27RmElfny0Dhq1yJ0hY6cWh8NdlAI6HA/
 yaVVikJAgVAM1mBNRSbPdjJJevBXm3YowGpgH3DDyuSaq6xDiBOs=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

The next patches will implement the regmap clocks and PLL driver. The
actual hardware specific clock listing will live in a separate module.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

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
index d50c03fd5a76..408bb256d2d4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3909,6 +3909,7 @@ F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
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
index 6899e32e14aa..651fe866ddad 100644
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
2.54.0

