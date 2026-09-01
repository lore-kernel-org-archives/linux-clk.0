Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C33E459ACC;
	Tue,  1 Sep 2026 07:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247564; cv=none; b=nzIJ4PReWx1bcvLLItLH97+13FoCvztoqXU49VmqPCDisvhQtwS1JDfb41JOL5h85M4A66bUcX9oHweetKOf2WFtxYEPmYzGCnUw+5rCNB3cUMTSqowI9nX3rMLa+REg3KOI7w2UW/EBqUtsnfUP7QrEhhRtNRWAspdj2y44F+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247564; c=relaxed/simple;
	bh=YSrI5lwRNTGuniJAZreVmoUENAx6wB8BLdoaMtg8R3w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eYSD63a6oopTu5H6OsJq4IVG0mr6kikFeSH5+YuK/HnQJl6i8EKAr8ZujeV821L4cYrzZ8wKxzvJaxkMpOu7nMAkLmNnOokx10I7nmBby5ShPhQofl28GuDPhjY3NvOn/2ggW+v10SMbF9f2dPtl5WYw/LqLx7IlBMTBRu8cX5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=tauP5oMy; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="tauP5oMy"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6817OpwfE1484589, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1788247493; bh=iT6+QytMFn2YurnJNonmDg6hHbCAtWzZhoFoNp1RSow=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=tauP5oMy3WojTzOOeanKtJz7JJ9YiywsyOKcxvWRd+Khorgkq+CXStrumDn7TnXMz
	 23a6Ov+Sr2oukGGo1W+UETnLYJsNseJQNteFiP63mAiEuPAqEOuz+/efgi0kBeiVx0
	 7R9NIPYw1IL9tjOc2Hw1Q6g2aRXPSY8qFkrk1h+CkIvxqZ85nw1NzLplTzJZNXVCwB
	 wZBshahkB+YwOsxrVF696teNplYVhS3c8Ufz8+6owbYYyPinvEijsn/Ojia+FBz1GY
	 1dCUET6EJjqCx+OGZfWUo4FUMcY42xrKN7CfDfao0dWW7yBYfHQLYwDau+5alINBr/
	 wWFfYyetE9HIA==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6817OpwfE1484589
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Sep 2026 15:24:52 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 1 Sep 2026 15:24:50 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS04.realtek.com.tw
 (10.21.1.54) with Microsoft SMTP Server id 15.2.2562.43 via Frontend
 Transport; Tue, 1 Sep 2026 15:24:49 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<p.zabel@pengutronix.de>, <cylee12@realtek.com>, <afaerber@suse.com>,
	<jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v14 02/11] reset: Add Realtek basic reset support
Date: Tue, 1 Sep 2026 15:24:37 +0800
Message-ID: <20260901072446.2563145-3-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260901072446.2563145-1-eleanor.lin@realtek.com>
References: <20260901072446.2563145-1-eleanor.lin@realtek.com>
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

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v14:
- Move Reviewed-by tag to the correct position.
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

