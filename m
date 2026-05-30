Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023080.outbound.protection.outlook.com [52.101.127.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC6A299937;
	Sat, 30 May 2026 02:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780107415; cv=fail; b=Cz+phbRZQVr/+L6OL41epyl1ACwGZAuCCTNb0Qcc3go1K17LomDhRUZaRnO9ISdvsXYwTJrEUpRmkpmpscdKD2OCe+gaKRDbtfHYjimZPzfqzyaKqzVBKa+X3GaqbhNLMDMpJbl2EUfg/uRHMibfVIVKMN5nz3YZmaBfNGNse8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780107415; c=relaxed/simple;
	bh=jxgkOsmz/BbyCaAy45FuS6ZWZEc6d6U0meqM0DZOauQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IfATHdhFhwvrJ2sXWDtFSuF6hqBJPnKxtplAxbESHGMbmNCaqG/ajBk3Fc5o1tT0R8Q53jLNswx0n+FqU89sq1kV2gGDwg+oPifzjY1vSjZxajg/IUa8Zr9byfI+6XRnW26Ewcz7t4vnTdWn0VE9ZkKkAKuq+US2xBg+2ZyZMqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AqKWX/fF7G+ZYUDyj5YKys9/MTPln89o5NVWmBLjnOAHLqUaWl3bHSZJrjwGbc5nncYnlr5Z6Fs8p08hGvCCyuvF2aZoBL7jICGDiz2ZaqCBWZbgwHeV8GMjrp/Wa+eXQNULzBBhAgSNL135jViCltvlQJAoMTgbm9mu86JH22Bfk9lCB8Qhitx2ehf2nL9cS03mksoe1KDo5LLXZIDNCYucbHcU4UNcq47gGO7+kL1/SeJnuxn192Svyvz0snJlDynO9pL8DKx3jGOU4Yxs4O99BHoyyt6Z8kfzARCLyMVkgzOxZcYHUCh4FUXaPg8NaEm4U2k6HEXaxVbQ+/1ePA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ju5gW6rE8l1Wrk90z4QhTer0z0tNLcfiSVzd92kESI=;
 b=QB6gecEgpTq/A91itCwarKlT30rfrUtxRFUruRpMpsHTgkvOJt1axa/Cpzil/IEtgZ5zbLUuIa6jIty3nr9d9EnX8ggTPmFOH1g52DopgAV5rQvsaz31FxZAMcMtVBuD3WQGDakcDysHCsaXytYnt+602TciB1chJncvrgMFYLL672kJESl9t5LBuPxCz4QNRFKfGKBvlQkTx51poJEE0V1Wt71Ylk2x4J0vHBvKfE6XnlUJwoNWtW/Io2ImsDVUbjKlOqkHBuJp10Uo31H5fatc7nME0gBoqhwtS1DowIaGwnWp1l+57jyfEt3JA/ueFSPKlbuFafPbGdX5RpjRfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR02CA0124.apcprd02.prod.outlook.com (2603:1096:4:188::9) by
 OSQPR06MB7990.apcprd06.prod.outlook.com (2603:1096:604:426::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.15; Sat, 30 May 2026 02:16:49 +0000
Received: from SG2PEPF000B66CC.apcprd03.prod.outlook.com
 (2603:1096:4:188:cafe::13) by SG2PR02CA0124.outlook.office365.com
 (2603:1096:4:188::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.15 via Frontend Transport; Sat, 30
 May 2026 02:16:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CC.mail.protection.outlook.com (10.167.240.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Sat, 30 May 2026 02:16:48 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 75407408426D;
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
Subject: [PATCH v1 4/7] dt-bindings: reset: cix,sky1-audss-reset: add aduss reset controller
Date: Sat, 30 May 2026 10:16:39 +0800
Message-ID: <20260530021642.64059-5-joakim.zhang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CC:EE_|OSQPR06MB7990:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 70233643-9257-4157-d979-08debdf18151
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700016|82310400026|3023799007|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8d7hYZ5R4dGdy4umURVgo7bO5X+bJrxjg/pxOavRj3vy4mRyKiZYn76UG1fuUgA7ruQsxN9s69Wl0K7DkniqT6Q4fmZiFXo92sn+UnokPzKTixBY0n1BafKzEuQAZUwk3/J0pH/dwqw02Ej2JpbpOMv90W654qsT5xHb9LAIsiL6MQPEcwAkCTucT4wqO8amiHrl1h/2wqM9nZjm5CRrhKaDuIdqISUBi7JOnEabF9Zbgmdgc4WgM1g+yMlQJUx/jVg53dLfOE75MXvMWIKW3VdkmR2IdchopHlKf7pCjVgsBP0ZogvYMTR+ZPQ2tzqJhcsy5up8fpD2GwQR2TC7wrq9umBjuxpCPmgVsamFGRnY/xyddeo9okBatIrm8GH7fU1S5iHn1IOZfyJ3GXqY1sg3Y05BnlLf6IPmpLa3AGbf4XiBShpei2FQ9vORM+KY70PMXD36s5IhCxlrcmsZL8ijMQ07gGXHrpoNsKLqDVbuxx8EzE1uWjGwB36eZIPZlfpHgpDezCoX4oqGxW4OoeA2W2ukUav68a33WI453Ts9Ehh6vIOUGMRGIjI1thJSfJiuvb3EvJnNvHivXhXJ3x3GAExYmrQxc6QvqSFHdhO0Nkm01Xj0rhE1yU24hzv237C4VQnGaZBj/0cUtL2Eix0ygx6MMpUoQ6Sd/TDrSlKTJf7Q/jFZuph/UOuFrWVo
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700016)(82310400026)(3023799007)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oGSbgEDQlAcWmaIRAvN8yvvxcJGo2a2Lo+xYS3t+C3TZlSFf5Ze9tzf+5IWGbUfG/DATR7EKgpKHKHhEQLY5S9mF/pKk0LpzzXaSoTR9C6eWlVFz7NEIgitdML7Rq0tg7jv9J2Y6xxmxQQNF2nCvXVxY7nwZ8u0bpXGG+xRpcTVZAmOGQIjcJBNOMTSpG8zbDgx0EsH/IKVu59h0Z3FO20ME4B6HirOMp20MEB+07RCCpDG2QAKIfrFfL4JV3ENi9uF9DBg5Cl8wx9WxQuup8B5lSHXtRJ5/XE4eBNANqgNnOXfCRY+WC6HGmyt63NBuQsJaYl7gErMXNirwK/AcWD8JGSc2G9MacJromzBlfBmv1fi3HbMPg1VowfIaC1XKg4vBe2yDDJHl6VE04nwUwZt1MV8Ddd35HkYrvcikgq5Pwf4DxbJfixvf5NK8X1xx
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2026 02:16:48.2602
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70233643-9257-4157-d979-08debdf18151
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CC.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR06MB7990

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add schema and reset IDs for the Cix Sky1 audio subsystem (AUDSS)
reset controller.

The compatible string is cix,sky1-audss-reset. Reset indices are
defined in include/dt-bindings/reset/sky1-reset-audss.h.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 .../bindings/reset/cix,sky1-audss-reset.yaml  | 50 +++++++++++++++++++
 include/dt-bindings/reset/sky1-reset-audss.h  | 29 +++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/cix,sky1-audss-reset.yaml
 create mode 100644 include/dt-bindings/reset/sky1-reset-audss.h

diff --git a/Documentation/devicetree/bindings/reset/cix,sky1-audss-reset.yaml b/Documentation/devicetree/bindings/reset/cix,sky1-audss-reset.yaml
new file mode 100644
index 000000000000..8e02ddd2517d
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/cix,sky1-audss-reset.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/cix,sky1-audss-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cix Sky1 audio subsystem reset controller
+
+maintainers:
+  - Joakim Zhang <joakim.zhang@cixtech.com>
+
+description: |
+  Reset provider for the Cix Sky1 audio subsystem (AUDSS).
+
+  This node is a child of a cix,sky1-audss-cru MFD/syscon node (see
+  cix,sky1-audss-cru.yaml). It does not have a reg property; software reset
+  bits are accessed through the parent CRU regmap.
+
+  Each #reset-cells index maps to a software reset line for an AUDSS block
+  (I2S, HDA, DMA, mailbox, watchdog, timer, etc.). Indices are defined in
+  sky1-reset-audss.h.
+
+properties:
+  compatible:
+    const: cix,sky1-audss-reset
+
+  '#reset-cells':
+    const: 1
+    description:
+      Reset indices are defined in include/dt-bindings/reset/sky1-reset-audss.h.
+
+required:
+  - compatible
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/reset/sky1-reset-audss.h>
+
+    cru: syscon@7110000 {
+        compatible = "cix,sky1-audss-cru", "simple-mfd", "syscon";
+        reg = <0x7110000 0x10000>;
+
+        audss_rst: reset-controller {
+            compatible = "cix,sky1-audss-reset";
+            #reset-cells = <1>;
+        };
+    };
diff --git a/include/dt-bindings/reset/sky1-reset-audss.h b/include/dt-bindings/reset/sky1-reset-audss.h
new file mode 100644
index 000000000000..7f1cf36d45e5
--- /dev/null
+++ b/include/dt-bindings/reset/sky1-reset-audss.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright 2026 Cix Technology Group Co., Ltd.
+ *
+ * This header provides constants for Cixtech Sky1 audio subsystem reset controller.
+ */
+#ifndef DT_BINDING_RESET_AUDSS_SKY1_H
+#define DT_BINDING_RESET_AUDSS_SKY1_H
+
+#define AUDSS_I2S0_SW_RST_N	0
+#define AUDSS_I2S1_SW_RST_N	1
+#define AUDSS_I2S2_SW_RST_N	2
+#define AUDSS_I2S3_SW_RST_N	3
+#define AUDSS_I2S4_SW_RST_N	4
+#define AUDSS_I2S5_SW_RST_N	5
+#define AUDSS_I2S6_SW_RST_N	6
+#define AUDSS_I2S7_SW_RST_N	7
+#define AUDSS_I2S8_SW_RST_N	8
+#define AUDSS_I2S9_SW_RST_N	9
+#define AUDSS_WDT_SW_RST_N	10
+#define AUDSS_TIMER_SW_RST_N	11
+#define AUDSS_MB0_SW_RST_N	12
+#define AUDSS_MB1_SW_RST_N	13
+#define AUDSS_HDA_SW_RST_N	14
+#define AUDSS_DMAC_SW_RST_N	15
+
+#define SKY1_AUDSS_SW_RESET_NUM	16
+
+#endif
-- 
2.50.1

