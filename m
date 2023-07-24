Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 373AFC001B0
	for <linux-clk@archiver.kernel.org>; Mon, 24 Jul 2023 11:19:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbjGXLT2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Jul 2023 07:19:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231878AbjGXLTQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Jul 2023 07:19:16 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2062.outbound.protection.outlook.com [40.107.95.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 025A4E7E;
        Mon, 24 Jul 2023 04:18:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TrQDwzGCIjVqSo7kmkSZSFmpYm3AGksjqxSzgKusZaU1DEEZINvbfhjL9aBZ9I1AsS4GVtDfY6Wy2Kclopb7r7ELqFG5XplBveig83fW21PYrjVAgF8VbBIqsOQugz5AOS6iffjZIF1BCs9r0A7REOun4IanaHKwYhp1B9TirEid/yolKtQUXnaircZw6L2EC19orVsceNRbW2qMDe8d4wbmWR69womuiXutXQDDcMskHQlcU1VYZz0/MFQdfb/ePL4GzXdX5v92Q5Zz5svVa48nlHcLowvkNqE3vlfvixTmjCsZFJG+TZPDJcvp81EPNWCM3E5nTFb8ffEEhsa8yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxzJMhtsXx+TvoEcBXAwP93wJCbwz2+2iPjrPvp4t7o=;
 b=a5S2qFKVoZ9IRie0GOcN55kNYZnr9k/K7iq4kCFkytVnwwvoY3IhX8wjWXEgKkaQau83/qPTBXeEhamUCvZq8EhNjXeM/X90kwfPEfMLR39v/sP7f0+qFTQa+oMt+ciIWgJndGgWV2Bc4TCok1vc7REOCVPxqnDZdiQ/jMdfLf6S27+67wbTWp5F7HlrSS7oesovDQbxOXP9sNZbmylEfS6zG18bcWaPYBd7m1eDFpUmeIgXKIznP6dVyMhpP0a1aF7wvqFuavOuXwYi/H0rUSRI1VlvjSO4ieGp2cotYpdrxDdFcY7sNpT3tase71V+0f4n5N8lulJ433jJJb72Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxzJMhtsXx+TvoEcBXAwP93wJCbwz2+2iPjrPvp4t7o=;
 b=YGAw/L39RLqL6iSKD/WBnihzOM+YtUp6NvPHruikCZul1bj2o+f9mEGy2doZU/jT9gMqC9H/TyFlx/1b7P+PGmtaoVs2eFSkWT+YHE5hkynixCR2XzIWQb38JpfYCBXCA9zj9BXbLveOpzqtC7K6zItxngrTOBvhN9lqZYGaOGc=
Received: from DS7PR05CA0099.namprd05.prod.outlook.com (2603:10b6:8:56::20) by
 DM4PR12MB6133.namprd12.prod.outlook.com (2603:10b6:8:ae::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.32; Mon, 24 Jul 2023 11:18:57 +0000
Received: from DM6NAM11FT114.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:56:cafe::9f) by DS7PR05CA0099.outlook.office365.com
 (2603:10b6:8:56::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.25 via Frontend
 Transport; Mon, 24 Jul 2023 11:18:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT114.mail.protection.outlook.com (10.13.172.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6631.25 via Frontend Transport; Mon, 24 Jul 2023 11:18:55 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 24 Jul
 2023 06:18:46 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 24 Jul 2023 06:18:44 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <devicetree@vger.kernel.org>
CC:     <git@amd.com>, <linux-clk@vger.kernel.org>, <michal.simek@amd.com>,
        <conor+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <robh+dt@kernel.org>, <sboyd@kernel.org>, <mturquette@baylibre.com>
Subject: [PATCH v3] dt-bindings: clock: versal: Convert the xlnx,zynqmp-clk.txt to yaml
Date:   Mon, 24 Jul 2023 16:48:43 +0530
Message-ID: <20230724111843.18706-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT114:EE_|DM4PR12MB6133:EE_
X-MS-Office365-Filtering-Correlation-Id: 6be681f7-7570-4233-8371-08db8c37c512
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MUpj5tIr/SUAj5ts6WYC2Cx0YYd65xH0N5Eum40wXBR53Sb2bXChTGRuBMPQIH6XlyJOj0qdeirWWKIYpZy/pLBdlMQ8+KGfXNWYDqz24p8ujRf+e18ct0hL8kX6bDO+o+shXd0VwA/2ds6roK4GH8TeBTBJ3yuyga9MbGC1S1ugfrRDB7RZnWa6HGi7G3psDA/EIyPh9vucEmJkaiiiPQuZkssoyzx7fsyLLU5y4PyWUMWnNMGLZl+jvYF5LHbCXlc4ptxA0qEYhfh2wa644JzC66yJdaxTjLM1yZn6v5u7xYlX3PIYStjM5F+TQxdn2bCvpulqb1225BKQ6Q75GuvuazCk+O/kPwSj7CWDxlVC0PGomMDvJ11VTYtwBHgIzdyfOSiINgOLtUjvIOS+hWw7dxPlhl6IG2hRtJzZkZ/+i0/Rzjmy8LOMgkSs05Ko/eV6rahV9a8LfDTjGFCESsO17GnxD2La9CZj6vHHVdugzYtw2MF1FO74JFufNaWf2vhT6hYctpT+q8NPP9h7b65KCvhbNQTpsW09dfnlJzxpycyc89vZe7dnbffK2wMrkvlw7+XCc1JDu9TPWxOzEBjtAXOCMMnpAM1iMwBlS1D2MFI8YXcABddkefT5ogf2vbxWsmEq/CY03O+0vqH6DTx/peWKdzUdJc7gkhTEnpuCc09ez17x3Pllc87Knj11V1+nKyTC3m7jxglLCXoNvwbw3gc1pf9NorAHxF9dtEOjEkapLIPSIXHmx/yAD+263qvhOquy+H8faBkfF7q/Rw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199021)(82310400008)(40470700004)(46966006)(36840700001)(40460700003)(81166007)(40480700001)(356005)(36860700001)(36756003)(2616005)(426003)(47076005)(83380400001)(8676002)(8936002)(5660300002)(44832011)(478600001)(54906003)(6916009)(4326008)(316002)(70206006)(70586007)(41300700001)(336012)(26005)(1076003)(186003)(2906002)(86362001)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 11:18:55.9690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be681f7-7570-4233-8371-08db8c37c512
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT114.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6133
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Convert the xlnx,zynqmp-clk.txt to yaml.
versal-clk.yaml already exists that's why ZynqMP is converted and
merged.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

---

Changes in v3:
Update the min and maxitems 

Changes in v2:
add enum in compatible
fix the description
add constraints for clocks
name the clock-controller1 to clock-controller

 .../bindings/clock/xlnx,versal-clk.yaml       | 78 ++++++++++++++++---
 .../bindings/clock/xlnx,zynqmp-clk.txt        | 63 ---------------
 2 files changed, 69 insertions(+), 72 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.txt

diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
index e9cf747bf89b..deebbfd084e8 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
@@ -19,7 +19,9 @@ select: false
 properties:
   compatible:
     oneOf:
-      - const: xlnx,versal-clk
+      - enum:
+          - xlnx,versal-clk
+          - xlnx,zynqmp-clk
       - items:
           - enum:
               - xlnx,versal-net-clk
@@ -31,16 +33,12 @@ properties:
   clocks:
     description: List of clock specifiers which are external input
       clocks to the given clock controller.
-    items:
-      - description: reference clock
-      - description: alternate reference clock
-      - description: alternate reference clock for programmable logic
+    minItems: 3
+    maxItems: 7
 
   clock-names:
-    items:
-      - const: ref
-      - const: alt_ref
-      - const: pl_alt_ref
+    minItems: 3
+    maxItems: 7
 
 required:
   - compatible
@@ -50,6 +48,59 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - xlnx,versal-clk
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: reference clock
+            - description: alternate reference clock
+            - description: alternate reference clock for programmable logic
+
+        clock-names:
+          items:
+            - const: ref
+            - const: alt_ref
+            - const: pl_alt_ref
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - xlnx,zynqmp-clk
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: PS reference clock
+            - description: reference clock for video system
+            - description: alternative PS reference clock
+            - description: auxiliary reference clock
+            - description: transceiver reference clock
+            - description: (E)MIO clock source  (Optional clock)
+            - description: GEM emio clock  (Optional clock)
+            - description: Watchdog external clock (Optional clock)
+
+        clock-names:
+          items:
+            - const: pss_ref_clk
+            - const: video_clk
+            - const: pss_alt_ref_clk
+            - const: aux_ref_clk
+            - const: gt_crx_ref_clk
+            - pattern: "^mio_clk[00-77]+.*$"
+            - pattern: "gem[0-3]+_emio_clk.*$"
+            - pattern: "swdt[0-1]+_ext_clk.*$"
+
 examples:
   - |
     firmware {
@@ -64,4 +115,13 @@ examples:
         };
       };
     };
+
+    clock-controller {
+        #clock-cells = <1>;
+        compatible = "xlnx,zynqmp-clk";
+        clocks = <&pss_ref_clk>, <&video_clk>, <&pss_alt_ref_clk>,
+                 <&aux_ref_clk>, <&gt_crx_ref_clk>;
+        clock-names = "pss_ref_clk", "video_clk", "pss_alt_ref_clk",
+                      "aux_ref_clk", "gt_crx_ref_clk";
+    };
 ...
diff --git a/Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.txt b/Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.txt
deleted file mode 100644
index 391ee1a60bed..000000000000
--- a/Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.txt
+++ /dev/null
@@ -1,63 +0,0 @@
---------------------------------------------------------------------------
-Device Tree Clock bindings for the Zynq Ultrascale+ MPSoC controlled using
-Zynq MPSoC firmware interface
---------------------------------------------------------------------------
-The clock controller is a h/w block of Zynq Ultrascale+ MPSoC clock
-tree. It reads required input clock frequencies from the devicetree and acts
-as clock provider for all clock consumers of PS clocks.
-
-See clock_bindings.txt for more information on the generic clock bindings.
-
-Required properties:
- - #clock-cells:	Must be 1
- - compatible:		Must contain:	"xlnx,zynqmp-clk"
- - clocks:		List of clock specifiers which are external input
-			clocks to the given clock controller. Please refer
-			the next section to find the input clocks for a
-			given controller.
- - clock-names:		List of clock names which are exteral input clocks
-			to the given clock controller. Please refer to the
-			clock bindings for more details.
-
-Input clocks for zynqmp Ultrascale+ clock controller:
-
-The Zynq UltraScale+ MPSoC has one primary and four alternative reference clock
-inputs. These required clock inputs are:
- - pss_ref_clk (PS reference clock)
- - video_clk (reference clock for video system )
- - pss_alt_ref_clk (alternative PS reference clock)
- - aux_ref_clk
- - gt_crx_ref_clk (transceiver reference clock)
-
-The following strings are optional parameters to the 'clock-names' property in
-order to provide an optional (E)MIO clock source:
- - swdt0_ext_clk
- - swdt1_ext_clk
- - gem0_emio_clk
- - gem1_emio_clk
- - gem2_emio_clk
- - gem3_emio_clk
- - mio_clk_XX		# with XX = 00..77
- - mio_clk_50_or_51	#for the mux clock to gem tsu from 50 or 51
-
-
-Output clocks are registered based on clock information received
-from firmware. Output clocks indexes are mentioned in
-include/dt-bindings/clock/xlnx-zynqmp-clk.h.
-
--------
-Example
--------
-
-firmware {
-	zynqmp_firmware: zynqmp-firmware {
-		compatible = "xlnx,zynqmp-firmware";
-		method = "smc";
-		zynqmp_clk: clock-controller {
-			#clock-cells = <1>;
-			compatible = "xlnx,zynqmp-clk";
-			clocks = <&pss_ref_clk>, <&video_clk>, <&pss_alt_ref_clk>, <&aux_ref_clk>, <&gt_crx_ref_clk>;
-			clock-names = "pss_ref_clk", "video_clk", "pss_alt_ref_clk","aux_ref_clk", "gt_crx_ref_clk";
-		};
-	};
-};
-- 
2.17.1

