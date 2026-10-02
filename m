Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4537343DA20;
	Fri,  2 Oct 2026 07:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790927072; cv=none; b=UV8iSKD/R8qoaAa1FxuE5qNxVJF05Q0b9s7gQGEzr3MdFTGF/t+q+K22XdeeAGX8nPyEhCk7E/1vza51foK1s9kl7Tbzd8aUfR+ZBq8HM0/Jkx0vxHgCqIjJ9t80C+4hVVaJzXOogVW5e/Z7llT/MMA3p4espy80V97T55jor8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790927072; c=relaxed/simple;
	bh=k1BWjynAjo9kguBw5af9GPjRrxdh5zJd+tQQpDBaSZo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sRLMaEOdES1NmxJFcVCL2og1CLK1c0xbt59ZT2TTEJc6I2x2Zp9Myjedttpnn0pMAeS9GJXcFbmaSTq3c1aNzv2aQlNWkGZiHFHsr850RwlZeN/FTLUIWmin9xUv/4pKYy0ZUJ2b3zPZht41qa/jbC9jrm4rCApuTz4aNzfD25U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=b+gdVM3a; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="b+gdVM3a"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6927hZm553646752, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1790927015; bh=7Wxkghw+RAWX/vV1Z0UBQHh7h9RS8Ulkr1yE8/JVcZ0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=b+gdVM3aqKzUmWt0DflvDMXP6CKak1U6mFxdPL+hUgEGLOYsryutM0zydI5QS0g1u
	 C6+O9SP3arORNd5bEwfbkCofYCVZvElKBGxjIIMH5sdXllRHzqPwh8XKvS/Ct6Ua3a
	 J0kXBBVSTHxN5hW08d7bgGP6IaAMi02IXqYqyk3MJUxwA0hvsC/X7dkTyCl/FPzX3E
	 BbPwNR3GUWPM/9FWF2TexSLLView8iSoA/6OvGINJivmr3OUZOn+cFJwkFAHe9Vs3x
	 qq+gX5Gdxu7U3Xqgzn7qcvjLguN5HEyboD/um6D/NjjqR+w2yXbuKWdaRYULPVZIxl
	 RM93Nk6cs06PA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6927hZm553646752
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 Oct 2026 15:43:35 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 15:43:34 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Fri, 2 Oct 2026 15:43:34 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <jbrunet+clk@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>,
	<bmasney+clk@redhat.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>, Brian Masney <bmasney@redhat.com>
Subject: [PATCH v15 10/11] clk: realtek: Add RTD1625-ISO clock controller driver
Date: Fri, 2 Oct 2026 15:43:30 +0800
Message-ID: <20261002074331.3066919-11-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261002074331.3066919-1-eleanor.lin@realtek.com>
References: <20261002074331.3066919-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
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
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
Changes in v15:
- Assign parents to gate clocks.
---
 drivers/clk/realtek/Makefile          |   1 +
 drivers/clk/realtek/clk-rtd1625-iso.c | 140 ++++++++++++++++++++++++++
 2 files changed, 141 insertions(+)
 create mode 100644 drivers/clk/realtek/clk-rtd1625-iso.c

diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
index 52d5d1b18104..e8d9017098d3 100644
--- a/drivers/clk/realtek/Makefile
+++ b/drivers/clk/realtek/Makefile
@@ -9,3 +9,4 @@ clk-rtk-y += freq_table.o
 
 clk-rtk-$(CONFIG_RTK_CLK_PLL_MMC) += clk-pll-mmc.o
 obj-$(CONFIG_CLK_RTD1625) += clk-rtd1625-crt.o
+obj-$(CONFIG_CLK_RTD1625) += clk-rtd1625-iso.o
diff --git a/drivers/clk/realtek/clk-rtd1625-iso.c b/drivers/clk/realtek/clk-rtd1625-iso.c
new file mode 100644
index 000000000000..cd520c6e1259
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
+static RTK_CLK_REGMAP_GATE(clk_en_usb_p4, "clk_sys", 0, 0x8c, 0, 0);
+static RTK_CLK_REGMAP_GATE(clk_en_usb_p3, "clk_sys", 0, 0x8c, 1, 0);
+static RTK_CLK_REGMAP_GATE(clk_en_misc_cec0, "clk_en_misc", 0, 0x8c, 2, 0);
+static RTK_CLK_REGMAP_GATE(clk_en_cbusrx_sys, "clk_sys", 0, 0x8c, 3, 0);
+static RTK_CLK_REGMAP_GATE(clk_en_cbustx_sys, "clk_sys", 0, 0x8c, 4, 0);
+static RTK_CLK_REGMAP_GATE(clk_en_cbus_sys, "clk_sys", 0, 0x8c, 5, 0);
+static RTK_CLK_REGMAP_GATE(clk_en_cbus_osc, "osc27m", 0, 0x8c, 6, 0);
+static RTK_CLK_REGMAP_GATE(clk_en_i2c0, "clk_ddsa_div4", 0, 0x8c, 9, 0);
+static RTK_CLK_REGMAP_GATE(clk_en_i2c1, "osc27m", 0, 0x8c, 10, 0);
+static RTK_CLK_REGMAP_GATE(clk_en_etn_250m, "clk_sys", 0, 0x8c, 11, 0);
+static RTK_CLK_REGMAP_GATE(clk_en_etn_sys, "clk_sys", 0, 0x8c, 12, 0);
+static RTK_CLK_REGMAP_GATE(clk_en_usb_drd, "clk_sys", 0, 0x8c, 13, 0);
+static RTK_CLK_REGMAP_GATE(clk_en_usb_host, "clk_sys", 0, 0x8c, 14, 0);
+static RTK_CLK_REGMAP_GATE(clk_en_usb_u3_host, "clk_sys", 0, 0x8c, 15, 0);
+static RTK_CLK_REGMAP_GATE(clk_en_usb, "clk_sys", 0, 0x8c, 16, 0);
+static RTK_CLK_REGMAP_GATE(clk_en_vtc, "osc27m", 0, 0x8c, 17, 0);
+static RTK_CLK_REGMAP_GATE(clk_en_misc_vfd, "clk_en_misc", 0, 0x8c, 18, 0);
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
+static RTK_CLK_REGMAP_GATE(clk_en_irda, "osc27m", 0, 0x314, 6, 1);
+static RTK_CLK_REGMAP_GATE(clk_en_ur10, "osc27m", 0, 0x314, 8, 1);
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

