Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022106.outbound.protection.outlook.com [52.101.126.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820193176EF;
	Sat, 30 May 2026 02:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780107415; cv=fail; b=jlRsR5nRiktDzKMFwqMpGMTSQbQORVoOb2ssWPoDLBPFwvtCCbdItyheedqpS1HPGBkNRxbg+zUGd6t97ZT3FD5M20Bghy/Xr7RY3vKSwpKcgt+NbkM4hXCJtW2fNvV11ps8yzb4ZqFyE5utxzCUH8ZtuHIzkIIXQzSQfn0aYIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780107415; c=relaxed/simple;
	bh=MnuDY1p2Fzfw3IpmDfrPWsz7qMvpp0oe2fDbf5yscrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RUoFlGxbP0phsK89JW2tPlo5KIajYehyZ+qfAkbf8StHN+arIExLYWszSu9n5XlzT9iYd4bwUZVVnARDhLba4AITatW4kbGqJnVNl2hu71KJNKmMVRsokoJeq+6TOmuSAwMhwIr9TgJSwUrc1Gi8gdiUfy4DVKvV3Zo0Wx5CTfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bsxXXieP98N8+z75z2ey8pdz7mx0fipHHjVAsIu9Cwcetx/qDI/+Cr+MJvno03WDISnBFfdspr+nFYwRzST+VGSgPJG2gpDwK4nvBK39uZ3knjjP39gLanlhkDTt9fmuvhHPQqutb1zo189Vdc5fCjwdouigBdqXiGaVD0RTww2iRaCmTuOpp+YO4fDU54nMFfwW7EzbMQINRu67tfozTHptIE0T+pFz0VI2armRPIxI0Otc3ecOZ6jj7ztbOALvGUTYZK7Yb3w+7OKBtpC0UnLwBJ4wl87ZZZ24h7c3es0KJKwjCw61vojgOWkNFguMvL0Hx5LFDI0gyBe/9Fk/1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEoCRdhMYX8R5j3udA0Ss9sKgn1ID1FQ9o2Im1oY1qg=;
 b=Ctj0JqpTbJqoWL8fNYF5aX/r05NGjrOThTFFMJWJIDeS7EXxBpyFUdiOy7gvo+zVmSRE0aY3WU7rZ1rzpLBlI5OmohIttoYGPM3AXI3vCEKktvCi9e39Z+95CRvuOudYCHc7iuoZpR3bk01rl2HbwvDx0XBKJeD4Ul4EJrfFBn2Yl50j5AdfuhwmEzp802q1yV5F7/buczJpFOlub2tLntsKhbml3kZFzl2P4jBV9DFpJSnLTQIyr+WXqYr6JW3dVQg2kur1rjaeUmXCgom1R3pxHOLt+Ij7Rc0F7pOaJg/1Cu1qGixXvcaWnjaVeMFBgdD9TYJj53dayhYhxMrPmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0001.apcprd02.prod.outlook.com (2603:1096:4:1f7::15)
 by TYSPR06MB7097.apcprd06.prod.outlook.com (2603:1096:405:8d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Sat, 30 May
 2026 02:16:50 +0000
Received: from OSA0EPF000000CB.apcprd02.prod.outlook.com
 (2603:1096:4:1f7:cafe::89) by SI1PR02CA0001.outlook.office365.com
 (2603:1096:4:1f7::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.15 via Frontend Transport; Sat, 30
 May 2026 02:16:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CB.mail.protection.outlook.com (10.167.240.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Sat, 30 May 2026 02:16:48 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 2E712408426B;
	Sat, 30 May 2026 10:16:47 +0800 (CST)
From: joakim.zhang@cixtech.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: cix-kernel-upstream@cixtech.com,
	linux-clk@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v1 2/7] dt-bindings: clock: cix,sky1-audss-clock: add audss clock controller
Date: Sat, 30 May 2026 10:16:37 +0800
Message-ID: <20260530021642.64059-3-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260530021642.64059-1-joakim.zhang@cixtech.com>
References: <20260530021642.64059-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CB:EE_|TYSPR06MB7097:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c0f79c17-5e8c-4e82-68fe-08debdf18157
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700016|22082099003|18002099003|56012099006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	MoAfdUw9fMemr1qo+H3dqO9JmPajrK7gWNkMsi7vtfM8sHdcBga24j4+w0wgW2oozc+iNOBehmoHAVo3LktgPbJD6HAog1SWeLPJOE2MN4pjTLBtDJqHC+UkhgrW1NRXvd+UdevY/hoUTlnXWoHqfAKrFpyRIn08dy+tcyrR0DiUnYi9s3jH00Ec4TPyMxHPFfoyPm0H8MHSquuvrD6GCdYs20vGsVIN4jxV3LH1W7PQjeuwOCRCVBqxxj1ElbUs6ZYXNOMKoseqa4M0bnYfqsRar8wk5jW+dHtKixead2BB3VXYOcv2Wx1HThC3QvPQqmwUsN2pK5c85qgCOkzGr/Rmx3nyGtpoyr8L1pmzoJ32vZB5YQGnpnPUYKgxf3p71lO1Ut6TFRlrX2yTZ/36ReZiQK5fW3tu5Et7G28rPEe26hl8Q95EnqKf3yz6Ml3Hx465sReXpkEa9Rc2wd6w2SvHaFWp5+4M3Zq0xYUTTT9IuHP+lrMxcJM2KYIXRVfWUWBbu24AwXzIosVSQjPPBSWqZfoG43vStVmVM/xlVM1IlM+sMtRiHjvHMoHLkh9EkxgmyMawRI3r3RQ0unOSqJKGqq5Pcivoy2lCAuAR+TQYFPeRTdjCCeWSgyCoGQjaKeN4uTKKdS+FdI/oKiJzkUSSHEf6Ua/3zgOAqT0VuqAG/Aj7G0Pve662m12RrD76
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700016)(22082099003)(18002099003)(56012099006)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/VN5xV+InsRuFtefFrwaU+UPtE+jgmuPpd54lXwK7eU3ybc/lkbjZwt8Zgw4urokw7CjH8g3vrOlW30kj0TNEgqWSmwieK1kcy1JUbLs87nHcjtqa0ezfA0Ms7kj9L/hGe4OWVwaMzdvuHUfqOh90fboqALqaLC7FpASkH97ohssbayitSn4vrEc9mxcXC9ZsxUzeODQtxhfXgak/8T+Z/YORkkNNWBMUuZOp1RuptjEVzAVxq4M722RBh5Zc1cvaWKS+miCWYT5iNRJcaEo/CPt5QzQF7JA8gBq9bYv82XsEjsBD8D0Qot/CY6SUU90ClRx/h5iAcib+INJlD6tvcl06dJl+85lHNfEzaiAlz3VMfBAVJqt87gzzDOh9FpHSjdwfRK/6sAA2jPIreBvOis01jRs8o+jhPQBZexhA31xKW9oVBAVA4QSKtaAjfcq
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2026 02:16:48.1374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f79c17-5e8c-4e82-68fe-08debdf18157
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CB.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7097

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add schema and clock IDs for the Cix Sky1 audio subsystem (AUDSS)
clock controller.

The compatible string is cix,sky1-audss-clock. Clock indices are
defined in include/dt-bindings/clock/sky1-audss.h.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 .../bindings/clock/cix,sky1-audss-clock.yaml  | 86 +++++++++++++++++++
 include/dt-bindings/clock/sky1-audss.h        | 64 ++++++++++++++
 2 files changed, 150 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/cix,sky1-audss-clock.yaml
 create mode 100644 include/dt-bindings/clock/sky1-audss.h

diff --git a/Documentation/devicetree/bindings/clock/cix,sky1-audss-clock.yaml b/Documentation/devicetree/bindings/clock/cix,sky1-audss-clock.yaml
new file mode 100644
index 000000000000..fb12c71381e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/cix,sky1-audss-clock.yaml
@@ -0,0 +1,86 @@
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
+  This node is a child of a cix,sky1-audss-cru MFD/syscon node (see
+  cix,sky1-audss-cru.yaml). It does not have a reg property; clock mux,
+  divider and gate fields are accessed through the parent CRU regmap.
+
+  Six SoC-level reference clocks listed in clocks/clock-names feed the AUDSS
+  clock tree. The provider exposes the internal AUDSS clocks to other devices
+  via #clock-cells; indices are defined in sky1-audss.h.
+
+properties:
+  compatible:
+    const: cix,sky1-audss-clock
+
+  '#clock-cells':
+    const: 1
+    description:
+      Clock indices are defined in include/dt-bindings/clock/sky1-audss.h.
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
+    #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+
+    cru: syscon@7110000 {
+        compatible = "cix,sky1-audss-cru", "simple-mfd", "syscon";
+        reg = <0x7110000 0x10000>;
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
diff --git a/include/dt-bindings/clock/sky1-audss.h b/include/dt-bindings/clock/sky1-audss.h
new file mode 100644
index 000000000000..5609b28db24b
--- /dev/null
+++ b/include/dt-bindings/clock/sky1-audss.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2026 Cix Technology Group Co., Ltd.
+ *
+ * This header provides constants for Cixtech Sky1 audio subsystem clock controller.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_SKY1_AUDSS_H_
+#define _DT_BINDINGS_CLOCK_SKY1_AUDSS_H_
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

