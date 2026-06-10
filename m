Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023143.outbound.protection.outlook.com [52.101.127.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A139D2D837C;
	Wed, 10 Jun 2026 06:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781072243; cv=fail; b=EaHNjHJskpTkuvC7WPF+IzQtiTqIg6s5mTxlwTcUU7tr5gm8a1aDaPeMKGCu/6ZM/fM+9f7/R0s2e2xRGJcc2kKz/vvJUkH29gumeT1rt/qO0OAC/zfrQfE9nc8OWh2bUEiWyv//MZfxuIVIgNSGRj+EGbXVItxilQSHBgN9t28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781072243; c=relaxed/simple;
	bh=srePhPxfMrGys/OU6YEKZjZJRHAgkcxFvGWuUwKZ2JY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I5EP9F2cNs9qWRNNHyZaIeO1IOmGkN7PyL+jYSUvMyNTf+Y9+oR3V3b/EkmrTZJje0erJHDPVrQIZsf3yVa9mQjcKlTAqe2WZGtBRVgRiGmAvp9/fWjqMIMV8EheNjUHssZRki0fFsgCNPXjLj70k1T1mYGdp8OZROgtpjlAZw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LfoJLHzDAt5q4qp3FIZtMzeOulYTWfavC0vVe9lot/vjTOzan584eMQALK7WC3+uJJc1p21eT/53KHp+QRqM6cN9hYzw0mmccd7L6zv5YGzUnYqpDAF0hcoPOPcVVWfm9cCqHRP+K2M3eEHviNr1VEC0817UWG2qpnzLQkaDptjWw0EQ+Z7PJLjCkUzjU937mvTmkw48KUChCLS8SyRs3jzdnN8dC9hLKP6jFeUltjJs9+yGiQGCSEosct/7OUn70n+s3kKb2uaCRcsSSqQuAzBVUZKDn6ZFCPb1iJacDFfqt5My02tbcBzjAwKFaLB/DQCmM8J/yOaV+eQX4+ZnJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cz1/C1s2UHjpZ8XGmIjVTd0yhgwb4EAoHfCCzoxJQ7A=;
 b=tc3yPXa2l2EZncZ4qN/HrdXmfuxCaSE3IC1Ge8/x+g37jYn545d2yHbt6h8TP5VfPg9ovi4UCybWRpJwWG+u5PBmTjYhgTnAXT1OxEfXURLegiIQHC7Eb+W+T8VIkGETRql0osSbzHknHRIv0QC8jXrmPXTGkqjt57xvzO9qmwpuO3xedCpqpgu3otznd4QzjZg28ReDLuGBKQtgVZ7QET8ZNgM5Io3xjqFnqoCj0LUkqoIunCKDdZ42tJSN2y3/YP2Ly7LXm07NYnIjIqivVZloSYgfUU8byoptWLKcVmtU8ONkEbd0ju5L1Ef9NQ4Fr6OdSvnw3RNiU90wfWjr/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0059.apcprd02.prod.outlook.com (2603:1096:4:1f5::19)
 by TYSPR06MB7299.apcprd06.prod.outlook.com (2603:1096:405:97::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 06:17:18 +0000
Received: from SG2PEPF000B66CD.apcprd03.prod.outlook.com
 (2603:1096:4:1f5:cafe::7f) by SI1PR02CA0059.outlook.office365.com
 (2603:1096:4:1f5::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Wed,
 10 Jun 2026 06:17:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CD.mail.protection.outlook.com (10.167.240.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 06:17:17 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 5E6054084275;
	Wed, 10 Jun 2026 14:17:15 +0800 (CST)
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
Date: Wed, 10 Jun 2026 14:17:10 +0800
Message-ID: <20260610061712.3203984-4-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260610061712.3203984-1-joakim.zhang@cixtech.com>
References: <20260610061712.3203984-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CD:EE_|TYSPR06MB7299:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5561dfe1-9161-4e07-4067-08dec6b7ec11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|7416014|376014|36860700016|56012099006|3023799007|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	siRFlG4pqmF/1ESs2SXjj69evtV96Uqnn9GWgPezL3mlSFql2Ss5es4ZlyQCa+ViUs5TJTTVQwfhR9+q/AH8jA/IqUk8rVskVubYJ5sRWw3UAoPORhjT5bEjT0oPK4DOTUS8jL3G+/ZE1aR91nMmzu4UGYeqgzHjFCUDJxv+Muhac1wRHo6Gy5x+46EgSs+ji22IgJgODko+7TjkjG8zFIc2zwlat7Wryjg0vjnTDnFLFr2aXf7/LSLTCYAihTqUiNyHr3KISH2VngEIWYHc8o4UYm13s1i5pVsv4DgbJQd0/gtJxZjJS9ie8fdFTTiUFaJQSjQLnZQmVw+9M2cmX/+rYOjZi3E1pnPJmCjrAdrlJkEr3ovP7JgB4DYnGsCgdv2k6jQeMU8mzabbCyDaGE4IJiQhuBIY5FkkvlctEU547DVxOUhN88zxhULfFOv5rVwznZhJPASpbKZUVb19n2KPMWwpcYTo766NlXG23o0hh92pmMitMLcF6j9/drxtohHOlSOAxymymC9irD12rXiZ953fPJDLC1iMoaqZ4YIpfGEaWyOqU1YqbsdIpWBg9pN9McG4gAbxJp6cl2RmWy0DiFJ/l8Q6kJAd2yI1RTeFR3Nebn5cw2RMy+zw73MldD2AtqLyINdEbhYRuSAhDPYmArDMmzxth/twga33MuvpoDsbtzW3XXpTGQbyisBq
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(7416014)(376014)(36860700016)(56012099006)(3023799007)(22082099003)(6133799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RYmZhJZiw33F+wgGDe6cyJcELo7v7xWbDm9JzyUf+YBosCrmFFmOiUpEm1uZSVwY7i+JYWHFAqBo0wrAxDLhC7HGfuEhuHfO4U2mN+DN5heE9i56QtZgyyk0vj3aQe8KHyoQ78HqgzOAqDWCUjXpODSPsXbf+z1Q8wcyFuZjvksZCtd7D2fEfb7iCdHimUdxxNKTUysFI/5ysvs4ZOFdILkAMcm3ZsKlTbJsAhLMuZmb/YKnTs0Hs0hFIW/ObSFs+FO1AVfoxzNc0UzGyVf0XCvEHs9a6akAIB1T1u3oEBl89gM7w0Jq7bUK/WqaZv8egmg2PyZqkSyJC45DXeD6MHQVV1dgfe4ehWtJCCSB29POu7Cu4fJu41/7vzFbZy28Xd5axyUPRcuEHDrCh/yrxaNyB385YyepwY+tSMmzqFywbKzgP18juoeJ+93w7imw
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 06:17:17.3285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5561dfe1-9161-4e07-4067-08dec6b7ec11
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CD.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7299

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

