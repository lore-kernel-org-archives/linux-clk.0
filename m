Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795487832;
	b=VWOJaerSgQjF39m5D3vXeaPCtrQIuBS6q/fnJ8DvisVW2WwLNvZxXXtSqFx47e7T1Puh
	 H/0QX69Mr2i2qSjiyxmi3KdANptaIwRw0T5Y61Gul84fUGrpwM1mWJIH5BTxLxfsLqY7V
	 6UEH9mptsftayIu0TPeYPlEGntJKuerxpG7JK9iB2ObrkzUl2Cyox1v5nlAYdn+8/h7aP
	 dX+HpWhe6I+mNXz6wtzlFREqIICAYC80zHhEreusMmLSnXql/4g2nsCuOI+iiTXdgYSdf
	 y+MHoUtFqlFLGZL/SBl7kIOSTu1VRfsrBFnW9yKbWy/l0w9qcirpcg4lIlyb2aAgCAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795487832;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=iSBfHYC766Er5k6D7G0vDeLrn6A14KKB3+Y+EkIqbU4=;
	b=3LERc9NruaibjKO+mfGtohr5X76btYNWUOnIjZAEiU9fuIXrpmb0TrmvFGVJkOAHJwof
	 kTjJq7E600xDklT2CFvwMbDaXQti9tfo77juAFgNp74I4EHU9XGFo2hUfOllKEd4PoV1i
	 PlAVrBS/fjnFcnh7SJP4gmMtShzJLK4v+vGPC07FfDuR948UG6WeRhS+hQ2dEykODcWmT
	 u4JMU0aSl6C8NJNb1MvGLF9QnIEaxNwkD1VMXkycZ5I1OtQV19C4PA/KC2DHlzHbBV0nF
	 nRL/mdo3Fl3GNnoawunf4vvF4xF9XPS1I8huGA/zmsR5EAyKaI35cxQmtdPkuyE7W6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=W5ly4NrL;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7A2606A6B4;
	Tue, 24 Nov 2026 02:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE7A2606A6B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=W5ly4NrL
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AO2a0HI12160562, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795487760; bh=iSBfHYC766Er5k6D7G0vDeLrn6A14KKB3+Y+EkIqbU4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=W5ly4NrLLG+3heNOFjed+TLIgKoXbWCjPUE8HcWubzgT61gkd252I9wGdFUr+J8NT
	 sIxC9LAg07mhrTN/JKFaZAYLlvg5CWaYoFjL6IT1Y3nFQFaL8eSWPPGIfB/s0cTtgm
	 x29GKfQq8r64N0td5fxfImtzFYNJRinGOscB1bjSAhfelgMjXAoWEvAF4OZ+Q+nruh
	 PV2N2WKsHUnF5xDvCaOjGJC9fHExm7vcSdPOekY+3WPVrZSRdZShvK83JlLmFfww8o
	 cexol4xblXy78GrEtNLLP9UZapJ8TCzq5B3OxnDPyqlZbgtEQHLuC7OLWqMTvhs+BP
	 6RyQXiSxCSgQw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AO2a0HI12160562
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Nov 2026 10:36:00 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 10:36:00 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Tue, 24 Nov 2026 10:36:00 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v17 8/9] clk: realtek: Add RTD1625-ISO clock controller driver
Date: Tue, 24 Nov 2026 10:35:56 +0800
Message-ID: <20261124023558.4088635-9-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261124023558.4088635-1-eleanor.lin@realtek.com>
References: <20261124023558.4088635-1-eleanor.lin@realtek.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Cheng-Yu Lee <cylee12@realtek.com>

Add support for the ISO (Isolation) domain clock controller on the Realtek
RTD1625 SoC. This controller manages clocks in the always-on power domain,
ensuring essential services remain functional even when the main system
power is gated.

Because the reset controller shares the same register space with this ISO
clock controller, this driver also acts as the parent device and registers
the reset controller as an auxiliary device on the auxiliary bus.

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v17:
- None.
---
 drivers/clk/realtek/Makefile          |   1 +
 drivers/clk/realtek/clk-rtd1625-iso.c | 140 ++++++++++++++++++++++++++
 2 files changed, 141 insertions(+)
 create mode 100644 drivers/clk/realtek/clk-rtd1625-iso.c

diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
index dd4c667e9808..04990a44c88a 100644
--- a/drivers/clk/realtek/Makefile
+++ b/drivers/clk/realtek/Makefile
@@ -9,3 +9,4 @@ clk-rtk-y += freq_table.o
 
 clk-rtk-$(CONFIG_RTK_CLK_PLL_MMC) += clk-regmap-pll-mmc.o
 obj-$(CONFIG_CLK_RTD1625) += clk-rtd1625-crt.o
+obj-$(CONFIG_CLK_RTD1625) += clk-rtd1625-iso.o
diff --git a/drivers/clk/realtek/clk-rtd1625-iso.c b/drivers/clk/realtek/clk-rtd1625-iso.c
new file mode 100644
index 000000000000..f7fd346ea964
--- /dev/null
+++ b/drivers/clk/realtek/clk-rtd1625-iso.c
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024-2026 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#include <dt-bindings/clock/realtek,rtd1625-clk.h>
+#include <linux/array_size.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include "clk-regmap-gate.h"
+
+#define RTD1625_ISO_CLK_MAX	19
+#define RTD1625_ISO_S_CLK_MAX	5
+
+static RTK_CLK_REGMAP_GATE_FW_NAME(clk_en_usb_p4, "clk_sys", 0, 0x4, 0, 0);
+static RTK_CLK_REGMAP_GATE_FW_NAME(clk_en_usb_p3, "clk_sys", 0, 0x4, 1, 0);
+static RTK_CLK_REGMAP_GATE_FW_NAME(clk_en_misc_cec0, "clk_en_misc", 0, 0x4, 2, 0);
+static RTK_CLK_REGMAP_GATE_FW_NAME(clk_en_cbusrx_sys, "clk_sys", 0, 0x4, 3, 0);
+static RTK_CLK_REGMAP_GATE_FW_NAME(clk_en_cbustx_sys, "clk_sys", 0, 0x4, 4, 0);
+static RTK_CLK_REGMAP_GATE_FW_NAME(clk_en_cbus_sys, "clk_sys", 0, 0x4, 5, 0);
+static RTK_CLK_REGMAP_GATE_FW_NAME(clk_en_cbus_osc, "osc27m", 0, 0x4, 6, 0);
+static RTK_CLK_REGMAP_GATE_FW_NAME(clk_en_i2c0, "clk_ddsa_div4", 0, 0x4, 9, 0);
+static RTK_CLK_REGMAP_GATE_FW_NAME(clk_en_i2c1, "osc27m", 0, 0x4, 10, 0);
+static RTK_CLK_REGMAP_GATE_FW_NAME(clk_en_etn_250m, "clk_sys", 0, 0x4, 11, 0);
+static RTK_CLK_REGMAP_GATE_FW_NAME(clk_en_etn_sys, "clk_sys", 0, 0x4, 12, 0);
+static RTK_CLK_REGMAP_GATE_FW_NAME(clk_en_usb_drd, "clk_sys", 0, 0x4, 13, 0);
+static RTK_CLK_REGMAP_GATE_FW_NAME(clk_en_usb_host, "clk_sys", 0, 0x4, 14, 0);
+static RTK_CLK_REGMAP_GATE_FW_NAME(clk_en_usb_u3_host, "clk_sys", 0, 0x4, 15, 0);
+static RTK_CLK_REGMAP_GATE_FW_NAME(clk_en_usb, "clk_sys", 0, 0x4, 16, 0);
+static RTK_CLK_REGMAP_GATE_FW_NAME(clk_en_vtc, "osc27m", 0, 0x4, 17, 0);
+static RTK_CLK_REGMAP_GATE_FW_NAME(clk_en_misc_vfd, "clk_en_misc", 0, 0x4, 18, 0);
+
+static struct rtk_clk_regmap *rtd1625_iso_clk_regmap_list[] = {
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
+		[RTD1625_ISO_CLK_EN_USB_P4]      = &__rtk_clk_regmap_gate_hw(&clk_en_usb_p4),
+		[RTD1625_ISO_CLK_EN_USB_P3]      = &__rtk_clk_regmap_gate_hw(&clk_en_usb_p3),
+		[RTD1625_ISO_CLK_EN_MISC_CEC0]   = &__rtk_clk_regmap_gate_hw(&clk_en_misc_cec0),
+		[RTD1625_ISO_CLK_EN_CBUSRX_SYS]  = &__rtk_clk_regmap_gate_hw(&clk_en_cbusrx_sys),
+		[RTD1625_ISO_CLK_EN_CBUSTX_SYS]  = &__rtk_clk_regmap_gate_hw(&clk_en_cbustx_sys),
+		[RTD1625_ISO_CLK_EN_CBUS_SYS]    = &__rtk_clk_regmap_gate_hw(&clk_en_cbus_sys),
+		[RTD1625_ISO_CLK_EN_CBUS_OSC]    = &__rtk_clk_regmap_gate_hw(&clk_en_cbus_osc),
+		[RTD1625_ISO_CLK_EN_I2C0]        = &__rtk_clk_regmap_gate_hw(&clk_en_i2c0),
+		[RTD1625_ISO_CLK_EN_I2C1]        = &__rtk_clk_regmap_gate_hw(&clk_en_i2c1),
+		[RTD1625_ISO_CLK_EN_ETN_250M]    = &__rtk_clk_regmap_gate_hw(&clk_en_etn_250m),
+		[RTD1625_ISO_CLK_EN_ETN_SYS]     = &__rtk_clk_regmap_gate_hw(&clk_en_etn_sys),
+		[RTD1625_ISO_CLK_EN_USB_DRD]     = &__rtk_clk_regmap_gate_hw(&clk_en_usb_drd),
+		[RTD1625_ISO_CLK_EN_USB_HOST]    = &__rtk_clk_regmap_gate_hw(&clk_en_usb_host),
+		[RTD1625_ISO_CLK_EN_USB_U3_HOST] = &__rtk_clk_regmap_gate_hw(&clk_en_usb_u3_host),
+		[RTD1625_ISO_CLK_EN_USB]         = &__rtk_clk_regmap_gate_hw(&clk_en_usb),
+		[RTD1625_ISO_CLK_EN_VTC]         = &__rtk_clk_regmap_gate_hw(&clk_en_vtc),
+		[RTD1625_ISO_CLK_EN_MISC_VFD]    = &__rtk_clk_regmap_gate_hw(&clk_en_misc_vfd),
+	},
+};
+
+static const struct rtk_clk_desc rtd1625_iso_desc = {
+	.clk_data = &rtd1625_iso_clk_data,
+	.clks     = rtd1625_iso_clk_regmap_list,
+	.num_clks = ARRAY_SIZE(rtd1625_iso_clk_regmap_list),
+	.aux_name = "rtd1625_iso_rst",
+};
+
+static RTK_CLK_REGMAP_GATE_FW_NAME(clk_en_irda, "osc27m", 0, 0x4, 6, 1);
+static RTK_CLK_REGMAP_GATE_FW_NAME(clk_en_ur10, "osc27m", 0, 0x4, 8, 1);
+
+static struct rtk_clk_regmap *rtd1625_iso_s_clk_regmap_list[] = {
+	&clk_en_irda.clkr,
+	&clk_en_ur10.clkr,
+};
+
+static struct clk_hw_onecell_data rtd1625_iso_s_clk_data = {
+	.num = RTD1625_ISO_S_CLK_MAX,
+	.hws = {
+		[RTD1625_ISO_S_CLK_EN_IRDA] = &__rtk_clk_regmap_gate_hw(&clk_en_irda),
+		[RTD1625_ISO_S_CLK_EN_UR10] = &__rtk_clk_regmap_gate_hw(&clk_en_ur10),
+	},
+};
+
+static const struct rtk_clk_desc rtd1625_iso_s_desc = {
+	.clk_data = &rtd1625_iso_s_clk_data,
+	.clks     = rtd1625_iso_s_clk_regmap_list,
+	.num_clks = ARRAY_SIZE(rtd1625_iso_s_clk_regmap_list),
+	.aux_name = "rtd1625_iso_s_rst",
+};
+
+static int rtd1625_iso_probe(struct platform_device *pdev)
+{
+	const struct rtk_clk_desc *desc;
+
+	desc = device_get_match_data(&pdev->dev);
+	if (!desc)
+		return -EINVAL;
+
+	return rtk_clk_probe(pdev, desc);
+}
+
+static const struct of_device_id rtd1625_iso_match[] = {
+	{ .compatible = "realtek,rtd1625-iso-clk", .data = &rtd1625_iso_desc },
+	{ .compatible = "realtek,rtd1625-iso-s-clk", .data = &rtd1625_iso_s_desc },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, rtd1625_iso_match);
+
+static struct platform_driver rtd1625_iso_driver = {
+	.probe = rtd1625_iso_probe,
+	.driver = {
+		.name = "rtk-rtd1625-iso-clk",
+		.of_match_table = rtd1625_iso_match,
+		.suppress_bind_attrs = true,
+	},
+};
+
+module_platform_driver(rtd1625_iso_driver);
+
+MODULE_DESCRIPTION("Realtek RTD1625 ISO Clock Controller Driver");
+MODULE_AUTHOR("Cheng-Yu Lee <cylee12@realtek.com>");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("CLK_REALTEK");
-- 
2.43.0

