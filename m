Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022090.outbound.protection.outlook.com [40.107.75.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6813733F58B;
	Wed, 10 Jun 2026 06:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781072244; cv=fail; b=NXfBleajtt8JfnRDcp4EopSeEhGYieFGhDfkBE4wORR3DsisJoQ64JlmwcESUn+2sWn3P0X//MJBK4S/x3UjYxApgnhEvQMSrCAu62NZTv4rbGMCKV+rFCFma+vEoIHartpEdl+UZjf+5cTxXXZYlafvHZpojfDZbdgh/i+D1oE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781072244; c=relaxed/simple;
	bh=ahNzjhznD5BW/te4zFwyA7WW0pNKuV/1ywH6zqEEIAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pX0Kn0ClaZPLMes8g1TJxrRLZvHX0TRKcPmcHGwPVg71kOOpTKaOc1cMf/BwSF3amaKuZ87bhJE2PnrCa0TfKCCB0SwaSS/NQmVNZxiGnRMOSHzyuKTYmiE2xFJmr2xtwtyNTp//vWesmmKMZY22jQMtkCHsdDdA7z2urAmktRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GiZxayJ2eZ3VEiJKiwICPSLznDZCgfibAaIv7Qm2C5M8CZQQIC8jjI0mfKf6qIN49wooxZPWMXD2TSTCQqvqfzg0vutQ1VaaprBXy9ByaDO6ryoaS7b19Feo2tIDU/esF628Wg+9DkLk2DCjTn6UoF3FQcMSqsIc2A2KDK8qBGYJEHP1/chQCpwUY0ZXLjaSS9wTqGdRbJdS0BRI5URSIdW8JA/roQqANECCLDbkplZ5bg7pLxAxHWlZ8WX3sWexF75iAxugJkUsqRnGKJNcqhF/0h9LhZUDW7JTYQ1mlZUqceiZzNg7vhtsSFJdt4As3MA1ujP13aj+KiRgNKra7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/42CnyAy+ZF5WIkX8USCQk9mIbd/Pj1XB6JN+DzDwnA=;
 b=DyoO+bbktNSTrmqTyR1dkyI3Mb1w1+/o1QuMAyU0ySHfPCYb9Z9ijJxjwLTkVEz/QZbP7RCYDei/x0iRXJqfmQnrC3G6OhJfvt7keXKnAWivPDcHjxqK1kSBGh1/RfoGetOPgZNkWGO1hEowBUravc+H/66iWuf7Zw0W1dbcsyPZ5Ocxb/c4o/WBcjcaukbXo00rUj7JaWzRSWzLrtNSEgjvs5UtUpC0QYL2rvp1C3kZyOY++j6PeKY014WN/Ou3CgA614dJhyUfmlL8AEJXmGTHJzIO+egBo/wusFVxJbvYwnZdpnLDSAyq0P5d5XZ6qFHjZ10gUtwHVqg/CFQ3vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR01CA0188.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::10) by KL1PR06MB6297.apcprd06.prod.outlook.com
 (2603:1096:820:ee::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 06:17:16 +0000
Received: from SG2PEPF000B66CA.apcprd03.prod.outlook.com
 (2603:1096:4:189:cafe::89) by SG2PR01CA0188.outlook.office365.com
 (2603:1096:4:189::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Wed,
 10 Jun 2026 06:17:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CA.mail.protection.outlook.com (10.167.240.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 06:17:16 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 1A8A0408426D;
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
Subject: [PATCH v3 1/5] dt-bindings: soc: cix,sky1-system-control: add audss system control
Date: Wed, 10 Jun 2026 14:17:08 +0800
Message-ID: <20260610061712.3203984-2-joakim.zhang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CA:EE_|KL1PR06MB6297:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 60330e5a-907a-4e02-afc2-08dec6b7eb93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|7416014|376014|1800799024|82310400026|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xamtm3rhZAxN7r2bes8MGK79XRqew5Ng7bQhjIVrNIzXis2TdkGqkm5HCE0YHltkm30T5+RoEZr5UWqR2EGtoHPXtwCcPbuCmNtRdYAmlxF6TDlyMz6koL/WaDVBI+deAX68I+VBVgkbBG7IDLI42BFzl0MllWUpwc+DiLcfLWUcKqbVuXTtnAOvjQXgKr/abDKm2BbuMgZ7AzTrdXYFVCuNXh0JWSsRJJeZVSPY/vkFYOmv3Gj+7QuNCpjtyuWrpZOB+QRR5Xi+WAqVyyZ4j/o6HzVaO11ES6AeiUomIl0SNUxjePheme31DMO9dZjzP7tMBgSOihyKE5Svp0N7d83iA/FsXIHL9ylX9HKsYX2AN5ExFBSIdkS/3nIceFLIXxM65h44VhIWh2mQtLN670GbEHWXjQ7G249Oji4BFDPW4S3WPYoSMpCDZJZn0VetzXIoXOdU7vBR2q8TzpLvAKk5DuYGb080SnEHIul3PBf2PSWCNulVFdfVhz3kSEIqE11MmOqKUQE1DWzpK/AEznSrtZ1oiZZRlJitQs7MwKS8kdFCkp55PQeIE4eFghJuQolagCRlyiIVcn/llJ7r855PKZd8vtTY+jScryHf35Q59otaJH5FV5E81/vM4GQkmWB7TDfvK0w97UJnnAqBd3dtWEP62qXjhZYZqCJhdsK8O/MSxBL+zHg33NV9O8687DCZLKYGfWEGyVzzNliLRARfKhZ8I7mpSng7VBMrIeY=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(7416014)(376014)(1800799024)(82310400026)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VYn1FqnNeCc4KlKNsSeAL/lWY2ZA9tCuG73NPkQnW6EVmAUoNoqu/La5g6yuyqd6zGUwrUBVsXNuzkbr3uBDvqnK4ekPJrOYu0PpefctgTfwavmrqOhwpYjK+FdnbmkDXhuD9UE2qc2ueSWYWhnAMkN2TVEa36bhZSX0s95pes7GHTbnqKVxhMUhpsSNQsnSBKe5xyoA5BptbiXZyAi1XFRqy6+be2jGMDLolaiSbybQaPKwJzkqtyMsNT0et23xMkhTqg14WLTFEo995RPWKfRughBgx9EmTYnpVwLbqMzayc/LJLbOe+9mcv5DRnqads97pmf77Q8zij7b5VxM4cbEiTjNjIzF3tK8VYfxQ/qw8SBPj6SZK+uSlxERsmQaUEalbi2g7Du39AbV9dqapkSNmiIDtznMI0EaDxlCuDwtsuNZLrlTXDsglVn3Ns71
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 06:17:16.4966
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60330e5a-907a-4e02-afc2-08dec6b7eb93
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CA.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6297

From: Joakim Zhang <joakim.zhang@cixtech.com>

The Cix Sky1 Audio Subsystem (AUDSS) groups audio-related clock, reset
and control registers in a dedicated CRU block. Software reset lines are
exposed on the syscon parent via #reset-cells, following the same model
as the existing Sky1 FCH and S5 system control bindings.

Add the cix,sky1-audss-system-control compatible to
cix,sky1-system-control.yaml for the MFD/syscon parent node, and define
AUDSS software reset indices in
include/dt-bindings/reset/cix,sky1-audss-system-control.h for I2S, HDA,
DMAC, mailbox, watchdog and timer blocks.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 .../soc/cix/cix,sky1-system-control.yaml      | 47 +++++++++++++++++--
 .../reset/cix,sky1-audss-system-control.h     | 25 ++++++++++
 2 files changed, 67 insertions(+), 5 deletions(-)
 create mode 100644 include/dt-bindings/reset/cix,sky1-audss-system-control.h

diff --git a/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml b/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml
index a01a515222c6..6c887b04cf25 100644
--- a/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml
+++ b/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml
@@ -15,11 +15,16 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - cix,sky1-system-control
-          - cix,sky1-s5-system-control
-      - const: syscon
+    oneOf:
+      - items:
+          - enum:
+              - cix,sky1-system-control
+              - cix,sky1-s5-system-control
+          - const: syscon
+      - items:
+          - const: cix,sky1-audss-system-control
+          - const: simple-mfd
+          - const: syscon
 
   reg:
     maxItems: 1
@@ -27,6 +32,28 @@ properties:
   '#reset-cells':
     const: 1
 
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
+    else:
+      properties:
+        clock-controller: false
+
 required:
   - compatible
   - reg
@@ -40,3 +67,13 @@ examples:
       reg = <0x4160000 0x100>;
       #reset-cells = <1>;
     };
+  - |
+    audss_syscon: system-controller@7110000 {
+        compatible = "cix,sky1-audss-system-control", "simple-mfd", "syscon";
+        reg = <0x7110000 0x10000>;
+        #reset-cells = <1>;
+
+        clock-controller {
+            compatible = "cix,sky1-audss-clock";
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

