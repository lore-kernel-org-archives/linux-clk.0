Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010033.outbound.protection.outlook.com [52.101.201.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827CB3E2AD6;
	Fri, 29 May 2026 14:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780063973; cv=fail; b=c+Djvxec9Zsx/ZNSzri14xM3EWbLTfatFI0yqa4kQpaqKYpJQKgWl530FukRRF6Gqwi1nZVjcvL1tYPaAtgjd/AcjnQcG80oqBiEX3QlMFtUXtoVKBtu6W3ENVrLYRIa3LUROapeiWGg1+8UHdq2HERvyMVHz598nVJLe13JcZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780063973; c=relaxed/simple;
	bh=G/D65kUAgkuBNJFE2bt9xyMRe95SCV2FpSjWgx0iLCM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CiN733g1oKHs5iZ6QEAMi0dUWLM+oHfw628ObLN9no/PBxAE8MAp2qZrOZNsgII3bsqvGYqpVFKHjdGXeadJN6mTep+XLoZkjqYmaSD4RkqWFSsURVqhLjVJDabpARGWJEn1lGMx/m/3rM5x5mnRY9KSv3UCM7F6EYcobN7daRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Yta+wS72; arc=fail smtp.client-ip=52.101.201.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Yta+wS72"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TI7Ug/vB91esKiDu47GX0xZX0Mb4WXhS4YrJQdLBvcB5Y5krZvSauL2zlHe7780rf7jqExxWdeRGWht7WDobTZBrIKBhB6Fi2xfEdO7eLRK8Nhi6RiDVY+x3thrFcwvuL5f0hQflWAifV0FhmoovVdMM8wP+fnNgpkS9uutd/PdWfKxvaHIlSioCWxSZvFtw7wYHmyBGMRKxDXDvUNZ7JKT64B2cfzsGLKBrJUB2k7Dr7MWzVHuRBS2YQDcsvLGJ20xiqPtmEjAY5qiTiW4VNB4ymUMgqphKEMK5CsNGNNybeHFn7gpK/Um+2aXHAvLnNpwQBy3dYCBYPNYxXAgUiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0ZhqOptSUJtq+T+LVGfCr64LQq3BQRjYFVINIBn0po=;
 b=wgyVBaf4RGhd52dQq5WmPqtKCE/FCpWqtrPhJF8SyQ2Vo206MDvWVsZuD4cnebFmOz55dR10QFWz6Qhi2mCXYJgiIIxf4Bmia54qTK8AMlu8bMFoiAepm7VWhz1hWbIlqeEZNcYmRWN41WYHln7QaM75oQ0vL/5knJg2AGKWbg6E/oZ0alUtPn/SEqHEossZmmiOhIVPVkuySGmavkZ1lqolWX7Z2sIyMgFCW6D/yQeuMnPY6W5UltkLPuMlChbaPXObGkrNBhYNQA/OVpPgXg3YByJfg9RHMF4ng0pd4srpP0YjW5O4Qi4mhLqn5MkrgnehZlv1E9idvfhKuy1KlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0ZhqOptSUJtq+T+LVGfCr64LQq3BQRjYFVINIBn0po=;
 b=Yta+wS72Z2ba4RahB7vOXMQ+lFfRfDM5V7EDneEGk0JcOIbuQ1S644piqoa543giAMjnFtAuV8QEZ0FgH/XL8FCWRDujbmf5PJLEMLh3BjWUCQvZHc49alkBfZkwk7BZTzMDUbd+P7nEBLAHDLcsjeTRZ9Bd8fYiqUSFuhLDpnY=
Received: from DSSP221CA0008.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:3d5::14) by
 CY8PR12MB7585.namprd12.prod.outlook.com (2603:10b6:930:98::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.15; Fri, 29 May 2026 14:12:41 +0000
Received: from CY4PEPF0000EE38.namprd03.prod.outlook.com
 (2603:10b6:8:3d5:cafe::81) by DSSP221CA0008.outlook.office365.com
 (2603:10b6:8:3d5::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Fri, 29
 May 2026 14:12:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE38.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 29 May 2026 14:12:41 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 29 May
 2026 09:12:32 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 29 May
 2026 09:12:31 -0500
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41 via Frontend
 Transport; Fri, 29 May 2026 09:12:30 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "open list:OPEN
 FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/ZYNQ ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>, "open list:COMMON CLK FRAMEWORK"
	<linux-clk@vger.kernel.org>
Subject: [PATCH v2 1/3] dt-bindings: clock: Move xlnx,zynqmp-clk to its own schema
Date: Fri, 29 May 2026 16:12:07 +0200
Message-ID: <8e9163806c6f6858cca9afcbdf63599ced3422fe.1780063921.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780063921.git.michal.simek@amd.com>
References: <cover.1780063921.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5508; i=michal.simek@amd.com; h=from:subject:message-id; bh=G/D65kUAgkuBNJFE2bt9xyMRe95SCV2FpSjWgx0iLCM=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWRJzjsxz+v1P6aSj+rCTx1e/p+W1+jzN9b9sF1LTOWhN 8d53/vu7ChlYRDjYJAVU2SZzqTjsObbtaViyyPzYeawMoEMYeDiFICJvNFi+F9xv3XvzW83HXIP /Pz39ITDYZnGtq3T3boYTl3lvxO1Kd6IkWH71M/P6jfaB3efeRIzU37L4SMf0n/8qhDnt53t3yO d8YYBAA==
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE38:EE_|CY8PR12MB7585:EE_
X-MS-Office365-Filtering-Correlation-Id: b89a9caa-6231-4223-d303-08debd8c588b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|7416014|36860700016|13003099007|18002099003|22082099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	4bu4eu77VLAzmnhTAYgQKrytCgqo2aBC6Wx3pc9hohJc7WOknwBWwuMRPxUmBFy5KsLydsMcQ1uJSxMb/V/sQoykBazTg+Yi4AQdiO2NWOohKMwEwX+tDaUvbNtDnBClYqTxSx5ktFYy8c2vc7jeIwzOH9P3P7RZz9R9Rr6i4T/6dhJlYxHYYjX6oc+w8VjY2py8KuMljBD2TTtv308pECj9nZ1O46tEBpmTF4xWYfwDTu7oTtQTZiL5UQP79FJeGVzIoZOsnao5x9IHbLIfP1OqOZB/pk7yO81ynSUQ+i9ty/Im3WmUn5BkWkH8ZeUL/z6vmvsfZERNOUtZOvCql7QFbv2Il8ZHyVP+S7H7y9PoIUxH7uy8CFhmqPDhSRJ8/ugyQtKb3Si4ANWXmEgo7uSULhpFs1HWhhQJLhjR5JhEeLkgR7JmODN4lkX71cKXvUmzC/BLIdW5nj8QzrZ7Igu/NlqgomuWP48cylBW/9p1is+lV6MFLc8oUNiD1bcK1qYQRWAkx4mKsxBy0y6EfuDs98xnOY7fL9aunTsmjw2raHvpTkB51i7HgKpjtprFXVV//SiSbrV/kz9UqgcHf8eohTi+GbR/ry32nWWXXnT+pML7NRnEs+e0LAaoseqpgoDAYzVr6pRoVHdRIbn7bVeU4fRvQwWlMVkO3yId+AkWTDJtQHVf/LT1jkDCfwHn
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(7416014)(36860700016)(13003099007)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LYTJDYLviwmJAJb0M78Kju/s0wLygose1EYw4hYG3Gb3uxNA7GW6qNeib4goPBhSZB2CHRjR/FB3MS/0+nOztYkycLysFIAsLZqzh8bHPgCiNMg0nCX37NDqYfBjyZl6m6GVAttEyNaHkTHYFrb+4DanXvQr4uboivB1aKoL9dvlNbV/Akz3e43GHXoEvH6kxGdJ2kBj7xTUAoCCwRoiRe4U4RLO+9w1PQkG0ABo4trN58fP+HQu11DsyPzxdlqyfaq033mHu+6OGWRty0KY0MGK2HrrpJXhR4rIUdq4KQ2JjiMJH4PziB+8ulXw/eqRFQoACseDe7UFK/SqsDyGL/1x2VQtoZdH+N9TcfUjwpek20ZZxIx2a6cb5mc1qXmJbhhz43j1l1A+wab/6p+OHIAfL5bMjYHNdn3b5cOBEvHiH2JMX0FConsqZSXUQobo
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 14:12:41.0778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b89a9caa-6231-4223-d303-08debd8c588b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE38.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7585

The ZynqMP clock controller binding shares only #clock-cells with the
Versal bindings. Move it to a dedicated xlnx,zynqmp-clk.yaml schema.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Michal Simek <michal.simek@amd.com>
---

Changes in v2:
- New patch in series
- Split zynqmp-clk from versal-clk

 .../bindings/clock/xlnx,versal-clk.yaml       | 50 +-------------
 .../bindings/clock/xlnx,zynqmp-clk.yaml       | 68 +++++++++++++++++++
 2 files changed, 71 insertions(+), 47 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.yaml

diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
index bef109d163a8..12d060c39bfc 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
@@ -17,9 +17,7 @@ description: |
 properties:
   compatible:
     oneOf:
-      - enum:
-          - xlnx,versal-clk
-          - xlnx,zynqmp-clk
+      - const: xlnx,versal-clk
       - items:
           - enum:
               - xlnx,versal-net-clk
@@ -32,11 +30,11 @@ properties:
     description: List of clock specifiers which are external input
       clocks to the given clock controller.
     minItems: 2
-    maxItems: 8
+    maxItems: 3
 
   clock-names:
     minItems: 2
-    maxItems: 8
+    maxItems: 3
 
 required:
   - compatible
@@ -87,39 +85,6 @@ allOf:
             - const: pl_alt_ref
             - const: alt_ref
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - xlnx,zynqmp-clk
-
-    then:
-      properties:
-        clocks:
-          minItems: 5
-          items:
-            - description: PS reference clock
-            - description: reference clock for video system
-            - description: alternative PS reference clock
-            - description: auxiliary reference clock
-            - description: transceiver reference clock
-            - description: (E)MIO clock source  (Optional clock)
-            - description: GEM emio clock  (Optional clock)
-            - description: Watchdog external clock (Optional clock)
-
-        clock-names:
-          minItems: 5
-          items:
-            - const: pss_ref_clk
-            - const: video_clk
-            - const: pss_alt_ref_clk
-            - const: aux_ref_clk
-            - const: gt_crx_ref_clk
-            - pattern: "^mio_clk[00-77]+.*$"
-            - pattern: "gem[0-3]+_emio_clk.*$"
-            - pattern: "swdt[0-1]+_ext_clk.*$"
-
 examples:
   - |
     firmware {
@@ -134,13 +99,4 @@ examples:
         };
       };
     };
-
-    clock-controller {
-        #clock-cells = <1>;
-        compatible = "xlnx,zynqmp-clk";
-        clocks = <&pss_ref_clk>, <&video_clk>, <&pss_alt_ref_clk>,
-                 <&aux_ref_clk>, <&gt_crx_ref_clk>;
-        clock-names = "pss_ref_clk", "video_clk", "pss_alt_ref_clk",
-                      "aux_ref_clk", "gt_crx_ref_clk";
-    };
 ...
diff --git a/Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.yaml
new file mode 100644
index 000000000000..6ed1efcb31bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/xlnx,zynqmp-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx ZynqMP clock controller
+
+maintainers:
+  - Michal Simek <michal.simek@amd.com>
+
+description:
+  The clock controller is a hardware block of Xilinx ZynqMP clock tree. It
+  reads required input clock frequencies from the devicetree and acts as clock
+  provider for all clock consumers of PS clocks.
+
+properties:
+  compatible:
+    const: xlnx,zynqmp-clk
+
+  "#clock-cells":
+    const: 1
+
+  clocks:
+    description: List of clock specifiers which are external input
+      clocks to the given clock controller.
+    minItems: 5
+    items:
+      - description: PS reference clock
+      - description: reference clock for video system
+      - description: alternative PS reference clock
+      - description: auxiliary reference clock
+      - description: transceiver reference clock
+      - description: (E)MIO clock source  (Optional clock)
+      - description: GEM emio clock  (Optional clock)
+      - description: Watchdog external clock (Optional clock)
+
+  clock-names:
+    minItems: 5
+    items:
+      - const: pss_ref_clk
+      - const: video_clk
+      - const: pss_alt_ref_clk
+      - const: aux_ref_clk
+      - const: gt_crx_ref_clk
+      - pattern: "^mio_clk[00-77]+.*$"
+      - pattern: "gem[0-3]+_emio_clk.*$"
+      - pattern: "swdt[0-1]+_ext_clk.*$"
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller {
+        #clock-cells = <1>;
+        compatible = "xlnx,zynqmp-clk";
+        clocks = <&pss_ref_clk>, <&video_clk>, <&pss_alt_ref_clk>,
+                 <&aux_ref_clk>, <&gt_crx_ref_clk>;
+        clock-names = "pss_ref_clk", "video_clk", "pss_alt_ref_clk",
+                      "aux_ref_clk", "gt_crx_ref_clk";
+    };
+...
-- 
2.43.0

