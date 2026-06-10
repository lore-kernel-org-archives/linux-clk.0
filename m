Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022094.outbound.protection.outlook.com [52.101.126.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EBD39A06A;
	Wed, 10 Jun 2026 07:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781078216; cv=fail; b=i7aakng3phoarwKkxAB9yWth+WSftLVDAP4UL8a49cSXsvpfBTky3Bi9aA1o/pDyq9j+oJ5jQQQ+V90zySRNJZ7K0MeTLxuw42gX+MQ4xz3zmuVAtU7J4iETjPFPLq4VqvzlciuKmq1qlBLOeEsKJuP7mTvhm2wlkFW2AHY6C6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781078216; c=relaxed/simple;
	bh=srePhPxfMrGys/OU6YEKZjZJRHAgkcxFvGWuUwKZ2JY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=loAbP9UMM+nyskMEbpQrYIhgjEZytM+YjF40ga4mr9GUIK7ljHh7kuP2pHUW7nwqF9PHmLosKrhWlNMyJ1ZfSiR1lb452ZE6kojr03aZi0vDJpyyhA0M2c4yc3YclXbLv+EQvhpBArm5IZ3OOxerTqMo6zNlpvTtJOstetM2r7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X8gSupfLAvoQpiKQV1fRsYCTbD+sA+Q6b98OWREYVsTe2E/O7TerfCbzGqcJWbc0NuBUg4zaD7t8UjXlbbH5b0rC7GYdfwnuiRXeoFTWjiALH6fyg4lhd7zNCeGJ/pT/PU2UfP3dNk8u8A/fQvrsEQPnWGMm809S08w+A0kp80mmYPhcj9phMH28jqLC7mM3+Fkw4EnRGegkj6vf15/h+kQ2ddw2SH30OAVh5ewEsKNNlrqeF+SD04OZRNuybTdKxljNdaM7+x0j/UtrElwhpSdqsfojwaL1MKoPyyATprfFBMDYPANRSFBB8bjDdbGqzURq8aOJulXEF9H9DwHeNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cz1/C1s2UHjpZ8XGmIjVTd0yhgwb4EAoHfCCzoxJQ7A=;
 b=RhJBsGCH+CLfUlu7seB+ng81PeqdWSFB4aZW3U76zsLKjsABE7pkO+6CNDBOLn5ToZ9K22IFWxyIPscfMMIN7uS1ZUH5FJs6Jdrp8r7ZxZJ9UmyKJhUzeP9YGSRNMpIog0/WEebhi7TnkWUZO74GDWCBqMEp3qFHXPiSVOODgUWpf3mZ+8/xKbGQbs4rgf5+z11NpMZWYV8NKlbf9jhxUgznCKJp7sTQdigGBD2fanZ2WyXe8CocYOCpqQpBxV93NKpp6QFUOeBfIBH5EMkJSgk8BrMqDShViJPR1TXUWJKLfhXMoReBlKMRmzdNEPVIP/8wAeCCrs5SiurWlWngcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OS3P286CA0025.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1f4::8)
 by JH0PR06MB6678.apcprd06.prod.outlook.com (2603:1096:990:36::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 07:56:50 +0000
Received: from OSA0EPF000000CD.apcprd02.prod.outlook.com
 (2603:1096:604:1f4:cafe::4d) by OS3P286CA0025.outlook.office365.com
 (2603:1096:604:1f4::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Wed,
 10 Jun 2026 07:56:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CD.mail.protection.outlook.com (10.167.240.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 07:56:49 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 9B97440A53A1;
	Wed, 10 Jun 2026 15:56:47 +0800 (CST)
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
Subject: [PATCH v3 3/5] dt-bindings: clock: cix,sky1-audss-clock: add audss clock controller
Date: Wed, 10 Jun 2026 15:56:43 +0800
Message-ID: <20260610075645.3581145-4-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260610075645.3581145-1-joakim.zhang@cixtech.com>
References: <20260610075645.3581145-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CD:EE_|JH0PR06MB6678:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 12dd79a5-0c72-4b99-c607-08dec6c5d3ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|7416014|1800799024|56012099006|3023799007|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6FuUMxQAnXhExO3cP69OH91xNPXUPEML6qnunWvViTpRCklf684vJkyKpWzH9agblVhhSD0gI/vXu6m63tmScPy0nTUbi9lrDi2/23pbLeYUA4gR81VdfDr7YC6CGlpPjNPkVmOE80DhHos/bZfVGXAT6EgWmMeXuXn4fiQlRIn6WQM+ez7kKQ+4XH1oHRzI2T8Encj7tzj+BlNWPsb6b0oulpN5oLXyEE8g4MqlO9c9gfINgMqOfvkUnzdj8Qwc0v/C3Wq25IjVH/CShNheGKZ7maMJ/5c45+Ea+FyaaEZ1qtzdGD6T1pOJ5KAseg+7JtQqECVBXSIe6rbyNSuX6/kGq7mPnLDx+SpzCoINZGTolYny2vXin4yv/dCiFV5ae8nkfQid3lmmS3KrKqFCOhb0FM5cYVnL4pZazuhx6T6IHwtIrOXXW7IcvoqG5xbn/711XUlcb4ri646xkVhDes3pSD4HaslKW+sQEMHqGj0SAA+EJM1ujD9s3Uv1fPSgwnB9LMCgfiQUhID3BwCU+9ZAGHaL9Dkd6P+TlI3+x9rf8a41HTwkpFooeE5rAMtmz4PKYWRgdWX5PFL7v89zTVdAsPusde7eNAZkPRIfiU6FACEI0HFR1VKI/V57aBhCB/9VZgsn2xf2ixi3Xfq8hFOPbVoiptGiIIP02S/ssXWH9t5A7ps2Gh3KrkBvv7B7
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(7416014)(1800799024)(56012099006)(3023799007)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	foOlgZttNVRJK9cehv9yby/VS/TiBsV6kgc3A63fnJgdR2F1PBuhA0+jf3MtzVmctuDhEhYTr3zVvcWTDV/dKyldyJtdf824iG8Iqb+fEJ1GPbzFkACoJDxRiZyB2J5QrMHxTE2rK151WOrpZkZ9YOmP32tGV8UiwMbFyZSaDdp5seCvohab7LZ4Y0QvMuAvQWJbJ+4Mrfo+XAo9IDRkMTKlNVzSmPNG2q1XYChqTj5Hwz08gacGBaKMktybYsS/ovfB4Y7UPUqCnFF3AY2nfM6vnPvQewk6gOFO7AO9V8M9yKKtrjgKmKvZoS+W9m/66S4XE0hMtnxFrr28cTrnDfWbINP/X673XVEHlzFp+miPCbREm5RF2V/G1XqDyhIwHcgN0FI/NJ7dgWTTljM7Rm6bIbcBpiWm7UAFmhJa5tAF/hpJm63N223C6f9ff7uK
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 07:56:49.0161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12dd79a5-0c72-4b99-c607-08dec6c5d3ed
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CD.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6678

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
 .../bindings/clock/cix,sky1-audss-clock.yaml  | 80 +++++++++++++++++++
 include/dt-bindings/clock/cix,sky1-audss.h    | 60 ++++++++++++++
 2 files changed, 140 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/cix,sky1-audss-clock.yaml
 create mode 100644 include/dt-bindings/clock/cix,sky1-audss.h

diff --git a/Documentation/devicetree/bindings/clock/cix,sky1-audss-clock.yaml b/Documentation/devicetree/bindings/clock/cix,sky1-audss-clock.yaml
new file mode 100644
index 000000000000..dff56f3a425b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/cix,sky1-audss-clock.yaml
@@ -0,0 +1,80 @@
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
+  Four SoC-level reference clocks listed in clocks/clock-names feed the AUDSS
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
+    items:
+      - description: I2S parent clock for sampling rates multiple of 8kHz.
+      - description: I2S parent clock for sampling rates multiple of 11.025kHz.
+      - description: clock feeding most devices in audss (NOC, DSP, SRAM, HDA, DMAC, I2S, and Mailbox).
+      - description: clock feeding for HDA, Timer and Watchdog, which is a delicated 48MHz clock.
+
+  clock-names:
+    items:
+      - const: x8k
+      - const: x11k
+      - const: sys
+      - const: 48m
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
+
+    clock-controller {
+        compatible = "cix,sky1-audss-clock";
+        power-domains = <&smc_devpd 0>;
+        #clock-cells = <1>;
+        clocks = <&scmi_clk CLK_TREE_AUDIO_CLK0>, <&scmi_clk CLK_TREE_AUDIO_CLK2>,
+                 <&scmi_clk CLK_TREE_AUDIO_CLK4>, <&scmi_clk CLK_TREE_AUDIO_CLK5>;
+        clock-names = "x8k", "x11k", "sys", "48m";
+        resets = <&s5_syscon 31>;
+    };
diff --git a/include/dt-bindings/clock/cix,sky1-audss.h b/include/dt-bindings/clock/cix,sky1-audss.h
new file mode 100644
index 000000000000..033046407dee
--- /dev/null
+++ b/include/dt-bindings/clock/cix,sky1-audss.h
@@ -0,0 +1,60 @@
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
+#endif
-- 
2.50.1

