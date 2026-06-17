Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022108.outbound.protection.outlook.com [40.107.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9EF24E4A1;
	Wed, 17 Jun 2026 06:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781676294; cv=fail; b=L7vCQzwqQ7JDQys0jIC4IRB10FrKfJ69xj/x/N8rgX3m4XNKE/YV57ersXGtjiCeakl/kgr0q7+xLZ726Hoc2ifGpXDbAb5IioLMtaz1nGE+5nGS8OVfLPRaX9cKbmjWPN0TI981YKq0AfXGiJwHIIiw5bncfeqH4RKmjrCa/O4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781676294; c=relaxed/simple;
	bh=1MF0BAEa0CwWEvAlXbt09sGTqWxWtm+9OPDFsutp2ZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tjt9hYbtPCnOtlvsIgWrjJMUG6OEvRBDYOYDRunGovHhHBJlFC0IW8wFrAaSdtLFMyJCP2WhZYlE2uLAt9AUTJU7m7snGGEqM83V88kSOe4SsvDnA5DncVo75r3CqZnyeJNTcqzu2ycXlHwSK7mxjH9Y0aS9m3IC4sgIgbYc/fI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBRde/+9nc6WFBU/bErT8Lbeh2Y20TVEKolvAa4CAKMK8F485xvZKyOvxRL5gtwAgC762SCuk1z4VmQTGMc69XXe3VOCeWBddL5FTTgULZomGAhEmzqVkPRBN3Nbc1seB33CQsndwwlhpBVqcGf7pJ5C2p2dV+uHGhHa+s+Rk0LVMYHUqgJw6P6CYXN8FMGFpVT2hlF3ThO3RJ9R5jkT9O4Vgohwlr2iYT+P9GnOJdVGXB8hLu/TayP2k3JGo9Qkdn7JESGdQR6HBqRxow00jweSegarpCWmORoVXUAVeIVxuz8iAM0g4ApinirYw8BxQwvkm3Fs1zj4mn3BJq+h1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6wfM91+Mc75JGSXiajPrv7YZLUJ0tzvc/SVrF79QsQ=;
 b=PibFuWp/fTBAQBPbSp4azB2l57dHgUyYw0gb+bhGHkTMK0PQoJrxotdBAYeyH09+11y7jBjLHZ7p7CQYKAdGgBPIVt5UY3nk5WDWVdf4VsLuCc3D/dDVOpaGBd6lNZcUKyg+ZhOYXvLI+xU084sgyg2OHfUDdyxkxd/CHoT2h/WLIdG/h47lhQrXn9uavaeDNhQ+oMcGOUdBMocAiO0g722A9nuX+RFPd0/QfHB1xTNxwnY1xXW0Dq+IJZgg/Wes38MImievvZy2evaAVTjJC4dZ6F9OvumIUv7sL5pxK8KvLcQirPH1bIfxXJDOSl2k5sPxnnFD+xW5fQNozoBtpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR04CA0001.apcprd04.prod.outlook.com (2603:1096:4:197::12)
 by TY0PR06MB5149.apcprd06.prod.outlook.com (2603:1096:400:1b0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 06:04:49 +0000
Received: from SG2PEPF000B66D0.apcprd03.prod.outlook.com
 (2603:1096:4:197:cafe::80) by SI2PR04CA0001.outlook.office365.com
 (2603:1096:4:197::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Wed,
 17 Jun 2026 06:04:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66D0.mail.protection.outlook.com (10.167.240.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 06:04:48 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 36EEB41D400C;
	Wed, 17 Jun 2026 14:04:47 +0800 (CST)
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
Subject: [PATCH v4 1/5] dt-bindings: soc: cix,sky1-system-control: add audss system control
Date: Wed, 17 Jun 2026 14:04:33 +0800
Message-ID: <20260617060437.1474816-2-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260617060437.1474816-1-joakim.zhang@cixtech.com>
References: <20260617060437.1474816-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66D0:EE_|TY0PR06MB5149:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7cd9f06f-1a4c-4be0-ad33-08decc36569b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|36860700016|376014|23010399003|1800799024|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	O944wm3KDNXrJzoCV8NaChD3AvBdR+M7YpdTc4lRtnHLEUqweOeTCzEWV0khMY4x5nfX6tqlPWwWjdk2xfqoXSWSlrt41c0S5+z4wwPQiur8hVEZwLqiqRKMuy4l3lytQIpSKkedpqA3+WNaxFdjqDYaIBMRfNoeueZv5zW5bLGhRgyt6F78Kah8gEmxkh15+JDb0lOq/naa3f8YqAJGI68tcP/Uh8XbQdgIcuzcc980I3U2kuyHDm6T3EgJFJ/W7s12Iphr5ifzYXG3Q2IyFhD4WRZe7ntdh261bVb7KUTqtye3RfT1DHDQDb6hG68FJ7ZzN8WjTwO2miFjlQF2UeH2v97/LqR0lznN10th3ZgBt0rh5MCdbsZk7hI0Ln3LJnfpzqAiHdg7DeDFyEvJwOH5nL/wfjpfGOwVig/VLTObhHtz0q77oqdGQD9NMZPBGQ92EzniuFixokHttnwhGLn3DPJ2T4TVPdUECGD1m9F6yjkuf5ov+D2LiNl3fuhiDHquEpaiTOE5M6GwSkkFhfb0QOPD4ACDgjQNRqMba7zXAcSmFbw9pMTpzm98pErcKlnmu6PZMLN2gFOe/qW/onCoVRS0W72KWeqEV8oFR5KzJL2EQ+tLZZRNRdQ9MSlCTnfNusjQAKYCNYvcyy5wh3dw20OrFTGr8LFpWQOz85zVbKwtwXxuQzM/Bw8BvAID/Yo2B5VkLAG/906jCwUET99CTWGYYT3t73LFzo7xtgI=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700016)(376014)(23010399003)(1800799024)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	h32cYyNWo/fBRFKenG9JqGi/ChII5FKslhNvFPhvR2lolqThbJ6GrJ6kIr8RIWO0/yjn8rJR0tgrDQzdaVhQeigtabJY25BWliZHVC0pPVMsiDEPodvGHDu8eFp4GNsccLtBZ+7jidoLCK95y6s1xzWjXKS5fac6VjQKn2r829IOKfjmUh8fD+nHJoo5QhzTIFUmv5GkcMNpNMygqmkKTqWbXIUd1rEFeqqEYPFPw4XPrR06+7FmHGhz+NJM0QYqxiP2WMUJ/kJSdQq76HN7dvcdsRfxaNdo2a/itejL43FvSE1u/eM+OI2inuCn+o/TgYs0f3yDZFL3oLoioHzRBEYVX5Xbr/Oah3E6t6EnYMYi880Wb3ura5IGCN6JAJqy6nKRY3jo/3CdjBa1pKfJfTnF2GMxzszbL9s+8l22J0lV8jBYjCa/y24VtfOgY+Ho
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 06:04:48.4835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd9f06f-1a4c-4be0-ad33-08decc36569b
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66D0.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5149

From: Joakim Zhang <joakim.zhang@cixtech.com>

The Cix Sky1 Audio Subsystem (AUDSS) groups audio-related clock, reset
and control registers in a dedicated CRU block. Software reset lines are
exposed on the syscon parent via #reset-cells, following the same model
as the existing Sky1 FCH and S5 system control bindings.

A clock-controller child node is required under the audss syscon. It has
no reg property of its own and accesses the parent register block for mux,
divider and gate fields.

The AUDSS is also controlled by one power domain and reset part.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 .../soc/cix/cix,sky1-system-control.yaml      | 48 +++++++++++++++++++
 .../reset/cix,sky1-audss-system-control.h     | 25 ++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 include/dt-bindings/reset/cix,sky1-audss-system-control.h

diff --git a/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml b/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml
index a01a515222c6..5a1cd5c24ade 100644
--- a/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml
+++ b/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - cix,sky1-system-control
           - cix,sky1-s5-system-control
+          - cix,sky1-audss-system-control
       - const: syscon
 
   reg:
@@ -27,6 +28,38 @@ properties:
   '#reset-cells':
     const: 1
 
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  clock-controller:
+    type: object
+    properties:
+      compatible:
+        const: cix,sky1-audss-clock
+    required:
+      - compatible
+    additionalProperties: true
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: cix,sky1-audss-system-control
+    then:
+      required:
+        - clock-controller
+        - power-domains
+        - resets
+    else:
+      properties:
+        clock-controller: false
+        power-domains: false
+        resets: false
+
 required:
   - compatible
   - reg
@@ -40,3 +73,18 @@ examples:
       reg = <0x4160000 0x100>;
       #reset-cells = <1>;
     };
+  - |
+    audss_syscon: system-controller@7110000 {
+        compatible = "cix,sky1-audss-system-control", "syscon";
+        reg = <0x7110000 0x10000>;
+        power-domains = <&smc_devpd 0>;
+        resets = <&s5_syscon 31>;
+        #reset-cells = <1>;
+
+        clock-controller {
+            compatible = "cix,sky1-audss-clock";
+            #clock-cells = <1>;
+            clocks = <&scmi_clk 0>, <&scmi_clk 2>, <&scmi_clk 4>, <&scmi_clk 5>;
+            clock-names = "x8k", "x11k", "sys", "48m";
+        };
+    };
diff --git a/include/dt-bindings/reset/cix,sky1-audss-system-control.h b/include/dt-bindings/reset/cix,sky1-audss-system-control.h
new file mode 100644
index 000000000000..aabdce60b094
--- /dev/null
+++ b/include/dt-bindings/reset/cix,sky1-audss-system-control.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright 2026 Cix Technology Group Co., Ltd.
+ */
+#ifndef DT_BINDING_RESET_CIX_SKY1_AUDSS_SYSTEM_CONTROL_H
+#define DT_BINDING_RESET_CIX_SKY1_AUDSS_SYSTEM_CONTROL_H
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

