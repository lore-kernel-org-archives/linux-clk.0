Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB1A3093B2;
	Mon, 13 Jul 2026 15:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783958269; cv=none; b=FzDDVdNjOxdA6JaZ5z0wyAnkjXKbz12CvQf55/h/TGH43EXTFhTjqVyZg23PwHV55E2MmKGicXbXNrwi/90BKCwSXK05JiqT4Evc5R7wQ0dBLMfQ1ODeO/4J2/jwhoa7vt1dQMcniGhdm1KZjqYgDLF7dVdrw9jzm3f07tVzxcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783958269; c=relaxed/simple;
	bh=yCyN4j3BIkGRddH/btAABiFMQ2aZ40/oi4hecLOJQKY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yinyu/cfB/eS5NWylmjb//GWUs8FjZ6QMOY0FT4jtdsugDlmwIBcvBfVt4UwctSmnDpUYOKw7tIzm+S+3QkQtC19aO7nlOWvf6JA0jBnhaS0MMPRk8qcNRrwSiXy7nq/ERJ4at662Pt2AXAPDmm8CNHZ2mwsq/82sFInKkgvfWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=vu/RNi8s; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="vu/RNi8s"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66DFuUymD1489869, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1783958190; bh=hVHdGUO7T2C0cNu1VW37mdyJy59h6dRZHHzqtB16qM0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=vu/RNi8s74dZow/MA2uIaxwGVwChsoQe4ehLvgphyDMndGcCnh2Bh3E2wxP9D5Pye
	 HCUFCaV40PdJLIXSwwo5QvapOF1XmPlxlb+QEzizwk4vb9OpicHzVzqMVRkQc5hE/W
	 q3A94w+TuFLkmZwZnZNu1XzYN4/FZKGitiA5xS3q1HRPeNo8aeT1E9th5ibGUyKIWa
	 28MFYPyubDDIUYo1hfsM58MFoPUB35RSFs9Xkk0XKTiOUmwIjfI/Bv8q82aMxc0KOl
	 mQhaggpk2HO0lvopj4ClsCrTNoHE0+rhOc9Lu9DDXbVkOR1fzXT9gNMhKoPH+Sfrhz
	 bT0awmW7UGdpw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66DFuUymD1489869
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Jul 2026 23:56:30 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 13 Jul 2026 23:56:31 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 13 Jul 2026 23:56:30 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 13 Jul 2026 23:56:30 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>,
	<bmasney@redhat.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v10 02/11] reset: Add Realtek basic reset support
Date: Mon, 13 Jul 2026 23:56:21 +0800
Message-ID: <20260713155630.3054636-3-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713155630.3054636-1-eleanor.lin@realtek.com>
References: <20260713155630.3054636-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Cheng-Yu Lee <cylee12@realtek.com>

Define the reset operations backed by a regmap-based register interface
and prepare the reset controller to be registered through the reset
framework.

Since the reset controllers on Realtek SoCs often share the same register
space with the clock controllers, this common framework is designed to
extract the regmap and device tree node from the parent device
(e.g., an auxiliary device parent).

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v10:
- Export 'rtk_reset_ops' directly instead of using a wrapper function,
allowing callers to assign regmap, ops, dev, and of_node individually.
- Replacing 'regmap_update_bits()' with 'regmap_set_bits()'.
- Change variable types.
---
 MAINTAINERS                              |  1 +
 drivers/reset/Kconfig                    |  1 +
 drivers/reset/Makefile                   |  1 +
 drivers/reset/realtek/Kconfig            |  8 +++
 drivers/reset/realtek/Makefile           |  2 +
 drivers/reset/realtek/reset-rtk-common.c | 75 ++++++++++++++++++++++++
 drivers/reset/realtek/reset-rtk-common.h | 28 +++++++++
 7 files changed, 116 insertions(+)
 create mode 100644 drivers/reset/realtek/Kconfig
 create mode 100644 drivers/reset/realtek/Makefile
 create mode 100644 drivers/reset/realtek/reset-rtk-common.c
 create mode 100644 drivers/reset/realtek/reset-rtk-common.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 03fc281e1aa3..02b34a53b258 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22742,6 +22742,7 @@ L:	devicetree@vger.kernel.org
 L:	linux-clk@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/clock/realtek*
+F:	drivers/reset/realtek/*
 F:	include/dt-bindings/clock/realtek*
 F:	include/dt-bindings/reset/realtek*
 
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index d009eb0849a3..45a4227b5f44 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -418,6 +418,7 @@ config RESET_ZYNQMP
 
 source "drivers/reset/amlogic/Kconfig"
 source "drivers/reset/hisilicon/Kconfig"
+source "drivers/reset/realtek/Kconfig"
 source "drivers/reset/spacemit/Kconfig"
 source "drivers/reset/starfive/Kconfig"
 source "drivers/reset/sti/Kconfig"
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 3e52569bd276..7330fee91365 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -2,6 +2,7 @@
 obj-y += core.o
 obj-y += amlogic/
 obj-y += hisilicon/
+obj-y += realtek/
 obj-y += spacemit/
 obj-y += starfive/
 obj-y += sti/
diff --git a/drivers/reset/realtek/Kconfig b/drivers/reset/realtek/Kconfig
new file mode 100644
index 000000000000..bb6dd856a64a
--- /dev/null
+++ b/drivers/reset/realtek/Kconfig
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config RESET_RTK_COMMON
+	tristate "Realtek common reset driver" if COMPILE_TEST
+	help
+	  This option enables the common reset controller library for
+	  Realtek SoCs. It provides shared reset control operations
+	  (assert, deassert, status) and a registration helper function
+	  that other Realtek-specific reset drivers can use.
diff --git a/drivers/reset/realtek/Makefile b/drivers/reset/realtek/Makefile
new file mode 100644
index 000000000000..6d68e41748bf
--- /dev/null
+++ b/drivers/reset/realtek/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_RESET_RTK_COMMON) += reset-rtk-common.o
diff --git a/drivers/reset/realtek/reset-rtk-common.c b/drivers/reset/realtek/reset-rtk-common.c
new file mode 100644
index 000000000000..4d5ec2b0416d
--- /dev/null
+++ b/drivers/reset/realtek/reset-rtk-common.c
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2019-2026 Realtek Semiconductor Corporation
+ */
+
+#include <linux/device.h>
+#include <linux/export.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include "reset-rtk-common.h"
+
+static inline struct rtk_reset_data *to_rtk_reset_controller(struct reset_controller_dev *r)
+{
+	return container_of(r, struct rtk_reset_data, rcdev);
+}
+
+static inline const struct rtk_reset_desc *rtk_reset_get_desc(struct rtk_reset_data *data,
+							      unsigned long idx)
+{
+	return &data->descs[idx];
+}
+
+static int rtk_reset_assert(struct reset_controller_dev *rcdev,
+			    unsigned long idx)
+{
+	struct rtk_reset_data *data = to_rtk_reset_controller(rcdev);
+	const struct rtk_reset_desc *desc;
+	unsigned int mask, val;
+
+	desc = rtk_reset_get_desc(data, idx);
+	mask = desc->write_en ? (0x3U << desc->bit) : BIT(desc->bit);
+	val  = desc->write_en ? (0x2U << desc->bit) : 0;
+
+	return regmap_update_bits(data->regmap, desc->ofs, mask, val);
+}
+
+static int rtk_reset_deassert(struct reset_controller_dev *rcdev,
+			      unsigned long idx)
+{
+	struct rtk_reset_data *data = to_rtk_reset_controller(rcdev);
+	const struct rtk_reset_desc *desc;
+	unsigned int mask;
+
+	desc = rtk_reset_get_desc(data, idx);
+	mask = desc->write_en ? (0x3U << desc->bit) : BIT(desc->bit);
+
+	return regmap_set_bits(data->regmap, desc->ofs, mask);
+}
+
+static int rtk_reset_status(struct reset_controller_dev *rcdev,
+			    unsigned long idx)
+{
+	struct rtk_reset_data *data = to_rtk_reset_controller(rcdev);
+	const struct rtk_reset_desc *desc;
+	unsigned int val;
+	int ret;
+
+	desc = rtk_reset_get_desc(data, idx);
+	ret = regmap_read(data->regmap, desc->ofs, &val);
+	if (ret)
+		return ret;
+
+	return !((val >> desc->bit) & 1);
+}
+
+const struct reset_control_ops rtk_reset_ops = {
+	.assert   = rtk_reset_assert,
+	.deassert = rtk_reset_deassert,
+	.status   = rtk_reset_status,
+};
+EXPORT_SYMBOL_NS_GPL(rtk_reset_ops, "REALTEK_RESET");
+
+MODULE_DESCRIPTION("realtek reset infrastructure");
+MODULE_LICENSE("GPL");
diff --git a/drivers/reset/realtek/reset-rtk-common.h b/drivers/reset/realtek/reset-rtk-common.h
new file mode 100644
index 000000000000..dce6724dd50c
--- /dev/null
+++ b/drivers/reset/realtek/reset-rtk-common.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 Realtek Semiconductor Corporation
+ * Author: Yu-Chun Lin <eleanor.lin@realtek.com>
+ */
+
+#ifndef __RESET_REALTEK_COMMON_H
+#define __RESET_REALTEK_COMMON_H
+
+#include <linux/reset-controller.h>
+
+struct regmap;
+
+struct rtk_reset_desc {
+	u32 ofs;
+	u32 bit;
+	bool write_en;
+};
+
+struct rtk_reset_data {
+	struct reset_controller_dev rcdev;
+	const struct rtk_reset_desc *descs;
+	struct regmap *regmap;
+};
+
+extern const struct reset_control_ops rtk_reset_ops;
+
+#endif /* __RESET_REALTEK_COMMON_H */
-- 
2.43.0

