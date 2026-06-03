Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011039.outbound.protection.outlook.com [40.93.194.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B0B25CC74;
	Wed,  3 Jun 2026 15:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780499565; cv=fail; b=giSaoVMwGbxdYMquFK0pWYJfnxCxQ5R3dtdko3xhLMCVujSsc4S4ECjktZR9GIk7+A3WqK+0AFZ7P6Btp1s3RQ/mjy52+TZXXFYNNSKo9HDyzkdCV3YC0kJUJBWh4VNRciNdpGy22U8DB3WHwBernb3m3BPGmdWUxwtsJTycMCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780499565; c=relaxed/simple;
	bh=FtofhE8CgFine7fc2u0Aj61k4faoKTkUVGjjyDYHrYo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GAUnJ8060kcOx1MqRiWD985X03L0JWZ7fZlexruOGiXDWGJiFZkUE0AdSCiNboeWLNxPvBRYQX95Si2YD+wjnQE7khlx61QWPeo6h8YyNUO5iITuCcv4lxvrCSluhm13/iQMrFig9jNtrqSBjS3eSX+kHnKt+aVXcss3IbmmPqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RT9nRGwt; arc=fail smtp.client-ip=40.93.194.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RT9nRGwt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cm5XJ/d6YHgcmCc0+W9wvtq/YWGdOFDFM7M1PTqljP8OR9XwSZVvfcwuQuaqgQu0WyXI9E2n8t3JW1I9BftWQOj7AtKmsklYTVI2JFYwAUBH+vVau47Sr4UFKofa27hl1Lx2N+HQiK26cJNG+/nEq+UUJPLbKJyeTEKOV8a5FMmIWr1yu7hSTOgfcievwm+q3rUnuh9e2Np5QDKqTvXAcra/xzMuy9rZCRXHZdlvvuvVpBJAlFY45CSc6U6CDijxAo0I5oXL4CEx5d+BDlMgXQodBK5z8agymhg4tNDq5cN9qg4YceuKgwN87igSmiGdWNTF8LkcBffLfRdCLHOYkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fCO9pdYuFIX/suRnwTcl3B0AO84cc9Tn2+U3AGb4KQ=;
 b=rgMgG2e5bjwU1k/SdT5flrImmzyblx1U3YiWyk7TRc7z+XzQPRBIErzHKNk3reIvUOqVH1p2LETQF8hxYnPguflZhzLolaGtpmXWCyZ7ggByivZ83p0oEH5+y0KSe7fV9I26fKdpkFrVp0lPTmqadLVAp2XNJp6I/+iFo7jgEvpQV9RcJ+uFCBIQxAm77VTOASfR7yekBVrS5vGw4X0ehGGsBOJO6Zu/HdwUMaKrYJNto99TJY3SA0GJNagzSSrfS10EAE7pce6gG3WxlxwbD6BURs1mH+unwxciwzgnBm2BAxoDAH6vv7uATsUY3oxCgsFE6eriH6Q/VihyQPaPwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fCO9pdYuFIX/suRnwTcl3B0AO84cc9Tn2+U3AGb4KQ=;
 b=RT9nRGwtRvoahGfV7ez6L+GmMO9L/UgT/O2fi8R+5WvnBncanvYadFbgEjsT2PuXpacnXzJrR1JmuMkTyD3exLGQLg6VfILqtCwwwiyqem3qaTJQylOLcofgJ6dpWNGmntRFVXGUmEXvfPPHdexEJ6yKuE5Wcl/Q8S2TkYFmlAg=
Received: from BN9PR03CA0481.namprd03.prod.outlook.com (2603:10b6:408:130::6)
 by LV2PR12MB5797.namprd12.prod.outlook.com (2603:10b6:408:17b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 15:12:34 +0000
Received: from MN1PEPF0000ECD8.namprd02.prod.outlook.com
 (2603:10b6:408:130:cafe::7e) by BN9PR03CA0481.outlook.office365.com
 (2603:10b6:408:130::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 15:12:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000ECD8.mail.protection.outlook.com (10.167.242.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 15:12:33 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 3 Jun
 2026 10:12:32 -0500
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41 via Frontend
 Transport; Wed, 3 Jun 2026 10:12:32 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "open list:OPEN
 FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	kishore Manne <nava.kishore.manne@amd.com>, "moderated list:ARM/ZYNQ
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:COMMON CLK
 FRAMEWORK" <linux-clk@vger.kernel.org>
Subject: [PATCH v3 3/5] dt-bindings: clock: Move xlnx,zynqmp-clk to its own schema
Date: Wed, 3 Jun 2026 17:12:08 +0200
Message-ID: <23d848e29176706548612c4a0751481d46176f11.1780499520.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780499520.git.michal.simek@amd.com>
References: <cover.1780499520.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7185; i=michal.simek@amd.com; h=from:subject:message-id; bh=FtofhE8CgFine7fc2u0Aj61k4faoKTkUVGjjyDYHrYo=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWQpuHj4+91hiQ2ve/lXzeFsZZCTxKcv2qmtMroXZhQLr K5/bX20o5SFQYyDQVZMkWU6k47Dmm/Xlootj8yHmcPKBDKEgYtTACay7QfD/7ozjz4/luB7crGU ebLQer71eTbx+9sOKz3OSRRs7/41vY2R4deBDVVyzJr66s1mS6SMlxr6r7fb8+XGm8gntypeHP/ rxw4A
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|LV2PR12MB5797:EE_
X-MS-Office365-Filtering-Correlation-Id: cbd63fdb-864a-4596-5bbb-08dec1828a19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|1800799024|13003099007|56012099006|11063799006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DX486Rc1dFqKCSkZAcRSfAeJhwWwNr3ALVb7tAs68zxCPiOQRHj/SO/zqA/wUXXG1ygtC//uvlmUxWfw9nnFVQX9INK2hQeWPK+G/fFIQhghIVWml9Oi9NWeOgeC4MIvViUZUUes3K4dmcca7eDPcbx5uxW0sYy0iSNMsQrq4ZsGYTEI+v99rUUUgeOdGLvoR00XZhsdC+pGLilajOifzCv30gmtBdgGRyiA0IkSavOzm936JYIbL6AW+25gMZyFgQ9+vDP0+oIhvcWqpBOu8Tchi8/28G7SkEKfgtSh0ya0feu6hwTwQcATVe3CNYPF/L0HKFS1NuuA4DQwZOAewtT+FsBAD4B4eNl7WGtkYhkuvd6k83/+ouFd7/1+EC2B/n9M72i6IkWw7/BavrDiEHXkeOFBHzg/B43tRVWOdQPB0THp0Y1guFfl6W9Ujq1Szg2zayNuQJ331pCLQTjfxRh+FD6Sz7f3z+0G0PQUaT7P2+9330bOamtyPC00oe7bLkSwcu9/Q7vAp+2OTSGoVI0G/67hOqUEYkzeHa+9bTCrCfh8CTZPP0R/043ReKmoUj7g/CQkbiswae7fztitUIRLKmHK3NU0BUD/XmR8hNRQhlDav0OMSRi8M5Km1eae/9IfgNwSkokrmjnFMh6GgJsloC5qpaIzGUOhJ1uzFEDkQ0Tj4ceVnFVoEVy2CeTx
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(1800799024)(13003099007)(56012099006)(11063799006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o3t/yTEnMCq17SVuA95jZiGwjh7mIE1IALLj5RrhUsKigLv/aawVEWWremCrppqVY1BLOsQL8LRbTLSFOsY0IVpnRcPrIGxYRCNHOeEnb0ZTjsCGLmnTVv2xoM3EnVpja9uhLSDJkQ6TMelYU0akmZmrzShvr7KcD/XrmlhMtX/JQsZ/HR4XN0EySU4H+gFP4XLWkmgUA9lwTttc6bLYUSenNeMz5c7sFygoHjesYzx3wMKkptiDUNfkbDWQiKIJOi0tZJDH5Sfg4ye/68UGv9z0QmGuM03bFUIWQlLqldMv4ULDjbldca/ACQCWlFSou2/Z9iE0FbwfZ3vL6DyeINRlFbcjNSz5ZkeqYZwgWkhAP8eoMR0Ulcng7IPIqUny+aPmpPXDHTz7ypU26lGiYtodggDLFOkZnIKME8C2+DOGqm10QcHA3BULFbP7gvc4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 15:12:33.9580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd63fdb-864a-4596-5bbb-08dec1828a19
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5797

The ZynqMP clock controller binding shares only #clock-cells with the
Versal bindings. Move it to a dedicated xlnx,zynqmp-clk.yaml schema.
Also remove "(Optional clock)" from clock description because it is visible
from schema itself.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Michal Simek <michal.simek@amd.com>
---

Changes in v3:
- Cover change in zynqmp-firmware.yaml
- Move clock-cells to be the last in the example
- Remove comment around (Optional clock) which is obvious from schema
  itself

Changes in v2:
- New patch in series
- Split zynqmp-clk from versal-clk

 .../bindings/clock/xlnx,versal-clk.yaml       | 50 +-------------
 .../bindings/clock/xlnx,zynqmp-clk.yaml       | 68 +++++++++++++++++++
 .../firmware/xilinx/xlnx,zynqmp-firmware.yaml |  7 +-
 3 files changed, 76 insertions(+), 49 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.yaml

diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
index d843d95801b5..12d060c39bfc 100644
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
-            - pattern: "^mio_clk(0[0-9]|[1-6][0-9]|7[0-7])+.*$"
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
index 000000000000..ccea3184b041
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
+      - description: (E)MIO clock source
+      - description: GEM emio clock
+      - description: Watchdog external clock
+
+  clock-names:
+    minItems: 5
+    items:
+      - const: pss_ref_clk
+      - const: video_clk
+      - const: pss_alt_ref_clk
+      - const: aux_ref_clk
+      - const: gt_crx_ref_clk
+      - pattern: "^mio_clk(0[0-9]|[1-6][0-9]|7[0-7])+.*$"
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
+        compatible = "xlnx,zynqmp-clk";
+        clocks = <&pss_ref_clk>, <&video_clk>, <&pss_alt_ref_clk>,
+                 <&aux_ref_clk>, <&gt_crx_ref_clk>;
+        clock-names = "pss_ref_clk", "video_clk", "pss_alt_ref_clk",
+                      "aux_ref_clk", "gt_crx_ref_clk";
+        #clock-cells = <1>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
index 680082c29f01..72af37cdb103 100644
--- a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
+++ b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
@@ -48,8 +48,7 @@ properties:
     const: 1
 
   clock-controller:
-    $ref: /schemas/clock/xlnx,versal-clk.yaml#
-    description: The clock controller is a hardware block of Xilinx versal
+    description: The clock controller is a hardware block of Xilinx SoC
       clock tree. It reads required input clock frequencies from the devicetree
       and acts as clock provider for all clock consumers of PS clocks.list of
       clock specifiers which are external input clocks to the given clock
@@ -113,10 +112,14 @@ allOf:
             const: xlnx,zynqmp-firmware
     then:
       properties:
+        clock-controller:
+          $ref: /schemas/clock/xlnx,zynqmp-clk.yaml#
         pinctrl:
           $ref: /schemas/pinctrl/xlnx,zynqmp-pinctrl.yaml#
     else:
       properties:
+        clock-controller:
+          $ref: /schemas/clock/xlnx,versal-clk.yaml#
         pinctrl:
           $ref: /schemas/pinctrl/xlnx,versal-pinctrl.yaml#
 
-- 
2.43.0

