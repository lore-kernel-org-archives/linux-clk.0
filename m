Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4645E3AFAFF;
	Wed, 24 Jun 2026 11:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782300648; cv=none; b=tWJburKqfQW9g+CROyAD20CMj5zbeq9BVAAGB3qIldeONfDG21+B4th25hDDCOvLtqcILb/2SJoMnoHbNs1DkIWL67IS3d4RUp6Mf1NbocUeUeZWJbzDPgGA788G8XurY8xtNCfdypneduIJoUzfj60nfW1BYGfLd9Stgg4dOsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782300648; c=relaxed/simple;
	bh=4zAIKVaBDV8RNjMv7doT6OtzLE/Hx/3v+vflDNwy7Ck=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kuXIKHeh4vcUxYuQNhCieTJcRMt571nkqhGoRM1clPB2PK9elEdKgE6k3LI1MoLGro2kHwfHHy+VWkUJP6FSHseWhgFEiNubnR6UFG80f7GlfbtwXXqjKh5/2XuL3oi21g5UEZUyYr6bVgPjvTckI4u4xCrHlFRnEdf1ezWTJTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=v4Jpfd6U; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="v4Jpfd6U"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 65OBTjVE24147249, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1782300585; bh=dhnB0pP402SqoVLAJUyn6Iw7GsQ/hopKBFb4FnkfASg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=v4Jpfd6Uq3euz+uvkiBp/Dq3Pv1j8zsd6plCeltPAVvnqns0Lh5dBNyma6cud3+Rd
	 wrLhEVflRaVLy2e8IZoOOq4YVyAQ614eG505bVuztk2SyuEHQqxcstvm02B1rXwTdA
	 33afXMIYw9kZTzU35nMLuwSpNSFdjpdiZZEB+thjL+6AJshwM85PZyZZbOLuLLC8ex
	 6yX5WEQVXhotVCdSfSXfQXsBl48OiQ/6DaU3QIfJ49NE2S53OmGkzjIsHfKiOn3/hW
	 g5h/JnG0rngDCcL0489Zdf/PUGFqI2/qORtlk2iPsUNtggq8SmJPPkkTnhq6gDBHIR
	 nwR5Tvy9f/7gA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 65OBTjVE24147249
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 Jun 2026 19:29:45 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Jun 2026 19:29:45 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Jun 2026 19:29:43 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 24 Jun 2026 19:29:43 +0800
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
Subject: [PATCH v9 03/12] reset: realtek: Add RTD1625-CRT reset driver
Date: Wed, 24 Jun 2026 19:29:31 +0800
Message-ID: <20260624112940.3475605-4-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260624112940.3475605-1-eleanor.lin@realtek.com>
References: <20260624112940.3475605-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Cheng-Yu Lee <cylee12@realtek.com>

Add support for the CRT (Clock, Reset, and Test) domain reset controller on
the Realtek RTD1625 SoC.

The reset controller shares the same register space with the CRT clock
controller. To handle this shared register space, the reset driver is
implemented as an auxiliary driver. It will be instantiated and probed via
the auxiliary bus by the RTD1625-CRT clock controller driver.

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v9:
- Extract reset-related code from the previous clock driver patch
(formerly patch 8 in v8).
---
 drivers/reset/realtek/Kconfig             |  11 ++
 drivers/reset/realtek/Makefile            |   1 +
 drivers/reset/realtek/reset-rtd1625-crt.c | 187 ++++++++++++++++++++++
 3 files changed, 199 insertions(+)
 create mode 100644 drivers/reset/realtek/reset-rtd1625-crt.c

diff --git a/drivers/reset/realtek/Kconfig b/drivers/reset/realtek/Kconfig
index bb6dd856a64a..b122e6334508 100644
--- a/drivers/reset/realtek/Kconfig
+++ b/drivers/reset/realtek/Kconfig
@@ -6,3 +6,14 @@ config RESET_RTK_COMMON
 	  Realtek SoCs. It provides shared reset control operations
 	  (assert, deassert, status) and a registration helper function
 	  that other Realtek-specific reset drivers can use.
+
+config RESET_RTD1625
+	tristate "RTD1625 Reset Controller"
+	depends on ARCH_REALTEK || COMPILE_TEST
+	select RESET_RTK_COMMON
+	select AUXILIARY_BUS
+	help
+	  This enables the reset controller driver for Realtek RTD1625 SoC.
+	  The driver controls reset lines for various peripherals including
+	  PCIe, SATA, HDMI, display, video encoder/decoder, USB, SD, audio,
+	  and other subsystems.
diff --git a/drivers/reset/realtek/Makefile b/drivers/reset/realtek/Makefile
index 6d68e41748bf..c3f605ffb11c 100644
--- a/drivers/reset/realtek/Makefile
+++ b/drivers/reset/realtek/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_RESET_RTK_COMMON) += reset-rtk-common.o
+obj-$(CONFIG_RESET_RTD1625) += reset-rtd1625-crt.o
diff --git a/drivers/reset/realtek/reset-rtd1625-crt.c b/drivers/reset/realtek/reset-rtd1625-crt.c
new file mode 100644
index 000000000000..5c0508577141
--- /dev/null
+++ b/drivers/reset/realtek/reset-rtd1625-crt.c
@@ -0,0 +1,187 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Realtek Semiconductor Corporation
+ */
+
+#include <dt-bindings/reset/realtek,rtd1625.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/slab.h>
+#include "reset-rtk-common.h"
+
+#define RTD1625_CRT_RSTN_MAX	123
+
+static const struct rtk_reset_desc rtd1625_crt_reset_descs[] = {
+	/* Bank 0: offset 0x0 */
+	[RTD1625_CRT_RSTN_MISC]         = { .ofs = 0x0, .bit = 0,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_DIP]          = { .ofs = 0x0, .bit = 2,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_GSPI]         = { .ofs = 0x0, .bit = 4,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SDS]          = { .ofs = 0x0, .bit = 6,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SDS_REG]      = { .ofs = 0x0, .bit = 8,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SDS_PHY]      = { .ofs = 0x0, .bit = 10, .write_en = 1 },
+	[RTD1625_CRT_RSTN_GPU2D]        = { .ofs = 0x0, .bit = 12, .write_en = 1 },
+	[RTD1625_CRT_RSTN_DC_PHY]       = { .ofs = 0x0, .bit = 22, .write_en = 1 },
+	[RTD1625_CRT_RSTN_DCPHY_CRT]    = { .ofs = 0x0, .bit = 24, .write_en = 1 },
+	[RTD1625_CRT_RSTN_LSADC]        = { .ofs = 0x0, .bit = 26, .write_en = 1 },
+	[RTD1625_CRT_RSTN_SE]           = { .ofs = 0x0, .bit = 28, .write_en = 1 },
+	[RTD1625_CRT_RSTN_DLA]          = { .ofs = 0x0, .bit = 30, .write_en = 1 },
+	/* Bank 1: offset 0x4 */
+	[RTD1625_CRT_RSTN_JPEG]         = { .ofs = 0x4, .bit = 0,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SD]           = { .ofs = 0x4, .bit = 2,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SDIO]         = { .ofs = 0x4, .bit = 6,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCR_CNT]      = { .ofs = 0x4, .bit = 8,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE0_STITCH] = { .ofs = 0x4, .bit = 10, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE0_PHY]    = { .ofs = 0x4, .bit = 12, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE0]        = { .ofs = 0x4, .bit = 14, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE0_CORE]   = { .ofs = 0x4, .bit = 16, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE0_POWER]  = { .ofs = 0x4, .bit = 18, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE0_NONSTICH] = { .ofs = 0x4, .bit = 20, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE0_PHY_MDIO] = { .ofs = 0x4, .bit = 22, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE0_SGMII_MDIO] = { .ofs = 0x4, .bit = 24, .write_en = 1 },
+	[RTD1625_CRT_RSTN_VO2]          = { .ofs = 0x4, .bit = 28, .write_en = 1 },
+	[RTD1625_CRT_RSTN_MISC_SC0]     = { .ofs = 0x4, .bit = 30, .write_en = 1 },
+	/* Bank 2: offset 0x8 */
+	[RTD1625_CRT_RSTN_MD]           = { .ofs = 0x8, .bit = 4,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_LVDS1]        = { .ofs = 0x8, .bit = 6,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_LVDS2]        = { .ofs = 0x8, .bit = 8,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_MISC_SC1]     = { .ofs = 0x8, .bit = 10, .write_en = 1 },
+	[RTD1625_CRT_RSTN_I2C_3]        = { .ofs = 0x8, .bit = 12, .write_en = 1 },
+	[RTD1625_CRT_RSTN_FAN]          = { .ofs = 0x8, .bit = 14, .write_en = 1 },
+	[RTD1625_CRT_RSTN_TVE]          = { .ofs = 0x8, .bit = 16, .write_en = 1 },
+	[RTD1625_CRT_RSTN_AIO]          = { .ofs = 0x8, .bit = 18, .write_en = 1 },
+	[RTD1625_CRT_RSTN_VO]           = { .ofs = 0x8, .bit = 20, .write_en = 1 },
+	[RTD1625_CRT_RSTN_MIPI_CSI]     = { .ofs = 0x8, .bit = 22, .write_en = 1 },
+	[RTD1625_CRT_RSTN_HDMIRX]       = { .ofs = 0x8, .bit = 24, .write_en = 1 },
+	[RTD1625_CRT_RSTN_HDMIRX_WRAP]  = { .ofs = 0x8, .bit = 26, .write_en = 1 },
+	[RTD1625_CRT_RSTN_HDMI]         = { .ofs = 0x8, .bit = 28, .write_en = 1 },
+	[RTD1625_CRT_RSTN_DISP]         = { .ofs = 0x8, .bit = 30, .write_en = 1 },
+	/* Bank 3: offset 0xc */
+	[RTD1625_CRT_RSTN_SATA_PHY_POW1] = { .ofs = 0xc, .bit = 0,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SATA_PHY_POW0] = { .ofs = 0xc, .bit = 2,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SATA_MDIO1]   = { .ofs = 0xc, .bit = 4,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SATA_MDIO0]   = { .ofs = 0xc, .bit = 6,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SATA_WRAP]    = { .ofs = 0xc, .bit = 8,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SATA_MAC_P1]  = { .ofs = 0xc, .bit = 10, .write_en = 1 },
+	[RTD1625_CRT_RSTN_SATA_MAC_P0]  = { .ofs = 0xc, .bit = 12, .write_en = 1 },
+	[RTD1625_CRT_RSTN_SATA_MAC_COM] = { .ofs = 0xc, .bit = 14, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE1_STITCH] = { .ofs = 0xc, .bit = 16, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE1_PHY]     = { .ofs = 0xc, .bit = 18, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE1]         = { .ofs = 0xc, .bit = 20, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE1_CORE]   = { .ofs = 0xc, .bit = 22, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE1_POWER]  = { .ofs = 0xc, .bit = 24, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE1_NONSTICH] = { .ofs = 0xc, .bit = 26, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE1_PHY_MDIO] = { .ofs = 0xc, .bit = 28, .write_en = 1 },
+	[RTD1625_CRT_RSTN_HDMITOP]      = { .ofs = 0xc, .bit = 30, .write_en = 1 },
+	/* Bank 4: offset 0x68 */
+	[RTD1625_CRT_RSTN_I2C_4]        = { .ofs = 0x68, .bit = 2,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_I2C_5]        = { .ofs = 0x68, .bit = 4,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_TSIO]         = { .ofs = 0x68, .bit = 6,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_VI]           = { .ofs = 0x68, .bit = 8,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_EDP]          = { .ofs = 0x68, .bit = 10, .write_en = 1 },
+	[RTD1625_CRT_RSTN_VE1_MMU]      = { .ofs = 0x68, .bit = 12, .write_en = 1 },
+	[RTD1625_CRT_RSTN_VE1_MMU_FUNC] = { .ofs = 0x68, .bit = 14, .write_en = 1 },
+	[RTD1625_CRT_RSTN_HSE_MMU]      = { .ofs = 0x68, .bit = 16, .write_en = 1 },
+	[RTD1625_CRT_RSTN_HSE_MMU_FUNC] = { .ofs = 0x68, .bit = 18, .write_en = 1 },
+	[RTD1625_CRT_RSTN_MDLM2M]       = { .ofs = 0x68, .bit = 20, .write_en = 1 },
+	[RTD1625_CRT_RSTN_ISO_GSPI]     = { .ofs = 0x68, .bit = 22, .write_en = 1 },
+	[RTD1625_CRT_RSTN_SOFT_NPU]     = { .ofs = 0x68, .bit = 24, .write_en = 1 },
+	[RTD1625_CRT_RSTN_SPI2EMMC]     = { .ofs = 0x68, .bit = 26, .write_en = 1 },
+	[RTD1625_CRT_RSTN_EARC]         = { .ofs = 0x68, .bit = 28, .write_en = 1 },
+	[RTD1625_CRT_RSTN_VE1]          = { .ofs = 0x68, .bit = 30, .write_en = 1 },
+	/* Bank 5: offset 0x90 */
+	[RTD1625_CRT_RSTN_PCIE2_STITCH]  = { .ofs = 0x90, .bit = 0,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE2_PHY]    = { .ofs = 0x90, .bit = 2,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE2]        = { .ofs = 0x90, .bit = 4,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE2_CORE]   = { .ofs = 0x90, .bit = 6,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE2_POWER]  = { .ofs = 0x90, .bit = 8,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE2_NONSTICH] = { .ofs = 0x90, .bit = 10, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE2_PHY_MDIO] = { .ofs = 0x90, .bit = 12, .write_en = 1 },
+	[RTD1625_CRT_RSTN_DCPHY_UMCTL2] = { .ofs = 0x90, .bit = 14, .write_en = 1 },
+	[RTD1625_CRT_RSTN_MIPI_DSI]     = { .ofs = 0x90, .bit = 16, .write_en = 1 },
+	[RTD1625_CRT_RSTN_HIFM]         = { .ofs = 0x90, .bit = 18, .write_en = 1 },
+	[RTD1625_CRT_RSTN_NSRAM]        = { .ofs = 0x90, .bit = 20, .write_en = 1 },
+	[RTD1625_CRT_RSTN_AUCPU0_REG]   = { .ofs = 0x90, .bit = 22, .write_en = 1 },
+	[RTD1625_CRT_RSTN_MDL_GENPW]    = { .ofs = 0x90, .bit = 24, .write_en = 1 },
+	[RTD1625_CRT_RSTN_MDL_CHIP]     = { .ofs = 0x90, .bit = 26, .write_en = 1 },
+	[RTD1625_CRT_RSTN_MDL_IP]       = { .ofs = 0x90, .bit = 28, .write_en = 1 },
+	[RTD1625_CRT_RSTN_TEST_MUX]     = { .ofs = 0x90, .bit = 30, .write_en = 1 },
+	/* Bank 6: offset 0xb8 */
+	[RTD1625_CRT_RSTN_ISO_BIST]     = { .ofs = 0xb8, .bit = 0,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_MAIN_BIST]    = { .ofs = 0xb8, .bit = 2,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_MAIN2_BIST]   = { .ofs = 0xb8, .bit = 4,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_VE1_BIST]     = { .ofs = 0xb8, .bit = 6,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_VE2_BIST]     = { .ofs = 0xb8, .bit = 8,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_DCPHY_BIST]   = { .ofs = 0xb8, .bit = 10, .write_en = 1 },
+	[RTD1625_CRT_RSTN_GPU_BIST]     = { .ofs = 0xb8, .bit = 12, .write_en = 1 },
+	[RTD1625_CRT_RSTN_DISP_BIST]    = { .ofs = 0xb8, .bit = 14, .write_en = 1 },
+	[RTD1625_CRT_RSTN_NPU_BIST]     = { .ofs = 0xb8, .bit = 16, .write_en = 1 },
+	[RTD1625_CRT_RSTN_CAS_BIST]     = { .ofs = 0xb8, .bit = 18, .write_en = 1 },
+	[RTD1625_CRT_RSTN_VE4_BIST]     = { .ofs = 0xb8, .bit = 20, .write_en = 1 },
+	/* Bank 7: offset 0x454 (DUMMY0, no write_en) */
+	[RTD1625_CRT_RSTN_EMMC]         = { .ofs = 0x454, .bit = 0 },
+	/* Bank 8: offset 0x458 (DUMMY1, no write_en) */
+	[RTD1625_CRT_RSTN_GPU]          = { .ofs = 0x458, .bit = 0 },
+	/* Bank 9: offset 0x464 (DUMMY4, no write_en) */
+	[RTD1625_CRT_RSTN_VE2]          = { .ofs = 0x464, .bit = 0 },
+	/* Bank 10: offset 0x880 */
+	[RTD1625_CRT_RSTN_UR1]          = { .ofs = 0x880, .bit = 0,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_UR2]          = { .ofs = 0x880, .bit = 2,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_UR3]          = { .ofs = 0x880, .bit = 4,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_UR4]          = { .ofs = 0x880, .bit = 6,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_UR5]          = { .ofs = 0x880, .bit = 8,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_UR6]          = { .ofs = 0x880, .bit = 10, .write_en = 1 },
+	[RTD1625_CRT_RSTN_UR7]          = { .ofs = 0x880, .bit = 12, .write_en = 1 },
+	[RTD1625_CRT_RSTN_UR8]          = { .ofs = 0x880, .bit = 14, .write_en = 1 },
+	[RTD1625_CRT_RSTN_UR9]          = { .ofs = 0x880, .bit = 16, .write_en = 1 },
+	[RTD1625_CRT_RSTN_UR_TOP]       = { .ofs = 0x880, .bit = 18, .write_en = 1 },
+	[RTD1625_CRT_RSTN_I2C_7]        = { .ofs = 0x880, .bit = 28, .write_en = 1 },
+	[RTD1625_CRT_RSTN_I2C_6]        = { .ofs = 0x880, .bit = 30, .write_en = 1 },
+	/* Bank 11: offset 0x890 */
+	[RTD1625_CRT_RSTN_SPI0]         = { .ofs = 0x890, .bit = 0,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SPI1]         = { .ofs = 0x890, .bit = 2,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SPI2]         = { .ofs = 0x890, .bit = 4,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_LSADC0]       = { .ofs = 0x890, .bit = 16, .write_en = 1 },
+	[RTD1625_CRT_RSTN_LSADC1]       = { .ofs = 0x890, .bit = 18, .write_en = 1 },
+	[RTD1625_CRT_RSTN_ISOMIS_DMA]   = { .ofs = 0x890, .bit = 20, .write_en = 1 },
+	[RTD1625_CRT_RSTN_AUDIO_ADC]    = { .ofs = 0x890, .bit = 22, .write_en = 1 },
+	[RTD1625_CRT_RSTN_DPTX]         = { .ofs = 0x890, .bit = 24, .write_en = 1 },
+	[RTD1625_CRT_RSTN_AUCPU1_REG]   = { .ofs = 0x890, .bit = 26, .write_en = 1 },
+	[RTD1625_CRT_RSTN_EDPTX]        = { .ofs = 0x890, .bit = 28, .write_en = 1 },
+};
+
+static int rtd1625_crt_reset_probe(struct auxiliary_device *adev,
+				   const struct auxiliary_device_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct rtk_reset_data *data;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->descs           = rtd1625_crt_reset_descs;
+	data->rcdev.nr_resets = RTD1625_CRT_RSTN_MAX;
+	data->rcdev.owner     = THIS_MODULE;
+
+	return rtk_reset_controller_add(dev, data);
+}
+
+static const struct auxiliary_device_id rtd1625_crt_reset_ids[] = {
+	{ .name = "clk_rtk.crt_rst" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, rtd1625_crt_reset_ids);
+
+static struct auxiliary_driver rtd1625_crt_driver = {
+	.probe    = rtd1625_crt_reset_probe,
+	.id_table = rtd1625_crt_reset_ids,
+	.driver = {
+		.name = "rtd1625-crt-reset",
+	},
+};
+module_auxiliary_driver(rtd1625_crt_driver);
+
+MODULE_DESCRIPTION("Realtek RTD1625 CRT Reset Controller Driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("REALTEK_RESET");
-- 
2.43.0

