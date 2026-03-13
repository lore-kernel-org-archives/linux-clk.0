Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F96531E83D;
	Fri, 13 Mar 2026 08:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773389636; cv=none; b=DR+rCHmNjK5ozid1gE/QWy0CDaur9REz0LiH8u6TKGcL1HsJeA/3PFNF50KrPHxabjH6jdHV6nhYFmGhls4P9btfpk1vopSmL2u6+zPKVReQ49gKiiu3jOXLr+LudWFLrSI2FB5D+kg/p8rBjsilZKB7Qa1UIysubgYLd3rCLn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773389636; c=relaxed/simple;
	bh=YdY6rUGwMp1tolAiHPOnrpT/zf8Ro0veMCihXzzxCOM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iI9eq4YbZqlcAexk6k0XlRZSmCmVkNmNw8DYcHVRW9a2RAbtqB5swRU9lDa5/R7UEUfYbebL6W7o4TRifIbMcnjLaG/A8Zlj6sJ40/zRwVPIOEG16ZhQ1dNKI2jl4SBB4NssIgnoXJoDEJZnkbKNh8r4JcJqVUEj9EdL90hnQcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=gw8itW/D; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="gw8itW/D"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62D8B1gvC053098, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773389462; bh=nI7RySXrPAdlU34Gg4b+g4Fd4OYdbJfaazhy68ssQIM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=gw8itW/DVXfRiQBUGsxOeN/bhc7ZD3CvUMgbu2u0XCeX4zWX1N7iaczD2FnrvVUsY
	 YRrn8TaeAiw/2slW2DYGlGewZQWFetfJFtZIo3pwfs1WdtNPyDSU3hH4hl3EeLpplr
	 H5vJ4ip8qB0aKe5DMnJvSPEQfZVloggz3+Rw2EvFcQtFkWWX0JWVru7VyXr4X3i2Og
	 iUIME8KuaCjL2UAnxJAktQ3o4fsBC3GUX7DuuGRUxSGvEy+3kWulyyByoIWFv3KEsi
	 ZVF1B3LI+O7XxNO7/4JJz3lAufmIGf9uFYwcIT7EuH18Q96C0TVFkbqy++eQQRqZfz
	 WWx5c2wzFXkiA==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62D8B1gvC053098
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Mar 2026 16:11:01 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 13 Mar 2026 16:11:01 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 13 Mar 2026 16:11:00 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 13 Mar 2026 16:11:00 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>
Subject: [PATCH v4 01/10] dt-bindings: clock: Add Realtek RTD1625 Clock & Reset Controller
Date: Fri, 13 Mar 2026 16:10:51 +0800
Message-ID: <20260313081100.596224-2-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260313081100.596224-1-eleanor.lin@realtek.com>
References: <20260313081100.596224-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add DT binding schema for Realtek RTD1625 clock and reset controller

Co-developed-by: Cheng-Yu Lee <cylee12@realtek.com>
Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v4:
- Add include/dt-bindings/reset/realtek,rtd1625.h and update the commit description
accordingly.
- Drop Krzysztof Kozlowski's Reviewed-by tag due to the new changes.
---
 .../bindings/clock/realtek,rtd1625-clk.yaml   |  52 +++++
 MAINTAINERS                                   |   9 +
 .../dt-bindings/clock/realtek,rtd1625-clk.h   | 164 +++++++++++++++
 include/dt-bindings/reset/realtek,rtd1625.h   | 195 ++++++++++++++++++
 4 files changed, 420 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/realtek,rtd1625-clk.yaml
 create mode 100644 include/dt-bindings/clock/realtek,rtd1625-clk.h
 create mode 100644 include/dt-bindings/reset/realtek,rtd1625.h

diff --git a/Documentation/devicetree/bindings/clock/realtek,rtd1625-clk.yaml b/Documentation/devicetree/bindings/clock/realtek,rtd1625-clk.yaml
new file mode 100644
index 000000000000..6fabc2da3975
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/realtek,rtd1625-clk.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/realtek,rtd1625-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek RTD1625 Clock & Reset Controller
+
+maintainers:
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
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@98000000 {
+      compatible = "realtek,rtd1625-crt-clk";
+      reg = <98000000 0x1000>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 61bf550fd37c..9b7d64cc8d90 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22240,6 +22240,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/dsa/realtek.yaml
 F:	drivers/net/dsa/realtek/*
 
+REALTEK SOC CLOCK AND RESET DRIVERS
+M:	Cheng-Yu Lee <cylee12@realtek.com>
+M:	Yu-Chun Lin <eleanor.lin@realtek.com>
+L:	devicetree@vger.kernel.org
+L:	linux-clk@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/clock/realtek*
+F:	include/dt-bindings/clock/realtek*
+
 REALTEK SPI-NAND
 M:	Chris Packham <chris.packham@alliedtelesis.co.nz>
 S:	Maintained
diff --git a/include/dt-bindings/clock/realtek,rtd1625-clk.h b/include/dt-bindings/clock/realtek,rtd1625-clk.h
new file mode 100644
index 000000000000..61ca652d6880
--- /dev/null
+++ b/include/dt-bindings/clock/realtek,rtd1625-clk.h
@@ -0,0 +1,164 @@
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
index 000000000000..e69b5ee14cc6
--- /dev/null
+++ b/include/dt-bindings/reset/realtek,rtd1625.h
@@ -0,0 +1,195 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2025 Realtek Semiconductor Corp.
+ */
+#ifndef __DT_BINDINGS_RTK_RESET_RTD1625_H
+#define __DT_BINDINGS_RTK_RESET_RTD1625_H
+
+#define RTD1625_RSTN_REG_ID_SOFT_RESET1     0
+#define RTD1625_RSTN_REG_ID_SOFT_RESET2     1
+#define RTD1625_RSTN_REG_ID_SOFT_RESET3     2
+#define RTD1625_RSTN_REG_ID_SOFT_RESET4     3
+#define RTD1625_RSTN_REG_ID_SOFT_RESET7     4
+#define RTD1625_RSTN_REG_ID_SOFT_RESET9     5
+#define RTD1625_RSTN_REG_ID_SOFT_RESET_BIST 6
+#define RTD1625_RSTN_REG_ID_DUMMY0          7
+#define RTD1625_RSTN_REG_ID_DUMMY1          8
+#define RTD1625_RSTN_REG_ID_DUMMY4          9
+#define RTD1625_RSTN_REG_ID_SOFT_RESET11    10
+#define RTD1625_RSTN_REG_ID_SOFT_RESET12    11
+
+#define _REG_ID(n) ((RTD1625_RSTN_REG_ID_ ## n) << 5)
+
+#define RTD1625_CRT_RSTN_MISC      (_REG_ID(SOFT_RESET1) | 0)
+#define RTD1625_CRT_RSTN_DIP       (_REG_ID(SOFT_RESET1) | 2)
+#define RTD1625_CRT_RSTN_GSPI      (_REG_ID(SOFT_RESET1) | 4)
+#define RTD1625_CRT_RSTN_SDS       (_REG_ID(SOFT_RESET1) | 6)
+#define RTD1625_CRT_RSTN_SDS_REG   (_REG_ID(SOFT_RESET1) | 8)
+#define RTD1625_CRT_RSTN_SDS_PHY   (_REG_ID(SOFT_RESET1) | 10)
+#define RTD1625_CRT_RSTN_GPU2D     (_REG_ID(SOFT_RESET1) | 12)
+#define RTD1625_CRT_RSTN_DC_PHY    (_REG_ID(SOFT_RESET1) | 22)
+#define RTD1625_CRT_RSTN_DCPHY_CRT (_REG_ID(SOFT_RESET1) | 24)
+#define RTD1625_CRT_RSTN_LSADC     (_REG_ID(SOFT_RESET1) | 26)
+#define RTD1625_CRT_RSTN_SE        (_REG_ID(SOFT_RESET1) | 28)
+#define RTD1625_CRT_RSTN_DLA       (_REG_ID(SOFT_RESET1) | 30)
+
+#define RTD1625_CRT_RSTN_JPEG             (_REG_ID(SOFT_RESET2) | 0)
+#define RTD1625_CRT_RSTN_SD               (_REG_ID(SOFT_RESET2) | 2)
+#define RTD1625_CRT_RSTN_SDIO             (_REG_ID(SOFT_RESET2) | 6)
+#define RTD1625_CRT_RSTN_PCR_CNT          (_REG_ID(SOFT_RESET2) | 8)
+#define RTD1625_CRT_RSTN_PCIE0_STITCH     (_REG_ID(SOFT_RESET2) | 10)
+#define RTD1625_CRT_RSTN_PCIE0_PHY        (_REG_ID(SOFT_RESET2) | 12)
+#define RTD1625_CRT_RSTN_PCIE0            (_REG_ID(SOFT_RESET2) | 14)
+#define RTD1625_CRT_RSTN_PCIE0_CORE       (_REG_ID(SOFT_RESET2) | 16)
+#define RTD1625_CRT_RSTN_PCIE0_POWER      (_REG_ID(SOFT_RESET2) | 18)
+#define RTD1625_CRT_RSTN_PCIE0_NONSTICH   (_REG_ID(SOFT_RESET2) | 20)
+#define RTD1625_CRT_RSTN_PCIE0_PHY_MDIO   (_REG_ID(SOFT_RESET2) | 22)
+#define RTD1625_CRT_RSTN_PCIE0_SGMII_MDIO (_REG_ID(SOFT_RESET2) | 24)
+#define RTD1625_CRT_RSTN_VO2              (_REG_ID(SOFT_RESET2) | 28)
+#define RTD1625_CRT_RSTN_MISC_SC0         (_REG_ID(SOFT_RESET2) | 30)
+
+#define RTD1625_CRT_RSTN_MD          (_REG_ID(SOFT_RESET3) | 4)
+#define RTD1625_CRT_RSTN_LVDS1       (_REG_ID(SOFT_RESET3) | 6)
+#define RTD1625_CRT_RSTN_LVDS2       (_REG_ID(SOFT_RESET3) | 8)
+#define RTD1625_CRT_RSTN_MISC_SC1    (_REG_ID(SOFT_RESET3) | 10)
+#define RTD1625_CRT_RSTN_I2C_3       (_REG_ID(SOFT_RESET3) | 12)
+#define RTD1625_CRT_RSTN_FAN         (_REG_ID(SOFT_RESET3) | 14)
+#define RTD1625_CRT_RSTN_TVE         (_REG_ID(SOFT_RESET3) | 16)
+#define RTD1625_CRT_RSTN_AIO         (_REG_ID(SOFT_RESET3) | 18)
+#define RTD1625_CRT_RSTN_VO          (_REG_ID(SOFT_RESET3) | 20)
+#define RTD1625_CRT_RSTN_MIPI_CSI    (_REG_ID(SOFT_RESET3) | 22)
+#define RTD1625_CRT_RSTN_HDMIRX      (_REG_ID(SOFT_RESET3) | 24)
+#define RTD1625_CRT_RSTN_HDMIRX_WRAP (_REG_ID(SOFT_RESET3) | 26)
+#define RTD1625_CRT_RSTN_HDMI        (_REG_ID(SOFT_RESET3) | 28)
+#define RTD1625_CRT_RSTN_DISP        (_REG_ID(SOFT_RESET3) | 30)
+
+#define RTD1625_CRT_RSTN_SATA_PHY_POW1  (_REG_ID(SOFT_RESET4) | 0)
+#define RTD1625_CRT_RSTN_SATA_PHY_POW0  (_REG_ID(SOFT_RESET4) | 2)
+#define RTD1625_CRT_RSTN_SATA_MDIO1     (_REG_ID(SOFT_RESET4) | 4)
+#define RTD1625_CRT_RSTN_SATA_MDIO0     (_REG_ID(SOFT_RESET4) | 6)
+#define RTD1625_CRT_RSTN_SATA_WRAP      (_REG_ID(SOFT_RESET4) | 8)
+#define RTD1625_CRT_RSTN_SATA_MAC_P1    (_REG_ID(SOFT_RESET4) | 10)
+#define RTD1625_CRT_RSTN_SATA_MAC_P0    (_REG_ID(SOFT_RESET4) | 12)
+#define RTD1625_CRT_RSTN_SATA_MAC_COM   (_REG_ID(SOFT_RESET4) | 14)
+#define RTD1625_CRT_RSTN_PCIE1_STITCH   (_REG_ID(SOFT_RESET4) | 16)
+#define RTD1625_CRT_RSTN_PCIE1_PHY      (_REG_ID(SOFT_RESET4) | 18)
+#define RTD1625_CRT_RSTN_PCIE1          (_REG_ID(SOFT_RESET4) | 20)
+#define RTD1625_CRT_RSTN_PCIE1_CORE     (_REG_ID(SOFT_RESET4) | 22)
+#define RTD1625_CRT_RSTN_PCIE1_POWER    (_REG_ID(SOFT_RESET4) | 24)
+#define RTD1625_CRT_RSTN_PCIE1_NONSTICH (_REG_ID(SOFT_RESET4) | 26)
+#define RTD1625_CRT_RSTN_PCIE1_PHY_MDIO (_REG_ID(SOFT_RESET4) | 28)
+#define RTD1625_CRT_RSTN_HDMITOP        (_REG_ID(SOFT_RESET4) | 30)
+
+#define RTD1625_CRT_RSTN_I2C_4        (_REG_ID(SOFT_RESET7) | 2)
+#define RTD1625_CRT_RSTN_I2C_5        (_REG_ID(SOFT_RESET7) | 4)
+#define RTD1625_CRT_RSTN_TSIO         (_REG_ID(SOFT_RESET7) | 6)
+#define RTD1625_CRT_RSTN_VI           (_REG_ID(SOFT_RESET7) | 8)
+#define RTD1625_CRT_RSTN_EDP          (_REG_ID(SOFT_RESET7) | 10)
+#define RTD1625_CRT_RSTN_VE1_MMU      (_REG_ID(SOFT_RESET7) | 12)
+#define RTD1625_CRT_RSTN_VE1_MMU_FUNC (_REG_ID(SOFT_RESET7) | 14)
+#define RTD1625_CRT_RSTN_HSE_MMU      (_REG_ID(SOFT_RESET7) | 16)
+#define RTD1625_CRT_RSTN_HSE_MMU_FUNC (_REG_ID(SOFT_RESET7) | 18)
+#define RTD1625_CRT_RSTN_MDLM2M       (_REG_ID(SOFT_RESET7) | 20)
+#define RTD1625_CRT_RSTN_ISO_GSPI     (_REG_ID(SOFT_RESET7) | 22)
+#define RTD1625_CRT_RSTN_SOFT_NPU     (_REG_ID(SOFT_RESET7) | 24)
+#define RTD1625_CRT_RSTN_SPI2EMMC     (_REG_ID(SOFT_RESET7) | 26)
+#define RTD1625_CRT_RSTN_EARC         (_REG_ID(SOFT_RESET7) | 28)
+#define RTD1625_CRT_RSTN_VE1          (_REG_ID(SOFT_RESET7) | 30)
+
+#define RTD1625_CRT_RSTN_PCIE2_STITCH   (_REG_ID(SOFT_RESET9) | 0)
+#define RTD1625_CRT_RSTN_PCIE2_PHY      (_REG_ID(SOFT_RESET9) | 2)
+#define RTD1625_CRT_RSTN_PCIE2          (_REG_ID(SOFT_RESET9) | 4)
+#define RTD1625_CRT_RSTN_PCIE2_CORE     (_REG_ID(SOFT_RESET9) | 6)
+#define RTD1625_CRT_RSTN_PCIE2_POWER    (_REG_ID(SOFT_RESET9) | 8)
+#define RTD1625_CRT_RSTN_PCIE2_NONSTICH (_REG_ID(SOFT_RESET9) | 10)
+#define RTD1625_CRT_RSTN_PCIE2_PHY_MDIO (_REG_ID(SOFT_RESET9) | 12)
+#define RTD1625_CRT_RSTN_DCPHY_UMCTL2   (_REG_ID(SOFT_RESET9) | 14)
+#define RTD1625_CRT_RSTN_MIPI_DSI       (_REG_ID(SOFT_RESET9) | 16)
+#define RTD1625_CRT_RSTN_HIFM           (_REG_ID(SOFT_RESET9) | 18)
+#define RTD1625_CRT_RSTN_NSRAM          (_REG_ID(SOFT_RESET9) | 20)
+#define RTD1625_CRT_RSTN_AUCPU0_REG     (_REG_ID(SOFT_RESET9) | 22)
+#define RTD1625_CRT_RSTN_MDL_GENPW      (_REG_ID(SOFT_RESET9) | 24)
+#define RTD1625_CRT_RSTN_MDL_CHIP       (_REG_ID(SOFT_RESET9) | 26)
+#define RTD1625_CRT_RSTN_MDL_IP         (_REG_ID(SOFT_RESET9) | 28)
+#define RTD1625_CRT_RSTN_TEST_MUX       (_REG_ID(SOFT_RESET9) | 30)
+
+#define RTD1625_CRT_RSTN_ISO_BIST   (_REG_ID(SOFT_RESET_BIST) | 0)
+#define RTD1625_CRT_RSTN_MAIN_BIST  (_REG_ID(SOFT_RESET_BIST) | 2)
+#define RTD1625_CRT_RSTN_MAIN2_BIST (_REG_ID(SOFT_RESET_BIST) | 4)
+#define RTD1625_CRT_RSTN_VE1_BIST   (_REG_ID(SOFT_RESET_BIST) | 6)
+#define RTD1625_CRT_RSTN_VE2_BIST   (_REG_ID(SOFT_RESET_BIST) | 8)
+#define RTD1625_CRT_RSTN_DCPHY_BIST (_REG_ID(SOFT_RESET_BIST) | 10)
+#define RTD1625_CRT_RSTN_GPU_BIST   (_REG_ID(SOFT_RESET_BIST) | 12)
+#define RTD1625_CRT_RSTN_DISP_BIST  (_REG_ID(SOFT_RESET_BIST) | 14)
+#define RTD1625_CRT_RSTN_NPU_BIST   (_REG_ID(SOFT_RESET_BIST) | 16)
+#define RTD1625_CRT_RSTN_CAS_BIST   (_REG_ID(SOFT_RESET_BIST) | 18)
+#define RTD1625_CRT_RSTN_VE4_BIST   (_REG_ID(SOFT_RESET_BIST) | 20)
+
+#define RTD1625_CRT_RSTN_EMMC (_REG_ID(DUMMY0) | 0)
+
+#define RTD1625_CRT_RSTN_GPU (_REG_ID(DUMMY1) | 0)
+
+#define RTD1625_CRT_RSTN_VE2 (_REG_ID(DUMMY4) | 0)
+
+#define RTD1625_CRT_RSTN_UR1    (_REG_ID(SOFT_RESET11) | 0)
+#define RTD1625_CRT_RSTN_UR2    (_REG_ID(SOFT_RESET11) | 2)
+#define RTD1625_CRT_RSTN_UR3    (_REG_ID(SOFT_RESET11) | 4)
+#define RTD1625_CRT_RSTN_UR4    (_REG_ID(SOFT_RESET11) | 6)
+#define RTD1625_CRT_RSTN_UR5    (_REG_ID(SOFT_RESET11) | 8)
+#define RTD1625_CRT_RSTN_UR6    (_REG_ID(SOFT_RESET11) | 10)
+#define RTD1625_CRT_RSTN_UR7    (_REG_ID(SOFT_RESET11) | 12)
+#define RTD1625_CRT_RSTN_UR8    (_REG_ID(SOFT_RESET11) | 14)
+#define RTD1625_CRT_RSTN_UR9    (_REG_ID(SOFT_RESET11) | 16)
+#define RTD1625_CRT_RSTN_UR_TOP (_REG_ID(SOFT_RESET11) | 18)
+#define RTD1625_CRT_RSTN_I2C_7  (_REG_ID(SOFT_RESET11) | 28)
+#define RTD1625_CRT_RSTN_I2C_6  (_REG_ID(SOFT_RESET11) | 30)
+
+#define RTD1625_CRT_RSTN_SPI0       (_REG_ID(SOFT_RESET12) | 0)
+#define RTD1625_CRT_RSTN_SPI1       (_REG_ID(SOFT_RESET12) | 2)
+#define RTD1625_CRT_RSTN_SPI2       (_REG_ID(SOFT_RESET12) | 4)
+#define RTD1625_CRT_RSTN_LSADC0     (_REG_ID(SOFT_RESET12) | 16)
+#define RTD1625_CRT_RSTN_LSADC1     (_REG_ID(SOFT_RESET12) | 18)
+#define RTD1625_CRT_RSTN_ISOMIS_DMA (_REG_ID(SOFT_RESET12) | 20)
+#define RTD1625_CRT_RSTN_AUDIO_ADC  (_REG_ID(SOFT_RESET12) | 22)
+#define RTD1625_CRT_RSTN_DPTX       (_REG_ID(SOFT_RESET12) | 24)
+#define RTD1625_CRT_RSTN_AUCPU1_REG (_REG_ID(SOFT_RESET12) | 26)
+#define RTD1625_CRT_RSTN_EDPTX      (_REG_ID(SOFT_RESET12) | 28)
+
+#define RTD1625_ISO_RSTN_VFD                0
+#define RTD1625_ISO_RSTN_CEC0               2
+#define RTD1625_ISO_RSTN_CEC1               3
+#define RTD1625_ISO_RSTN_CBUSTX             5
+#define RTD1625_ISO_RSTN_CBUSRX             6
+#define RTD1625_ISO_RSTN_USB3_PHY2_XTAL_POW 7
+#define RTD1625_ISO_RSTN_UR0                8
+#define RTD1625_ISO_RSTN_GMAC               9
+#define RTD1625_ISO_RSTN_GPHY               10
+#define RTD1625_ISO_RSTN_I2C_0              11
+#define RTD1625_ISO_RSTN_I2C_1              12
+#define RTD1625_ISO_RSTN_CBUS               13
+#define RTD1625_ISO_RSTN_USB_DRD            14
+#define RTD1625_ISO_RSTN_USB_HOST           15
+#define RTD1625_ISO_RSTN_USB_PHY_0          16
+#define RTD1625_ISO_RSTN_USB_PHY_1          17
+#define RTD1625_ISO_RSTN_USB_PHY_2          18
+#define RTD1625_ISO_RSTN_USB                19
+#define RTD1625_ISO_RSTN_TYPE_C             20
+#define RTD1625_ISO_RSTN_USB_U3_HOST        21
+#define RTD1625_ISO_RSTN_USB3_PHY0_POW      22
+#define RTD1625_ISO_RSTN_USB3_P0_MDIO       23
+#define RTD1625_ISO_RSTN_USB3_PHY1_POW      24
+#define RTD1625_ISO_RSTN_USB3_P1_MDIO       25
+#define RTD1625_ISO_RSTN_VTC                26
+#define RTD1625_ISO_RSTN_USB3_PHY2_POW      27
+#define RTD1625_ISO_RSTN_USB3_P2_MDIO       28
+#define RTD1625_ISO_RSTN_USB_PHY_3          29
+#define RTD1625_ISO_RSTN_USB_PHY_4          30
+
+#define RTD1625_ISO_RSTN_ISOM_MIS           0
+#define RTD1625_ISO_RSTN_GPIOM              2
+#define RTD1625_ISO_RSTN_TIMER7             4
+#define RTD1625_ISO_RSTN_IRDA               6
+#define RTD1625_ISO_RSTN_UR10               8
+
+#endif /* __DT_BINDINGS_RTK_RESET_RTD1625_H */
+
-- 
2.34.1

