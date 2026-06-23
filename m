Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023135.outbound.protection.outlook.com [40.107.44.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6AB39B97F;
	Tue, 23 Jun 2026 07:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782198495; cv=fail; b=dMpSlqc9ZmlvxFLGh4vc6GwQ9RLGM/Wtmawd/SPpDfob2eeAuDaflTfs7U4BTYmDBOLJUtA4QUwBxRaBJzbOkIV58A85+zpAJadDfZH+v8pHqwsWan1YXlS58cnYob7WzZeImNFFP3kTIg7DfcCWXoZOG7NoySZdjXBJ2MKNIW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782198495; c=relaxed/simple;
	bh=a54eThxKti3EuucHvdWLguHxPJ+vWEibcUII0kSGsbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UGVibs+jxgsHjGOAXx8D9XU/aeojAnx+A3f4iBWUeBCVbGjcCElIOTvxEUxh03dj4KgpGzdUMeF0JaH4BtW/bBdlLVaEGWq7Te3t+PCWWd3OOBjO1SbY/9ZOo6WFjLSqpnrWvF4ikojxZMxZlPkyP5i+lIQgFQhn3M5JLurKoxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dglaST60LoPlbXfH7bkmGBOAEQ4yfO9rwe/pIQLdoHue32zb8Bu5hJmv/MERo0zNOFxCEZ7xfn6jmSwSODe0w5KhSwd/fn5tFAVAegCQMN86obMgbtrAW2wAWXRVksOlVUF0dg+xyTLKMh0f/r0zW/oTJ2ryhXL2FWes+WXC+Cj0lvNSgMymfL25FMil7FafjZKme7RsOb0TOszaB8AQup83WFcRVT1HkJlbRS7PoyiC3hPxpDrg2eRGS8UA/70mDWDE/B/z41vp5AgsjDzHNsEjZi3y58hdKn+ZwXoVCRp8zdYSSCcX08b6e56brfSgCuIVtbhHVtfVJbNCykjz/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CA1JEuAQJesEAthq1xbtl71zvOPKeaAZGaTbi8O9GF0=;
 b=LHX8+Um53LYlWihyX+fWvANyWAM2+pUSWHW6EyI1AHRYObIW/sTqt5tVv2UbUdlTdX+/0C9bAQbW+Np12bUSymcQusushFXssOrkOuaK+/H4tGeSzTyb1cscyheEPxuGUaEMUK7kOZAdyxoKD2qqVqLf10J0xTgJqq5TQhGaemE73umJY3e4EgpaFgKndsPFNvEv2igZGD8HE/v1AukghFL+Cof2QMaTDSOz9ITDMNH9I+tBIbAF9XjUllvfYVNxeuorMueMu5X4zV5kWcrRddrVnk7tG4UEApCwyOOzYm9Nu4K5/I5qGNJRGjTPL4LzYfuznTqlU/YWtUgIABfDMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:990:56::20) by KUYPR06MB9181.apcprd06.prod.outlook.com
 (2603:1096:d10:8b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 07:08:10 +0000
Received: from OSA0EPF000000CD.apcprd02.prod.outlook.com
 (2603:1096:990:56:cafe::11) by JH0PR01CA0004.outlook.office365.com
 (2603:1096:990:56::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.20 via Frontend Transport; Tue,
 23 Jun 2026 07:08:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CD.mail.protection.outlook.com (10.167.240.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Tue, 23 Jun 2026 07:08:08 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id A196240E7F98;
	Tue, 23 Jun 2026 15:08:07 +0800 (CST)
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
Subject: [PATCH v6 1/4] dt-bindings: soc: cix: add sky1 audss cru controller
Date: Tue, 23 Jun 2026 15:08:02 +0800
Message-ID: <20260623070805.211019-2-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260623070805.211019-1-joakim.zhang@cixtech.com>
References: <20260623070805.211019-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CD:EE_|KUYPR06MB9181:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bc51e69d-7ec7-49ad-0490-08ded0f62e8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|7416014|376014|23010399003|82310400026|56012099006|3023799007|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IGJ6kHVv6mUKT/apw/faj1nL6NArNAbYySALESRGeGOR0dASa5lLYpbW7PzAdSFEJND2jjCwTgjWoCQptDm4f62kYpvQ+NJwm/dLIKSUfZuCDpVVNfZReY/qFcI0H7VkEeImoybOyah2hqhCX1HrC4gE/ofdMKRwLQFV1EXSXOjgnLf7Dtwn/kn38aGWLupwAaoHRRnjEFN729udcG0hVQcVxBIRrTzBtlBwqYjLORWRhhzmt27ggp+Bw9qrzfQNllCPzdHTVo4cf46iRd/gVE+1Mez8xSBzlgSRqH2byk5MXDDem7NTqic4GJ5x6bWg56KqtMLNt0cXw7uLD3FCTmW2aSXiOPQDwT3tYwbwu8My4mJ2CALi0dMivVgKHO1JaBzDI8fG9HU5GGSsQWagjUcPDmI8EwkZqxQs9jyvZGASXmT4JQpEbWv6VOFwHxGxU7qOW+TMJryMe0HQ8e8Z2gZuzFwB89IgnLYYYp/PxPJPh25FE+MWdH7jvWq4d/bpaeSAXT1ydb9lOyclhi3tY+qllH8LzqbDzEc8mJaYkVxzQWY91uz3pQaUM6PPhkogum0xeaR7POiFQroGbIDn8oi67SjNl9qDIR9slWJsYcszlQEiXDVdirrs6/bQt+IGv5OlY9hcgnZcURUj9WNBtg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(7416014)(376014)(23010399003)(82310400026)(56012099006)(3023799007)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	O+jDg+Q2VRoipjNtHUsp4IixDrQAwnPR2rtpWXyI8fHhvs/yGhQn8c/84T0v8qCBq5hJojc2/K0DQ9CoYE0SruJ3qbX2FZlMaKUSUmZ433TKN1J0nUwFhksoTL9cUWU8NNqD8Bmp1zYYxNMqYbbamqDXaLCfprc577BY2m8WaIXVBrDY5OOM3422afUHZLNHrDsmKLhuE90gvnmeIBXxxhHB/mfsq00nlGbaRgFndD+R8dHsaSO3NN2/ZtAKniajrvJDVU/NH56wRX/i/OC5vPQFe49M2M96mXMVE39xg+con3U0pfSEd777QIYuaT55lW3BzHhej0sNYokwSdIL0SucIfDhHhGQE2RlHcIFH0X0d4YhagtQ7OVkKK5Ybku876UPKdbP/Qryz1q/bFcO8NByCUQxvzGvpS2GivMhQMd/ZGnUJvkhUxHNgT+FXY9j
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 07:08:08.8076
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc51e69d-7ec7-49ad-0490-08ded0f62e8c
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CD.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYPR06MB9181

From: Joakim Zhang <joakim.zhang@cixtech.com>

The Cix Sky1 Audio Subsystem (AUDSS) Clock and Reset Unit (CRU)
groups clock muxing, gating and block-level software reset control
in a single register block.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 .../bindings/soc/cix/cix,sky1-audss-cru.yaml  | 92 +++++++++++++++++++
 .../dt-bindings/clock/cix,sky1-audss-cru.h    | 60 ++++++++++++
 .../dt-bindings/reset/cix,sky1-audss-cru.h    | 25 +++++
 3 files changed, 177 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml
 create mode 100644 include/dt-bindings/clock/cix,sky1-audss-cru.h
 create mode 100644 include/dt-bindings/reset/cix,sky1-audss-cru.h

diff --git a/Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml b/Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml
new file mode 100644
index 000000000000..50dd0593e1d9
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
+  defined in include/dt-bindings/clock/cix,sky1-audss-cru.h.
+
+  Block-level software reset indices are exposed via #reset-cells; indices
+  are defined in include/dt-bindings/reset/cix,sky1-audss-cru.h.
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
+      Clock indices are defined in include/dt-bindings/clock/cix,sky1-audss-cru.h.
+
+  '#reset-cells':
+    const: 1
+    description:
+      Reset indices are defined in include/dt-bindings/reset/cix,sky1-audss-cru.h.
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
diff --git a/include/dt-bindings/clock/cix,sky1-audss-cru.h b/include/dt-bindings/clock/cix,sky1-audss-cru.h
new file mode 100644
index 000000000000..8c58ef8bf682
--- /dev/null
+++ b/include/dt-bindings/clock/cix,sky1-audss-cru.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2026 Cix Technology Group Co., Ltd.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_CIX_SKY1_AUDSS_CRU_H
+#define _DT_BINDINGS_CLOCK_CIX_SKY1_AUDSS_CRU_H
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
diff --git a/include/dt-bindings/reset/cix,sky1-audss-cru.h b/include/dt-bindings/reset/cix,sky1-audss-cru.h
new file mode 100644
index 000000000000..55e9f3797b30
--- /dev/null
+++ b/include/dt-bindings/reset/cix,sky1-audss-cru.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2026 Cix Technology Group Co., Ltd.
+ */
+#ifndef DT_BINDINGS_RESET_CIX_SKY1_AUDSS_CRU_H
+#define DT_BINDINGS_RESET_CIX_SKY1_AUDSS_CRU_H
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

