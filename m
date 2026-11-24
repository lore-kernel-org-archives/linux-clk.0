Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795487833;
	b=FqKGijA/h9CzLwHrEbLbrsvfplcHs9+HxrZ1MP4pzqDqtv7NwRxYDoZJEWdh5aSV4i4a
	 iZ6Fjx0Oo4LA3Ckt14djZoxHkvpmVN607cigw/7uyYM9+Rj1fMV18WI8BC12tD2XqjYqR
	 0HXoDnwmAc0fiBhctBnu6eyIVgJsamUqKrHzbjFoF3NdWTMdc/y7kUb6QhILAtKrNNK69
	 n3yBw/ITjkZuR03MQ9JaQAzSL9swULTsYlf5mVu1Q4XB4UaA5BnJ0/HFebxFFkPJ/O61R
	 DLRsRTqEU7EcnGcL4DnfUugOY9VY/Hlsu8EBQ7Y0JNiv6CaQR3zqUwmdVnPn9aWMhAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795487833;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=ygU8fGKUmnGnm5PVxdJh1kJFzSJLmb7y0zqmvaDmUk4=;
	b=1BE/yzgTkTTARvOEyToLpew/Yjl0sByVVQrzNt1r6K7O4JzGnfU2BXW69ZHs8jfrjgyy
	 WZAtod4TPC4ERlAvXHZ/8dciADqFFfg+WjerNPSFwUUA8kXAbOY7STA0Q9qdEyS9mYnlm
	 4tyVo/Lljqnrbq7hLfGvmo5nC9QWKP6f75CwrGKCfGzFwVVIesSc+Pxa4FmphwKyKqIpy
	 5EyqA0tZleIQI3HFujJSUkA70/lTIBBxNFk2meJXc4m+tBDFJ/vyWaZn9ixdvVKxWpxnS
	 dEKi1PfQ059eck80KyJn5h+vn/ERV31MiTVwTay4sSwZYje3P3aV4D3NPvqvbiMlHlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=PkMMetiO;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB69260A2611;
	Tue, 24 Nov 2026 02:37:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB69260A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=PkMMetiO
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AO2ZwH722160542, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795487758; bh=ygU8fGKUmnGnm5PVxdJh1kJFzSJLmb7y0zqmvaDmUk4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=PkMMetiOkG0keOhRjGc+9YZr5pbCihnr5qwvPWmqYt5xZvTheT0Qjk3EAvq7shxDH
	 kxcW2ZHlHCXUELcuKSUL+QBZIc6qIwtQ0XCpiX1Iuzv5yTGnLBIi4SWwkYDsweEQwr
	 HMEm/oGdhQBTG0B9qI2VRW8FLemo8YpGwSYLIDxHOwid1PDS1oKLyGYq6FH1Lr//Rc
	 6IkqadL4Khr0/+m/OhFbkFWT4iypjExzbj6uhlAwjy61eMTAqARY8Za2VBx0T6S8Sy
	 CTIszgODNgBO8/FAoDjG1qWcK3z1OLQNeVIGXjZ3kScCfsYBCLjROF+QkZx+D/xyNR
	 UhplG9bCt8Suw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AO2ZwH722160542
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Nov 2026 10:35:58 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 10:35:58 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 10:35:58 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Tue, 24 Nov 2026 10:35:58 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v17 1/9] dt-bindings: clock: Add Realtek RTD1625 Clock & Reset Controller
Date: Tue, 24 Nov 2026 10:35:49 +0800
Message-ID: <20261124023558.4088635-2-eleanor.lin@realtek.com>
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

Add DT binding schema for Realtek RTD1625 clock and reset controller

Co-developed-by: Cheng-Yu Lee <cylee12@realtek.com>
Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
The reset IDs have been accepted:
https://lore.kernel.org/lkml/1e434e5ab047b503e02e9ed9f3eb0aeb173d5602.camel@pengutronix.de/

Changes in v17:
- Move the 'clocks' and 'clock-names' item descriptions to the top level, and
keep only the item counts in the if/else branches.
---
 .../bindings/clock/realtek,rtd1625-clk.yaml   |  93 ++++++++++
 MAINTAINERS                                   |   6 +
 .../dt-bindings/clock/realtek,rtd1625-clk.h   | 166 ++++++++++++++++++
 3 files changed, 265 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/realtek,rtd1625-clk.yaml
 create mode 100644 include/dt-bindings/clock/realtek,rtd1625-clk.h

diff --git a/Documentation/devicetree/bindings/clock/realtek,rtd1625-clk.yaml b/Documentation/devicetree/bindings/clock/realtek,rtd1625-clk.yaml
new file mode 100644
index 000000000000..d126e07b6729
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/realtek,rtd1625-clk.yaml
@@ -0,0 +1,93 @@
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
+description:
+  The Realtek RTD1625 Clock Controller manages and distributes clock
+  signals to various controllers and implements a Reset Controller for the
+  SoC peripherals.
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
+    minItems: 1
+    items:
+      - description: External 27 MHz oscillator
+      - description: CRT SYS clock input
+      - description: CRT SYSH clock input
+      - description: CRT DDSA divide-by-four clock input
+      - description: CRT miscellaneous gate clock input
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: osc27m
+      - const: clk_sys
+      - const: clk_sysh
+      - const: clk_ddsa_div4
+      - const: clk_en_misc
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
+  - clock-names
+  - "#clock-cells"
+  - "#reset-cells"
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: realtek,rtd1625-iso-clk
+
+    then:
+      properties:
+        clocks:
+          minItems: 5
+
+        clock-names:
+          minItems: 5
+
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+
+        clock-names:
+          maxItems: 1
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@98000000 {
+      compatible = "realtek,rtd1625-crt-clk";
+      reg = <0x98000000 0x1000>;
+      clocks = <&osc27m>;
+      clock-names = "osc27m";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..c51f9fc157c8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23537,6 +23537,12 @@ S:	Maintained
 F:	include/sound/rt*.h
 F:	sound/soc/codecs/rt*
 
+REALTEK CLOCK DRIVERS
+M:	Cheng-Yu Lee <cylee12@realtek.com>
+M:	Yu-Chun Lin <eleanor.lin@realtek.com>
+S:	Supported
+F:	include/dt-bindings/clock/realtek*
+
 REALTEK OTTO WATCHDOG
 M:	Sander Vanheule <sander@svanheule.net>
 L:	linux-watchdog@vger.kernel.org
diff --git a/include/dt-bindings/clock/realtek,rtd1625-clk.h b/include/dt-bindings/clock/realtek,rtd1625-clk.h
new file mode 100644
index 000000000000..ea4e6bb77736
--- /dev/null
+++ b/include/dt-bindings/clock/realtek,rtd1625-clk.h
@@ -0,0 +1,166 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2026 Realtek Semiconductor Corp.
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
+#define RTD1625_CRT_PLL_VODMA             172
+#define RTD1625_CRT_CLK_DDSA_DIV4         173
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
-- 
2.43.0

