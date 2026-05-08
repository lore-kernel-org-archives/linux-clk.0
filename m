Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C922C399017;
	Fri,  8 May 2026 11:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778239116; cv=none; b=D3TFvbRlGz0yAlJiOjfoqqhCfS3uy+U9KfAM1M0qj/L66KvSTxLB2m6BOxw7H5b+MEQsPU3FBZSc2SJETjwwOQQC3IAkKbkZn+aeT4UoT68SnoZjdAMMWEUzhTQ1hCJR0Q3yISiQc4teZgjOMyuqqhOg2P+HOKgiqnquixrQ6tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778239116; c=relaxed/simple;
	bh=Wb0OkScO5CS+DhapPNUkRiDRDh3bRbSNkA40zR+vtH8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sd8QmEYdwXIS2pSOAjO9bOwizgOczvfIeVkHlQkyvwFGGiAO8p1hUDUZ8AwH6MgsCnWB5FxDi6Fb+p924HK+Bdz8x661oI1lQSB2Hv8AcKIO4280R3H1Wwt0cQBBj6n5Zkfmvp1o2D2pL6VQnmWAY1+85CSLJ/2aY6lpjVzFRxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=M7QIz5ap; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="M7QIz5ap"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 648BGhmwE3763955, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1778239003; bh=LnHDR4gq4B0+1iAgIJE4k0XkpaBfdZxbZ0fzl8AKsf0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=M7QIz5apSzExGr869PCv+JFx8cGivadzrd409E/KhTTTF92cQ0363jm/0oOmZsC6c
	 k8KlP1MBPid+UlyVYJ6vn5SY/99OEFez3RT5bZlQxhf5GhxLniWJVr5WWpsncxFJRt
	 tV6Xx91Q6mlLXb/CCl2FO5eBAcCnkNloRPg2LFtg7htOLyh/Day98bZy/xb6uDLFnD
	 W0UT83YEvAAnzB+5s8uWio6Y/EUpUfRp4EXTQoDtikdMoF6UcEW/WQwvR67JYUpYhX
	 w9BPNwteXtveZ6PmAcg05zTT0QDNBTFzT+KSsxBdd7M3nG7bYzxTXGsO1weqwPN4qU
	 Q8X1vgqcPMz5g==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.27/5.94) with ESMTPS id 648BGhmwE3763955
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 May 2026 19:16:43 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 8 May 2026 19:16:43 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 8 May 2026 19:16:43 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <bmasney@redhat.com>
Subject: [PATCH v7 08/10] clk: realtek: Add RTD1625-CRT clock controller driver
Date: Fri, 8 May 2026 19:16:39 +0800
Message-ID: <20260508111641.3192177-9-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260508111641.3192177-1-eleanor.lin@realtek.com>
References: <20260508111641.3192177-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Cheng-Yu Lee <cylee12@realtek.com>

Add support for the CRT (Clock, Reset, and Test) domain clock controller
on the Realtek RTD1625 SoC. This driver provides essential clock sources
(including PLLs), gating, and multiplexing functionalities for the
platform's peripherals.

Since the reset controller shares the same register space with the CRT
clock controller, it is instantiated as an auxiliary device by the core
clock driver. This patch also includes the corresponding auxiliary reset
driver to handle the CRT domain resets.

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 drivers/clk/realtek/Kconfig               |  15 +
 drivers/clk/realtek/Makefile              |   1 +
 drivers/clk/realtek/clk-rtd1625-crt.c     | 791 ++++++++++++++++++++++
 drivers/reset/realtek/Kconfig             |  11 +
 drivers/reset/realtek/Makefile            |   1 +
 drivers/reset/realtek/reset-rtd1625-crt.c | 187 +++++
 6 files changed, 1006 insertions(+)
 create mode 100644 drivers/clk/realtek/clk-rtd1625-crt.c
 create mode 100644 drivers/reset/realtek/reset-rtd1625-crt.c

diff --git a/drivers/clk/realtek/Kconfig b/drivers/clk/realtek/Kconfig
index 9efd70094bd2..2eaaa827ae3a 100644
--- a/drivers/clk/realtek/Kconfig
+++ b/drivers/clk/realtek/Kconfig
@@ -28,4 +28,19 @@ config RTK_CLK_COMMON
 config RTK_CLK_PLL_MMC
 	tristate
 
+config CLK_RTD1625
+	tristate "RTD1625 Clock Controller"
+	depends on RESET_CONTROLLER
+	select RESET_RTD1625
+	select RTK_CLK_COMMON
+	select RTK_CLK_PLL_MMC
+	help
+	  Support for the clock controller on Realtek RTD1625 SoCs.
+
+	  This driver provides clock sources, gating, multiplexing, and
+	  reset control for peripherals on the RTD1625 platform.
+
+	  Say Y here if your system is based on the RTD1625 and you need
+	  its peripheral devices to function.
+
 endif
diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
index fd7d777902c8..f4a62be092d2 100644
--- a/drivers/clk/realtek/Makefile
+++ b/drivers/clk/realtek/Makefile
@@ -9,3 +9,4 @@ clk-rtk-y += clk-regmap-mux.o
 clk-rtk-y += freq_table.o
 
 clk-rtk-$(CONFIG_RTK_CLK_PLL_MMC) += clk-pll-mmc.o
+obj-$(CONFIG_CLK_RTD1625) += clk-rtd1625-crt.o
diff --git a/drivers/clk/realtek/clk-rtd1625-crt.c b/drivers/clk/realtek/clk-rtd1625-crt.c
new file mode 100644
index 000000000000..ec9d8f936199
--- /dev/null
+++ b/drivers/clk/realtek/clk-rtd1625-crt.c
@@ -0,0 +1,791 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2022-2026 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#include <dt-bindings/clock/realtek,rtd1625-clk.h>
+#include <linux/array_size.h>
+#include <linux/bits.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/spinlock.h>
+#include "clk-pll.h"
+#include "clk-regmap-gate.h"
+#include "clk-regmap-mux.h"
+
+#define RTD1625_CRT_CLK_MAX	172
+#define RTD1625_CRT_RSTN_MAX	123
+
+#define RTD1625_REG_PLL_ACPU1			0x10c
+#define RTD1625_REG_PLL_ACPU2			0x110
+#define RTD1625_REG_PLL_SSC_DIG_ACPU0		0x5c0
+#define RTD1625_REG_PLL_SSC_DIG_ACPU1		0x5c4
+#define RTD1625_REG_PLL_SSC_DIG_ACPU2		0x5c8
+#define RTD1625_REG_PLL_SSC_DIG_ACPU_DBG2	0x5dc
+
+#define RTD1625_REG_PLL_VE1_1			0x114
+#define RTD1625_REG_PLL_VE1_2			0x118
+#define RTD1625_REG_PLL_SSC_DIG_VE1_0		0x580
+#define RTD1625_REG_PLL_SSC_DIG_VE1_1		0x584
+#define RTD1625_REG_PLL_SSC_DIG_VE1_2		0x588
+#define RTD1625_REG_PLL_SSC_DIG_VE1_DBG2	0x59c
+
+#define RTD1625_REG_PLL_GPU1			0x1c0
+#define RTD1625_REG_PLL_GPU2			0x1c4
+#define RTD1625_REG_PLL_SSC_DIG_GPU0		0x5a0
+#define RTD1625_REG_PLL_SSC_DIG_GPU1		0x5a4
+#define RTD1625_REG_PLL_SSC_DIG_GPU2		0x5a8
+#define RTD1625_REG_PLL_SSC_DIG_GPU_DBG2	0x5bc
+
+#define RTD1625_REG_PLL_NPU1			0x1c8
+#define RTD1625_REG_PLL_NPU2			0x1cc
+#define RTD1625_REG_PLL_SSC_DIG_NPU0		0x800
+#define RTD1625_REG_PLL_SSC_DIG_NPU1		0x804
+#define RTD1625_REG_PLL_SSC_DIG_NPU2		0x808
+#define RTD1625_REG_PLL_SSC_DIG_NPU_DBG2	0x81c
+
+#define RTD1625_REG_PLL_VE2_1			0x1d0
+#define RTD1625_REG_PLL_VE2_2			0x1d4
+#define RTD1625_REG_PLL_SSC_DIG_VE2_0		0x5e0
+#define RTD1625_REG_PLL_SSC_DIG_VE2_1		0x5e4
+#define RTD1625_REG_PLL_SSC_DIG_VE2_2		0x5e8
+#define RTD1625_REG_PLL_SSC_DIG_VE2_DBG2	0x5fc
+
+#define RTD1625_REG_PLL_HIFI1			0x1d8
+#define RTD1625_REG_PLL_HIFI2			0x1dc
+#define RTD1625_REG_PLL_SSC_DIG_HIFI0		0x6e0
+#define RTD1625_REG_PLL_SSC_DIG_HIFI1		0x6e4
+#define RTD1625_REG_PLL_SSC_DIG_HIFI2		0x6e8
+#define RTD1625_REG_PLL_SSC_DIG_HIFI_DBG2	0x6fc
+
+#define RTD1625_REG_PLL_BUS1	0x524
+
+#define RTD1625_REG_PLL_SSC_DIG_DDSA1	0x564
+
+#define RTD1625_REG_PLL_SSC_DIG_DCSB1	0x544
+
+static const char * const clk_gpu_parents[] = {"pll_gpu", "clk_sys"};
+static CLK_REGMAP_MUX(clk_gpu, clk_gpu_parents, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
+		      0x28, 12, 0x1);
+static const char * const clk_ve_parents[] = {"pll_vo", "clk_sysh", "pll_ve1", "pll_ve2"};
+static CLK_REGMAP_MUX(clk_ve1, clk_ve_parents, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
+		      0x4c, 0, 0x3);
+static CLK_REGMAP_MUX(clk_ve2, clk_ve_parents, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
+		      0x4c, 3, 0x3);
+static CLK_REGMAP_MUX(clk_ve4, clk_ve_parents, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
+		      0x4c, 6, 0x3);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_misc, CLK_IS_CRITICAL, 0x50, 0, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_pcie0, 0, 0x50, 2, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_gspi, 0, 0x50, 6, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_iso_misc, 0, 0x50, 10, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_sds, 0, 0x50, 12, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_hdmi, 0, 0x50, 14, 1);
+static CLK_REGMAP_GATE(clk_en_gpu, "clk_gpu", CLK_SET_RATE_PARENT, 0x50, 18, 1);
+static CLK_REGMAP_GATE(clk_en_ve1, "clk_ve1", CLK_SET_RATE_PARENT, 0x50, 20, 1);
+static CLK_REGMAP_GATE(clk_en_ve2, "clk_ve2", CLK_SET_RATE_PARENT, 0x50, 22, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_se, 0, 0x50, 30, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_md, 0, 0x54, 4, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_tp, CLK_IS_CRITICAL, 0x54, 6, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_rcic, 0, 0x54, 8, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_nf, 0, 0x54, 10, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_emmc, 0, 0x54, 12, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_sd, 0, 0x54, 14, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_sdio_ip, 0, 0x54, 16, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_mipi_csi, 0, 0x54, 18, 1);
+static CLK_REGMAP_GATE(clk_en_emmc_ip, "pll_emmc", CLK_SET_RATE_PARENT, 0x54, 20, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_sdio, 0, 0x54, 22, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_sd_ip, 0, 0x54, 24, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_tpb, 0, 0x54, 28, 1);
+static CLK_REGMAP_GATE(clk_en_misc_sc1, "clk_en_misc", 0, 0x54, 30, 1);
+static CLK_REGMAP_GATE(clk_en_misc_i2c_3, "clk_en_misc", 0, 0x58, 0, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_jpeg, 0, 0x58, 4, 1);
+static CLK_REGMAP_GATE(clk_en_acpu, "pll_acpu", CLK_SET_RATE_PARENT,
+		       0x58, 6, 1);
+static CLK_REGMAP_GATE(clk_en_misc_sc0, "clk_en_misc", 0, 0x58, 10, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_hdmirx, 0, 0x58, 26, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_hse, CLK_IS_CRITICAL, 0x58, 28, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_fan, 0, 0x5c, 2, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_sata_wrap_sys, 0, 0x5c, 8, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_sata_wrap_sysh, 0, 0x5c, 10, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_sata_mac_sysh, 0, 0x5c, 12, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_r2rdsc, 0, 0x5c, 14, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_pcie1, 0, 0x5c, 18, 1);
+static CLK_REGMAP_GATE(clk_en_misc_i2c_4, "clk_en_misc", 0, 0x5c, 20, 1);
+static CLK_REGMAP_GATE(clk_en_misc_i2c_5, "clk_en_misc", 0, 0x5c, 22, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_tsio, 0, 0x5c, 24, 1);
+static CLK_REGMAP_GATE(clk_en_ve4, "clk_ve4", CLK_SET_RATE_PARENT,
+		       0x5c, 26, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_edp, 0, 0x5c, 28, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_tsio_trx, 0, 0x5c, 30, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_pcie2, 0, 0x8c, 0, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_earc, 0, 0x8c, 4, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_lite, 0, 0x8c, 6, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_mipi_dsi, 0, 0x8c, 8, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_npupp, 0, 0x8c, 10, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_npu, 0, 0x8c, 12, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_aucpu0, 0, 0x8c, 14, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_aucpu1, 0, 0x8c, 16, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_nsram, 0, 0x8c, 18, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_hdmitop, 0, 0x8c, 20, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_aucpu_iso_npu, 0, 0x8c, 24, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_keyladder, 0, 0x8c, 26, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_ifcp_klm, 0, 0x8c, 28, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_ifcp, 0, 0x8c, 30, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_mdl_genpw, 0, 0xb0, 0, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_mdl_chip, 0, 0xb0, 2, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_mdl_ip, 0, 0xb0, 4, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_mdlm2m, 0, 0xb0, 6, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_mdl_xtal, 0, 0xb0, 8, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_test_mux, 0, 0xb0, 10, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_dla, 0, 0xb0, 12, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_tpcw, 0, 0xb0, 16, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_gpu_ts_src, 0, 0xb0, 18, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_vi, 0, 0xb0, 22, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_lvds1, 0, 0xb0, 24, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_lvds2, 0, 0xb0, 26, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_aucpu, 0, 0xb0, 28, 1);
+static CLK_REGMAP_GATE(clk_en_ur1, "clk_en_ur_top", 0, 0x884, 0, 1);
+static CLK_REGMAP_GATE(clk_en_ur2, "clk_en_ur_top", 0, 0x884, 2, 1);
+static CLK_REGMAP_GATE(clk_en_ur3, "clk_en_ur_top", 0, 0x884, 4, 1);
+static CLK_REGMAP_GATE(clk_en_ur4, "clk_en_ur_top", 0, 0x884, 6, 1);
+static CLK_REGMAP_GATE(clk_en_ur5, "clk_en_ur_top", 0, 0x884, 8, 1);
+static CLK_REGMAP_GATE(clk_en_ur6, "clk_en_ur_top", 0, 0x884, 10, 1);
+static CLK_REGMAP_GATE(clk_en_ur7, "clk_en_ur_top", 0, 0x884, 12, 1);
+static CLK_REGMAP_GATE(clk_en_ur8, "clk_en_ur_top", 0, 0x884, 14, 1);
+static CLK_REGMAP_GATE(clk_en_ur9, "clk_en_ur_top", 0, 0x884, 16, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_ur_top, CLK_IS_CRITICAL, 0x884, 18, 1);
+static CLK_REGMAP_GATE(clk_en_misc_i2c_7, "clk_en_misc", 0, 0x884, 28, 1);
+static CLK_REGMAP_GATE(clk_en_misc_i2c_6, "clk_en_misc", 0, 0x884, 30, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_spi0, 0, 0x894, 0, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_spi1, 0, 0x894, 2, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_spi2, 0, 0x894, 4, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_lsadc0, 0, 0x894, 16, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_lsadc1, 0, 0x894, 18, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_isomis_dma, 0, 0x894, 20, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_dptx, 0, 0x894, 24, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_npu_mipi_csi, 0, 0x894, 26, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_edptx, 0, 0x894, 28, 1);
+
+#define FREQ_NF_MASK       0x7ffff
+#define FREQ_NF(_r, _nf)   {.rate = _r, .val = (_nf),}
+
+static const struct freq_table acpu_tbl[] = {
+	FREQ_NF(513000000, 0x11000),
+	FREQ_TABLE_END
+};
+
+static const struct freq_table ve_tbl[] = {
+	FREQ_NF(553500000, 0x12800),
+	FREQ_NF(661500000, 0x16800),
+	FREQ_NF(688500000, 0x17800),
+	FREQ_TABLE_END
+};
+
+static const struct freq_table bus_tbl[] = {
+	FREQ_NF(513000000, 0x11000),
+	FREQ_NF(540000000, 0x12000),
+	FREQ_NF(553500000, 0x12800),
+	FREQ_TABLE_END
+};
+
+static const struct freq_table ddsa_tbl[] = {
+	FREQ_NF(432000000, 0xe000),
+	FREQ_TABLE_END
+};
+
+static const struct freq_table gpu_tbl[] = {
+	FREQ_NF(405000000, 0xd000),
+	FREQ_NF(540000000, 0x12000),
+	FREQ_NF(661500000, 0x16800),
+	FREQ_NF(729000000, 0x19000),
+	FREQ_NF(810000000, 0x1c000),
+	FREQ_NF(850500000, 0x1d800),
+	FREQ_TABLE_END
+};
+
+static const struct freq_table hifi_tbl[] = {
+	FREQ_NF(756000000, 0x1a000),
+	FREQ_NF(810000000, 0x1c000),
+	FREQ_TABLE_END
+};
+
+static const struct freq_table npu_tbl[] = {
+	FREQ_NF(661500000, 0x16800),
+	FREQ_NF(729000000, 0x19000),
+	FREQ_NF(810000000, 0x1c000),
+	FREQ_TABLE_END
+};
+
+static const struct reg_sequence pll_acpu_seq_power_on[] = {
+	{RTD1625_REG_PLL_ACPU2,         0x5},
+	{RTD1625_REG_PLL_ACPU2,         0x7},
+	{RTD1625_REG_PLL_ACPU1,         0x54000},
+	{RTD1625_REG_PLL_SSC_DIG_ACPU2, 0x1e1f8e},
+	{RTD1625_REG_PLL_SSC_DIG_ACPU0, 0x4},
+	{RTD1625_REG_PLL_SSC_DIG_ACPU0, 0x5, 200},
+	{RTD1625_REG_PLL_ACPU2,         0x3},
+};
+
+static const struct reg_sequence pll_acpu_seq_power_off[] = {
+	{RTD1625_REG_PLL_ACPU2,         0x4},
+};
+
+static const struct reg_sequence pll_acpu_seq_pre_set_freq[] = {
+	{RTD1625_REG_PLL_SSC_DIG_ACPU0, 0x4},
+};
+
+static const struct reg_sequence pll_acpu_seq_post_set_freq[] = {
+	{RTD1625_REG_PLL_SSC_DIG_ACPU0, 0x5},
+};
+
+static struct clk_pll pll_acpu = {
+	.clkr.hw.init = CLK_HW_INIT("pll_acpu", "osc27m", &rtk_clk_pll_ops, CLK_GET_RATE_NOCACHE),
+	.seq_power_on          = pll_acpu_seq_power_on,
+	.num_seq_power_on      = ARRAY_SIZE(pll_acpu_seq_power_on),
+	.seq_power_off         = pll_acpu_seq_power_off,
+	.num_seq_power_off     = ARRAY_SIZE(pll_acpu_seq_power_off),
+	.seq_pre_set_freq      = pll_acpu_seq_pre_set_freq,
+	.num_seq_pre_set_freq  = ARRAY_SIZE(pll_acpu_seq_pre_set_freq),
+	.seq_post_set_freq     = pll_acpu_seq_post_set_freq,
+	.num_seq_post_set_freq = ARRAY_SIZE(pll_acpu_seq_post_set_freq),
+	.freq_reg              = RTD1625_REG_PLL_SSC_DIG_ACPU1,
+	.freq_tbl              = acpu_tbl,
+	.freq_mask             = FREQ_NF_MASK,
+	.freq_ready_reg        = RTD1625_REG_PLL_SSC_DIG_ACPU_DBG2,
+	.freq_ready_mask       = BIT(20),
+	.freq_ready_val        = BIT(20),
+	.power_reg             = RTD1625_REG_PLL_ACPU2,
+	.power_mask            = 0x7,
+	.power_val_on          = 0x3,
+	.lock                  = __SPIN_LOCK_UNLOCKED(pll_acpu.lock),
+};
+
+static const struct reg_sequence pll_ve1_seq_power_on[] = {
+	{RTD1625_REG_PLL_VE1_2,         0x5},
+	{RTD1625_REG_PLL_VE1_2,         0x7},
+	{RTD1625_REG_PLL_VE1_1,         0x54000},
+	{RTD1625_REG_PLL_SSC_DIG_VE1_0, 0x4},
+	{RTD1625_REG_PLL_SSC_DIG_VE1_0, 0x5, 200},
+	{RTD1625_REG_PLL_VE1_2,         0x3},
+};
+
+static const struct reg_sequence pll_ve1_seq_power_off[] = {
+	{RTD1625_REG_PLL_VE1_2,         0x4},
+};
+
+static const struct reg_sequence pll_ve1_seq_pre_set_freq[] = {
+	{RTD1625_REG_PLL_SSC_DIG_VE1_0, 0x4},
+};
+
+static const struct reg_sequence pll_ve1_seq_post_set_freq[] = {
+	{RTD1625_REG_PLL_SSC_DIG_VE1_0, 0x5},
+};
+
+static struct clk_pll pll_ve1 = {
+	.clkr.hw.init = CLK_HW_INIT("pll_ve1", "osc27m", &rtk_clk_pll_ops, CLK_GET_RATE_NOCACHE),
+	.seq_power_on          = pll_ve1_seq_power_on,
+	.num_seq_power_on      = ARRAY_SIZE(pll_ve1_seq_power_on),
+	.seq_power_off         = pll_ve1_seq_power_off,
+	.num_seq_power_off     = ARRAY_SIZE(pll_ve1_seq_power_off),
+	.seq_pre_set_freq      = pll_ve1_seq_pre_set_freq,
+	.num_seq_pre_set_freq  = ARRAY_SIZE(pll_ve1_seq_pre_set_freq),
+	.seq_post_set_freq     = pll_ve1_seq_post_set_freq,
+	.num_seq_post_set_freq = ARRAY_SIZE(pll_ve1_seq_post_set_freq),
+	.freq_reg              = RTD1625_REG_PLL_SSC_DIG_VE1_1,
+	.freq_tbl              = ve_tbl,
+	.freq_mask             = FREQ_NF_MASK,
+	.freq_ready_reg        = RTD1625_REG_PLL_SSC_DIG_VE1_DBG2,
+	.freq_ready_mask       = BIT(20),
+	.freq_ready_val        = BIT(20),
+	.power_reg             = RTD1625_REG_PLL_VE1_2,
+	.power_mask            = 0x7,
+	.power_val_on          = 0x3,
+	.lock                  = __SPIN_LOCK_UNLOCKED(pll_ve1.lock),
+};
+
+static struct clk_pll pll_ddsa = {
+	.clkr.hw.init = CLK_HW_INIT("pll_ddsa", "osc27m", &rtk_clk_pll_ro_ops,
+				    CLK_GET_RATE_NOCACHE),
+	.freq_reg     = RTD1625_REG_PLL_SSC_DIG_DDSA1,
+	.freq_tbl     = ddsa_tbl,
+	.freq_mask    = FREQ_NF_MASK,
+	.lock         = __SPIN_LOCK_UNLOCKED(pll_ddsa.lock),
+};
+
+static struct clk_pll pll_bus = {
+	.clkr.hw.init = CLK_HW_INIT("pll_bus", "osc27m", &rtk_clk_pll_ro_ops,
+				    CLK_GET_RATE_NOCACHE),
+	.freq_reg     = RTD1625_REG_PLL_BUS1,
+	.freq_tbl     = bus_tbl,
+	.freq_mask    = FREQ_NF_MASK,
+	.lock         = __SPIN_LOCK_UNLOCKED(pll_bus.lock),
+};
+
+static CLK_FIXED_FACTOR(clk_sys, "clk_sys", "pll_bus", 2, 1, 0);
+
+static struct clk_pll pll_dcsb = {
+	.clkr.hw.init = CLK_HW_INIT("pll_dcsb", "osc27m", &rtk_clk_pll_ro_ops,
+				    CLK_GET_RATE_NOCACHE),
+	.freq_reg     = RTD1625_REG_PLL_SSC_DIG_DCSB1,
+	.freq_tbl     = bus_tbl,
+	.freq_mask    = FREQ_NF_MASK,
+	.lock         = __SPIN_LOCK_UNLOCKED(pll_dcsb.lock),
+};
+
+static CLK_FIXED_FACTOR(clk_sysh, "clk_sysh", "pll_dcsb", 1, 1, 0);
+
+static const struct reg_sequence pll_gpu_seq_power_on[] = {
+	{RTD1625_REG_PLL_GPU2,         0x5},
+	{RTD1625_REG_PLL_GPU2,         0x7},
+	{RTD1625_REG_PLL_GPU1,         0x54000},
+	{RTD1625_REG_PLL_SSC_DIG_GPU0, 0x4},
+	{RTD1625_REG_PLL_SSC_DIG_GPU0, 0x5, 200},
+	{RTD1625_REG_PLL_GPU2,         0x3},
+};
+
+static const struct reg_sequence pll_gpu_seq_power_off[] = {
+	{RTD1625_REG_PLL_GPU2,         0x4},
+};
+
+static const struct reg_sequence pll_gpu_seq_pre_set_freq[] = {
+	{RTD1625_REG_PLL_SSC_DIG_GPU0, 0x4},
+};
+
+static const struct reg_sequence pll_gpu_seq_post_set_freq[] = {
+	{RTD1625_REG_PLL_SSC_DIG_GPU0, 0x5},
+};
+
+static struct clk_pll pll_gpu = {
+	.clkr.hw.init = CLK_HW_INIT("pll_gpu", "osc27m", &rtk_clk_pll_ops, CLK_GET_RATE_NOCACHE),
+	.seq_power_on          = pll_gpu_seq_power_on,
+	.num_seq_power_on      = ARRAY_SIZE(pll_gpu_seq_power_on),
+	.seq_power_off         = pll_gpu_seq_power_off,
+	.num_seq_power_off     = ARRAY_SIZE(pll_gpu_seq_power_off),
+	.seq_pre_set_freq      = pll_gpu_seq_pre_set_freq,
+	.num_seq_pre_set_freq  = ARRAY_SIZE(pll_gpu_seq_pre_set_freq),
+	.seq_post_set_freq     = pll_gpu_seq_post_set_freq,
+	.num_seq_post_set_freq = ARRAY_SIZE(pll_gpu_seq_post_set_freq),
+	.freq_reg              = RTD1625_REG_PLL_SSC_DIG_GPU1,
+	.freq_tbl              = gpu_tbl,
+	.freq_mask             = FREQ_NF_MASK,
+	.freq_ready_reg        = RTD1625_REG_PLL_SSC_DIG_GPU_DBG2,
+	.freq_ready_mask       = BIT(20),
+	.freq_ready_val        = BIT(20),
+	.power_reg             = RTD1625_REG_PLL_GPU2,
+	.power_mask            = 0x7,
+	.power_val_on          = 0x3,
+	.lock                  = __SPIN_LOCK_UNLOCKED(pll_gpu.lock),
+};
+
+static const struct reg_sequence pll_npu_seq_power_on[] = {
+	{RTD1625_REG_PLL_NPU2,         0x5},
+	{RTD1625_REG_PLL_NPU2,         0x7},
+	{RTD1625_REG_PLL_NPU1,         0x54000},
+	{RTD1625_REG_PLL_SSC_DIG_NPU0, 0x4},
+	{RTD1625_REG_PLL_SSC_DIG_NPU0, 0x5, 200},
+	{RTD1625_REG_PLL_NPU2,         0x3},
+};
+
+static const struct reg_sequence pll_npu_seq_power_off[] = {
+	{RTD1625_REG_PLL_NPU2,         0x4},
+	{RTD1625_REG_PLL_NPU1,         0x54010},
+};
+
+static const struct reg_sequence pll_npu_seq_pre_set_freq[] = {
+	{RTD1625_REG_PLL_SSC_DIG_NPU0, 0x4},
+};
+
+static const struct reg_sequence pll_npu_seq_post_set_freq[] = {
+	{RTD1625_REG_PLL_SSC_DIG_NPU0, 0x5},
+};
+
+static struct clk_pll pll_npu = {
+	.clkr.hw.init = CLK_HW_INIT("pll_npu", "osc27m", &rtk_clk_pll_ops,
+				    CLK_GET_RATE_NOCACHE),
+	.seq_power_on          = pll_npu_seq_power_on,
+	.num_seq_power_on      = ARRAY_SIZE(pll_npu_seq_power_on),
+	.seq_power_off         = pll_npu_seq_power_off,
+	.num_seq_power_off     = ARRAY_SIZE(pll_npu_seq_power_off),
+	.seq_pre_set_freq      = pll_npu_seq_pre_set_freq,
+	.num_seq_pre_set_freq  = ARRAY_SIZE(pll_npu_seq_pre_set_freq),
+	.seq_post_set_freq     = pll_npu_seq_post_set_freq,
+	.num_seq_post_set_freq = ARRAY_SIZE(pll_npu_seq_post_set_freq),
+	.freq_reg              = RTD1625_REG_PLL_SSC_DIG_NPU1,
+	.freq_tbl              = npu_tbl,
+	.freq_mask             = FREQ_NF_MASK,
+	.freq_ready_reg        = RTD1625_REG_PLL_SSC_DIG_NPU_DBG2,
+	.freq_ready_mask       = BIT(20),
+	.freq_ready_val        = BIT(20),
+	.power_reg             = RTD1625_REG_PLL_NPU2,
+	.power_mask            = 0x7,
+	.power_val_on          = 0x3,
+	.lock                  = __SPIN_LOCK_UNLOCKED(pll_npu.lock),
+};
+
+static CLK_FIXED_FACTOR(clk_npu, "clk_npu", "pll_npu", 1, 1, CLK_SET_RATE_PARENT);
+static CLK_FIXED_FACTOR(clk_npu_mipi_csi, "clk_npu_mipi_csi", "pll_npu", 1, 1,
+			CLK_SET_RATE_PARENT);
+
+static const struct reg_sequence pll_ve2_seq_power_on[] = {
+	{RTD1625_REG_PLL_VE2_2,         0x5},
+	{RTD1625_REG_PLL_VE2_2,         0x7},
+	{RTD1625_REG_PLL_VE2_1,         0x54000},
+	{RTD1625_REG_PLL_SSC_DIG_VE2_0, 0x4},
+	{RTD1625_REG_PLL_SSC_DIG_VE2_0, 0x5, 200},
+	{RTD1625_REG_PLL_VE2_2,         0x3},
+};
+
+static const struct reg_sequence pll_ve2_seq_power_off[] = {
+	{RTD1625_REG_PLL_VE2_2,         0x4},
+};
+
+static const struct reg_sequence pll_ve2_seq_pre_set_freq[] = {
+	{RTD1625_REG_PLL_SSC_DIG_VE2_0, 0x4},
+};
+
+static const struct reg_sequence pll_ve2_seq_post_set_freq[] = {
+	{RTD1625_REG_PLL_SSC_DIG_VE2_0, 0x5},
+};
+
+static struct clk_pll pll_ve2 = {
+	.clkr.hw.init = CLK_HW_INIT("pll_ve2", "osc27m", &rtk_clk_pll_ops, CLK_GET_RATE_NOCACHE),
+	.seq_power_on          = pll_ve2_seq_power_on,
+	.num_seq_power_on      = ARRAY_SIZE(pll_ve2_seq_power_on),
+	.seq_power_off         = pll_ve2_seq_power_off,
+	.num_seq_power_off     = ARRAY_SIZE(pll_ve2_seq_power_off),
+	.seq_pre_set_freq      = pll_ve2_seq_pre_set_freq,
+	.num_seq_pre_set_freq  = ARRAY_SIZE(pll_ve2_seq_pre_set_freq),
+	.seq_post_set_freq     = pll_ve2_seq_post_set_freq,
+	.num_seq_post_set_freq = ARRAY_SIZE(pll_ve2_seq_post_set_freq),
+	.freq_reg              = RTD1625_REG_PLL_SSC_DIG_VE2_1,
+	.freq_tbl              = ve_tbl,
+	.freq_mask             = FREQ_NF_MASK,
+	.freq_ready_reg        = RTD1625_REG_PLL_SSC_DIG_VE2_DBG2,
+	.freq_ready_mask       = BIT(20),
+	.freq_ready_val        = BIT(20),
+	.power_reg             = RTD1625_REG_PLL_VE2_2,
+	.power_mask            = 0x7,
+	.power_val_on          = 0x3,
+	.lock                  = __SPIN_LOCK_UNLOCKED(pll_ve2.lock),
+};
+
+static const struct reg_sequence pll_hifi_seq_power_on[] = {
+	{RTD1625_REG_PLL_HIFI2,         0x5},
+	{RTD1625_REG_PLL_HIFI2,         0x7},
+	{RTD1625_REG_PLL_HIFI1,         0x54000},
+	{RTD1625_REG_PLL_SSC_DIG_HIFI0, 0x4},
+	{RTD1625_REG_PLL_SSC_DIG_HIFI0, 0x5, 200},
+	{RTD1625_REG_PLL_HIFI2,         0x3},
+};
+
+static const struct reg_sequence pll_hifi_seq_power_off[] = {
+	{RTD1625_REG_PLL_HIFI2,         0x4},
+};
+
+static const struct reg_sequence pll_hifi_seq_pre_set_freq[] = {
+	{RTD1625_REG_PLL_SSC_DIG_HIFI0, 0x4},
+};
+
+static const struct reg_sequence pll_hifi_seq_post_set_freq[] = {
+	{RTD1625_REG_PLL_SSC_DIG_HIFI0, 0x5},
+};
+
+static struct clk_pll pll_hifi = {
+	.clkr.hw.init = CLK_HW_INIT("pll_hifi", "osc27m", &rtk_clk_pll_ops, CLK_GET_RATE_NOCACHE),
+	.seq_power_on          = pll_hifi_seq_power_on,
+	.num_seq_power_on      = ARRAY_SIZE(pll_hifi_seq_power_on),
+	.seq_power_off         = pll_hifi_seq_power_off,
+	.num_seq_power_off     = ARRAY_SIZE(pll_hifi_seq_power_off),
+	.seq_pre_set_freq      = pll_hifi_seq_pre_set_freq,
+	.num_seq_pre_set_freq  = ARRAY_SIZE(pll_hifi_seq_pre_set_freq),
+	.seq_post_set_freq     = pll_hifi_seq_post_set_freq,
+	.num_seq_post_set_freq = ARRAY_SIZE(pll_hifi_seq_post_set_freq),
+	.freq_reg              = RTD1625_REG_PLL_SSC_DIG_HIFI1,
+	.freq_tbl              = hifi_tbl,
+	.freq_mask             = FREQ_NF_MASK,
+	.freq_ready_reg        = RTD1625_REG_PLL_SSC_DIG_HIFI_DBG2,
+	.freq_ready_mask       = BIT(20),
+	.freq_ready_val        = BIT(20),
+	.power_reg             = RTD1625_REG_PLL_HIFI2,
+	.power_mask            = 0x7,
+	.power_val_on          = 0x3,
+	.lock                  = __SPIN_LOCK_UNLOCKED(pll_hifi.lock),
+};
+
+static CLK_FIXED_FACTOR(pll_emmc_ref, "pll_emmc_ref", "osc27m", 1, 1, 0);
+
+static struct clk_pll_mmc pll_emmc = {
+	.pll_ofs        = 0x1f0,
+	.ssc_dig_ofs    = 0x6b0,
+	.clkr.hw.init   = CLK_HW_INIT("pll_emmc", "pll_emmc_ref", &rtk_clk_pll_mmc_ops, 0),
+	.phase0_hw.init = CLK_HW_INIT("pll_emmc_vp0", "pll_emmc", &rtk_clk_pll_mmc_phase_ops, 0),
+	.phase1_hw.init = CLK_HW_INIT("pll_emmc_vp1", "pll_emmc", &rtk_clk_pll_mmc_phase_ops, 0),
+};
+
+static struct clk_regmap * const rtd1625_crt_regmap_clks[] = {
+	&clk_en_misc.clkr,
+	&clk_en_pcie0.clkr,
+	&clk_en_gspi.clkr,
+	&clk_en_iso_misc.clkr,
+	&clk_en_sds.clkr,
+	&clk_en_hdmi.clkr,
+	&clk_en_gpu.clkr,
+	&clk_en_ve1.clkr,
+	&clk_en_ve2.clkr,
+	&clk_en_se.clkr,
+	&clk_en_md.clkr,
+	&clk_en_tp.clkr,
+	&clk_en_rcic.clkr,
+	&clk_en_nf.clkr,
+	&clk_en_emmc.clkr,
+	&clk_en_sd.clkr,
+	&clk_en_sdio_ip.clkr,
+	&clk_en_mipi_csi.clkr,
+	&clk_en_emmc_ip.clkr,
+	&clk_en_sdio.clkr,
+	&clk_en_sd_ip.clkr,
+	&clk_en_tpb.clkr,
+	&clk_en_misc_sc1.clkr,
+	&clk_en_misc_i2c_3.clkr,
+	&clk_en_jpeg.clkr,
+	&clk_en_acpu.clkr,
+	&clk_en_misc_sc0.clkr,
+	&clk_en_hdmirx.clkr,
+	&clk_en_hse.clkr,
+	&clk_en_fan.clkr,
+	&clk_en_sata_wrap_sys.clkr,
+	&clk_en_sata_wrap_sysh.clkr,
+	&clk_en_sata_mac_sysh.clkr,
+	&clk_en_r2rdsc.clkr,
+	&clk_en_pcie1.clkr,
+	&clk_en_misc_i2c_4.clkr,
+	&clk_en_misc_i2c_5.clkr,
+	&clk_en_tsio.clkr,
+	&clk_en_ve4.clkr,
+	&clk_en_edp.clkr,
+	&clk_en_tsio_trx.clkr,
+	&clk_en_pcie2.clkr,
+	&clk_en_earc.clkr,
+	&clk_en_lite.clkr,
+	&clk_en_mipi_dsi.clkr,
+	&clk_en_npupp.clkr,
+	&clk_en_npu.clkr,
+	&clk_en_aucpu0.clkr,
+	&clk_en_aucpu1.clkr,
+	&clk_en_nsram.clkr,
+	&clk_en_hdmitop.clkr,
+	&clk_en_aucpu_iso_npu.clkr,
+	&clk_en_keyladder.clkr,
+	&clk_en_ifcp_klm.clkr,
+	&clk_en_ifcp.clkr,
+	&clk_en_mdl_genpw.clkr,
+	&clk_en_mdl_chip.clkr,
+	&clk_en_mdl_ip.clkr,
+	&clk_en_mdlm2m.clkr,
+	&clk_en_mdl_xtal.clkr,
+	&clk_en_test_mux.clkr,
+	&clk_en_dla.clkr,
+	&clk_en_tpcw.clkr,
+	&clk_en_gpu_ts_src.clkr,
+	&clk_en_vi.clkr,
+	&clk_en_lvds1.clkr,
+	&clk_en_lvds2.clkr,
+	&clk_en_aucpu.clkr,
+	&clk_en_ur1.clkr,
+	&clk_en_ur2.clkr,
+	&clk_en_ur3.clkr,
+	&clk_en_ur4.clkr,
+	&clk_en_ur5.clkr,
+	&clk_en_ur6.clkr,
+	&clk_en_ur7.clkr,
+	&clk_en_ur8.clkr,
+	&clk_en_ur9.clkr,
+	&clk_en_ur_top.clkr,
+	&clk_en_misc_i2c_7.clkr,
+	&clk_en_misc_i2c_6.clkr,
+	&clk_en_spi0.clkr,
+	&clk_en_spi1.clkr,
+	&clk_en_spi2.clkr,
+	&clk_en_lsadc0.clkr,
+	&clk_en_lsadc1.clkr,
+	&clk_en_isomis_dma.clkr,
+	&clk_en_dptx.clkr,
+	&clk_en_npu_mipi_csi.clkr,
+	&clk_en_edptx.clkr,
+	&clk_gpu.clkr,
+	&clk_ve1.clkr,
+	&clk_ve2.clkr,
+	&clk_ve4.clkr,
+	&pll_ve1.clkr,
+	&pll_ddsa.clkr,
+	&pll_bus.clkr,
+	&pll_dcsb.clkr,
+	&pll_gpu.clkr,
+	&pll_npu.clkr,
+	&pll_ve2.clkr,
+	&pll_hifi.clkr,
+	&pll_emmc.clkr,
+	&pll_acpu.clkr,
+};
+
+static struct clk_hw_onecell_data rtd1625_crt_hw_data = {
+	.num = RTD1625_CRT_CLK_MAX,
+	.hws = {
+		[RTD1625_CRT_CLK_EN_MISC]     = &__clk_regmap_gate_hw(&clk_en_misc),
+		[RTD1625_CRT_CLK_EN_PCIE0]    = &__clk_regmap_gate_hw(&clk_en_pcie0),
+		[RTD1625_CRT_CLK_EN_GSPI]     = &__clk_regmap_gate_hw(&clk_en_gspi),
+		[RTD1625_CRT_CLK_EN_ISO_MISC] = &__clk_regmap_gate_hw(&clk_en_iso_misc),
+		[RTD1625_CRT_CLK_EN_SDS]      = &__clk_regmap_gate_hw(&clk_en_sds),
+		[RTD1625_CRT_CLK_EN_HDMI]     = &__clk_regmap_gate_hw(&clk_en_hdmi),
+		[RTD1625_CRT_CLK_EN_GPU]      = &__clk_regmap_gate_hw(&clk_en_gpu),
+		[RTD1625_CRT_CLK_EN_VE1]      = &__clk_regmap_gate_hw(&clk_en_ve1),
+		[RTD1625_CRT_CLK_EN_VE2]      = &__clk_regmap_gate_hw(&clk_en_ve2),
+		[RTD1625_CRT_CLK_EN_MD]       = &__clk_regmap_gate_hw(&clk_en_md),
+		[RTD1625_CRT_CLK_EN_TP]       = &__clk_regmap_gate_hw(&clk_en_tp),
+		[RTD1625_CRT_CLK_EN_RCIC]     = &__clk_regmap_gate_hw(&clk_en_rcic),
+		[RTD1625_CRT_CLK_EN_NF]       = &__clk_regmap_gate_hw(&clk_en_nf),
+		[RTD1625_CRT_CLK_EN_EMMC]     = &__clk_regmap_gate_hw(&clk_en_emmc),
+		[RTD1625_CRT_CLK_EN_SD]       = &__clk_regmap_gate_hw(&clk_en_sd),
+		[RTD1625_CRT_CLK_EN_SDIO_IP]  = &__clk_regmap_gate_hw(&clk_en_sdio_ip),
+		[RTD1625_CRT_CLK_EN_MIPI_CSI] = &__clk_regmap_gate_hw(&clk_en_mipi_csi),
+		[RTD1625_CRT_CLK_EN_EMMC_IP]  = &__clk_regmap_gate_hw(&clk_en_emmc_ip),
+		[RTD1625_CRT_CLK_EN_SDIO]     = &__clk_regmap_gate_hw(&clk_en_sdio),
+		[RTD1625_CRT_CLK_EN_SD_IP]    = &__clk_regmap_gate_hw(&clk_en_sd_ip),
+		[RTD1625_CRT_CLK_EN_TPB]      = &__clk_regmap_gate_hw(&clk_en_tpb),
+		[RTD1625_CRT_CLK_EN_MISC_SC1] = &__clk_regmap_gate_hw(&clk_en_misc_sc1),
+		[RTD1625_CRT_CLK_EN_MISC_I2C_3] = &__clk_regmap_gate_hw(&clk_en_misc_i2c_3),
+		[RTD1625_CRT_CLK_EN_ACPU]     = &__clk_regmap_gate_hw(&clk_en_acpu),
+		[RTD1625_CRT_CLK_EN_JPEG]     = &__clk_regmap_gate_hw(&clk_en_jpeg),
+		[RTD1625_CRT_CLK_EN_MISC_SC0] = &__clk_regmap_gate_hw(&clk_en_misc_sc0),
+		[RTD1625_CRT_CLK_EN_HDMIRX]   = &__clk_regmap_gate_hw(&clk_en_hdmirx),
+		[RTD1625_CRT_CLK_EN_HSE]      = &__clk_regmap_gate_hw(&clk_en_hse),
+		[RTD1625_CRT_CLK_EN_FAN]      = &__clk_regmap_gate_hw(&clk_en_fan),
+		[RTD1625_CRT_CLK_EN_SATA_WRAP_SYS] = &__clk_regmap_gate_hw(&clk_en_sata_wrap_sys),
+		[RTD1625_CRT_CLK_EN_SATA_WRAP_SYSH] = &__clk_regmap_gate_hw(&clk_en_sata_wrap_sysh),
+		[RTD1625_CRT_CLK_EN_SATA_MAC_SYSH] = &__clk_regmap_gate_hw(&clk_en_sata_mac_sysh),
+		[RTD1625_CRT_CLK_EN_R2RDSC]   = &__clk_regmap_gate_hw(&clk_en_r2rdsc),
+		[RTD1625_CRT_CLK_EN_PCIE1]    = &__clk_regmap_gate_hw(&clk_en_pcie1),
+		[RTD1625_CRT_CLK_EN_MISC_I2C_4] = &__clk_regmap_gate_hw(&clk_en_misc_i2c_4),
+		[RTD1625_CRT_CLK_EN_MISC_I2C_5] = &__clk_regmap_gate_hw(&clk_en_misc_i2c_5),
+		[RTD1625_CRT_CLK_EN_TSIO]     = &__clk_regmap_gate_hw(&clk_en_tsio),
+		[RTD1625_CRT_CLK_EN_VE4]      = &__clk_regmap_gate_hw(&clk_en_ve4),
+		[RTD1625_CRT_CLK_EN_EDP]      = &__clk_regmap_gate_hw(&clk_en_edp),
+		[RTD1625_CRT_CLK_EN_TSIO_TRX] = &__clk_regmap_gate_hw(&clk_en_tsio_trx),
+		[RTD1625_CRT_CLK_EN_PCIE2]    = &__clk_regmap_gate_hw(&clk_en_pcie2),
+		[RTD1625_CRT_CLK_EN_EARC]     = &__clk_regmap_gate_hw(&clk_en_earc),
+		[RTD1625_CRT_CLK_EN_LITE]     = &__clk_regmap_gate_hw(&clk_en_lite),
+		[RTD1625_CRT_CLK_EN_MIPI_DSI] = &__clk_regmap_gate_hw(&clk_en_mipi_dsi),
+		[RTD1625_CRT_CLK_EN_NPUPP]    = &__clk_regmap_gate_hw(&clk_en_npupp),
+		[RTD1625_CRT_CLK_EN_NPU]      = &__clk_regmap_gate_hw(&clk_en_npu),
+		[RTD1625_CRT_CLK_EN_AUCPU0]   = &__clk_regmap_gate_hw(&clk_en_aucpu0),
+		[RTD1625_CRT_CLK_EN_AUCPU1]   = &__clk_regmap_gate_hw(&clk_en_aucpu1),
+		[RTD1625_CRT_CLK_EN_NSRAM]    = &__clk_regmap_gate_hw(&clk_en_nsram),
+		[RTD1625_CRT_CLK_EN_HDMITOP]  = &__clk_regmap_gate_hw(&clk_en_hdmitop),
+		[RTD1625_CRT_CLK_EN_AUCPU_ISO_NPU] = &__clk_regmap_gate_hw(&clk_en_aucpu_iso_npu),
+		[RTD1625_CRT_CLK_EN_KEYLADDER] = &__clk_regmap_gate_hw(&clk_en_keyladder),
+		[RTD1625_CRT_CLK_EN_IFCP_KLM]  = &__clk_regmap_gate_hw(&clk_en_ifcp_klm),
+		[RTD1625_CRT_CLK_EN_IFCP]      = &__clk_regmap_gate_hw(&clk_en_ifcp),
+		[RTD1625_CRT_CLK_EN_MDL_GENPW] = &__clk_regmap_gate_hw(&clk_en_mdl_genpw),
+		[RTD1625_CRT_CLK_EN_MDL_CHIP]  = &__clk_regmap_gate_hw(&clk_en_mdl_chip),
+		[RTD1625_CRT_CLK_EN_MDL_IP]    = &__clk_regmap_gate_hw(&clk_en_mdl_ip),
+		[RTD1625_CRT_CLK_EN_MDLM2M]    = &__clk_regmap_gate_hw(&clk_en_mdlm2m),
+		[RTD1625_CRT_CLK_EN_MDL_XTAL]  = &__clk_regmap_gate_hw(&clk_en_mdl_xtal),
+		[RTD1625_CRT_CLK_EN_TEST_MUX]  = &__clk_regmap_gate_hw(&clk_en_test_mux),
+		[RTD1625_CRT_CLK_EN_DLA]       = &__clk_regmap_gate_hw(&clk_en_dla),
+		[RTD1625_CRT_CLK_EN_TPCW]      = &__clk_regmap_gate_hw(&clk_en_tpcw),
+		[RTD1625_CRT_CLK_EN_GPU_TS_SRC] = &__clk_regmap_gate_hw(&clk_en_gpu_ts_src),
+		[RTD1625_CRT_CLK_EN_VI]        = &__clk_regmap_gate_hw(&clk_en_vi),
+		[RTD1625_CRT_CLK_EN_LVDS1]     = &__clk_regmap_gate_hw(&clk_en_lvds1),
+		[RTD1625_CRT_CLK_EN_LVDS2]     = &__clk_regmap_gate_hw(&clk_en_lvds2),
+		[RTD1625_CRT_CLK_EN_AUCPU]     = &__clk_regmap_gate_hw(&clk_en_aucpu),
+		[RTD1625_CRT_CLK_EN_UR1]       = &__clk_regmap_gate_hw(&clk_en_ur1),
+		[RTD1625_CRT_CLK_EN_UR2]       = &__clk_regmap_gate_hw(&clk_en_ur2),
+		[RTD1625_CRT_CLK_EN_UR3]       = &__clk_regmap_gate_hw(&clk_en_ur3),
+		[RTD1625_CRT_CLK_EN_UR4]       = &__clk_regmap_gate_hw(&clk_en_ur4),
+		[RTD1625_CRT_CLK_EN_UR5]       = &__clk_regmap_gate_hw(&clk_en_ur5),
+		[RTD1625_CRT_CLK_EN_UR6]       = &__clk_regmap_gate_hw(&clk_en_ur6),
+		[RTD1625_CRT_CLK_EN_UR7]       = &__clk_regmap_gate_hw(&clk_en_ur7),
+		[RTD1625_CRT_CLK_EN_UR8]       = &__clk_regmap_gate_hw(&clk_en_ur8),
+		[RTD1625_CRT_CLK_EN_UR9]       = &__clk_regmap_gate_hw(&clk_en_ur9),
+		[RTD1625_CRT_CLK_EN_UR_TOP]    = &__clk_regmap_gate_hw(&clk_en_ur_top),
+		[RTD1625_CRT_CLK_EN_MISC_I2C_7] = &__clk_regmap_gate_hw(&clk_en_misc_i2c_7),
+		[RTD1625_CRT_CLK_EN_MISC_I2C_6] = &__clk_regmap_gate_hw(&clk_en_misc_i2c_6),
+		[RTD1625_CRT_CLK_EN_SPI0]      = &__clk_regmap_gate_hw(&clk_en_spi0),
+		[RTD1625_CRT_CLK_EN_SPI1]      = &__clk_regmap_gate_hw(&clk_en_spi1),
+		[RTD1625_CRT_CLK_EN_SPI2]      = &__clk_regmap_gate_hw(&clk_en_spi2),
+		[RTD1625_CRT_CLK_EN_LSADC0]    = &__clk_regmap_gate_hw(&clk_en_lsadc0),
+		[RTD1625_CRT_CLK_EN_LSADC1]    = &__clk_regmap_gate_hw(&clk_en_lsadc1),
+		[RTD1625_CRT_CLK_EN_ISOMIS_DMA] = &__clk_regmap_gate_hw(&clk_en_isomis_dma),
+		[RTD1625_CRT_CLK_EN_DPTX]      = &__clk_regmap_gate_hw(&clk_en_dptx),
+		[RTD1625_CRT_CLK_EN_NPU_MIPI_CSI] = &__clk_regmap_gate_hw(&clk_en_npu_mipi_csi),
+		[RTD1625_CRT_CLK_EN_EDPTX] = &__clk_regmap_gate_hw(&clk_en_edptx),
+		[RTD1625_CRT_CLK_GPU]          = &__clk_regmap_mux_hw(&clk_gpu),
+		[RTD1625_CRT_CLK_VE1]          = &__clk_regmap_mux_hw(&clk_ve1),
+		[RTD1625_CRT_CLK_VE2]          = &__clk_regmap_mux_hw(&clk_ve2),
+		[RTD1625_CRT_CLK_VE4]          = &__clk_regmap_mux_hw(&clk_ve4),
+		[RTD1625_CRT_PLL_VE1]          = &__clk_pll_hw(&pll_ve1),
+		[RTD1625_CRT_PLL_DDSA]         = &__clk_pll_hw(&pll_ddsa),
+		[RTD1625_CRT_PLL_BUS]          = &__clk_pll_hw(&pll_bus),
+		[RTD1625_CRT_CLK_SYS]          = &clk_sys.hw,
+		[RTD1625_CRT_PLL_DCSB]         = &__clk_pll_hw(&pll_dcsb),
+		[RTD1625_CRT_CLK_SYSH]         = &clk_sysh.hw,
+		[RTD1625_CRT_PLL_GPU]          = &__clk_pll_hw(&pll_gpu),
+		[RTD1625_CRT_PLL_NPU]          = &__clk_pll_hw(&pll_npu),
+		[RTD1625_CRT_PLL_VE2]          = &__clk_pll_hw(&pll_ve2),
+		[RTD1625_CRT_PLL_HIFI]         = &__clk_pll_hw(&pll_hifi),
+		[RTD1625_CRT_PLL_EMMC_REF]     = &pll_emmc_ref.hw,
+		[RTD1625_CRT_PLL_EMMC]         = &__clk_pll_mmc_hw(&pll_emmc),
+		[RTD1625_CRT_PLL_EMMC_VP0]     = &pll_emmc.phase0_hw,
+		[RTD1625_CRT_PLL_EMMC_VP1]     = &pll_emmc.phase1_hw,
+		[RTD1625_CRT_PLL_ACPU]         = &__clk_pll_hw(&pll_acpu),
+		[RTD1625_CRT_CLK_NPU]          = &clk_npu.hw,
+		[RTD1625_CRT_CLK_NPU_MIPI_CSI] = &clk_npu_mipi_csi.hw,
+
+		[RTD1625_CRT_CLK_MAX]          = NULL,
+	},
+};
+
+static const struct rtk_clk_desc rtd1625_crt_desc = {
+	.clk_data        = &rtd1625_crt_hw_data,
+	.clks            = rtd1625_crt_regmap_clks,
+	.num_clks        = ARRAY_SIZE(rtd1625_crt_regmap_clks),
+};
+
+static int rtd1625_crt_probe(struct platform_device *pdev)
+{
+	const struct rtk_clk_desc *desc;
+
+	desc = of_device_get_match_data(&pdev->dev);
+	if (!desc)
+		return -EINVAL;
+
+	return rtk_clk_probe(pdev, desc, "crt_rst");
+}
+
+static const struct of_device_id rtd1625_crt_match[] = {
+	{.compatible = "realtek,rtd1625-crt-clk", .data = &rtd1625_crt_desc,},
+	{ /* sentinel */ }
+};
+
+static struct platform_driver rtd1625_crt_driver = {
+	.probe = rtd1625_crt_probe,
+	.driver = {
+		.name = "rtk-rtd1625-crt-clk",
+		.of_match_table = rtd1625_crt_match,
+	},
+};
+
+static int __init rtd1625_crt_init(void)
+{
+	return platform_driver_register(&rtd1625_crt_driver);
+}
+subsys_initcall(rtd1625_crt_init);
+
+MODULE_DESCRIPTION("Realtek RTD1625 CRT Clock Controller Driver");
+MODULE_AUTHOR("Cheng-Yu Lee <cylee12@realtek.com>");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("REALTEK_CLK");
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
index b59a3f7f2453..65c29a12524d 100644
--- a/drivers/reset/realtek/Makefile
+++ b/drivers/reset/realtek/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_RESET_RTK_COMMON) += common.o
+obj-$(CONFIG_RESET_RTD1625) += reset-rtd1625-crt.o
diff --git a/drivers/reset/realtek/reset-rtd1625-crt.c b/drivers/reset/realtek/reset-rtd1625-crt.c
new file mode 100644
index 000000000000..13553e3224cd
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
+#include "common.h"
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
+MODULE_DESCRIPTION("Reatek RTD1625 CRT Reset Controller Driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("REALTEK_RESET");
-- 
2.34.1

