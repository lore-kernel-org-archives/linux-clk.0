Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022083.outbound.protection.outlook.com [52.101.126.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E5E3EEAC2;
	Fri,  5 Jun 2026 03:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780629838; cv=fail; b=UFQgvBRXV+t1yS6OTmmsBR8HVIWG1YVZAA9g1GLwoEgzOduJ0+4zfDtEqu7fW5dHQOJjpW0MZo4xJpfNGsEAEAbf/GHnDrzj/l27X6QcPHreIHIoTQ5b5mOHuuvRzLmJWj7mDRR/XR8kFuTa20SThFMXS5310BQHJtK4Wu3509Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780629838; c=relaxed/simple;
	bh=3lHDs1DWXzDFmaP2153knYT6qSd9x+W7UrCxbPhjtMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r0ZTuPxXAdwNEXJ9AEZ37sIc2WtM9fa2KPxq5qrolI+e+mcAFuzIVEk/HwcMHpsLTFqwYgXmYvoTV1x2MBPYuDIytmSzZ65RYMTA5d91N7tCBpkn89ATuyrxxpwA8li8r8gF+AuX9GW0RdQqzorwJM8PgVSgSlTSJh9xk6CX0Jo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cODbXDvvsWwHlu7w+Z0f/y6Q+27Y5A3dVpBcvZM895EfoYCHvQ5bnTQz6pAdYALAr476LImFxqmR5NdkJ6B/85xw0tS/f+LBTTJXSc3o1PMWfJtV3GbMwHEzW3cvC6i4Ge8doS7TrPAjkoSHH31jMyMQUf7oWD9WSzL3Pfn8kMDwLcs8LTczMif/bUWc8Tjdwz1/lExPZy2PlrXBTbHaOprpDTJJZZUYilSMCI7ZrcmyGyqkJNDTFejGunrsBHvW9M745A32Z7aAnstO24LZElWm5aiQV0YrJZsDoCbaW1xfo2fGyqX/y+m7rKHOhuhFzM/GjGLifFnVSjZEoG6g2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+cA31u1C882DVmHqxfU8dOoMi1ZGid/mY+wivDMhWQ4=;
 b=gRVDzfVEwc+GU/n/7WcOLoXbbVHwwtZaB6ZLM6sDJbMhiN+UX4dkSf75eqIAoj317NvhJgxIDnQTUBFVSzfanaM4a2eJ4lT6JLXZ+emTIHE0PKRDqwlJU9/H8N8QsnjEYu7ZDrlWD3Bl5nTZIW7Upu9FwK6QhmU+XTvzCaJ9vdRVJUtOl+s0903lz5qXLKeVweYS55bPIdDWEugTOkyw8KFSr312xUXvoOCQ8c5lDMxlvtO4nywgbayUOFEviJ+JRddOskgxgNXv1PCH0PRW49wigEwGpxVhv8vFZ/4oR11ORHnECWY5litW2Vsfxmg30MmJW4BNSFN2k5cu+8ePkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0031.apcprd02.prod.outlook.com (2603:1096:4:1f6::11)
 by KU2PPF0C4CE1E54.apcprd06.prod.outlook.com (2603:1096:d18::48a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Fri, 5 Jun 2026
 03:23:45 +0000
Received: from OSA0EPF000000C9.apcprd02.prod.outlook.com
 (2603:1096:4:1f6:cafe::2e) by SI1PR02CA0031.outlook.office365.com
 (2603:1096:4:1f6::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Fri, 5
 Jun 2026 03:23:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C9.mail.protection.outlook.com (10.167.240.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 5 Jun 2026 03:23:44 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 2E374408426D;
	Fri,  5 Jun 2026 11:23:41 +0800 (CST)
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
Subject: [PATCH v2 3/5] dt-bindings: clock: cix,sky1-audss-clock: add audss clock controller
Date: Fri,  5 Jun 2026 11:22:23 +0800
Message-ID: <20260605032225.523669-4-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260605032225.523669-1-joakim.zhang@cixtech.com>
References: <20260605032225.523669-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C9:EE_|KU2PPF0C4CE1E54:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a7ececbb-b89f-4b78-5133-08dec2b1d9a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700016|22082099003|18002099003|6133799003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	fsNKnYYg7zHrvRHVHBTsGXuXpq2hTIqWEsmXgybU6PurNMxWMt0ZKBxqGrFXTcpYApXIs9uV6/EwxOdO9FGb8ZPYheGigpl6N6gBrzpX7x/qjGr6jYTkiXnIQWib+4Z9r+gLNV+TBKzZIeum/VC4cajh8Yx3lHF9J94srsoTrY+6rHqWfeJy76jym8xWwptDUvgqhktCsnjticzep/6Snm7B92QmmlqqQ5VWK37eFi4AolPfZFy6XaaGs8Ef1HPlOVe+t0gKXgreslZKnFchmB/6G2ddoNcQVf0TLj9SbSHMp7lleafqLlEFtozA+ZUw9pHelPa5gP3jdM/tRxHyfUsrXDmk/TspYgNOOEX/85uM+l4I8477kg9cwJypFXEXSgfdkm+jf5ywcC/yVTXWa/fo2NjrZgilb4kRcuDeAE6yJXuOPWyurq5F+JPENdnwjeI19iAoiiLURPPBSoWuveFc1gsM+MtMRniozQbzlHCqJcY09C1RuvEIrbBWxIu3Eo12GDfJY5Oynz23gDDpYQ5TL4cW3e92cqwFWRz7YxPPShTsKS8Phh1lxZ6rl5WP11Sd3nC1hgFp6uxnzSZRuj6eQ7PuSnL8id9/eqOnOCWs+QSouoY9Aitmi7cKMxaSmqjwjc7bCBnynzeoFiVnsUBuXZ/+jiPwQuHQCGDOJATPZBUOqEii3qLkZCHR4fSp
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700016)(22082099003)(18002099003)(6133799003)(56012099006)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qNXRu0k1tvleKmRP373oPqxKTsvmgHQVnwDv51lTKUASsD3wXvWulNDkAldygirBvi1rwAHiIa1dw+FKScIntle6tp/Td6ejsfcnTVaW1XHSetiLW+3p3FaD/xP++/gD9YiunPEn+9D+2jbIo5EiP76zwaLeZJan64hW0etyDv5cWUrpUrTNQc7MGyZvuieN6sl/VpQK0BSVVyn8c2rDWL4gXwBhfn60Km8fOTMGTIMbqt2qcE3ZheOMeQH6Ol63Y2vREkjCyInZKCD3KaA8kqxgnFdIHQtbbkh8hC9YEooN8OCwNzO99NDTPPKrnFAE4H+t+MQSHGSabTBt+cYuQrHYSjM/uW6Lt70BpIPJy3FDY9CQuSfAoZDN0T62oRSU3MJlhDEskvcRfRAgE2R8wilRAI1tLFp03pKW8eN0XXc30ajQHNQTOIN3w/vftNSr
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 03:23:44.7004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ececbb-b89f-4b78-5133-08dec2b1d9a4
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C9.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPF0C4CE1E54

From: Joakim Zhang <joakim.zhang@cixtech.com>

The AUDSS CRU contains an internal clock tree of muxes, dividers and
gates for DSP, I2S, HDA, DMAC and related blocks. The clock provider is
a child node of the cix,sky1-audss-system-control syscon and accesses
registers through the parent MMIO region.

Add the devicetree binding for cix,sky1-audss-clock and clock indices in
include/dt-bindings/clock/cix,sky1-audss.h. Document the parent syscon
indices.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 .../bindings/clock/cix,sky1-audss-clock.yaml  | 92 +++++++++++++++++++
 include/dt-bindings/clock/cix,sky1-audss.h    | 62 +++++++++++++
 2 files changed, 154 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/cix,sky1-audss-clock.yaml
 create mode 100644 include/dt-bindings/clock/cix,sky1-audss.h

diff --git a/Documentation/devicetree/bindings/clock/cix,sky1-audss-clock.yaml b/Documentation/devicetree/bindings/clock/cix,sky1-audss-clock.yaml
new file mode 100644
index 000000000000..22b4cc72f395
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/cix,sky1-audss-clock.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/cix,sky1-audss-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cix Sky1 audio subsystem clock controller
+
+maintainers:
+  - Joakim Zhang <joakim.zhang@cixtech.com>
+
+description: |
+  Clock provider for the Cix Sky1 audio subsystem (AUDSS).
+
+  This node is a child of a cix,sky1-audss-system-control MFD/syscon node
+  (see cix,sky1-system-control.yaml). It does not have a reg property; clock
+  mux, divider and gate fields are accessed through the parent register block.
+
+  Software reset lines for AUDSS blocks are exposed on the parent syscon via
+  #reset-cells. Reset indices are defined in
+  include/dt-bindings/reset/cix,sky1-audss-system-control.h.
+
+  Six SoC-level reference clocks listed in clocks/clock-names feed the AUDSS
+  clock tree. The provider exposes the internal AUDSS clocks to other devices
+  via #clock-cells; indices are defined in cix,sky1-audss.h.
+
+properties:
+  compatible:
+    const: cix,sky1-audss-clock
+
+  '#clock-cells':
+    const: 1
+    description:
+      Clock indices are defined in include/dt-bindings/clock/cix,sky1-audss.h.
+
+  clocks:
+    minItems: 6
+    maxItems: 6
+    description:
+      Six SoC-level audio reference clocks that feed the audio subsystem,
+      in the same order as clock-names.
+
+  clock-names:
+    items:
+      - const: audio_clk0
+      - const: audio_clk1
+      - const: audio_clk2
+      - const: audio_clk3
+      - const: audio_clk4
+      - const: audio_clk5
+
+  resets:
+    maxItems: 1
+    description: Audio subsystem NoC (or bus) reset line.
+
+  power-domains:
+    maxItems: 1
+    description: Audio subsystem power domain.
+
+required:
+  - compatible
+  - '#clock-cells'
+  - clocks
+  - clock-names
+  - resets
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/cix,sky1.h>
+    #include <dt-bindings/reset/cix,sky1-audss-system-control.h>
+    #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+
+    audss_syscon: system-controller@7110000 {
+        compatible = "cix,sky1-audss-system-control", "simple-mfd", "syscon";
+        reg = <0x7110000 0x10000>;
+        #reset-cells = <1>;
+
+        audss_clk: clock-controller {
+            compatible = "cix,sky1-audss-clock";
+            power-domains = <&smc_devpd 0>;
+            #clock-cells = <1>;
+            clocks = <&scmi_clk CLK_TREE_AUDIO_CLK0>, <&scmi_clk CLK_TREE_AUDIO_CLK1>,
+                     <&scmi_clk CLK_TREE_AUDIO_CLK2>, <&scmi_clk CLK_TREE_AUDIO_CLK3>,
+                     <&scmi_clk CLK_TREE_AUDIO_CLK4>, <&scmi_clk CLK_TREE_AUDIO_CLK5>;
+            clock-names = "audio_clk0", "audio_clk1", "audio_clk2",
+                          "audio_clk3", "audio_clk4", "audio_clk5";
+            resets = <&src SKY1_AUDIO_HIFI5_NOC_RESET_N>;
+        };
+    };
diff --git a/include/dt-bindings/clock/cix,sky1-audss.h b/include/dt-bindings/clock/cix,sky1-audss.h
new file mode 100644
index 000000000000..041f9daa1ee4
--- /dev/null
+++ b/include/dt-bindings/clock/cix,sky1-audss.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2026 Cix Technology Group Co., Ltd.
+ */
+
+#ifndef _DT_BINDINGS_CLK_CIX_SKY1_AUDSS_H
+#define _DT_BINDINGS_CLK_CIX_SKY1_AUDSS_H
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
+#define AUDSS_MAX_CLKS		41
+
+#endif
-- 
2.50.1

