Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572E83D75CE;
	Tue,  4 Aug 2026 16:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785861566; cv=none; b=fj84/do1AHyrnNBcvzER3//gR0CBTr5Gk3d+Jnjv4/RrzFv1lVa5toNvvH6zB9VmNbrXD6b1HlkOHmuJpRJssidY7NwkD2mRwCnY0VHDtgrssaCzkcwumrb0UNC4ao7cu8FSViVPgwT11pSzYsKUwclj8nYWVWB0RxiuaboYAto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785861566; c=relaxed/simple;
	bh=wWGaLwcvTgkyit4xiVAtqVyf7tLY6hpn1kE1IgRHEVU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XqkmkX8DgkRWqdAiyTJeQI8GVWfRhbhcHp48J4POeGEJW5CpYAAVgRxgopTjYGbhJtIdi1gfxCyqlR/0S1OjOhHPCwvwQh+N4BR/Ii0LcFkGCZGlziXFPgndKCIsG3DHkAswdi62SFZoTqShuMhHZ9FvgIaTyl2r5iM1r2sBjts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=gaByM9vS; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="gaByM9vS"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 674Gc8FW11231932, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1785861488; bh=M3O8LjgCbP9sxWW4N88Y821dVyCQbypPcylShidCqC8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=gaByM9vSpt8+hMhEuyq/RJtvvCggNCJrbehby8kqjshI/zZ6trHwRqVVusIcqv1js
	 2LOrz9B46AmcFhszTl57BgZE+TpVJtPttsWTQBBS2BN4QOWxUt0rKH1SU6NqpDwuMI
	 Ks7igm+45QwX4Oy6XiitQlgY4OfVmiFY8KTVNUpg12WzoDPiB66haFHpSqJ7CA37CY
	 Ug5a+wrxbvXAvvsFT89s2qluZQJKIeaN8Dx+/uKCiDll6duiy/+EdmmFioHSnsC2ah
	 q6jdIHXqIWNPnnk22hfY6O0KaXo8llwVWZnv5rBSMH1vTi00rVYaNBwx/t9cT7a8tC
	 I+zu5fxpL8VTA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 674Gc8FW11231932
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Aug 2026 00:38:08 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
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
	<eleanor.lin@realtek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v12 01/11] dt-bindings: clock: Add Realtek RTD1625 Clock & Reset Controller
Date: Wed, 5 Aug 2026 00:37:57 +0800
Message-ID: <20260804163807.1285869-2-eleanor.lin@realtek.com>
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

Add DT binding schema for Realtek RTD1625 clock and reset controller

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Co-developed-by: Cheng-Yu Lee <cylee12@realtek.com>
Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v12:
- Drop mailing lists from MAINTAINERS.
---
 .../bindings/clock/realtek,rtd1625-clk.yaml   |  58 ++++++
 MAINTAINERS                                   |   8 +
 .../dt-bindings/clock/realtek,rtd1625-clk.h   | 165 +++++++++++++++++
 include/dt-bindings/reset/realtek,rtd1625.h   | 171 ++++++++++++++++++
 4 files changed, 402 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/realtek,rtd1625-clk.yaml
 create mode 100644 include/dt-bindings/clock/realtek,rtd1625-clk.h
 create mode 100644 include/dt-bindings/reset/realtek,rtd1625.h

diff --git a/Documentation/devicetree/bindings/clock/realtek,rtd1625-clk.yaml b/Documentation/devicetree/bindings/clock/realtek,rtd1625-clk.yaml
new file mode 100644
index 000000000000..1aceef31e148
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/realtek,rtd1625-clk.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/realtek,rtd1625-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek RTD1625 Clock & Reset Controller
+
+maintainers:
+  - Cheng-Yu Lee <cylee12@realtek.com>
+  - Yu-Chun Lin <eleanor.lin@realtek.com>
+
+description: |
+  The Realtek RTD1625 Clock Controller manages and distributes clock
+  signals to various controllers and implements a Reset Controller for the
+  SoC peripherals.
+
+  Clocks and resets are referenced by unique identifiers, which are defined as
+  preprocessor macros in include/dt-bindings/clock/realtek,rtd1625-clk.h and
+  include/dt-bindings/reset/realtek,rtd1625.h.
+
+properties:
+  compatible:
+    enum:
+      - realtek,rtd1625-crt-clk
+      - realtek,rtd1625-iso-clk
+      - realtek,rtd1625-iso-s-clk
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@98000000 {
+      compatible = "realtek,rtd1625-crt-clk";
+      reg = <0x98000000 0x1000>;
+      clocks = <&osc27m>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 5114e6db7307..6dc36e93fbd4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22741,6 +22741,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/dsa/realtek.yaml
 F:	drivers/net/dsa/realtek/*
 
+REALTEK SOC CLOCK AND RESET DRIVERS
+M:	Cheng-Yu Lee <cylee12@realtek.com>
+M:	Yu-Chun Lin <eleanor.lin@realtek.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/clock/realtek*
+F:	include/dt-bindings/clock/realtek*
+F:	include/dt-bindings/reset/realtek*
+
 REALTEK SPI-NAND
 M:	Chris Packham <chris.packham@alliedtelesis.co.nz>
 S:	Maintained
diff --git a/include/dt-bindings/clock/realtek,rtd1625-clk.h b/include/dt-bindings/clock/realtek,rtd1625-clk.h
new file mode 100644
index 000000000000..db198bdb883d
--- /dev/null
+++ b/include/dt-bindings/clock/realtek,rtd1625-clk.h
@@ -0,0 +1,165 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2025 Realtek Semiconductor Corp.
+ */
+#ifndef __DT_BINDINGS_RTK_CLOCK_RTD1625_H
+#define __DT_BINDINGS_RTK_CLOCK_RTD1625_H
+
+#define RTD1625_CRT_CLK_EN_MISC           0
+#define RTD1625_CRT_CLK_EN_PCIE0          1
+#define RTD1625_CRT_CLK_EN_DIP            2
+#define RTD1625_CRT_CLK_EN_GSPI           3
+#define RTD1625_CRT_CLK_EN_ISO_MISC       5
+#define RTD1625_CRT_CLK_EN_SDS            6
+#define RTD1625_CRT_CLK_EN_HDMI           7
+#define RTD1625_CRT_CLK_EN_GPU            9
+#define RTD1625_CRT_CLK_EN_VE1            10
+#define RTD1625_CRT_CLK_EN_VE2            11
+#define RTD1625_CRT_CLK_EN_MD             18
+#define RTD1625_CRT_CLK_EN_TP             19
+#define RTD1625_CRT_CLK_EN_RCIC           20
+#define RTD1625_CRT_CLK_EN_NF             21
+#define RTD1625_CRT_CLK_EN_EMMC           22
+#define RTD1625_CRT_CLK_EN_SD             23
+#define RTD1625_CRT_CLK_EN_SDIO_IP        24
+#define RTD1625_CRT_CLK_EN_MIPI_CSI       25
+#define RTD1625_CRT_CLK_EN_EMMC_IP        26
+#define RTD1625_CRT_CLK_EN_SDIO           27
+#define RTD1625_CRT_CLK_EN_SD_IP          28
+#define RTD1625_CRT_CLK_EN_TPB            30
+#define RTD1625_CRT_CLK_EN_MISC_SC1       31
+#define RTD1625_CRT_CLK_EN_MISC_I2C_3     32
+#define RTD1625_CRT_CLK_EN_ACPU           33
+#define RTD1625_CRT_CLK_EN_JPEG           34
+#define RTD1625_CRT_CLK_EN_MISC_SC0       37
+#define RTD1625_CRT_CLK_EN_HDMIRX         45
+#define RTD1625_CRT_CLK_EN_HSE            46
+#define RTD1625_CRT_CLK_EN_FAN            49
+#define RTD1625_CRT_CLK_EN_SATA_WRAP_SYS  52
+#define RTD1625_CRT_CLK_EN_SATA_WRAP_SYSH 53
+#define RTD1625_CRT_CLK_EN_SATA_MAC_SYSH  54
+#define RTD1625_CRT_CLK_EN_R2RDSC         55
+#define RTD1625_CRT_CLK_EN_TPC            56
+#define RTD1625_CRT_CLK_EN_PCIE1          57
+#define RTD1625_CRT_CLK_EN_MISC_I2C_4     58
+#define RTD1625_CRT_CLK_EN_MISC_I2C_5     59
+#define RTD1625_CRT_CLK_EN_TSIO           60
+#define RTD1625_CRT_CLK_EN_VE4            61
+#define RTD1625_CRT_CLK_EN_EDP            62
+#define RTD1625_CRT_CLK_EN_TSIO_TRX       63
+#define RTD1625_CRT_CLK_EN_PCIE2          64
+#define RTD1625_CRT_CLK_EN_EARC           66
+#define RTD1625_CRT_CLK_EN_LITE           67
+#define RTD1625_CRT_CLK_EN_MIPI_DSI       68
+#define RTD1625_CRT_CLK_EN_NPUPP          69
+#define RTD1625_CRT_CLK_EN_NPU            70
+#define RTD1625_CRT_CLK_EN_AUCPU0         71
+#define RTD1625_CRT_CLK_EN_AUCPU1         72
+#define RTD1625_CRT_CLK_EN_NSRAM          73
+#define RTD1625_CRT_CLK_EN_HDMITOP        74
+#define RTD1625_CRT_CLK_EN_AUCPU_ISO_NPU  76
+#define RTD1625_CRT_CLK_EN_KEYLADDER      77
+#define RTD1625_CRT_CLK_EN_IFCP_KLM       78
+#define RTD1625_CRT_CLK_EN_IFCP           79
+#define RTD1625_CRT_CLK_EN_MDL_GENPW      80
+#define RTD1625_CRT_CLK_EN_MDL_CHIP       81
+#define RTD1625_CRT_CLK_EN_MDL_IP         82
+#define RTD1625_CRT_CLK_EN_MDLM2M         83
+#define RTD1625_CRT_CLK_EN_MDL_XTAL       84
+#define RTD1625_CRT_CLK_EN_TEST_MUX       85
+#define RTD1625_CRT_CLK_EN_DLA            86
+#define RTD1625_CRT_CLK_EN_TPCW           88
+#define RTD1625_CRT_CLK_EN_GPU_TS_SRC     89
+#define RTD1625_CRT_CLK_EN_VI             91
+#define RTD1625_CRT_CLK_EN_LVDS1          92
+#define RTD1625_CRT_CLK_EN_LVDS2          93
+#define RTD1625_CRT_CLK_EN_AUCPU          94
+#define RTD1625_CRT_CLK_EN_UR1            96
+#define RTD1625_CRT_CLK_EN_UR2            97
+#define RTD1625_CRT_CLK_EN_UR3            98
+#define RTD1625_CRT_CLK_EN_UR4            99
+#define RTD1625_CRT_CLK_EN_UR5            100
+#define RTD1625_CRT_CLK_EN_UR6            101
+#define RTD1625_CRT_CLK_EN_UR7            102
+#define RTD1625_CRT_CLK_EN_UR8            103
+#define RTD1625_CRT_CLK_EN_UR9            104
+#define RTD1625_CRT_CLK_EN_UR_TOP         105
+#define RTD1625_CRT_CLK_EN_MISC_I2C_7     110
+#define RTD1625_CRT_CLK_EN_MISC_I2C_6     111
+#define RTD1625_CRT_CLK_EN_SPI0           112
+#define RTD1625_CRT_CLK_EN_SPI1           113
+#define RTD1625_CRT_CLK_EN_SPI2           114
+#define RTD1625_CRT_CLK_EN_LSADC0         120
+#define RTD1625_CRT_CLK_EN_LSADC1         121
+#define RTD1625_CRT_CLK_EN_ISOMIS_DMA     122
+#define RTD1625_CRT_CLK_EN_DPTX           124
+#define RTD1625_CRT_CLK_EN_NPU_MIPI_CSI   125
+#define RTD1625_CRT_CLK_EN_EDPTX          126
+#define RTD1625_CRT_CLK_HIFI              128
+#define RTD1625_CRT_CLK_NPU_MIPI_CSI      129
+#define RTD1625_CRT_CLK_NPU               130
+#define RTD1625_CRT_CLK_NPU_SYSH          132
+#define RTD1625_CRT_CLK_HIFI_SCPU         133
+#define RTD1625_CRT_CLK_GPU               134
+#define RTD1625_CRT_CLK_GPU2D             135
+#define RTD1625_CRT_CLK_MIPI_DSI_PCLK     136
+#define RTD1625_CRT_CLK_VE1               137
+#define RTD1625_CRT_CLK_VE2               138
+#define RTD1625_CRT_CLK_VE4               139
+#define RTD1625_CRT_CLK_SYS               141
+#define RTD1625_CRT_CLK_SYSH              142
+#define RTD1625_CRT_PLL_VO                144
+#define RTD1625_CRT_PLL_SDIO_REF          145
+#define RTD1625_CRT_PLL_CR_REF            146
+#define RTD1625_CRT_PLL_EMMC_REF          147
+#define RTD1625_CRT_CLK_MIS_SC0           148
+#define RTD1625_CRT_CLK_MIS_SC1           149
+#define RTD1625_CRT_PLL_SCPU              150
+#define RTD1625_CRT_PLL_VE1               151
+#define RTD1625_CRT_PLL_DDSA              152
+#define RTD1625_CRT_PLL_PSAUDA1           153
+#define RTD1625_CRT_PLL_PSAUDA2           154
+#define RTD1625_CRT_PLL_BUS               155
+#define RTD1625_CRT_PLL_SDIO              156
+#define RTD1625_CRT_PLL_SDIO_VP0          157
+#define RTD1625_CRT_PLL_SDIO_VP1          158
+#define RTD1625_CRT_PLL_DCSB              159
+#define RTD1625_CRT_PLL_GPU               160
+#define RTD1625_CRT_PLL_NPU               161
+#define RTD1625_CRT_PLL_VE2               162
+#define RTD1625_CRT_PLL_HIFI              163
+#define RTD1625_CRT_PLL_SD                164
+#define RTD1625_CRT_PLL_SD_VP0            165
+#define RTD1625_CRT_PLL_SD_VP1            166
+#define RTD1625_CRT_PLL_EMMC              167
+#define RTD1625_CRT_PLL_EMMC_VP0          168
+#define RTD1625_CRT_PLL_EMMC_VP1          169
+#define RTD1625_CRT_PLL_ACPU              170
+#define RTD1625_CRT_CLK_DET               171
+
+#define RTD1625_ISO_CLK_EN_USB_P4         0
+#define RTD1625_ISO_CLK_EN_USB_P3         1
+#define RTD1625_ISO_CLK_EN_MISC_CEC0      2
+#define RTD1625_ISO_CLK_EN_CBUSRX_SYS     3
+#define RTD1625_ISO_CLK_EN_CBUSTX_SYS     4
+#define RTD1625_ISO_CLK_EN_CBUS_SYS       5
+#define RTD1625_ISO_CLK_EN_CBUS_OSC       6
+#define RTD1625_ISO_CLK_EN_MISC_UR0       8
+#define RTD1625_ISO_CLK_EN_I2C0           9
+#define RTD1625_ISO_CLK_EN_I2C1           10
+#define RTD1625_ISO_CLK_EN_ETN_250M       11
+#define RTD1625_ISO_CLK_EN_ETN_SYS        12
+#define RTD1625_ISO_CLK_EN_USB_DRD        13
+#define RTD1625_ISO_CLK_EN_USB_HOST       14
+#define RTD1625_ISO_CLK_EN_USB_U3_HOST    15
+#define RTD1625_ISO_CLK_EN_USB            16
+#define RTD1625_ISO_CLK_EN_VTC            17
+#define RTD1625_ISO_CLK_EN_MISC_VFD       18
+
+#define RTD1625_ISO_S_CLK_EN_ISOM_MIS     0
+#define RTD1625_ISO_S_CLK_EN_ISOM_GPIOM   1
+#define RTD1625_ISO_S_CLK_EN_TIMER7       2
+#define RTD1625_ISO_S_CLK_EN_IRDA         3
+#define RTD1625_ISO_S_CLK_EN_UR10         4
+
+#endif /* __DT_BINDINGS_RTK_CLOCK_RTD1625_H */
diff --git a/include/dt-bindings/reset/realtek,rtd1625.h b/include/dt-bindings/reset/realtek,rtd1625.h
new file mode 100644
index 000000000000..d8c82211a1bb
--- /dev/null
+++ b/include/dt-bindings/reset/realtek,rtd1625.h
@@ -0,0 +1,171 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2025 Realtek Semiconductor Corp.
+ */
+
+#ifndef __DT_BINDINGS_RTK_RESET_RTD1625_H
+#define __DT_BINDINGS_RTK_RESET_RTD1625_H
+
+#define RTD1625_CRT_RSTN_MISC			0
+#define RTD1625_CRT_RSTN_DIP			1
+#define RTD1625_CRT_RSTN_GSPI			2
+#define RTD1625_CRT_RSTN_SDS			3
+#define RTD1625_CRT_RSTN_SDS_REG		4
+#define RTD1625_CRT_RSTN_SDS_PHY		5
+#define RTD1625_CRT_RSTN_GPU2D			6
+#define RTD1625_CRT_RSTN_DC_PHY			7
+#define RTD1625_CRT_RSTN_DCPHY_CRT		8
+#define RTD1625_CRT_RSTN_LSADC			9
+#define RTD1625_CRT_RSTN_SE			10
+#define RTD1625_CRT_RSTN_DLA			11
+#define RTD1625_CRT_RSTN_JPEG			12
+#define RTD1625_CRT_RSTN_SD			13
+#define RTD1625_CRT_RSTN_SDIO			14
+#define RTD1625_CRT_RSTN_PCR_CNT		15
+#define RTD1625_CRT_RSTN_PCIE0_STITCH		16
+#define RTD1625_CRT_RSTN_PCIE0_PHY		17
+#define RTD1625_CRT_RSTN_PCIE0			18
+#define RTD1625_CRT_RSTN_PCIE0_CORE		19
+#define RTD1625_CRT_RSTN_PCIE0_POWER		20
+#define RTD1625_CRT_RSTN_PCIE0_NONSTICH		21
+#define RTD1625_CRT_RSTN_PCIE0_PHY_MDIO		22
+#define RTD1625_CRT_RSTN_PCIE0_SGMII_MDIO	23
+#define RTD1625_CRT_RSTN_VO2			24
+#define RTD1625_CRT_RSTN_MISC_SC0		25
+#define RTD1625_CRT_RSTN_MD			26
+#define RTD1625_CRT_RSTN_LVDS1			27
+#define RTD1625_CRT_RSTN_LVDS2			28
+#define RTD1625_CRT_RSTN_MISC_SC1		29
+#define RTD1625_CRT_RSTN_I2C_3			30
+#define RTD1625_CRT_RSTN_FAN			31
+#define RTD1625_CRT_RSTN_TVE			32
+#define RTD1625_CRT_RSTN_AIO			33
+#define RTD1625_CRT_RSTN_VO			34
+#define RTD1625_CRT_RSTN_MIPI_CSI		35
+#define RTD1625_CRT_RSTN_HDMIRX			36
+#define RTD1625_CRT_RSTN_HDMIRX_WRAP		37
+#define RTD1625_CRT_RSTN_HDMI			38
+#define RTD1625_CRT_RSTN_DISP			39
+#define RTD1625_CRT_RSTN_SATA_PHY_POW1		40
+#define RTD1625_CRT_RSTN_SATA_PHY_POW0		41
+#define RTD1625_CRT_RSTN_SATA_MDIO1		42
+#define RTD1625_CRT_RSTN_SATA_MDIO0		43
+#define RTD1625_CRT_RSTN_SATA_WRAP		44
+#define RTD1625_CRT_RSTN_SATA_MAC_P1		45
+#define RTD1625_CRT_RSTN_SATA_MAC_P0		46
+#define RTD1625_CRT_RSTN_SATA_MAC_COM		47
+#define RTD1625_CRT_RSTN_PCIE1_STITCH		48
+#define RTD1625_CRT_RSTN_PCIE1_PHY		49
+#define RTD1625_CRT_RSTN_PCIE1			50
+#define RTD1625_CRT_RSTN_PCIE1_CORE		51
+#define RTD1625_CRT_RSTN_PCIE1_POWER		52
+#define RTD1625_CRT_RSTN_PCIE1_NONSTICH		53
+#define RTD1625_CRT_RSTN_PCIE1_PHY_MDIO		54
+#define RTD1625_CRT_RSTN_HDMITOP		55
+#define RTD1625_CRT_RSTN_I2C_4			56
+#define RTD1625_CRT_RSTN_I2C_5			57
+#define RTD1625_CRT_RSTN_TSIO			58
+#define RTD1625_CRT_RSTN_VI			59
+#define RTD1625_CRT_RSTN_EDP			60
+#define RTD1625_CRT_RSTN_VE1_MMU		61
+#define RTD1625_CRT_RSTN_VE1_MMU_FUNC		62
+#define RTD1625_CRT_RSTN_HSE_MMU		63
+#define RTD1625_CRT_RSTN_HSE_MMU_FUNC		64
+#define RTD1625_CRT_RSTN_MDLM2M			65
+#define RTD1625_CRT_RSTN_ISO_GSPI		66
+#define RTD1625_CRT_RSTN_SOFT_NPU		67
+#define RTD1625_CRT_RSTN_SPI2EMMC		68
+#define RTD1625_CRT_RSTN_EARC			69
+#define RTD1625_CRT_RSTN_VE1			70
+#define RTD1625_CRT_RSTN_PCIE2_STITCH		71
+#define RTD1625_CRT_RSTN_PCIE2_PHY		72
+#define RTD1625_CRT_RSTN_PCIE2			73
+#define RTD1625_CRT_RSTN_PCIE2_CORE		74
+#define RTD1625_CRT_RSTN_PCIE2_POWER		75
+#define RTD1625_CRT_RSTN_PCIE2_NONSTICH		76
+#define RTD1625_CRT_RSTN_PCIE2_PHY_MDIO		77
+#define RTD1625_CRT_RSTN_DCPHY_UMCTL2		78
+#define RTD1625_CRT_RSTN_MIPI_DSI		79
+#define RTD1625_CRT_RSTN_HIFM			80
+#define RTD1625_CRT_RSTN_NSRAM			81
+#define RTD1625_CRT_RSTN_AUCPU0_REG		82
+#define RTD1625_CRT_RSTN_MDL_GENPW		83
+#define RTD1625_CRT_RSTN_MDL_CHIP		84
+#define RTD1625_CRT_RSTN_MDL_IP			85
+#define RTD1625_CRT_RSTN_TEST_MUX		86
+#define RTD1625_CRT_RSTN_ISO_BIST		87
+#define RTD1625_CRT_RSTN_MAIN_BIST		88
+#define RTD1625_CRT_RSTN_MAIN2_BIST		89
+#define RTD1625_CRT_RSTN_VE1_BIST		90
+#define RTD1625_CRT_RSTN_VE2_BIST		91
+#define RTD1625_CRT_RSTN_DCPHY_BIST		92
+#define RTD1625_CRT_RSTN_GPU_BIST		93
+#define RTD1625_CRT_RSTN_DISP_BIST		94
+#define RTD1625_CRT_RSTN_NPU_BIST		95
+#define RTD1625_CRT_RSTN_CAS_BIST		96
+#define RTD1625_CRT_RSTN_VE4_BIST		97
+#define RTD1625_CRT_RSTN_EMMC			98
+#define RTD1625_CRT_RSTN_GPU			99
+#define RTD1625_CRT_RSTN_VE2			100
+#define RTD1625_CRT_RSTN_UR1			101
+#define RTD1625_CRT_RSTN_UR2			102
+#define RTD1625_CRT_RSTN_UR3			103
+#define RTD1625_CRT_RSTN_UR4			104
+#define RTD1625_CRT_RSTN_UR5			105
+#define RTD1625_CRT_RSTN_UR6			106
+#define RTD1625_CRT_RSTN_UR7			107
+#define RTD1625_CRT_RSTN_UR8			108
+#define RTD1625_CRT_RSTN_UR9			109
+#define RTD1625_CRT_RSTN_UR_TOP			110
+#define RTD1625_CRT_RSTN_I2C_7			111
+#define RTD1625_CRT_RSTN_I2C_6			112
+#define RTD1625_CRT_RSTN_SPI0			113
+#define RTD1625_CRT_RSTN_SPI1			114
+#define RTD1625_CRT_RSTN_SPI2			115
+#define RTD1625_CRT_RSTN_LSADC0			116
+#define RTD1625_CRT_RSTN_LSADC1			117
+#define RTD1625_CRT_RSTN_ISOMIS_DMA		118
+#define RTD1625_CRT_RSTN_AUDIO_ADC		119
+#define RTD1625_CRT_RSTN_DPTX			120
+#define RTD1625_CRT_RSTN_AUCPU1_REG		121
+#define RTD1625_CRT_RSTN_EDPTX			122
+
+/* ISO reset */
+#define RTD1625_ISO_RSTN_VFD			0
+#define RTD1625_ISO_RSTN_CEC0			1
+#define RTD1625_ISO_RSTN_CEC1			2
+#define RTD1625_ISO_RSTN_CBUSTX			3
+#define RTD1625_ISO_RSTN_CBUSRX			4
+#define RTD1625_ISO_RSTN_USB3_PHY2_XTAL_POW	5
+#define RTD1625_ISO_RSTN_UR0			6
+#define RTD1625_ISO_RSTN_GMAC			7
+#define RTD1625_ISO_RSTN_GPHY			8
+#define RTD1625_ISO_RSTN_I2C_0			9
+#define RTD1625_ISO_RSTN_I2C_1			10
+#define RTD1625_ISO_RSTN_CBUS			11
+#define RTD1625_ISO_RSTN_USB_DRD		12
+#define RTD1625_ISO_RSTN_USB_HOST		13
+#define RTD1625_ISO_RSTN_USB_PHY_0		14
+#define RTD1625_ISO_RSTN_USB_PHY_1		15
+#define RTD1625_ISO_RSTN_USB_PHY_2		16
+#define RTD1625_ISO_RSTN_USB			17
+#define RTD1625_ISO_RSTN_TYPE_C			18
+#define RTD1625_ISO_RSTN_USB_U3_HOST		19
+#define RTD1625_ISO_RSTN_USB3_PHY0_POW		20
+#define RTD1625_ISO_RSTN_USB3_P0_MDIO		21
+#define RTD1625_ISO_RSTN_USB3_PHY1_POW		22
+#define RTD1625_ISO_RSTN_USB3_P1_MDIO		23
+#define RTD1625_ISO_RSTN_VTC			24
+#define RTD1625_ISO_RSTN_USB3_PHY2_POW		25
+#define RTD1625_ISO_RSTN_USB3_P2_MDIO		26
+#define RTD1625_ISO_RSTN_USB_PHY_3		27
+#define RTD1625_ISO_RSTN_USB_PHY_4		28
+
+/* ISO_S reset */
+#define RTD1625_ISO_S_RSTN_ISOM_MIS		0
+#define RTD1625_ISO_S_RSTN_GPIOM		1
+#define RTD1625_ISO_S_RSTN_TIMER7		2
+#define RTD1625_ISO_S_RSTN_IRDA			3
+#define RTD1625_ISO_S_RSTN_UR10			4
+
+#endif /* __DT_BINDINGS_RTK_RESET_RTD1625_H */
-- 
2.43.0

