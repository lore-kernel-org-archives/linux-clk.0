Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD967388E7A;
	Tue, 24 Mar 2026 02:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774321015; cv=none; b=t8UMxLFPbmTXm8H4vEDJHcwABFCD1ihbpXcA0d/8YOfv/NWq6F6T5h1koewBT3FGvKAc+CUqsAq87z6N3lpfMUUL5T6E+aoCDIs8FGQhl8lBSIB59Btt0WbuFlQHeXJ9N/UUBFD6xRsiV/gdpXuDzVayIMBtAUQDkteJ5cEGqfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774321015; c=relaxed/simple;
	bh=POOHqqxtA21ajaBz/3NF9f/GPHMg31DqKiT4JanHApU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OLdmmk7xA/wCTh8I6Wdqjfds9iDkr+t0XP1OCUFylMxz650FIDfSKLYQ208DpuNaP8yOwmcTCrHJPO5fP15GC+lCQlMrEezBDRszMJAt4gZFYr7NJu1Nm4xuwHrkP03NRCHns9u/o10UezWfw7hxG247e5YTt/6TD9XPPdZzLmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=CIo6DP7+; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="CIo6DP7+"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62O2rXt65278453, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1774320813; bh=rjkTB/VfnHd5x/i85I4AqRLXhPiPeOFV8rGAGsqWHJg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=CIo6DP7+9d7taoedOZdt6dQv+jc4OazejTpublCG52vwAp/ljZQibRwCWp4mFtBs+
	 CRqAdEckupuD/tgfyMXGgCMkcEItG+3zWdOICT366MTHBiJrkAhkykm6CvPd+6krOM
	 ZcbmdZRBdBF1+B7JNngvLt2FQcZ/nj9nrbM2WyxF85iMrT9f0r1JyepHGlrA5RFB8I
	 WmUR0QzFlaiiqwdXrL47I61G/BXBPX8lj5ZKerbZrAx693rpDYXEaHn4mdl00XtKmm
	 296oEWXH95x9QCxAxMeJvXb69pHT/RmWCnR5IinYfV7fScOW2FoZeC5hNZcIA3E43U
	 PSmKfiEs6lIgw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62O2rXt65278453
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Mar 2026 10:53:33 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 24 Mar 2026 10:53:33 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 24 Mar 2026 10:53:33 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 24 Mar 2026 10:53:33 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>
Subject: [PATCH v5 03/10] reset: Add Realtek basic reset support
Date: Tue, 24 Mar 2026 10:53:24 +0800
Message-ID: <20260324025332.3416977-4-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260324025332.3416977-1-eleanor.lin@realtek.com>
References: <20260324025332.3416977-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Cheng-Yu Lee <cylee12@realtek.com>

Define the reset operations backed by a regmap-based register
interface and prepare the reset controller to be registered
through the reset framework.

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v5:
- Created drivers/reset/realtek/ directory and include/linux/reset/realtek.h.
- Extracted the common reset helpers:
 - Moved the source code to drivers/reset/realtek/common.c and
 - the header to include/linux/reset/realtek.h
- Renamed rtk_reset_bank to rtk_reset_desc.
- Added 'bits' member to rtk_reset_desc structure.
- Removed rtk_reset_get_id() and rtk_reset_get_bank() helper.
- Introduced rtk_reset_get_desc().
---
 MAINTAINERS                    |  1 +
 drivers/reset/Kconfig          |  1 +
 drivers/reset/Makefile         |  1 +
 drivers/reset/realtek/Kconfig  |  3 ++
 drivers/reset/realtek/Makefile |  2 +
 drivers/reset/realtek/common.c | 91 ++++++++++++++++++++++++++++++++++
 include/linux/reset/realtek.h  | 25 ++++++++++
 7 files changed, 124 insertions(+)
 create mode 100644 drivers/reset/realtek/Kconfig
 create mode 100644 drivers/reset/realtek/Makefile
 create mode 100644 drivers/reset/realtek/common.c
 create mode 100644 include/linux/reset/realtek.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 721356d4c02c..9419b0497e0b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22229,6 +22229,7 @@ L:	devicetree@vger.kernel.org
 L:	linux-clk@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/clock/realtek*
+F:	drivers/reset/realtek/*
 F:	include/dt-bindings/clock/realtek*
 
 REALTEK SPI-NAND
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 7ce151f6a7e4..03be1931f264 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -398,6 +398,7 @@ config RESET_ZYNQMP
 
 source "drivers/reset/amlogic/Kconfig"
 source "drivers/reset/hisilicon/Kconfig"
+source "drivers/reset/realtek/Kconfig"
 source "drivers/reset/spacemit/Kconfig"
 source "drivers/reset/starfive/Kconfig"
 source "drivers/reset/sti/Kconfig"
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index fc0cc99f8514..4407d1630070 100644
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
index 000000000000..99a14d355803
--- /dev/null
+++ b/drivers/reset/realtek/Kconfig
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config RESET_RTK_COMMON
+	bool
diff --git a/drivers/reset/realtek/Makefile b/drivers/reset/realtek/Makefile
new file mode 100644
index 000000000000..b59a3f7f2453
--- /dev/null
+++ b/drivers/reset/realtek/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_RESET_RTK_COMMON) += common.o
diff --git a/drivers/reset/realtek/common.c b/drivers/reset/realtek/common.c
new file mode 100644
index 000000000000..b9e3219dc8f7
--- /dev/null
+++ b/drivers/reset/realtek/common.c
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2019 Realtek Semiconductor Corporation
+ */
+
+#include <linux/device.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+#include <linux/reset/realtek.h>
+
+struct rtk_reset_data {
+	struct reset_controller_dev rcdev;
+	struct rtk_reset_desc *descs;
+	struct regmap *regmap;
+};
+
+static inline struct rtk_reset_data *to_rtk_reset_controller(struct reset_controller_dev *r)
+{
+	return container_of(r, struct rtk_reset_data, rcdev);
+}
+
+static inline struct rtk_reset_desc *rtk_reset_get_desc(struct rtk_reset_data *data,
+							unsigned long idx)
+{
+	return &data->descs[idx];
+}
+
+static int rtk_reset_assert(struct reset_controller_dev *rcdev,
+			    unsigned long idx)
+{
+	struct rtk_reset_data *data = to_rtk_reset_controller(rcdev);
+	struct rtk_reset_desc *desc = rtk_reset_get_desc(data, idx);
+	u32 mask = desc->write_en ? (0x3 << desc->bit) : BIT(desc->bit);
+	u32 val  = desc->write_en ? (0x2 << desc->bit) : 0;
+
+	return regmap_update_bits(data->regmap, desc->ofs, mask, val);
+}
+
+static int rtk_reset_deassert(struct reset_controller_dev *rcdev,
+			      unsigned long idx)
+{
+	struct rtk_reset_data *data = to_rtk_reset_controller(rcdev);
+	struct rtk_reset_desc *desc = rtk_reset_get_desc(data, idx);
+	u32 mask = desc->write_en ? (0x3 << desc->bit) : BIT(desc->bit);
+	u32 val  = mask;
+
+	return regmap_update_bits(data->regmap, desc->ofs, mask, val);
+}
+
+static int rtk_reset_status(struct reset_controller_dev *rcdev,
+			    unsigned long idx)
+{
+	struct rtk_reset_data *data = to_rtk_reset_controller(rcdev);
+	struct rtk_reset_desc *desc = rtk_reset_get_desc(data, idx);
+	u32 val;
+	int ret;
+
+	ret = regmap_read(data->regmap, desc->ofs, &val);
+	if (ret)
+		return ret;
+
+	return !((val >> desc->bit) & 1);
+}
+
+static const struct reset_control_ops rtk_reset_ops = {
+	.assert   = rtk_reset_assert,
+	.deassert = rtk_reset_deassert,
+	.status   = rtk_reset_status,
+};
+
+int rtk_reset_controller_add(struct device *dev,
+			     struct rtk_reset_initdata *initdata)
+{
+	struct rtk_reset_data *data;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->regmap          = initdata->regmap;
+	data->descs           = initdata->descs;
+	data->rcdev.owner     = THIS_MODULE;
+	data->rcdev.ops       = &rtk_reset_ops;
+	data->rcdev.dev       = dev;
+	data->rcdev.of_node   = dev->of_node;
+	data->rcdev.nr_resets = initdata->num_descs;
+
+	return devm_reset_controller_register(dev, &data->rcdev);
+}
+EXPORT_SYMBOL_GPL(rtk_reset_controller_add);
diff --git a/include/linux/reset/realtek.h b/include/linux/reset/realtek.h
new file mode 100644
index 000000000000..3c2226e3ed26
--- /dev/null
+++ b/include/linux/reset/realtek.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __LINUX_RESET_REALTEK_H__
+#define __LINUX_RESET_REALTEK_H__
+
+#include <linux/types.h>
+
+struct device;
+struct regmap;
+
+struct rtk_reset_desc {
+	u32 ofs;
+	u32 bit;
+	u32 write_en;
+};
+
+struct rtk_reset_initdata {
+	struct rtk_reset_desc *descs;
+	u32 num_descs;
+	struct regmap *regmap;
+};
+
+int rtk_reset_controller_add(struct device *dev,
+			     struct rtk_reset_initdata *initdata);
+
+#endif /* __LINUX_RESET_REALTEK_H__ */
-- 
2.34.1

