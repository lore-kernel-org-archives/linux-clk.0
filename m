Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023108.outbound.protection.outlook.com [40.107.44.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633E02DCC1F;
	Wed, 10 Jun 2026 07:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781078214; cv=fail; b=gwcBv2u+Jq/Z/vxYnoERS7tOcIKEmabHVy1kV0LW/W2yCZiEcDXKWnTkRPjoDW6M2PtydLu48kJkiJAW1/bf1qmZptoEJA9Idq0ThM2QiVozMWAgIzzVtSsvCyJqGn7vvN+X6gGtSQgGHCsFx8yU58qRigWrS0P1HowXpvAjtaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781078214; c=relaxed/simple;
	bh=A1X8EtmEbisEmGS1mwYFwLLz7ZRvgpTazoZLyjOvtJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wr8bjCSgpvi2qw0YTBRva2QVkuHMjBomLe9DYoK2X46X1guGtlaxENlB73yBYfuJVcHntiH3PPQASF34vUcU/gxF3IKrjMHFpaJFGmFRI0k+DbA8HmDNErT2aobqUJH0UXfEI8xWAwwr+Bx4nhmGPz1URLVOkFZ1kceG+GjDXHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ESDeAVOiLh/VkH0Gvsvw03tFvzvUDkSVD7a15jrC4HvXSdz2tU0HqGXMV4gwYceHgnbpFVcdGFMtTno5+HB5HsVXSlCysVl1aAsNcaIPj6scsLe7Ruv5y6svKNS1uEUgMCyvSHniH7BeUxj9c1ZVllTkSeG4SOjfA7iyHY8sTVXDlRKY8JvU21+6AdlbhEVVEycuE+DMj6dg83rjfxCiA6hiPSuAYB0Umq5oOZ+pQngEbna+c0PK31bLuIjFFU3Y4Dh651ItyqbIIfQivAswlFzZYgrQHiPzSOSlyzjJQIK+NkxpxyITWOMFSQmiaWzKsAw7rvT8b/ni1ir3PglcvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUARxUqCIeXyLfxaAPJer0YoGGjh4X3VIjARsohoWC0=;
 b=igyF3kYRPjc19hPS5iijQCAYoCEGGldsbGhVFH/g8zwWcWcwbcOrEBrHFqb8jckpIMbK+VBGy+8CZa6fBscKazCyC+ZeutP3EIn3ExQFQKhzZBwCW9/UdaEdiOG3DXVmTjx75wrR38iOLP+h+WfeLAgyzFihS0WCZGrYVgyxkXTmaWm1fTp0IZnRcR3BPdr90EueqgXARLZKd3J+fk+8yHO4jeDqj8owCVPYBgs6clEb19SDkL7dpgfPsawYoZoqkgMfpRkeCdbNY7S3vVhgnDCYJr9AHa0vaAC6OGJ7EN9ufrp3zZFqBq6EiCWa81/viQHpTYGx8luKM/I1cMi7Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OS3P286CA0031.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1f4::10)
 by SE3PR06MB8381.apcprd06.prod.outlook.com (2603:1096:101:32c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 07:56:49 +0000
Received: from OSA0EPF000000CD.apcprd02.prod.outlook.com
 (2603:1096:604:1f4:cafe::71) by OS3P286CA0031.outlook.office365.com
 (2603:1096:604:1f4::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Wed,
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
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 07:56:48 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 530C94084275;
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
Subject: [PATCH v3 1/5] dt-bindings: soc: cix,sky1-system-control: add audss system control
Date: Wed, 10 Jun 2026 15:56:41 +0800
Message-ID: <20260610075645.3581145-2-joakim.zhang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CD:EE_|SE3PR06MB8381:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 232578c7-28c8-4b64-18f1-08dec6c5d39b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|82310400026|36860700016|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	3/LJcGRKdSUq3zDXa6rtDK8LSu9D5PvbIZmpJuwx4Rq6pKGAQneBBZT6AXFhIlJcqQ/tkVJiN6lAA7d6vTr4EuvDptUqyzjQSJjevrcHkvKEyjmNzpSdCwHGtAp367tztilquVpMC/3FH3TtEdy13LQXqs2qg9GI0Aa4O+9QgiZhNO0SfaxAA6/Otff6mFeWPFUqu0aaRG/gm5PZYmQj2IvbLevHWLkbMhfYGDka6Xyke/uOyzxczmfaX7ytPh9GpPb9evJP3g662FkXW9tipYXiNCEiwtbt6YR4ZPZRLgE8SXx4nLgerqCvUe43fJbZc0k5pvOmoPDj6JGR6UK61bZnM1gbMK/Ne4GrPycUMfLpFhVNY8h0yN1PFNDL2iDJzgSzkwM3zjzeSrn9z+5DPwLUP/b8P1lPQ0YmjJDdHfvONauBLkl2+kj8cZhONcSXHZaAujzpLoPP4XeS/9W44Jk+A/vZg5DqaeE+JALWANeuYBpnr0hsEtko9J9lzHfkKpw2zfcsrS3b50M4lxFf3OWDtpF7eA2YzKqv4LrdN5YNMDmYZNvtkqMZxlx/tGrAwajMWCF5e6MEOEEEWLaldMWo++X34UePUDB0edYsNFsRSHSK2piasAbHv5qF6mHoW54k0J6AFnlb5MfzfP9kCQggrb9d3qlu99Tg2nGB1QcVhtjhkR4qT6HpqxczXjLtwx58CF1prfeYJFbpYPZyfrrQyg7VOH/5n4GhJkZQdgI=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(82310400026)(36860700016)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YHQbOqJYHUD4Ww+Lqlt01sMdun2hEyHJbcnHsL/bFyBGyjeC6mA93UdlK1/ZYjFegUuVIV9omPl2aMSuBhg7FDFIisY3L4nKJWXN2TyT8KdK3DoAIqdn+msiwTrl/cM6tbW2yzurS9Sdsdba6iTneJ0MRhDwrHejjZWRXz8wNVeO1Njxqblv9D11J6Eb84tr2PXimMtsAsMQcbNc9IujuiZVXBJRQFpEt2Voo7Ux7Y0uRbKRg40/Prdj1uIdMBFD1yrUDMdiJ12E7V9eYCanYitLKQwfZL+tLsg1EtemedTJ4Bo0NRRB7NtgLIOOJ1ooBxrBAE0K8TcWTdKRwaaHFLDe2vmmuL0CNj2Sa6zRYv3b++CJQ53j0VDB4NVRYUrWTWbZAqd5bgazTVWeYEwfvhgIFheogWdZCPXvJMFvng8+fsygIgsNzscqGQ1LU2Y0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 07:56:48.8482
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 232578c7-28c8-4b64-18f1-08dec6c5d39b
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CD.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB8381

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
 .../soc/cix/cix,sky1-system-control.yaml      | 52 +++++++++++++++++--
 .../reset/cix,sky1-audss-system-control.h     | 25 +++++++++
 2 files changed, 72 insertions(+), 5 deletions(-)
 create mode 100644 include/dt-bindings/reset/cix,sky1-audss-system-control.h

diff --git a/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml b/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml
index a01a515222c6..61d26a69fd44 100644
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
@@ -40,3 +67,18 @@ examples:
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
+            power-domains = <&smc_devpd 0>;
+            #clock-cells = <1>;
+            clocks = <&scmi_clk 0>, <&scmi_clk 2>, <&scmi_clk 4>, <&scmi_clk 5>;
+            clock-names = "x8k", "x11k", "sys", "48m";
+            resets = <&s5_syscon 31>;
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

