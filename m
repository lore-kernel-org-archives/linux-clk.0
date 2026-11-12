Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461202;
	b=P87MN/PeoBdy4HNrYGUQDaNZLrE1FP9AjkgOK/iLZPuHtCQf68R0DDiCMKP59wXlU+kK
	 EaAJZKNo3QL5pARRFhgrQYkKdNNzUR9W7SWumw7/coyOwBOViPS54tOiJok8jNDi0R7iY
	 Ms6HyMlp1lf7hHJUDuypQ7vufGU309gHB68h/Wd9v9ny1v4hmO8wirwzE7t/xfDJfd4+C
	 n4SkW4SeiNvSCHwBv0CnA+RZz2zPoLr1Sexxo+LwwwZBbYRR1v8QqDHC15qb7zxyDuD/L
	 mIrwjCQjKdRsTiu+0udaEMPftBJvrA66GgWhiYrEdNyokU1DUBIdADMNKc7D3VTE+zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461202;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=hcvKZvtTJRsUCQ7R4+F2QpRoFGIK5JJUC2+FutA0Fu0=;
	b=iRKx9TkqlmTtwBGl3ATMC05kwI8nUHvRRnnnn8xmYloYIdLmhN4F7NkF6WEByCWGqE0u
	 Y1XAgj6L8SqdYBaHlvlgNCFeQZc91DRrYi50hdqwkSqrEANsIu1DNTURm8McT4XykHeoC
	 ImKpNCCTi54lHqFfHIPyHcNH+i6BbNu4X0kxA+ugsGjm1yifm9kf3IZIaSIujfDB1bWSO
	 Vn2hkXLJmNXp+ubQxnm/eRWbmhtFZ93X3dwSacQCswgwfnDNBGRks8GF5sSNeMgYlTIS6
	 btCPfrbEb/jVtLGYOfssvfRFk1o0ZSyaauf2F/tNvZHjvFTJvszOxvlpX3u4Ytz+z6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=LD9yHpQC;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BB9606A33B;
	Thu, 12 Nov 2026 05:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72BB9606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=LD9yHpQC
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AC5PmMoA3459357, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794461148; bh=hcvKZvtTJRsUCQ7R4+F2QpRoFGIK5JJUC2+FutA0Fu0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=LD9yHpQCTgCbxpb0TVh+dJ0Ze33DUR9LQEcwJ+0yzjHcj9C/sF6uaKXjhh4bFhkbi
	 4uToyS8F1ObfjIvjMDPdfw4JlOE+YC6pPoKLppOKpo7rw88IPv58P/t0UNq+mR0eNw
	 K9oX3IyFQLQv8fk/Fwia1bRUawFiH+R2U+vtW9lHIsJ+kX+jLGnwtS6nJMTD4xNzKQ
	 FyTWK2t3AoxWe3Bar4U/A/hwh0PJAAqiX+o9V2B101C+bUFF8FmvVH7WjjLeoHBEHG
	 WhErmXRgD6OzuY9s+pOMoeuFayZ5Q7zVQjXaP2XRfN6myhBM2eHI+l1FycRm2xkyDs
	 a9DKCcuo3A1AQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AC5PmMoA3459357
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Nov 2026 13:25:48 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 13:25:48 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 13:25:47 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Thu, 12 Nov 2026 13:25:47 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v16 8/9] clk: realtek: Add RTD1625-ISO clock controller driver
Date: Thu, 12 Nov 2026 13:25:43 +0800
Message-ID: <20261112052544.555563-9-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261112052544.555563-1-eleanor.lin@realtek.com>
References: <20261112052544.555563-1-eleanor.lin@realtek.com>
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
Changes in v16:
- Remove Brian's reviewed-by tag.
- Switch all gate clock initializations to use '_FW_NAME' macros.
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

