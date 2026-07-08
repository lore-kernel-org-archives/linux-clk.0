Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012030.outbound.protection.outlook.com [40.107.200.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A55A3DDDB1;
	Wed,  8 Jul 2026 07:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495188; cv=fail; b=lUk8P55unCM+rEtYee4spvfuQYam90ii4P88x/nvpXnwOosA/4A0S9sUHcrJGlP2ZHRLvptF6/1TNC4OrGGb+DdGwJaqNbdqrnsFg50WO4UyXYemT2IiUxU1xP1BNR1nTYn7tgiEy7e26kHpoLcCXIi/xp5DHrA0FLJC/KkdCRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495188; c=relaxed/simple;
	bh=SUsTpAqEJZUPy/qfCTuMydg+OjvwOl1+gU+Qi6GT2Ck=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uSroyclr5guexh5+cj6ZhC0hnB6u6ZIxLj0JxnatJtwOy+ZEjuLUE3a3ppz1n7dOhVKMzvIQCnNslWNZoyGkNu+ko37pDOdxKbANWr9dlI0BlIKSnkOR75S6XIqvnK7s6aISzffAZkWgnb/dL3vGKSBGN/DLqayIQJNUDwkfFTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=B6PZyMaF; arc=fail smtp.client-ip=40.107.200.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="B6PZyMaF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Szqj5qfH4sp/MHYkkhUujGTN0KMhwjziJnhwESSumDMyyix1JMLozX7zRGO7xjMmED9B7w2dssGy80ui6SjEFAA3ShDEm58FUFUmse56Gbgtb6UiuwMJqP3z+7T+ITfxISwiE1hi9qw3zWLQbQntmxxSKjrs6C5K1NfKMFnQ+yW0yL23wm7y7trmh9qMhO+0UkHo7xUftznGFJ444WRe/aUzR5ZGIlN8oxdscRbPtaw73DqkVOrG79niz36lMBtOhC0DQBWi22rDEmAxQD7WKES51Bsz7tpoNV7DU53+cTv0ORFf+mdCwjYKOQ8kxu6u5qeklcX6ndhFDIvriP6f4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8INIusw0Sou16UnWU1kSdSRDaF4buPs7z/zgXj7SSbs=;
 b=YuZGBbJpOv1gzTGWd19RaGObqOGcsk5zHT6CJVO/pQIbze/+iLTLSZJSZN5q0Dt+Tf4XqjjxR70zYQp1AE9XXw8FXiZD6p5HyLH/ZOeOVTpWuF2KeKxXi3/52TAUp8fXlsS6sCYhcMHvG3BLw0zX/Z+sZhhBkHrKVgMjT+o3ICpAImIbSkT7DFA/9LuTFeOXKM39Yliz57lZ1hveJKO/tcR962HhjYxVczQ1ySyojt1e13i4BnBWyKnrTb/gs9XjNOAyqTLBti72usqzAY6CANiP2AJFicQ5SUeXkPdGOfiSc3HOX3yk6aqSCetKJSz6+0GAgUYjVyxcAiPZmh9umA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8INIusw0Sou16UnWU1kSdSRDaF4buPs7z/zgXj7SSbs=;
 b=B6PZyMaFs9pZ+Ug/VLMhl8ZiHvgo4ESkCNIQqLUKSf8HWV1Pr4BnzgMJ+NkfobuG97Kgst+t5db1n8ui0OjHHj/K1IpZ/mAS65BP9IhHF2SoeYOTJ8aM9/tu1kgzaMo4claKqA4yrguz/+NBwHPwPy+O2oS8pUksl7CZwQKgCMA=
Received: from BY3PR10CA0021.namprd10.prod.outlook.com (2603:10b6:a03:255::26)
 by PH8PR12MB7421.namprd12.prod.outlook.com (2603:10b6:510:22b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 07:19:17 +0000
Received: from CO1PEPF00012E62.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::4a) by BY3PR10CA0021.outlook.office365.com
 (2603:10b6:a03:255::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 07:19:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00012E62.mail.protection.outlook.com (10.167.249.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 07:19:17 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 02:19:15 -0500
Received: from localhost (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41 via Frontend
 Transport; Wed, 8 Jul 2026 02:19:15 -0500
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
Subject: [PATCH v4 3/5] dt-bindings: clock: Move xlnx,zynqmp-clk to its own schema
Date: Wed, 8 Jul 2026 09:18:50 +0200
Message-ID: <f6fc3f65475888cd5726e3f2795a110e9f7a79c3.1783495122.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783495122.git.michal.simek@amd.com>
References: <cover.1783495122.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7278; i=michal.simek@amd.com; h=from:subject:message-id; bh=SUsTpAqEJZUPy/qfCTuMydg+OjvwOl1+gU+Qi6GT2Ck=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWT5/nwg/HfarSCRVU2/Tx7ckXaopK94WevB+XHmvFtL5 mXwh7pO6ihlYRDjYJAVU2SZzqTjsObbtaViyyPzYeawMoEMYeDiFICJXD7KyDC5JiHGwf7M229G s5+9f7hr80mhTeqCHblv8sMOu376t1qekeHMt64kj0rt7+cUlb5MC+1u+7qgImr/l9jHf+WWqWh a7eYHAA==
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E62:EE_|PH8PR12MB7421:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a0ba3e3-6150-4c49-32de-08dedcc138b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|23010399003|36860700016|1800799024|376014|18002099003|13003099007|56012099006|3023799007|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	cnn9O+zimMMA5mBYo+AzfoQtACTix68PaGfGDkCcvoQykQjuqJiBJ9QG8jp0Y5lC/3WKASXymxTq+Fsbw03RU1esOZI8qGFHmCJpsWzqUqmtldTt6DIN0bf3UF+Kivuhcql+PYdlwHSutW1sNh59jlIp4EVQ7e+FzyHNw5kn/XXsrN8PWgGeis9FSmNVoMs8gdb2N/FUb0XUqySKg/GZJhCRA2uFFA47qt2YMMoOBQjB5qyTNlXKmFHP2PGPBEssywh2sdRRQdwMc82RVWI37nkK+jcSRVu8pe33+xZ9tYkILXtbL3A74793S/gR6dceGLXvuppu7aqko7rsYgxdM9KNNK5US4LsVil5RHw2W5p4OJQPoCDp21JiygX2BmDm+pDfKjGGELmlcP5mXBrMRe0j1X6PQDiBSCQfwUh6pxCetze0c53gBkY0TUhqU2+56yvImApifLwWbDVLq8L44xIZ4/CX5+lUFjZ8+nLjPKsI6RGk7Lt8ayLYP41jzg2wWTZ1u0HC69/1/dtEwOonApfog8gdzGXNU+3WkADQESxqkTvPU+eibluRPzgOLonQ/aMiH6iVvh/3Cg8vi1mv4QY4Q2oaQ/KX5VlKUUeVl+LYjub4Z6YgaWsbRvUCqAWQbEKoy1h6LR6GNy5ThsGhDA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(23010399003)(36860700016)(1800799024)(376014)(18002099003)(13003099007)(56012099006)(3023799007)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nnUGymH7pCT1RYxE6wdO5b1S4POdIsjgI/LoqzJgCgBzBS74KafSAia5/15TjnlFDxfEou1IEqX9NEVZ5KUWvqNYYsiHfikE1shizMQXCTbjTKUJ3VCPxgC5JgQsDUZBmN9OOmBtOEeCU7YCS7bCsrrX3FdoXY+AWTfPcDiOLbwmo3+ksdUtC2eLgdxtj/SxTzq3y1ExuUf7AM4xuxkYvP8tz9y0xap01ieX8I1jT5jOqUSQXrkwJY158K2Z7RNRLzR01UHRM9QYxQenc5r4D2oyprKDDZo3hUZM67idZDbGwur7GCulAtfHggoQNj4YD4kLr8jJKAOsRX5D1Rfzb+5nPl3gCo2neYMBj+QZrOkOMpJFmq7aG7Esq4X9DKb2Fq0An0fto58w11O6sL/Icn/nDWwA7XE3rtm8sRdtbd68V3BO3CxKlCM86prLgIaE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 07:19:17.0831
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a0ba3e3-6150-4c49-32de-08dedcc138b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E62.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7421

The ZynqMP clock controller binding shares only #clock-cells with the
Versal bindings. Move it to a dedicated xlnx,zynqmp-clk.yaml schema.
Also remove "(Optional clock)" from clock description because it is visible
from schema itself.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Michal Simek <michal.simek@amd.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---

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

 .../bindings/clock/xlnx,versal-clk.yaml       | 50 +-------------
 .../bindings/clock/xlnx,zynqmp-clk.yaml       | 68 +++++++++++++++++++
 .../firmware/xilinx/xlnx,zynqmp-firmware.yaml |  7 +-
 3 files changed, 76 insertions(+), 49 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.yaml

diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
index b1623c2ab0f6..12d060c39bfc 100644
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
-            - pattern: "^mio_clk([0-6][0-9]|7[0-7])+.*$"
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

