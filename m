Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023083.outbound.protection.outlook.com [40.107.44.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F302A31353C;
	Mon, 22 Jun 2026 02:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782095135; cv=fail; b=MJx/Gl325fXiSdOTvYMLDbkbIdVyYsTkQKvvMqfhW+6AXrqqLrmZnt7FEWPbNyq2/udouvR9b/M+5C5O1C7fTwSdSMSgTtMJgUd8BDybW4+lL425fE7Bj1xaaEM8y6YVVrsDOEPnBi7t4ObP41XaU+3ItJFU6chrgghIMiqVi18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782095135; c=relaxed/simple;
	bh=XlhzOdNxcmx0PKBox++Tpy30kPFgEQTAq0mdegmwqes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EZg956ZQ170UMl9bvGgXYSLQotfH4aOloa4vzFDHPBfVymKtWqFKTJhmK5qr4wcPiFGJ7HvbXI2KmLbAVr/eeiMQeL4kvXuxa751rSJkbzFAXGjOg9bPum1YHN08spOVdo0iTXHKOaN2fhFfynfsk9kJLKPsYM2Ph6/tY0CD9VU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iVPDhdWt4nGGdhQhQWEswgZ+JHag/w2XWKzyHEvEzmWp5XvFkxgVjqj0yRKpzxmthcKKXxMUDpWOpDj0owEMoIasZtNaZZsqiMehgflyWVChxPx39sWPC/HVKHtGqINUxTRB2Iz9piqV6f7gTadrcQA5/HMP7YudF/MQaWgGQpd1wjfN4RFxgSgzVBdlIfDH9wKB8G+NOEhSnRD652Us5ZAkCknNzAvccTALb+2vEMFD6axaKNNRlgPAqLm30SVG6kXwsaLKo52Z4VxeXSW9DEVUxGyRmiMESNs8Iq18gPLRsY3aTRL6z954l6VQdlPhuIouEHhN0pEy7qft94l9yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QiBaJKqpASei7HSSL/aA1H67jqqvtRyCe0AlNmJmwr8=;
 b=Jt5ULphMB7HfTJ9W2TlL4csAgUXXTj983OBxVZKzaY07PzFxuIQxVDFFelY9/cMxBeA+ggjlYtxJU3aF2MeOU6C3Tt5KkSkfDllaWdU0KKHXhXBu9ksmQ1pesZAqHqxb3/u4AMRI553gnlVg65FMiBC5rMoIIuUHrB9YM8VHVcSpugWxODUUhv2fQC0QMxjuUaWuO4UV03TSLrfBVjhrk0sWT4THCp48DG2l9ICg8qvWdGmN40JLbrzRoLVhQ1FaCZI9dlIORJh9OVPnvI9RPH527k7uw5PamAI96+Nx5FjBI8OqRdq5T1uup0cEaMqIFhOaEGn7KyVcEP+rjfi+Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR04CA0017.apcprd04.prod.outlook.com (2603:1096:4:197::15)
 by JH0PR06MB7056.apcprd06.prod.outlook.com (2603:1096:990:6c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 02:25:29 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:197:cafe::28) by SI2PR04CA0017.outlook.office365.com
 (2603:1096:4:197::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.15 via Frontend Transport; Mon,
 22 Jun 2026 02:25:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 22 Jun 2026 02:25:28 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id DF29D40E7F95;
	Mon, 22 Jun 2026 10:25:25 +0800 (CST)
From: joakim.zhang@cixtech.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	gary.yang@cixtech.com
Cc: cix-kernel-upstream@cixtech.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v5 1/4] dt-bindings: soc: cix: add sky1 audss cru controller
Date: Mon, 22 Jun 2026 10:25:17 +0800
Message-ID: <20260622022520.3127103-2-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260622022520.3127103-1-joakim.zhang@cixtech.com>
References: <20260622022520.3127103-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|JH0PR06MB7056:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 32f08deb-8a8a-47fb-32dc-08ded00586a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|36860700016|82310400026|3023799007|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	eVLFMAzKTCaXLBAeRnLH2aTvN5o47CZrCbeX91lQtz3J/5/QsIlLe144sEwwPxF4wdHTsol14RmIHrvjeRN9R9vmp7Bd9tlW6KOMPwgX5h2OBlhL0kC0Zaq1vXIpD50Ksp48emEJG5JCXjG/yXj6rCR2OFLCitbIHDJhfQzm8vp1Ea1pGyNDZljCCSPPMipJILVoqr6YQfx1o4AfbbzwRs/P/QpDG+AHwTC0tyMZJVl88wcR0YzgRz5I1Zrvy0HqWpSoayQkSDCEJiAbdgKpVzLn5RlDdf9S0ZRYxpO7izcndFmrTYru0LX0G4ChKiuAglca8O9IOGl5vj3IVUPgj8G63sg4UUofsiJYCL39nrTyT7Eyv4HQlhChbrLNsNt+JIzNuZeIieyQ7QYxxDfQ50NjaAjx+ECvq/66YRMQYC80GVjLltfNAgWhnSU2R7RQl5HrW7/WTAV8So0cOW6ztKulvea5X5w0kfntsfHehfnOnXVRQUWSTXzHK5fLqh6GY7Nl4rS1FDgcxBud0z+bSTWVH162f+xHrtuowhTCFjyGNuhgH2YHfFJfq5XpJutW2NuVPKCISrzKJSf7WCu82MTisCi386LWjJTeH7rRwVx8hSfENarHbreHUbw90g4rK5BU/Ogi1y2zc/l4oCXjiA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(36860700016)(82310400026)(3023799007)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nozCQQ+v4+wONjYC/XtLicdDGZ+t0SWylblao+af5naalKunBN4qID8IrIGlG0jPFGJb20SGVcT+wvqt4NWlEkzqKK5JeeY+4Yieck8jwHErDQH+JfSBzKfekXNnNl7YzrFwmZ4VxL1sACPwLcm7NW8xksmKCbRhkGHeInZc5D3MtZB7DHKZ0J284uQvNcYZ5uJJCTp4xPolVG85SogMj41PKgDDv0Hviuj9R45Lm/ymv2U5DKfRmHTukCJefNB15O7Mxyv0AJj8dYpvmeyVmSf2q5r1nyChBCYtJmtEws7eSRbHeTpl/6x72Jr+K0CKegeZUS6c19x+aeAonlT/jcwZS756ERkP7X/tyXV/uxVJXaSklxAIR1Zgk3kOM5Ld9+wrDntODJo65FIvbBhM5waIOW/r58IyvzDlcHLlu5gQZoq+tqIjtj4thI5E+UgE
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 02:25:28.1761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f08deb-8a8a-47fb-32dc-08ded00586a5
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7056

From: Joakim Zhang <joakim.zhang@cixtech.com>

The Cix Sky1 Audio Subsystem (AUDSS) Clock and Reset Unit (CRU)
groups clock muxing, gating and block-level software reset control
in a single register block.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 .../bindings/soc/cix/cix,sky1-audss-cru.yaml  | 92 +++++++++++++++++++
 .../dt-bindings/clock/cix,sky1-audss-clock.h  | 60 ++++++++++++
 .../dt-bindings/reset/cix,sky1-audss-reset.h  | 25 +++++
 3 files changed, 177 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml
 create mode 100644 include/dt-bindings/clock/cix,sky1-audss-clock.h
 create mode 100644 include/dt-bindings/reset/cix,sky1-audss-reset.h

diff --git a/Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml b/Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml
new file mode 100644
index 000000000000..d5a6d771bc6f
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/cix/cix,sky1-audss-cru.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cix Sky1 audio subsystem clock and reset unit
+
+maintainers:
+  - Joakim Zhang <joakim.zhang@cixtech.com>
+
+description: |
+  The Cix Sky1 Audio Subsystem (AUDSS) Clock and Reset Unit (CRU) groups
+  audio-related clock muxing, gating and block-level software reset control
+  in a single register block.
+
+  A single device node exposes both the clock controller and software reset
+  lines. The clock driver registers as a platform driver; the reset controller
+  is registered by an auxiliary driver bound from the clock driver.
+
+  Four SoC-level reference clocks listed in clocks/clock-names feed the AUDSS
+  clock tree. Internal AUDSS clocks are exposed via #clock-cells; indices are
+  defined in include/dt-bindings/clock/cix,sky1-audss-clock.h.
+
+  Block-level software reset indices are exposed via #reset-cells; indices
+  are defined in include/dt-bindings/reset/cix,sky1-audss-reset.h.
+
+  The SoC syscon NoC (or bus) reset is described via resets. The audio
+  subsystem power domain is described via power-domains.
+
+properties:
+  compatible:
+    const: cix,sky1-audss-cru
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+    description:
+      Clock indices are defined in include/dt-bindings/clock/cix,sky1-audss-clock.h.
+
+  '#reset-cells':
+    const: 1
+    description:
+      Reset indices are defined in include/dt-bindings/reset/cix,sky1-audss-reset.h.
+
+  clocks:
+    items:
+      - description: I2S parent clock for sampling rates multiple of 8kHz.
+      - description: I2S parent clock for sampling rates multiple of 11.025kHz.
+      - description: Clock feeding most devices in AUDSS (NOC, DSP, SRAM, HDA, DMAC, I2S, and mailbox).
+      - description: Clock feeding HDA, timer and watchdog, which is a dedicated 48 MHz clock.
+
+  clock-names:
+    items:
+      - const: x8k
+      - const: x11k
+      - const: sys
+      - const: 48m
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - '#reset-cells'
+  - clocks
+  - clock-names
+  - power-domains
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    audss_cru: clock-controller@7110000 {
+        compatible = "cix,sky1-audss-cru";
+        reg = <0x7110000 0x10000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        clocks = <&scmi_clk 76>, <&scmi_clk 78>,
+                 <&scmi_clk 70>, <&scmi_clk 71>;
+        clock-names = "x8k", "x11k", "sys", "48m";
+        power-domains = <&smc_devpd 0>;
+        resets = <&s5_syscon 31>;
+    };
diff --git a/include/dt-bindings/clock/cix,sky1-audss-clock.h b/include/dt-bindings/clock/cix,sky1-audss-clock.h
new file mode 100644
index 000000000000..7e9bd3e6c7a1
--- /dev/null
+++ b/include/dt-bindings/clock/cix,sky1-audss-clock.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2026 Cix Technology Group Co., Ltd.
+ */
+
+#ifndef _DT_BINDINGS_CLK_CIX_SKY1_AUDSS_CLOCK_H
+#define _DT_BINDINGS_CLK_CIX_SKY1_AUDSS_CLOCK_H
+
+#define CLK_AUD_CLK4_DIV2	0
+#define CLK_AUD_CLK4_DIV4	1
+#define CLK_AUD_CLK5_DIV2	2
+
+#define CLK_DSP_CLK		3
+#define CLK_DSP_BCLK		4
+#define CLK_DSP_PBCLK		5
+
+#define CLK_SRAM_AXI		6
+
+#define CLK_HDA_SYS		7
+#define CLK_HDA_HDA		8
+
+#define CLK_DMAC_AXI		9
+
+#define CLK_WDG_APB		10
+#define CLK_WDG_WDG		11
+
+#define CLK_TIMER_APB		12
+#define CLK_TIMER_TIMER		13
+
+#define CLK_MB_0_APB		14	/* MB0: ap->dsp */
+#define CLK_MB_1_APB		15	/* MB1: dsp->ap */
+
+#define CLK_I2S0_APB		16
+#define CLK_I2S1_APB		17
+#define CLK_I2S2_APB		18
+#define CLK_I2S3_APB		19
+#define CLK_I2S4_APB		20
+#define CLK_I2S5_APB		21
+#define CLK_I2S6_APB		22
+#define CLK_I2S7_APB		23
+#define CLK_I2S8_APB		24
+#define CLK_I2S9_APB		25
+#define CLK_I2S0		26
+#define CLK_I2S1		27
+#define CLK_I2S2		28
+#define CLK_I2S3		29
+#define CLK_I2S4		30
+#define CLK_I2S5		31
+#define CLK_I2S6		32
+#define CLK_I2S7		33
+#define CLK_I2S8		34
+#define CLK_I2S9		35
+
+#define CLK_MCLK0		36
+#define CLK_MCLK1		37
+#define CLK_MCLK2		38
+#define CLK_MCLK3		39
+#define CLK_MCLK4		40
+
+#endif
diff --git a/include/dt-bindings/reset/cix,sky1-audss-reset.h b/include/dt-bindings/reset/cix,sky1-audss-reset.h
new file mode 100644
index 000000000000..fe4116866b63
--- /dev/null
+++ b/include/dt-bindings/reset/cix,sky1-audss-reset.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright 2026 Cix Technology Group Co., Ltd.
+ */
+#ifndef DT_BINDINGS_RESET_CIX_SKY1_AUDSS_RESET_H
+#define DT_BINDINGS_RESET_CIX_SKY1_AUDSS_RESET_H
+
+#define AUDSS_I2S0_SW_RST	0
+#define AUDSS_I2S1_SW_RST	1
+#define AUDSS_I2S2_SW_RST	2
+#define AUDSS_I2S3_SW_RST	3
+#define AUDSS_I2S4_SW_RST	4
+#define AUDSS_I2S5_SW_RST	5
+#define AUDSS_I2S6_SW_RST	6
+#define AUDSS_I2S7_SW_RST	7
+#define AUDSS_I2S8_SW_RST	8
+#define AUDSS_I2S9_SW_RST	9
+#define AUDSS_WDT_SW_RST	10
+#define AUDSS_TIMER_SW_RST	11
+#define AUDSS_MB0_SW_RST	12
+#define AUDSS_MB1_SW_RST	13
+#define AUDSS_HDA_SW_RST	14
+#define AUDSS_DMAC_SW_RST	15
+
+#endif
-- 
2.50.1

