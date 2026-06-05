Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023128.outbound.protection.outlook.com [40.107.44.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69E13E638B;
	Fri,  5 Jun 2026 03:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780629830; cv=fail; b=TkLdd8d4g6Sem/5tXg/8r9NXrOgjtkxCok4r7XDTVX2kCL3GF9wZp7QJPef5jhhUGVmlSkjwhDI9oaQ5RoZAyIO47ZmmLKvveHPSqLGj2S0XGMXRO2y/G1050Jisivla1oQe3GYs6x/Kck99CjNo9qoDoneQtvQ5VByTqsyjxzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780629830; c=relaxed/simple;
	bh=hKPP4Jh328u9V/TumrKX24RnraOUaTeiX7IWW9wWQ5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sz9aVJ2NDmlUG4j0vHHpIVZmXdJN2nlZwXE1LLbf8L498fRSyoijzorbshD8UfE+QdyVERtkvJORykiEf1ZvEfQ83eDcGSMmKyq1JXWHAcpV7G8lRXaehqNm3d16BznLBoPrsm/8SRbQVMR0MW17fr4HJ1FWGnZfJBCCFj9CPW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v4J9ZWov5SjjF3zT8+hH+nIT0W76j0vZ4wzMO6DyyVtfkCf9nProsug5PdPmE7AKvqX4d9sqGM3ocGCGT9p0Dkegk3ymAqIampaU9iUmHEH2rdxW1mT62fPbsyJshMuk5/vzwyS/NGCsev03YFgmF2GH9sQ2rveg1b5fK5Jh953OiRFjKqvxVoYK/twBPgLJ6Yr+OjT3+FY7+MFd2TYKaI7ver392jZmSCeE7GLVPTKbOp+6LMvz1+Id9thEnmVolxe0Lwh2bwUCQLL6T2FY+TtOomWyiO6k1HTwmZeiYm6IJWZYL/nnhmxSGN6d75AQyvzbHDo37D+PaJkIJaepdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TH9eCWEiQBeJwqJ9gxfw+2lMtNVbt3d5QU+Ecv/VimA=;
 b=xIOK/r4AB12TiGDWyPSDXgLpSKPQmNFTD4Q7yLYDJ02vyia5Mh0Xxyk4efkXwZP6qybvhSW/oArjNpv9yWhtR2pLaDvkl6LUSJzSuythW/b+Zghit2sgn9VnqQQdM5WTK8R4cD8IsRxtoZn4qL1kLrKA5lPbxr1At/k5zWs94/mvyzR9tQ7m6o4k9amtWrg4Ke8mRBRkF7RLIzTgGieyvOBQXxVZ+HYANotNY8CnV7nBkCfqm5mWU+PSacptmnwfbwazFvT5he8InGLoeEmvlRpLlnjYyaT2AOMUa5YjRboVfyoCmLn392xyvsAVoi+rcBhBa9VXRjQywT9IFtgHjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0033.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::23) by KUYPR06MB8675.apcprd06.prod.outlook.com
 (2603:1096:d10:93::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 03:23:41 +0000
Received: from OSA0EPF000000C7.apcprd02.prod.outlook.com
 (2603:1096:4:192:cafe::67) by SI2PR01CA0033.outlook.office365.com
 (2603:1096:4:192::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Fri, 5
 Jun 2026 03:23:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C7.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 5 Jun 2026 03:23:40 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 79FD14084270;
	Fri,  5 Jun 2026 11:23:38 +0800 (CST)
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
Subject: [PATCH v2 1/5] dt-bindings: soc: cix,sky1-system-control: add audss system control
Date: Fri,  5 Jun 2026 11:22:21 +0800
Message-ID: <20260605032225.523669-2-joakim.zhang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C7:EE_|KUYPR06MB8675:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 80c3fdcc-311c-46e8-1bd9-08dec2b1d73e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|1800799024|56012099006|3023799007|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EC3wP9nV+x+LRs1/cZYdsjTBShALn/IwGa9luHrj153o3ZoTfxifcHrJ3YQL4woqEYkblzXhhl5eHHvUpTnzQSjmyb6JZKHjA0DA1Gt8iPBu+BT/cGMtc3Do+3C3lbs87Sh/NDatKYM6BRFwHRlgBYRp+LXDM/KU3k3iFQquiEcFNtsb07xbMWDwVDCT5mvCgbjiMXgrByELsiCXI0HFL1XKwDSQTP5xD2Qyp4XouQxuev/GN+qM1QY6shcv6Dr1d8PIsBS8dYo8WyYDl78vF0t8IyDi3cnlDKlWBuRbRFP6HeJ8+XH6Xy4yM7kVqxi62Pm2iZ+AtLl9e/4SWjTrFGT9lLHhSAONCl38AxhOSsr7K2+y/uX8FoiScW2kc6OAKNYYZi2xhgJFGhmIf/rfW1DtrkU/W/nqtkIVqFs5AoWgJxrX4kdlzrmf1mfDZxeLRhTkrq1R63JG2lpydXJRjKEYTe/3bkQafdBQMwJrrOtp5XlqCuDcP255cMru3WWX9Zygov9elBwLBrubgjb+A0A9fO92dVGw+kd8Vn5P4A24eZKX3a+HWpK82M+WkQq0HlMKbqQeHE+lZYtjDVMv2U6isnhNQr9XyE0/VlY0ZF4EN2Qf64gYvauZqHRL0ob7WDbIP1UuWn8X366op2LCQhWUvuoWguGdxG65IVsWvEx1sj28r9eJuUFywbDRUJehJtHDrJNCVTxGVAKXKWJpWYsC2aIJj+XBFNsw27KGZlw=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(1800799024)(56012099006)(3023799007)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4Syhwpq+7bdyMhiqr9LCUVMFzXgvOSMlIYe0DSaI0RbnY7rr5lKotyA6dWwTOAbaXM/+2caXatw4OJ9m1J+OJB3b0toWDOvPUhkhoHF9E7YZi4blO8sjKAABx7qIxk4c4gHw4emn5RNUjA4YBqwLu0/9CtxtAdPRdA414kSfc1s46Q66VMq8ZI3aFBU7yYLTNtqYUH9upnhpbq4qDI6YFQNWylYl+pbsKvEsthR9y2c6ZbZKvZQ1SERLmgZ1s5xKpjBmu37kdtmvQRSglJz6gx266GKi+i3ZzrgCfzxWUY4xSD+w2PZQuiTzwnnGgNTdcm1qLFUpk6+hIwvj+jxP8BETdhKBMkz/woUrbItfDrj3Ae6zcuWVnmLBSK3bu+CEaJm//4Ss/zXu3KjksLMrF7Fc8QPl80PdcwNUJ/ncBfinm3zjl6MaciGRmvlIFIoG
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 03:23:40.6897
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80c3fdcc-311c-46e8-1bd9-08dec2b1d73e
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYPR06MB8675

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
 .../soc/cix/cix,sky1-system-control.yaml      | 39 ++++++++++++++++---
 .../reset/cix,sky1-audss-system-control.h     | 27 +++++++++++++
 2 files changed, 61 insertions(+), 5 deletions(-)
 create mode 100644 include/dt-bindings/reset/cix,sky1-audss-system-control.h

diff --git a/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml b/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml
index a01a515222c6..3b243b02a7e8 100644
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
@@ -27,6 +32,11 @@ properties:
   '#reset-cells':
     const: 1
 
+  clock-controller:
+    $ref: /schemas/clock/cix,sky1-audss-clock.yaml#
+    description:
+      AUDSS internal clock provider (cix,sky1-audss-system-control only).
+
 required:
   - compatible
   - reg
@@ -40,3 +50,22 @@ examples:
       reg = <0x4160000 0x100>;
       #reset-cells = <1>;
     };
+  - |
+    #include <dt-bindings/reset/cix,sky1-audss-system-control.h>
+
+    audss_syscon: system-controller@7110000 {
+        compatible = "cix,sky1-audss-system-control", "simple-mfd", "syscon";
+        reg = <0x7110000 0x10000>;
+        #reset-cells = <1>;
+
+        clock-controller {
+            compatible = "cix,sky1-audss-clock";
+            power-domains = <&smc_devpd 0>;
+            #clock-cells = <1>;
+            clocks = <&scmi_clk 0>, <&scmi_clk 1>, <&scmi_clk 2>,
+                     <&scmi_clk 3>, <&scmi_clk 4>, <&scmi_clk 5>;
+            clock-names = "audio_clk0", "audio_clk1", "audio_clk2",
+                          "audio_clk3", "audio_clk4", "audio_clk5";
+            resets = <&src 0>;
+        };
+    };
diff --git a/include/dt-bindings/reset/cix,sky1-audss-system-control.h b/include/dt-bindings/reset/cix,sky1-audss-system-control.h
new file mode 100644
index 000000000000..2ebc5c4f10cd
--- /dev/null
+++ b/include/dt-bindings/reset/cix,sky1-audss-system-control.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright 2026 Cix Technology Group Co., Ltd.
+ */
+#ifndef DT_BINDING_RESET_CIX_SKY1_AUDSS_SYSTEM_CONTROL_H
+#define DT_BINDING_RESET_CIX_SKY1_AUDSS_SYSTEM_CONTROL_H
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

