Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57154772BB;
	Tue,  4 Aug 2026 16:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785861564; cv=none; b=Y7YocqqE//mwY0IkaUYdSsG+vM0KdPFHTHqD7MIc2A/3UfahiEoqldhj1fl+Q5FnphqtM2eNfZEZIcFA2TtNS4VERC6qW9bs2pznrBOrbORlHp3TxW4RmLPPNe0S8vmB8V27nrusH2tjWhEG3dk5XeGHDQOHvrLL7ft9luPzhjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785861564; c=relaxed/simple;
	bh=W35kJbsEwWJ7PF2yl7e/T3rc84tsdL1BH8n2LUzNDSM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iuRYaFtz+e3TzRn3gMyk9AummE1k7tKpk69OMnw2Kf0YRvaMPYH2Y4RxothIalopuqbPQA0ofH4vi2RoCLstirQ80pWHdM/DniSrNsCTkHthOQ9SeiYWmSg69eOGygFmIC74yBgZf4qFeJjlBMkSQq9YZWyDDNSbEtNktU4xhd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=jHJIBpnu; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="jHJIBpnu"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 674Gc9yW51231937, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1785861489; bh=aRODG7mm1rUltpcxFmzEVFO3n74N3CyVr0zTOQYOodo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=jHJIBpnuqHgb3AZ4JP3XCWKEcxEdmXHQyBKgA9xtu71FUotvgzKMblCjtxNXuUlMS
	 gAqEO6ZpZB5gMW1XusmVNqrcMU9feXH+THuklqrPEq0SIywrkzs3+sscHA/N2DYT8O
	 77foamzk7dAsr1RA80pruYb7s32JjR/HtaHdeE/8KKmKc9b5Rd6LYRqC12xYM6gNm4
	 iz0GXQUmHu7EGmahXvnChKwEUk0udE6pWw1b3mFDwJ2pdQ3Re4pUG8a1ixCeXwdRZw
	 Sm8+Fyhic/RJORDKUWpiAv18riwivAJDox1ae3v5KtXC8zscDWWgWcwcwk8k5wrpnF
	 P+9iwat7tANUg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 674Gc9yW51231937
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Aug 2026 00:38:09 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 5 Aug 2026 00:38:09 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 5 Aug 2026 00:38:08 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 5 Aug 2026 00:38:08 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
	<cylee12@realtek.com>, <jyanchou@realtek.com>, <bmasney@redhat.com>
CC: <afaerber@suse.com>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v12 02/11] reset: Add Realtek basic reset support
Date: Wed, 5 Aug 2026 00:37:58 +0800
Message-ID: <20260804163807.1285869-3-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260804163807.1285869-1-eleanor.lin@realtek.com>
References: <20260804163807.1285869-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Cheng-Yu Lee <cylee12@realtek.com>

Define the common reset operations backed by a regmap-based register
interface for Realtek SoCs.

This library exports the standard reset control operations (assert,
deassert, and status) to be utilized by other specific Realtek reset
drivers. The implementation supports handling an optional write-enable bit
required by certain Realtek reset controllers.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v12:
- None
---
 MAINTAINERS                              |  1 +
 drivers/reset/Kconfig                    |  1 +
 drivers/reset/Makefile                   |  1 +
 drivers/reset/realtek/Kconfig            |  8 +++
 drivers/reset/realtek/Makefile           |  2 +
 drivers/reset/realtek/reset-rtk-common.c | 73 ++++++++++++++++++++++++
 drivers/reset/realtek/reset-rtk-common.h | 29 ++++++++++
 7 files changed, 115 insertions(+)
 create mode 100644 drivers/reset/realtek/Kconfig
 create mode 100644 drivers/reset/realtek/Makefile
 create mode 100644 drivers/reset/realtek/reset-rtk-common.c
 create mode 100644 drivers/reset/realtek/reset-rtk-common.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 6dc36e93fbd4..a752551f32f9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22746,6 +22746,7 @@ M:	Cheng-Yu Lee <cylee12@realtek.com>
 M:	Yu-Chun Lin <eleanor.lin@realtek.com>
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
index 000000000000..5ddf8e5c09c7
--- /dev/null
+++ b/drivers/reset/realtek/Kconfig
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config RESET_RTK_COMMON
+	tristate "Realtek common reset driver" if COMPILE_TEST
+	help
+	  This option enables the common reset controller library for
+	  Realtek SoCs. It provides shared reset control operations
+	  (assert, deassert, status) that other Realtek-specific reset
+	  drivers can use.
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
index 000000000000..6900932b0a32
--- /dev/null
+++ b/drivers/reset/realtek/reset-rtk-common.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2019-2026 Realtek Semiconductor Corporation
+ */
+
+#include <linux/export.h>
+#include <linux/module.h>
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
index 000000000000..3ea35d9573a4
--- /dev/null
+++ b/drivers/reset/realtek/reset-rtk-common.h
@@ -0,0 +1,29 @@
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
+#include <linux/types.h>
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

