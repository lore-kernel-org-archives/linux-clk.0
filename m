Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013012.outbound.protection.outlook.com [40.107.201.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B8827E1D7;
	Wed,  8 Jul 2026 13:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516386; cv=fail; b=ZlSQR5sCzdKAm0CPOGSYCqs38itNzWHSPZ6wV6By0CpA8XE/CATXTYQfvBIdRIINz8DvJXGWqO6cMOXdr62ljPM6catPTo90ok9n8261wcGYcsSq39NMAmMUBIpEuZkL4eL7mKpGIbr3k28A+ZEAMAdhCFQQqiL4YZrpXEvbdKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516386; c=relaxed/simple;
	bh=GqjjMlJrFfYpjRByXDUg9N2DTkZe+cLqX5LhRI5kO3g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C+EScG/62fNhc9dWUxGbN28oo4ecdRhX2cWUDjbalFxLQJ4aA7kdUFJt7aZPIJkHHjtkviendiZT/4P+YdLnDgeRHOqFOAliAoWiGFDt71mEzO9iSG7SVWeDKeNPhcQSlym/hIoXN2b11L+0ZQWkeL23J5nxQm4ULf3a7Q++xoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KchxZ6p0; arc=fail smtp.client-ip=40.107.201.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KchxZ6p0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YOaK3mdcJe+hCCMkrDfVC87hKHbb5v2NKLonsg+9ALBuFcPJ+0NKbglrNrNmRweeavFj3z1nDnipIcwhpN2X36tJdMic4JMJ8R90dMBgCfnkcc1Ygo6k4p0fET5PMxFpG9vcny2vIRfyqrbQTmnngiJMl5EipXbp6TgaLpRIBNfO1MX7/WCQ4Bzmm8rdu2RwQY0WjH2ADpJLCyzO1obOzFNzIfsLvv1VMg/u8YUUZwwMXG1f4et4wTXgxlDlVCppjob7oVSp/BvKlB9lqU8aw11/CoDjTiA9KHfxW2Oh7e6+3chziqgGvQ7m0z3sExqU8zJOiohYt6CpwSJnS5HvXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9qfsIQpBX/+c7Z6mG3JzLtjdxK3jsS22aMaGA7zXRJM=;
 b=zFsBtiahzenAiMHX9lrgBXJ5YFFVFQllhsf/BRu3Ady1kR+fFS5zXdGuaiRA+aljt0RPfqOnDVSCar2XB48InscUZuS9nHhuk7KSWlwJlEofr/064oCvs5vM+nPeZfMoDeFzgMATPviX1kq4tB9e1f3hMcS+Wdh2Q6gYHDyU9ufYsDLO0JUnq0qV/NRI6XBp+lRLu36QeHiUaISamDkM3hmECfv7eI0AHRb/payC7nM6VKHbAtYt+g4r5HCrGtN1186DAmGJTp0sJwToBGVFMVeXX9a5kgraQfUXUdyTrPTwd+UxVa+dVPK3ljalZ2DrtKz9lJIQ21HB5c/ixvdCrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9qfsIQpBX/+c7Z6mG3JzLtjdxK3jsS22aMaGA7zXRJM=;
 b=KchxZ6p07aVSKrgIle1laaCBkChFdKoHhozftzH3iVMXS7E/vWXI2V+AwDpASdq9XQfOozCtnj6ghkE9jDTjTOXuNnKTNgO9ViGUF9AwynIZQtk3vEBo6sJSNTEa38L696uyiI55sdPlwZ8BdBRMki2V8CYFkyvMRtOLiLav0z8=
Received: from MW4PR03CA0155.namprd03.prod.outlook.com (2603:10b6:303:8d::10)
 by DS4PR12MB999077.namprd12.prod.outlook.com (2603:10b6:8:2f9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 8 Jul
 2026 13:12:57 +0000
Received: from CO1PEPF000066ED.namprd05.prod.outlook.com
 (2603:10b6:303:8d:cafe::8) by MW4PR03CA0155.outlook.office365.com
 (2603:10b6:303:8d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Wed, 8
 Jul 2026 13:12:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000066ED.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 13:12:57 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 08:12:41 -0500
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41 via Frontend
 Transport; Wed, 8 Jul 2026 08:12:41 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Rob Herring <robh@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
	Brian Masney <bmasney@redhat.com>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "open list:OPEN
 FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	kishore Manne <nava.kishore.manne@amd.com>, "moderated list:ARM/ZYNQ
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:COMMON CLK
 FRAMEWORK" <linux-clk@vger.kernel.org>
Subject: [PATCH v5 3/5] dt-bindings: clock: Move xlnx,zynqmp-clk to its own schema
Date: Wed, 8 Jul 2026 15:12:24 +0200
Message-ID: <973a8a5441cf13622594b95dd0dd20a5f42ccece.1783516336.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783516336.git.michal.simek@amd.com>
References: <cover.1783516336.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7784; i=michal.simek@amd.com; h=from:subject:message-id; bh=GqjjMlJrFfYpjRByXDUg9N2DTkZe+cLqX5LhRI5kO3g=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWT5+ezJON4stuDj9dknNE8u/PnaJyv52qFJhS7Zgct7J UzTV11e3FHKwiDGwSArpsgynUnHYc23a0vFlkfmw8xhZQIZwsDFKQAT2fGF4b+/gJV+4OOC9DN5 QgmXzarmJj6/mv3NN+eZi06xPssqwUaGf2bmK25G1y2+4rk+KPqVwccpK7IWbw99+vZHy9H5qjE bdBkA
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066ED:EE_|DS4PR12MB999077:EE_
X-MS-Office365-Filtering-Correlation-Id: f419cfd0-a4c4-4d26-4d82-08dedcf2a10b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|7416014|82310400026|23010399003|1800799024|56012099006|11063799006|3023799007|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	PVOCOQiWps6CVDEviRmXrarvbeaxeqoUFpe6rIIe+4BABkYF1hWE+onycOREmjNfC/49y6+vURXkMxSxgJ6sr9UYy1HHknBd+f7Uy5TjrE9ClOe5fn52/A2luM3Iv9UO1PxLVQqONsF/AOGn4me82iBXaoZrIDTksi7zA+S7Z3Tb/hE9gat/qO/8ybttAdLMg8EetMBFFAP/RcXAQtgQpc627eichVC2rTBr97ZbLnyXXBvZSgI/PBtOewooJhyH3VccVSMcyxPWM/10bA+9ztWXnFCBv5F2I6GvSBOLmQ47dHdocvZFrie9zRtQyThYBh1HNZ+BUS2oNVCAFj99Sp5Rln3XtQdBSaSa4Eq7rrUs3WgfWmAB9Pak02S5dfUYzMiD9M6LjULslbNxkuDLD7fqKmIfat6EeYJ2zb5yz+tFjx6O9yUKPV2P8c9sSafUt44qmiRCpgTLQusyuahMhh8kXBeMvszURboNTxiWKKpFOGRg8HKG3fvdhkLDPwtaXOffKuZ0nyfel7HSxGYsCrYRrUqDYiwVXChvGvkRuANOqgc3KBB4UUUh2wNKiB/hIywcTirHhI+9EYSmR+L8ZbAnbiu6gIxhiPo3y0WBXidCGga5SQNo6tijOmuXzFGUGn+oF9IrWTZfwwP0F3cd0w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(7416014)(82310400026)(23010399003)(1800799024)(56012099006)(11063799006)(3023799007)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4kTLIVFtcxo8/6E2lkYjMBVRu/TmpWUqNJrT+qzgdR1M13HGGtiUDxcJ33oIj7IuBDi0Qus31J9IkVHGJbA5x8d4MAVqpVHthaoAW7PXrbJScwxCTtyGzFoSzomgj20Nkz9xL7cDeH8JJVFZ5mGwZuVnseO1idhxWsWxRY+hLvdMz37MgVRSvLf9U4ntVwc1ez76WjpZ2VzBOwpLhCgXSfTK1U72WvkuGuD/cMLc9vmDtzQusahmlr/N6J9FnJyTTh+ZSfB19lxQT98DH4cYsTswHbQq4/HUTEw1aAdBVuxXqyhmJ5n0Zd+/G+Iq93Sa8Ha1lU5j1y0aUAhwHQq95Jqn1VuSPToNh1fgNRCn2pvd0JjGMAfOSRIo6Oej4yups8HX4sX7hOmfdNvStv2xTh/qq/czKW7YmzlZqXUhwZNgg/HbSeFBT3xS5nUHE41s
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 13:12:57.4558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f419cfd0-a4c4-4d26-4d82-08dedcf2a10b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB999077

The ZynqMP clock controller binding shares only #clock-cells with the
Versal bindings. Move it to a dedicated xlnx,zynqmp-clk.yaml schema.
Also remove "(Optional clock)" from clock description because it is visible
from schema itself.

Also update versal-firmware example to match changes in
xlnx,zynqmp-firmware.yaml.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Michal Simek <michal.simek@amd.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---

Changes in v5:
- Also update firmware node to match xlnx,versal-firmware enforced by
  schema (change taken from next patch)
- Update commit message

Changes in v4:
- Update regex from previous patch

Changes in v3:
- Cover change in zynqmp-firmware.yaml
- Move clock-cells to be the last in the example
- Remove comment around (Optional clock) which is obvious from schema
  itself

Changes in v2:
- New patch in series
- Split zynqmp-clk from versal-clk

 .../bindings/clock/xlnx,versal-clk.yaml       | 54 ++-------------
 .../bindings/clock/xlnx,zynqmp-clk.yaml       | 68 +++++++++++++++++++
 .../firmware/xilinx/xlnx,zynqmp-firmware.yaml |  7 +-
 3 files changed, 78 insertions(+), 51 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.yaml

diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
index b1623c2ab0f6..7b6d9ec83863 100644
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
@@ -87,44 +85,11 @@ allOf:
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
-            - pattern: "^mio_clk([0-6][0-9]|7[0-7])+.*$"
-            - pattern: "gem[0-3]+_emio_clk.*$"
-            - pattern: "swdt[0-1]+_ext_clk.*$"
-
 examples:
   - |
     firmware {
-      zynqmp_firmware: zynqmp-firmware {
-        compatible = "xlnx,zynqmp-firmware";
+      versal-firmware {
+        compatible = "xlnx,versal-firmware";
         method = "smc";
         versal_clk: clock-controller {
           #clock-cells = <1>;
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
index 000000000000..c64550471581
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
+      - pattern: "^mio_clk([0-6][0-9]|7[0-7])+.*$"
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

