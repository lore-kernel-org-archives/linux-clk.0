Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E46026B0A9;
	Mon, 29 Dec 2025 07:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766994824; cv=none; b=h0GEmZGlYuYVRUQ61dQhBdn2OBTllZeLZyhfYsome2LLj13NlXQ9QmzGrN7i6d2gRhT/a3cxXn1lEabgCC9om0JOPRypMZP5+qStGoBVSjC5r9WHtHc/s0lh1dX+2NXZQo7q/DSrxSJtYQgpDsrqqTrzD+hJP9UY/ZcnDLTv8vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766994824; c=relaxed/simple;
	bh=h8tFoU5prStasKF6Y4zooaiqU8Sj6ilNg5gkFe0JSvA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Whnvg8BJlgT49jNH63yCDiAkpEJmOBHQiDzl1w8MWdh4j0b79+PMzpJbhQM6M0cyu4AFqadjK0Vv3Ho0WuGjR018XiRU1pC2MQELZj7/MPWZcczWsqRUlDZPN5xWOEoSonybj7+YmGVT3JbZ+LNEgXzhRpUjwq7f1nXmiwLrHK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=PNtl+6s3; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="PNtl+6s3"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5BT7rGdV5703582, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1766994796; bh=LzxS3dAR1FL5FoF2wVAPXWUmq+bv2sSZlcav75KV1Tc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=PNtl+6s3VuYvT/WlVZ+ZPkcDRKFpfytlrPBY4a5vyMXPtGfXjjN/6piMw1uFXweEX
	 HBc6WwHC6v0rY372Cxid9iAEg7c7FHgpdsg/bx64e2jdPs7sZ9JYwjpopBbMvfrBrj
	 foIVFTYPFcxSZbbT/9Fo110SDQi2jrqExUBvQ1xaVjTN+YWCg+0U+ZsN6cFmAutkeD
	 uM9qZUv6OspiGpTU1BVQyhyEFfvtlrtfWR8YMDMNjfB6v5TpsfPgVtrq+ad/VW8Dot
	 5nUkdiPcBxj1s+t3B9X0KhFK0+QlACoPDluIRgj32H9H0Yhx9lRZj5+kcSizuwJ2wY
	 43IyMetmgn+nw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5BT7rGdV5703582
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Dec 2025 15:53:16 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 29 Dec 2025 15:53:16 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS04.realtek.com.tw
 (10.21.1.54) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 29 Dec 2025 15:53:16 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <cylee12@realtek.com>, <jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>
Subject: [PATCH 9/9] clk: realtek: Add RTD1625-ISO clock controller driver
Date: Mon, 29 Dec 2025 15:53:13 +0800
Message-ID: <20251229075313.27254-10-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251229075313.27254-1-eleanor.lin@realtek.com>
References: <20251229075313.27254-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add support for the ISO (Isolation) domain clock controller on the Realtek
RTD1625 SoC. This controller manages clocks in the always-on power domain,
ensuring essential services remain functional even when the main system
power is gated.

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 drivers/clk/realtek/Makefile          |   1 +
 drivers/clk/realtek/clk-rtd1625-iso.c | 150 ++++++++++++++++++++++++++
 2 files changed, 151 insertions(+)
 create mode 100644 drivers/clk/realtek/clk-rtd1625-iso.c

diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
index 3cda1e600172..e90fce42a85e 100644
--- a/drivers/clk/realtek/Makefile
+++ b/drivers/clk/realtek/Makefile
@@ -11,3 +11,4 @@ clk-rtk-y += reset.o
 
 clk-rtk-$(CONFIG_RTK_CLK_PLL_MMC) += clk-pll-mmc.o
 obj-$(CONFIG_COMMON_CLK_RTD1625) += clk-rtd1625-crt.o
+obj-$(CONFIG_COMMON_CLK_RTD1625) += clk-rtd1625-iso.o
diff --git a/drivers/clk/realtek/clk-rtd1625-iso.c b/drivers/clk/realtek/clk-rtd1625-iso.c
new file mode 100644
index 000000000000..eb942487befc
--- /dev/null
+++ b/drivers/clk/realtek/clk-rtd1625-iso.c
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#include <dt-bindings/clock/realtek,rtd1625-clk.h>
+#include <linux/clk-provider.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include "clk-regmap-gate.h"
+
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_usb_p4, 0, 0x08c, 0, 0);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_usb_p3, 0, 0x08c, 1, 0);
+static CLK_REGMAP_GATE(clk_en_misc_cec0, "clk_en_misc", 0, 0x08c, 2, 0);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_cbusrx_sys, 0, 0x08c, 3, 0);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_cbustx_sys, 0, 0x08c, 4, 0);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_cbus_sys, 0, 0x08c, 5, 0);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_cbus_osc, 0, 0x08c, 6, 0);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_i2c0, 0, 0x08c, 9, 0);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_i2c1, 0, 0x08c, 10, 0);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_etn_250m, 0, 0x08c, 11, 0);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_etn_sys, 0, 0x08c, 12, 0);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_usb_drd, 0, 0x08c, 13, 0);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_usb_host, 0, 0x08c, 14, 0);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_usb_u3_host, 0, 0x08c, 15, 0);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_usb, 0, 0x08c, 16, 0);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_vtc, 0, 0x08c, 17, 0);
+static CLK_REGMAP_GATE(clk_en_misc_vfd, "clk_en_misc", 0, 0x08c, 18, 0);
+
+static struct clk_regmap *rtd1625_clk_regmap_list[] = {
+	&clk_en_usb_p4.clkr,
+	&clk_en_usb_p3.clkr,
+	&clk_en_misc_cec0.clkr,
+	&clk_en_cbusrx_sys.clkr,
+	&clk_en_cbustx_sys.clkr,
+	&clk_en_cbus_sys.clkr,
+	&clk_en_cbus_osc.clkr,
+	&clk_en_i2c0.clkr,
+	&clk_en_i2c1.clkr,
+	&clk_en_etn_250m.clkr,
+	&clk_en_etn_sys.clkr,
+	&clk_en_usb_drd.clkr,
+	&clk_en_usb_host.clkr,
+	&clk_en_usb_u3_host.clkr,
+	&clk_en_usb.clkr,
+	&clk_en_vtc.clkr,
+	&clk_en_misc_vfd.clkr,
+};
+
+static struct clk_hw_onecell_data rtd1625_iso_clk_data = {
+	.num = RTD1625_ISO_CLK_MAX,
+	.hws = {
+		[RTD1625_ISO_CLK_EN_USB_P4]      = &__clk_regmap_gate_hw(&clk_en_usb_p4),
+		[RTD1625_ISO_CLK_EN_USB_P3]      = &__clk_regmap_gate_hw(&clk_en_usb_p3),
+		[RTD1625_ISO_CLK_EN_MISC_CEC0]   = &__clk_regmap_gate_hw(&clk_en_misc_cec0),
+		[RTD1625_ISO_CLK_EN_CBUSRX_SYS]  = &__clk_regmap_gate_hw(&clk_en_cbusrx_sys),
+		[RTD1625_ISO_CLK_EN_CBUSTX_SYS]  = &__clk_regmap_gate_hw(&clk_en_cbustx_sys),
+		[RTD1625_ISO_CLK_EN_CBUS_SYS]    = &__clk_regmap_gate_hw(&clk_en_cbus_sys),
+		[RTD1625_ISO_CLK_EN_CBUS_OSC]    = &__clk_regmap_gate_hw(&clk_en_cbus_osc),
+		[RTD1625_ISO_CLK_EN_I2C0]        = &__clk_regmap_gate_hw(&clk_en_i2c0),
+		[RTD1625_ISO_CLK_EN_I2C1]        = &__clk_regmap_gate_hw(&clk_en_i2c1),
+		[RTD1625_ISO_CLK_EN_ETN_250M]    = &__clk_regmap_gate_hw(&clk_en_etn_250m),
+		[RTD1625_ISO_CLK_EN_ETN_SYS]     = &__clk_regmap_gate_hw(&clk_en_etn_sys),
+		[RTD1625_ISO_CLK_EN_USB_DRD]     = &__clk_regmap_gate_hw(&clk_en_usb_drd),
+		[RTD1625_ISO_CLK_EN_USB_HOST]    = &__clk_regmap_gate_hw(&clk_en_usb_host),
+		[RTD1625_ISO_CLK_EN_USB_U3_HOST] = &__clk_regmap_gate_hw(&clk_en_usb_u3_host),
+		[RTD1625_ISO_CLK_EN_USB]         = &__clk_regmap_gate_hw(&clk_en_usb),
+		[RTD1625_ISO_CLK_EN_VTC]         = &__clk_regmap_gate_hw(&clk_en_vtc),
+		[RTD1625_ISO_CLK_EN_MISC_VFD]    = &__clk_regmap_gate_hw(&clk_en_misc_vfd),
+		[RTD1625_ISO_CLK_MAX] = NULL,
+	},
+};
+
+static struct rtk_reset_bank rtd1625_iso_reset_banks[] = {
+	{ .ofs = 0x88, },
+};
+
+static const struct rtk_clk_desc rtd1625_iso_desc = {
+	.clk_data        = &rtd1625_iso_clk_data,
+	.clks            = rtd1625_clk_regmap_list,
+	.num_clks        = ARRAY_SIZE(rtd1625_clk_regmap_list),
+	.reset_banks     = rtd1625_iso_reset_banks,
+	.num_reset_banks = ARRAY_SIZE(rtd1625_iso_reset_banks),
+};
+
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_irda, 0, 0x314, 6, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_ur10, CLK_IGNORE_UNUSED, 0x314, 8, 1);
+
+static struct clk_regmap *rtd1625_iso_s_clk_regmap_list[] = {
+	&clk_en_irda.clkr,
+	&clk_en_ur10.clkr,
+};
+
+static struct clk_hw_onecell_data rtd1625_iso_s_clk_data = {
+	.num = RTD1625_ISO_S_CLK_MAX,
+	.hws = {
+		[RTD1625_ISO_S_CLK_EN_IRDA] = &__clk_regmap_gate_hw(&clk_en_irda),
+		[RTD1625_ISO_S_CLK_EN_UR10] = &__clk_regmap_gate_hw(&clk_en_ur10),
+		[RTD1625_ISO_S_CLK_MAX] = NULL,
+	},
+};
+
+static struct rtk_reset_bank rtd1625_iso_s_reset_banks[] = {
+	{ .ofs = 0x310, .write_en = 1, },
+};
+
+static const struct rtk_clk_desc rtd1625_iso_s_desc = {
+	.clk_data        = &rtd1625_iso_s_clk_data,
+	.clks            = rtd1625_iso_s_clk_regmap_list,
+	.num_clks        = ARRAY_SIZE(rtd1625_iso_s_clk_regmap_list),
+	.reset_banks     = rtd1625_iso_s_reset_banks,
+	.num_reset_banks = ARRAY_SIZE(rtd1625_iso_s_reset_banks),
+};
+
+static int rtd1625_iso_probe(struct platform_device *pdev)
+{
+	const struct rtk_clk_desc *desc;
+
+	desc = of_device_get_match_data(&pdev->dev);
+	if (!desc)
+		return -EINVAL;
+	return rtk_clk_probe(pdev, desc);
+}
+
+static const struct of_device_id rtd1625_iso_match[] = {
+	{ .compatible = "realtek,rtd1625-iso-clk", .data = &rtd1625_iso_desc },
+	{ .compatible = "realtek,rtd1625-iso-s-clk", .data = &rtd1625_iso_s_desc },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver rtd1625_iso_driver = {
+	.probe = rtd1625_iso_probe,
+	.driver = {
+		.name = "rtk-rtd1625-iso-clk",
+		.of_match_table = rtd1625_iso_match,
+	},
+};
+
+static int __init rtd1625_iso_init(void)
+{
+	return platform_driver_register(&rtd1625_iso_driver);
+}
+subsys_initcall(rtd1625_iso_init);
+
+MODULE_DESCRIPTION("Realtek RTD1625 ISO Controller Driver");
+MODULE_AUTHOR("Cheng-Yu Lee <cylee12@realtek.com>");
+MODULE_LICENSE("GPL");
-- 
2.34.1

